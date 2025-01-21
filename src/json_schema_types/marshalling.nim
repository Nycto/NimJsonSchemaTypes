import std/[macros, tables, sets, json, jsonutils, options]
import types, util

proc isJsonKind(value: NimNode, kind: JsonNodeKind): NimNode =
    return quote:
        `value`.kind == `kind`

proc buildIsType(typ: TypeDef, value: NimNode): NimNode =
    case typ.kind
    of StringType, EnumType: return value.isJsonKind(JString)
    of IntegerType: return value.isJsonKind(JInt)
    of ObjType, MapType: return value.isJsonKind(JObject)
    of ArrayType: return value.isJsonKind(JArray)
    of BoolType: return value.isJsonKind(JBool)
    of NullType: return value.isJsonKind(JNull)
    of NumberType: return infix(value.isJsonKind(JFloat), "or", value.isJsonKind(JInt))
    of JsonType: return true.newLit
    of OptionalType: return typ.subtype.buildIsType(value)
    of UnionType: raiseAssert("Unions should not contain other unions")
    of RefType: raiseAssert("Unions are not supported in ref types")

let source {.compileTime.} = ident("source")
let target {.compileTime.} = ident("target")

proc buildUnionDecoder*(typ: TypeDef, typeName: NimNode): NimNode =
    ## Builds the `fromJsonHook` function for decoding a union type down to the union object
    assert(typ.kind == UnionType)

    var branches = nnkIfStmt.newTree()

    for i, subtype in typ.subtypes:
        let key = i.unionKey
        let builder = quote:
            `target` = `typeName`(kind: `i`, `key`: jsonTo(`source`, typeof(`target`.`key`)))
        branches.add(nnkElifBranch.newTree(buildIsType(subtype, source), builder))

    branches.add(
        nnkElse.newTree(
            nnkRaiseStmt.newTree(
                nnkCall.newTree(
                    bindSym("newException"),
                    bindSym("ValueError"),
                    newLit("Unable to deserialize json node to " & typeName.getName)
                )
            )
        )
    )

    return quote:
        proc fromJsonHook*(`target`: var `typeName`; `source`: JsonNode) =
            `branches`

proc buildUnionEncoder*(typ: TypeDef, typeName: NimNode): NimNode =
    ## Builds the `toJsonHook` function for encoding a union
    assert(typ.kind == UnionType)

    var cases = nnkCaseStmt.newTree(newDotExpr(source, ident("kind")))

    for i, subtype in typ.subtypes:
        let key = i.unionKey
        let decode = quote:
            return toJson(`source`.`key`)
        cases.add(nnkOfBranch.newTree(i.newLit, decode))

    return quote:
        proc toJsonHook*(`source`: `typeName`): JsonNode =
            `cases`

proc buildEnumEncoder*(typ: TypeDef, typeName: NimNode): NimNode =
    assert(typ.kind == EnumType)

    var cases = nnkCaseStmt.newTree(source)
    for value in typ.values:
        cases.add(
            nnkOfBranch.newTree(
                newDotExpr(typeName, safeTypeName(value)),
                nnkReturnStmt.newTree(newCall(bindSym("newJString"), value.newLit))
            )
        )

    return quote:
        proc toJsonHook*(`source`: `typeName`): JsonNode =
            `cases`