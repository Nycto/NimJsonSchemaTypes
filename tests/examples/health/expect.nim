{.push warning[UnusedImport]:off.}
import std/[json, jsonutils, tables, options]

type
  `Testhealth`* = object
    `dateOfBirth`*: string
    `emergencyContact`*: Option[`TestTesthealth_emergencyContact`]
    `patientName`*: string
    `bloodType`*: string
    `medications`*: Option[seq[string]]
    `conditions`*: Option[seq[string]]
    `allergies`*: Option[seq[string]]
  `TestTesthealth_emergencyContact`* = object
    `username`*: Option[string]
    `email`*: Option[string]
proc fromJsonHook*(target: var `TestTesthealth_emergencyContact`;
                   source: JsonNode) =
  if "username" in source:
    target.`username` = some(jsonTo(source{"username"},
                                    typeof(unsafeGet(target.`username`))))
  if "email" in source:
    target.`email` = some(jsonTo(source{"email"},
                                 typeof(unsafeGet(target.`email`))))

proc toJsonHook*(source: `TestTesthealth_emergencyContact`): JsonNode =
  result = newJObject()
  if isSome(source.`username`):
    result{"username"} = toJson(source.`username`)
  if isSome(source.`email`):
    result{"email"} = toJson(source.`email`)

proc fromJsonHook*(target: var `Testhealth`; source: JsonNode) =
  assert("dateOfBirth" in source,
         "dateOfBirth" & " is missing while decoding " & "Testhealth")
  target.`dateOfBirth` = jsonTo(source{"dateOfBirth"},
                                typeof(target.`dateOfBirth`))
  if "emergencyContact" in source:
    target.`emergencyContact` = some(jsonTo(source{"emergencyContact"},
        typeof(unsafeGet(target.`emergencyContact`))))
  assert("patientName" in source,
         "patientName" & " is missing while decoding " & "Testhealth")
  target.`patientName` = jsonTo(source{"patientName"},
                                typeof(target.`patientName`))
  assert("bloodType" in source,
         "bloodType" & " is missing while decoding " & "Testhealth")
  target.`bloodType` = jsonTo(source{"bloodType"}, typeof(target.`bloodType`))
  if "medications" in source:
    target.`medications` = some(jsonTo(source{"medications"},
                                       typeof(unsafeGet(target.`medications`))))
  if "conditions" in source:
    target.`conditions` = some(jsonTo(source{"conditions"},
                                      typeof(unsafeGet(target.`conditions`))))
  if "allergies" in source:
    target.`allergies` = some(jsonTo(source{"allergies"},
                                     typeof(unsafeGet(target.`allergies`))))

proc toJsonHook*(source: `Testhealth`): JsonNode =
  result = newJObject()
  result{"dateOfBirth"} = toJson(source.`dateOfBirth`)
  if isSome(source.`emergencyContact`):
    result{"emergencyContact"} = toJson(source.`emergencyContact`)
  result{"patientName"} = toJson(source.`patientName`)
  result{"bloodType"} = toJson(source.`bloodType`)
  if isSome(source.`medications`):
    result{"medications"} = toJson(source.`medications`)
  if isSome(source.`conditions`):
    result{"conditions"} = toJson(source.`conditions`)
  if isSome(source.`allergies`):
    result{"allergies"} = toJson(source.`allergies`)
