{.push warning[UnusedImport]:off.}
import std/[json, jsonutils, tables, options]

type
  File_systemType* = enum
    Disk
  File_systemDiskDevice* = object
    `type`*: File_systemType
    device*: string
  File_systemStorageType* = enum
    Disk
  File_systemDiskUUID* = object
    `type`*: File_systemStorageType
    label*: string
  File_systemfile_systemStorageType* = enum
    Nfs
  File_systemNfs* = object
    `type`*: File_systemfile_systemStorageType
    server*: string
    remotePath*: string
  File_systemfile_systemStorageType2* = enum
    Tmpfs
  File_systemTmpfs* = object
    `type`*: File_systemfile_systemStorageType2
    sizeInMB*: BiggestInt
  File_systemUnion* = object
    case kind*: range[0 .. 3]
    of 0:
      key0*: File_systemDiskDevice
    of 1:
      key1*: File_systemDiskUUID
    of 2:
      key2*: File_systemNfs
    of 3:
      key3*: File_systemTmpfs
  File_systemFstype* = enum
    Ext4, Btrfs, Ext3
  File_systemfile_system* = object
    options*: Option[seq[string]]
    readonly*: Option[bool]
    storage*: File_systemUnion
    fstype*: Option[File_systemFstype]
proc toJsonHook*(source: File_systemType): JsonNode =
  case source
  of File_systemType.Disk:
    return newJString("disk")
  
proc fromJsonHook*(target: var File_systemType; source: JsonNode) =
  target = case getStr(source)
  of "disk":
    File_systemType.Disk
  else:
    raise newException(ValueError, "Unable to decode enum")
  
proc fromJsonHook*(target: var File_systemDiskDevice; source: JsonNode) =
  assert("type" in source,
         "type" & " is missing while decoding " & "File_systemDiskDevice")
  target.`type` = jsonTo(source{"type"}, typeof(target.`type`))
  assert("device" in source,
         "device" & " is missing while decoding " & "File_systemDiskDevice")
  target.device = jsonTo(source{"device"}, typeof(target.device))

proc toJsonHook*(source: File_systemDiskDevice): JsonNode =
  result = newJObject()
  result{"type"} = toJson(source.`type`)
  result{"device"} = toJson(source.device)

proc toJsonHook*(source: File_systemStorageType): JsonNode =
  case source
  of File_systemStorageType.Disk:
    return newJString("disk")
  
proc fromJsonHook*(target: var File_systemStorageType; source: JsonNode) =
  target = case getStr(source)
  of "disk":
    File_systemStorageType.Disk
  else:
    raise newException(ValueError, "Unable to decode enum")
  
proc fromJsonHook*(target: var File_systemDiskUUID; source: JsonNode) =
  assert("type" in source,
         "type" & " is missing while decoding " & "File_systemDiskUUID")
  target.`type` = jsonTo(source{"type"}, typeof(target.`type`))
  assert("label" in source,
         "label" & " is missing while decoding " & "File_systemDiskUUID")
  target.label = jsonTo(source{"label"}, typeof(target.label))

proc toJsonHook*(source: File_systemDiskUUID): JsonNode =
  result = newJObject()
  result{"type"} = toJson(source.`type`)
  result{"label"} = toJson(source.label)

proc toJsonHook*(source: File_systemfile_systemStorageType): JsonNode =
  case source
  of File_systemfile_systemStorageType.Nfs:
    return newJString("nfs")
  
proc fromJsonHook*(target: var File_systemfile_systemStorageType;
                   source: JsonNode) =
  target = case getStr(source)
  of "nfs":
    File_systemfile_systemStorageType.Nfs
  else:
    raise newException(ValueError, "Unable to decode enum")
  
proc fromJsonHook*(target: var File_systemNfs; source: JsonNode) =
  assert("type" in source,
         "type" & " is missing while decoding " & "File_systemNfs")
  target.`type` = jsonTo(source{"type"}, typeof(target.`type`))
  assert("server" in source,
         "server" & " is missing while decoding " & "File_systemNfs")
  target.server = jsonTo(source{"server"}, typeof(target.server))
  assert("remotePath" in source,
         "remotePath" & " is missing while decoding " & "File_systemNfs")
  target.remotePath = jsonTo(source{"remotePath"}, typeof(target.remotePath))

proc toJsonHook*(source: File_systemNfs): JsonNode =
  result = newJObject()
  result{"type"} = toJson(source.`type`)
  result{"server"} = toJson(source.server)
  result{"remotePath"} = toJson(source.remotePath)

proc toJsonHook*(source: File_systemfile_systemStorageType2): JsonNode =
  case source
  of File_systemfile_systemStorageType2.Tmpfs:
    return newJString("tmpfs")
  
