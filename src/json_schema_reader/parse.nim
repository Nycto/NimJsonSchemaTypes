import std/[json, sets, tables, strformat], types, schemaRef

type ParseContext = ref object
    doc: JsonNode
    resolver: UrlResolver

proc resolve(sref: SchemaRef, ctx: ParseContext): JsonNode = resolve(sref, ctx.doc, ctx.resolver)

proc parseType(node: JsonNode, ctx: ParseContext): TypeDef

proc parseObj(node: JsonNode, ctx: ParseContext): TypeDef =
    result = TypeDef(kind: ObjType, properties: initTable[string, TypeDef]())
    for key, typeDef in node{"properties"}:
        result.properties[key] = typeDef.parseType(ctx)

proc parseArray(node: JsonNode, ctx: ParseContext): TypeDef =
    return TypeDef(kind: ArrayType, items: parseType(node{"items"}, ctx))

proc parseRef(node: JsonNode, ctx: ParseContext): TypeDef =
    parseRef(node{"$ref"}.getStr).resolve(ctx).parseType(ctx)

proc parseStr(node: JsonNode, ctx: ParseContext): TypeDef =
    if "enum" in node:
        result = TypeDef(kind: EnumType, values: initHashSet[string]())
        for value in node{"enum"}:
            result.values.incl(value.getStr)
    else:
        return TypeDef(kind: StringType)

proc parseTypedStr(node: JsonNode, ctx: ParseContext): TypeDef =
    let typ = node{"type"}.getStr
    case typ
    of "string": return parseStr(node, ctx)
    of "number": return TypeDef(kind: NumberType)
    of "integer": return TypeDef(kind: IntegerType)
    of "object": return parseObj(node, ctx)
    of "array": return parseArray(node, ctx)
    else: raise newException(ValueError, fmt"Unsupported type {typ} in {node}")

proc parseTyped(node: JsonNode, ctx: ParseContext): TypeDef =
    let typ = node{"type"}
    case typ.kind
    of JString: return parseTypedStr(node, ctx)
    else: raise newException(ValueError, fmt"Unsupported type {typ} in {node}")

proc parseType(node: JsonNode, ctx: ParseContext): TypeDef =
    if "$ref" in node:
        return parseRef(node, ctx)
    elif "type" in node:
        return parseTyped(node, ctx)
    else:
        raise newException(ValueError, fmt"Unable to parse type: {node}")

proc parseSchema*(node: JsonNode, resolver: UrlResolver = defaultResolver): JsonSchema =
    result = JsonSchema()
    result.rootType = parseType(node, ParseContext(doc: node, resolver: resolver))

proc parseSchema*(node: string, resolver: UrlResolver = defaultResolver): JsonSchema =
    node.parseJson.parseSchema
