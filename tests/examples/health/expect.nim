{.push warning[UnusedImport]:off.}
import std/[json, jsonutils, tables, options]

type
  HealthEmergencyContact* = object
    username*: Option[string]
    email*: Option[string]
  Healthhealth* = object
    dateOfBirth*: string
    emergencyContact*: Option[HealthEmergencyContact]
    patientName*: string
    bloodType*: string
    medications*: Option[seq[string]]
    conditions*: Option[seq[string]]
    allergies*: Option[seq[string]]
proc toJsonHook*(source: HealthEmergencyContact): JsonNode
proc toJsonHook*(source: Healthhealth): JsonNode
proc fromJsonHook*(target: var HealthEmergencyContact; source: JsonNode) =
  if hasKey(source, "username") and source{"username"}.kind != JNull:
    target.username = some(jsonTo(source{"username"},
                                  typeof(unsafeGet(target.username))))
  if hasKey(source, "email") and source{"email"}.kind != JNull:
    target.email = some(jsonTo(source{"email"}, typeof(unsafeGet(target.email))))

proc toJsonHook*(source: HealthEmergencyContact): JsonNode =
  result = newJObject()
  if isSome(source.username):
    result{"username"} = newJString(unsafeGet(source.username))
  if isSome(source.email):
    result{"email"} = newJString(unsafeGet(source.email))

proc fromJsonHook*(target: var Healthhealth; source: JsonNode) =
  assert(hasKey(source, "dateOfBirth"),
         "dateOfBirth" & " is missing while decoding " & "Healthhealth")
  target.dateOfBirth = jsonTo(source{"dateOfBirth"}, typeof(target.dateOfBirth))
  if hasKey(source, "emergencyContact") and
      source{"emergencyContact"}.kind != JNull:
    target.emergencyContact = some(jsonTo(source{"emergencyContact"},
        typeof(unsafeGet(target.emergencyContact))))
  assert(hasKey(source, "patientName"),
         "patientName" & " is missing while decoding " & "Healthhealth")
  target.patientName = jsonTo(source{"patientName"}, typeof(target.patientName))
  assert(hasKey(source, "bloodType"),
         "bloodType" & " is missing while decoding " & "Healthhealth")
  target.bloodType = jsonTo(source{"bloodType"}, typeof(target.bloodType))
  if hasKey(source, "medications") and source{"medications"}.kind != JNull:
    target.medications = some(jsonTo(source{"medications"},
                                     typeof(unsafeGet(target.medications))))
  if hasKey(source, "conditions") and source{"conditions"}.kind != JNull:
    target.conditions = some(jsonTo(source{"conditions"},
                                    typeof(unsafeGet(target.conditions))))
  if hasKey(source, "allergies") and source{"allergies"}.kind != JNull:
    target.allergies = some(jsonTo(source{"allergies"},
                                   typeof(unsafeGet(target.allergies))))

proc toJsonHook*(source: Healthhealth): JsonNode =
  result = newJObject()
  result{"dateOfBirth"} = newJString(source.dateOfBirth)
  if isSome(source.emergencyContact):
    result{"emergencyContact"} = toJsonHook(unsafeGet(source.emergencyContact))
  result{"patientName"} = newJString(source.patientName)
  result{"bloodType"} = newJString(source.bloodType)
  if isSome(source.medications):
    result{"medications"} = block:
      var output = newJArray()
      for entry in unsafeGet(source.medications):
        output.add(newJString(entry))
      output
  if isSome(source.conditions):
    result{"conditions"} = block:
      var output = newJArray()
      for entry in unsafeGet(source.conditions):
        output.add(newJString(entry))
      output
  if isSome(source.allergies):
    result{"allergies"} = block:
      var output = newJArray()
      for entry in unsafeGet(source.allergies):
        output.add(newJString(entry))
      output
{.pop.}