proc fromJsonHook*(target: var File_systemfile_systemStorageType2;
                   source: JsonNode) =
  target = case getStr(source)
  of "tmpfs":
    File_systemfile_systemStorageType2.Tmpfs
  else:
    raise newException(ValueError, "Unable to decode enum")
  
proc fromJsonHook*(target: var File_systemTmpfs; source: JsonNode) =
  assert("type" in source,
         "type" & " is missing while decoding " & "File_systemTmpfs")
  target.`type` = jsonTo(source{"type"}, typeof(target.`type`))
  assert("sizeInMB" in source,
         "sizeInMB" & " is missing while decoding " & "File_systemTmpfs")
  target.sizeInMB = jsonTo(source{"sizeInMB"}, typeof(target.sizeInMB))

proc toJsonHook*(source: File_systemTmpfs): JsonNode =
  result = newJObject()
  result{"type"} = toJson(source.`type`)
  result{"sizeInMB"} = toJson(source.sizeInMB)

proc fromJsonHook*(target: var File_systemUnion; source: JsonNode) =
  if source.kind == JObject and "device" in source:
    target = File_systemUnion(kind: 0, key0: jsonTo(source, typeof(target.key0)))
  elif source.kind == JObject and "label" in source:
    target = File_systemUnion(kind: 1, key1: jsonTo(source, typeof(target.key1)))
  elif source.kind == JObject and "remotePath" in source:
    target = File_systemUnion(kind: 2, key2: jsonTo(source, typeof(target.key2)))
  elif source.kind == JObject and "sizeInMB" in source:
    target = File_systemUnion(kind: 3, key3: jsonTo(source, typeof(target.key3)))
  else:
    raise newException(ValueError,
                       "Unable to deserialize json node to File_systemUnion")
  
proc toJsonHook*(source: File_systemUnion): JsonNode =
  case source.kind
  of 0:
    return toJson(source.key0)
  of 1:
    return toJson(source.key1)
  of 2:
    return toJson(source.key2)
  of 3:
    return toJson(source.key3)
  
proc isDiskDevice(value: File_systemUnion): bool =
  value.kind == 0

proc asDiskDevice(value: File_systemUnion): auto =
  assert(value.kind == 0)
  return value.key0

proc isDiskUUID(value: File_systemUnion): bool =
  value.kind == 1

proc asDiskUUID(value: File_systemUnion): auto =
  assert(value.kind == 1)
  return value.key1

proc isNfs(value: File_systemUnion): bool =
  value.kind == 2

proc asNfs(value: File_systemUnion): auto =
  assert(value.kind == 2)
  return value.key2

proc isTmpfs(value: File_systemUnion): bool =
  value.kind == 3

proc asTmpfs(value: File_systemUnion): auto =
  assert(value.kind == 3)
  return value.key3

proc toJsonHook*(source: File_systemFstype): JsonNode =
  case source
  of File_systemFstype.Ext4:
    return newJString("ext4")
  of File_systemFstype.Btrfs:
    return newJString("btrfs")
  of File_systemFstype.Ext3:
    return newJString("ext3")
  
proc fromJsonHook*(target: var File_systemFstype; source: JsonNode) =
  target = case getStr(source)
  of "ext4":
    File_systemFstype.Ext4
  of "btrfs":
    File_systemFstype.Btrfs
  of "ext3":
    File_systemFstype.Ext3
  else:
    raise newException(ValueError, "Unable to decode enum")
  
proc fromJsonHook*(target: var File_systemfile_system; source: JsonNode) =
  if "options" in source and source{"options"}.kind != JNull:
    target.options = some(jsonTo(source{"options"},
                                 typeof(unsafeGet(target.options))))
  if "readonly" in source and source{"readonly"}.kind != JNull:
    target.readonly = some(jsonTo(source{"readonly"},
                                  typeof(unsafeGet(target.readonly))))
  assert("storage" in source,
         "storage" & " is missing while decoding " & "File_systemfile_system")
  target.storage = jsonTo(source{"storage"}, typeof(target.storage))
  if "fstype" in source and source{"fstype"}.kind != JNull:
    target.fstype = some(jsonTo(source{"fstype"},
                                typeof(unsafeGet(target.fstype))))

proc toJsonHook*(source: File_systemfile_system): JsonNode =
  result = newJObject()
  if isSome(source.options):
    result{"options"} = toJson(source.options)
  if isSome(source.readonly):
    result{"readonly"} = toJson(source.readonly)
  result{"storage"} = toJson(source.storage)
  if isSome(source.fstype):
    result{"fstype"} = toJson(source.fstype)
