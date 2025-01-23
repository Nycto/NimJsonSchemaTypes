{.push warning[UnusedImport]:off.}
import std/[json, jsonutils, tables, options]

type
  LdtkWhen* = enum
    AfterLoad, BeforeSave, AfterSave, Manual
  LdtkCustomCommand* = object
    command*: string
    `when`*: LdtkWhen
  LdtkEntityReferenceInfos* = object
    layerIid*: string
    levelIid*: string
    entityIid*: string
    worldIid*: string
  LdtkTocInstanceData* = object
    worldY*: BiggestInt
    fields*: JsonNode
    widPx*: BiggestInt
    iids*: LdtkEntityReferenceInfos
    heiPx*: BiggestInt
    worldX*: BiggestInt
  LdtkTableOfContentEntry* = object
    instancesData*: seq[LdtkTocInstanceData]
    identifier*: string
    instances*: Option[seq[LdtkEntityReferenceInfos]]
  LdtkWorldLayout* = enum
    LinearHorizontal, LinearVertical, GridVania, Free
  LdtkNeighbourLevel* = object
    levelUid*: Option[BiggestInt]
    levelIid*: string
    dir*: string
  LdtkBgPos* = enum
    CoverDirty, Repeat, Contain, Cover, Unscaled
  LdtkTile* = object
    px*: seq[BiggestInt]
    t*: BiggestInt
    d*: seq[BiggestInt]
    a*: BiggestFloat
    src*: seq[BiggestInt]
    f*: BiggestInt
  LdtkIntGridValueInstance* = object
    coordId*: BiggestInt
    v*: BiggestInt
  LdtkTilesetRect* = object
    x*: BiggestInt
    w*: BiggestInt
    y*: BiggestInt
    h*: BiggestInt
    tilesetUid*: BiggestInt
  LdtkFieldInstance* = object
    realEditorValues*: seq[JsonNode]
    value*: JsonNode
    tile*: Option[LdtkTilesetRect]
    `type`*: string
    identifier*: string
    defUid*: BiggestInt
  LdtkEntityInstance* = object
    worldY*: Option[BiggestInt]
    tile*: Option[LdtkTilesetRect]
    identifier*: string
    tags*: seq[string]
    height*: BiggestInt
    px*: seq[BiggestInt]
    defUid*: BiggestInt
    pivot*: seq[BiggestFloat]
    fieldInstances*: seq[LdtkFieldInstance]
    iid*: string
    width*: BiggestInt
    worldX*: Option[BiggestInt]
    grid*: seq[BiggestInt]
    smartColor*: string
  LdtkLayerInstance* = object
    opacity*: BiggestFloat
    optionalRules*: seq[BiggestInt]
    gridSize*: BiggestInt
    pxTotalOffsetX*: BiggestInt
    gridTiles*: seq[LdtkTile]
    `type`*: string
    identifier*: string
    overrideTilesetUid*: Option[BiggestInt]
    levelId*: BiggestInt
    intGrid*: Option[seq[LdtkIntGridValueInstance]]
    autoLayerTiles*: seq[LdtkTile]
    layerDefUid*: BiggestInt
    entityInstances*: seq[LdtkEntityInstance]
    intGridCsv*: seq[BiggestInt]
    pxOffsetX*: BiggestInt
    tilesetRelPath*: Option[string]
    tilesetDefUid*: Option[BiggestInt]
    cHei*: BiggestInt
    seed*: BiggestInt
    visible*: bool
    pxOffsetY*: BiggestInt
    iid*: string
    pxTotalOffsetY*: BiggestInt
    cWid*: BiggestInt
  LdtkLevelBgPosInfos* = object
    scale*: seq[BiggestFloat]
    cropRect*: seq[BiggestFloat]
    topLeftPx*: seq[BiggestInt]
  LdtkLevel* = object
    pxHei*: BiggestInt
    useAutoIdentifier*: bool
    bgColor*: string
    bgColor1*: Option[string]
    externalRelPath*: Option[string]
    worldY*: BiggestInt
    bgRelPath*: Option[string]
    identifier*: string
    pxWid*: BiggestInt
    worldDepth*: BiggestInt
    bgPivotX*: BiggestFloat
    neighbours*: seq[LdtkNeighbourLevel]
    uid*: BiggestInt
    bgPos*: Option[LdtkBgPos]
    layerInstances*: Option[seq[LdtkLayerInstance]]
    fieldInstances*: seq[LdtkFieldInstance]
    bgPos1*: Option[LdtkLevelBgPosInfos]
    worldX*: BiggestInt
    iid*: string
    bgPivotY*: BiggestFloat
    smartColor*: string
  LdtkWorld* = object
    worldGridWidth*: BiggestInt
    defaultLevelHeight*: BiggestInt
    identifier*: string
    worldLayout*: Option[LdtkWorldLayout]
    iid*: string
    defaultLevelWidth*: BiggestInt
    worldGridHeight*: BiggestInt
    levels*: seq[LdtkLevel]
  LdtkImageExportMode* = enum
    LayersAndLevels, OneImagePerLayer, None, OneImagePerLevel
  LdtkIntGridValueDef* = object
    tile*: Option[LdtkTilesetRect]
    color*: string
    identifier*: Option[string]
    groupUid*: BiggestInt
    value*: BiggestInt
  LdtkTextLanguageMode* = enum
    LangMarkdown, LangPython, LangLog, LangC, LangLua, LangHaxe, LangJS,
    LangRuby, LangJson, LangXml
  LdtkEditorDisplayPos* = enum
    Beneath, Above, Center
  LdtkEditorDisplayMode* = enum
    PointPath, PointStar, ValueOnly, Hidden, Points, NameAndValue,
    ArrayCountNoLabel, EntityTile, PointPathLoop, RadiusPx, LevelTile,
    RadiusGrid, RefLinkBetweenCenters, RefLinkBetweenPivots, ArrayCountWithLabel
  LdtkEditorLinkStyle* = enum
    DashedLine, CurvedArrow, ArrowsLine, ZigZag, StraightArrow
  LdtkAllowedRefs* = enum
    Any, OnlyTags, OnlySame, OnlySpecificEntity
  LdtkFieldDef* = object
    type1*: string
    editorDisplayScale*: BiggestFloat
    `type`*: string
    allowedRefsEntityUid*: Option[BiggestInt]
    textLanguageMode*: Option[LdtkTextLanguageMode]
    editorAlwaysShow*: bool
    defaultOverride*: Option[JsonNode]
    autoChainRef*: bool
    editorDisplayPos*: LdtkEditorDisplayPos
    editorDisplayMode*: LdtkEditorDisplayMode
    identifier*: string
    regex*: Option[string]
    isArray*: bool
    editorLinkStyle*: LdtkEditorLinkStyle
    allowedRefs*: LdtkAllowedRefs
    useForSmartColor*: bool
    editorTextSuffix*: Option[string]
    doc*: Option[string]
    editorTextPrefix*: Option[string]
    editorCutLongValues*: bool
    canBeNull*: bool
    allowedRefTags*: seq[string]
    uid*: BiggestInt
    symmetricalRef*: bool
    editorDisplayColor*: Option[string]
    allowOutOfLevelRef*: bool
    acceptFileTypes*: Option[seq[string]]
    editorShowInWorld*: bool
    tilesetUid*: Option[BiggestInt]
    arrayMaxLength*: Option[BiggestInt]
    arrayMinLength*: Option[BiggestInt]
    searchable*: bool
    min*: Option[BiggestFloat]
    exportToToc*: bool
    max*: Option[BiggestFloat]
  LdtkEmbedAtlas* = enum
    LdtkIcons
  LdtkEnumTagValue* = object
    tileIds*: seq[BiggestInt]
    enumValueId*: string
  LdtkTileCustomMetadata* = object
    data*: string
    tileId*: BiggestInt
  LdtkTilesetDef* = object
    pxHei*: BiggestInt
    savedSelections*: seq[Table[string, JsonNode]]
    padding*: BiggestInt
    spacing*: BiggestInt
    tagsSourceEnumUid*: Option[BiggestInt]
    embedAtlas*: Option[LdtkEmbedAtlas]
    identifier*: string
    cachedPixelData*: Option[Table[string, JsonNode]]
    enumTags*: seq[LdtkEnumTagValue]
    pxWid*: BiggestInt
    tileGridSize*: BiggestInt
    customData*: seq[LdtkTileCustomMetadata]
    uid*: BiggestInt
    cHei*: BiggestInt
    cWid*: BiggestInt
    relPath*: Option[string]
    tags*: seq[string]
  LdtkLimitScope* = enum
    PerLayer, PerWorld, PerLevel
  LdtkLimitBehavior* = enum
    PreventAdding, MoveLastOne, DiscardOldOnes
  LdtkRenderMode* = enum
    Tile, Cross, Ellipse, Rectangle
  LdtkTileRenderMode* = enum
    FullSizeCropped, FullSizeUncropped, Repeat, FitInside, NineSlice, Cover,
    Stretch
  LdtkEntityDef* = object
    allowOutOfBounds*: bool
    pivotY*: BiggestFloat
    tileOpacity*: BiggestFloat
    color*: string
    limitScope*: LdtkLimitScope
    limitBehavior*: LdtkLimitBehavior
    hollow*: bool
    height*: BiggestInt
    renderMode*: LdtkRenderMode
    tilesetId*: Option[BiggestInt]
    keepAspectRatio*: bool
    minWidth*: Option[BiggestInt]
    showName*: bool
    resizableX*: bool
    identifier*: string
    maxCount*: BiggestInt
    tileId*: Option[BiggestInt]
    pivotX*: BiggestFloat
    doc*: Option[string]
    fieldDefs*: seq[LdtkFieldDef]
    uid*: BiggestInt
    tileRenderMode*: LdtkTileRenderMode
    uiTileRect*: Option[LdtkTilesetRect]
    resizableY*: bool
    lineOpacity*: BiggestFloat
    minHeight*: Option[BiggestInt]
    tileRect*: Option[LdtkTilesetRect]
    nineSliceBorders*: seq[BiggestInt]
    maxWidth*: Option[BiggestInt]
    width*: BiggestInt
    tags*: seq[string]
    maxHeight*: Option[BiggestInt]
    exportToToc*: bool
    fillOpacity*: BiggestFloat
  LdtkEnumDefValues* = object
    tileSrcRect*: Option[seq[BiggestInt]]
    color*: BiggestInt
    id*: string
    tileId*: Option[BiggestInt]
    tileRect*: Option[LdtkTilesetRect]
  LdtkEnumDef* = object
    values*: seq[LdtkEnumDefValues]
    externalRelPath*: Option[string]
    identifier*: string
    externalFileChecksum*: Option[string]
    iconTilesetUid*: Option[BiggestInt]
    uid*: BiggestInt
    tags*: seq[string]
  LdtkType* = enum
    Tiles, Entities, AutoLayer, IntGrid
  LdtkChecker* = enum
    Horizontal, Vertical, None
  LdtkTileMode* = enum
    Single, Stamp
  LdtkAutoRuleDef* = object
    checker*: LdtkChecker
    pivotY*: BiggestFloat
    breakOnMatch*: bool
    perlinOctaves*: BiggestFloat
    yModulo*: BiggestInt
    size*: BiggestInt
    tileMode*: LdtkTileMode
    tileRandomXMax*: BiggestInt
    tileRandomXMin*: BiggestInt
    xModulo*: BiggestInt
    yOffset*: BiggestInt
    flipX*: bool
    tileYOffset*: BiggestInt
    chance*: BiggestFloat
    tileRandomYMax*: BiggestInt
    perlinActive*: bool
    perlinScale*: BiggestFloat
    outOfBoundsValue*: Option[BiggestInt]
    pivotX*: BiggestFloat
    flipY*: bool
    active*: bool
    uid*: BiggestInt
    tileIds*: Option[seq[BiggestInt]]
    invalidated*: bool
    pattern*: seq[BiggestInt]
    alpha*: BiggestFloat
    tileRectsIds*: seq[seq[BiggestInt]]
    tileXOffset*: BiggestInt
    xOffset*: BiggestInt
    tileRandomYMin*: BiggestInt
    perlinSeed*: BiggestFloat
  LdtkAutoLayerRuleGroup* = object
    isOptional*: bool
    color*: Option[string]
    collapsed*: Option[bool]
    usesWizard*: bool
    biomeRequirementMode*: BiggestInt
    rules*: seq[LdtkAutoRuleDef]
    icon*: Option[LdtkTilesetRect]
    active*: bool
    uid*: BiggestInt
    name*: string
    requiredBiomeValues*: seq[string]
  LdtkIntGridValueGroupDef* = object
    color*: Option[string]
    identifier*: Option[string]
    uid*: BiggestInt
  LdtkLayerDef* = object
    type1*: LdtkType
    autoTilesetDefUid*: Option[BiggestInt]
    parallaxScaling*: bool
    biomeFieldUid*: Option[BiggestInt]
    autoTilesKilledByOtherLayerUid*: Option[BiggestInt]
    inactiveOpacity*: BiggestFloat
    `type`*: string
    autoRuleGroups*: seq[LdtkAutoLayerRuleGroup]
    gridSize*: BiggestInt
    hideInList*: bool
    tilesetDefUid*: Option[BiggestInt]
    uiColor*: Option[string]
    requiredTags*: seq[string]
    tilePivotX*: BiggestFloat
    uiFilterTags*: seq[string]
    guideGridWid*: BiggestInt
    parallaxFactorX*: BiggestFloat
    identifier*: string
    canSelectWhenInactive*: bool
    pxOffsetX*: BiggestInt
    tilePivotY*: BiggestFloat
    excludedTags*: seq[string]
    doc*: Option[string]
    uid*: BiggestInt
    guideGridHei*: BiggestInt
    autoSourceLayerDefUid*: Option[BiggestInt]
    displayOpacity*: BiggestFloat
    intGridValuesGroups*: seq[LdtkIntGridValueGroupDef]
    hideFieldsWhenInactive*: bool
    useAsyncRender*: bool
    pxOffsetY*: BiggestInt
    parallaxFactorY*: BiggestFloat
    intGridValues*: seq[LdtkIntGridValueDef]
    renderInWorldView*: bool
  LdtkDefinitions* = object
    levelFields*: seq[LdtkFieldDef]
    tilesets*: seq[LdtkTilesetDef]
    entities*: seq[LdtkEntityDef]
    enums*: seq[LdtkEnumDef]
    layers*: seq[LdtkLayerDef]
    externalEnums*: seq[LdtkEnumDef]
  LdtkGridPoint* = object
    cx*: BiggestInt
    cy*: BiggestInt
  Ldtk_FORCED_REFS* = object
    CustomCommand*: Option[LdtkCustomCommand]
    IntGridValueDef*: Option[LdtkIntGridValueDef]
    Level*: Option[LdtkLevel]
    Definitions*: Option[LdtkDefinitions]
    EnumDef*: Option[LdtkEnumDef]
    FieldDef*: Option[LdtkFieldDef]
    AutoLayerRuleGroup*: Option[LdtkAutoLayerRuleGroup]
    TilesetDef*: Option[LdtkTilesetDef]
    TableOfContentEntry*: Option[LdtkTableOfContentEntry]
    EntityDef*: Option[LdtkEntityDef]
    FieldInstance*: Option[LdtkFieldInstance]
    EntityReferenceInfos*: Option[LdtkEntityReferenceInfos]
    LevelBgPosInfos*: Option[LdtkLevelBgPosInfos]
    TileCustomMetadata*: Option[LdtkTileCustomMetadata]
    Tile*: Option[LdtkTile]
    AutoRuleDef*: Option[LdtkAutoRuleDef]
    NeighbourLevel*: Option[LdtkNeighbourLevel]
    GridPoint*: Option[LdtkGridPoint]
    EntityInstance*: Option[LdtkEntityInstance]
    TilesetRect*: Option[LdtkTilesetRect]
    EnumTagValue*: Option[LdtkEnumTagValue]
    LayerInstance*: Option[LdtkLayerInstance]
    IntGridValueInstance*: Option[LdtkIntGridValueInstance]
    World*: Option[LdtkWorld]
    LayerDef*: Option[LdtkLayerDef]
    IntGridValueGroupDef*: Option[LdtkIntGridValueGroupDef]
    TocInstanceData*: Option[LdtkTocInstanceData]
    EnumDefValues*: Option[LdtkEnumDefValues]
  LdtkldtkWorldLayout* = enum
    LinearHorizontal, LinearVertical, GridVania, Free
  LdtkFlags* = enum
    ExportPreCsvIntGridFormat, DiscardPreCsvIntGrid,
    ExportOldTableOfContentData, PrependIndexToLevelFileNames, MultiWorlds,
    UseMultilinesType, IgnoreBackupSuggest
  LdtkIdentifierStyle* = enum
    Lowercase, Free, Capitalize, Uppercase
  LdtkLdtkJsonRoot* = object
    backupLimit*: BiggestInt
    simplifiedExport*: bool
    externalLevels*: bool
    backupRelPath*: Option[string]
    jsonVersion*: string
    bgColor*: string
    appBuildId*: BiggestFloat
    defaultEntityHeight*: BiggestInt
    pngFilePattern*: Option[string]
    customCommands*: seq[LdtkCustomCommand]
    exportTiled*: bool
    exportPng*: Option[bool]
    worldGridWidth*: Option[BiggestInt]
    defaultLevelHeight*: Option[BiggestInt]
    toc*: seq[LdtkTableOfContentEntry]
    worlds*: seq[LdtkWorld]
    imageExportMode*: LdtkImageExportMode
    dummyWorldIid*: string
    FORCED_REFS*: Option[Ldtk_FORCED_REFS]
    defaultPivotY*: BiggestFloat
    exportLevelBg*: bool
    nextUid*: BiggestInt
    levelNamePattern*: string
    defs*: LdtkDefinitions
    defaultPivotX*: BiggestFloat
    tutorialDesc*: Option[string]
    worldLayout*: Option[LdtkldtkWorldLayout]
    defaultEntityWidth*: BiggestInt
    iid*: string
    defaultGridSize*: BiggestInt
    defaultLevelWidth*: Option[BiggestInt]
    minifyJson*: bool
    backupOnSave*: bool
    flags*: seq[LdtkFlags]
    defaultLevelBgColor*: string
    identifierStyle*: LdtkIdentifierStyle
    worldGridHeight*: Option[BiggestInt]
    levels*: seq[LdtkLevel]
proc toJsonHook*(source: LdtkWhen): JsonNode =
  case source
  of LdtkWhen.AfterLoad:
    return newJString("AfterLoad")
  of LdtkWhen.BeforeSave:
    return newJString("BeforeSave")
  of LdtkWhen.AfterSave:
    return newJString("AfterSave")
  of LdtkWhen.Manual:
    return newJString("Manual")
  
proc fromJsonHook*(target: var LdtkWhen; source: JsonNode) =
  target = case getStr(source)
  of "AfterLoad":
    LdtkWhen.AfterLoad
  of "BeforeSave":
    LdtkWhen.BeforeSave
  of "AfterSave":
    LdtkWhen.AfterSave
  of "Manual":
    LdtkWhen.Manual
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc fromJsonHook*(target: var LdtkCustomCommand; source: JsonNode) =
  assert(hasKey(source, "command"),
         "command" & " is missing while decoding " & "LdtkCustomCommand")
  target.command = jsonTo(source{"command"}, typeof(target.command))
  assert(hasKey(source, "when"),
         "when" & " is missing while decoding " & "LdtkCustomCommand")
  target.`when` = jsonTo(source{"when"}, typeof(target.`when`))

proc toJsonHook*(source: LdtkCustomCommand): JsonNode =
  result = newJObject()
  result{"command"} = toJson(source.command)
  result{"when"} = toJson(source.`when`)

proc fromJsonHook*(target: var LdtkEntityReferenceInfos; source: JsonNode) =
  assert(hasKey(source, "layerIid"), "layerIid" & " is missing while decoding " &
      "LdtkEntityReferenceInfos")
  target.layerIid = jsonTo(source{"layerIid"}, typeof(target.layerIid))
  assert(hasKey(source, "levelIid"), "levelIid" & " is missing while decoding " &
      "LdtkEntityReferenceInfos")
  target.levelIid = jsonTo(source{"levelIid"}, typeof(target.levelIid))
  assert(hasKey(source, "entityIid"), "entityIid" &
      " is missing while decoding " &
      "LdtkEntityReferenceInfos")
  target.entityIid = jsonTo(source{"entityIid"}, typeof(target.entityIid))
  assert(hasKey(source, "worldIid"), "worldIid" & " is missing while decoding " &
      "LdtkEntityReferenceInfos")
  target.worldIid = jsonTo(source{"worldIid"}, typeof(target.worldIid))

proc toJsonHook*(source: LdtkEntityReferenceInfos): JsonNode =
  result = newJObject()
  result{"layerIid"} = toJson(source.layerIid)
  result{"levelIid"} = toJson(source.levelIid)
  result{"entityIid"} = toJson(source.entityIid)
  result{"worldIid"} = toJson(source.worldIid)

proc fromJsonHook*(target: var LdtkTocInstanceData; source: JsonNode) =
  assert(hasKey(source, "worldY"),
         "worldY" & " is missing while decoding " & "LdtkTocInstanceData")
  target.worldY = jsonTo(source{"worldY"}, typeof(target.worldY))
  assert(hasKey(source, "fields"),
         "fields" & " is missing while decoding " & "LdtkTocInstanceData")
  target.fields = jsonTo(source{"fields"}, typeof(target.fields))
  assert(hasKey(source, "widPx"),
         "widPx" & " is missing while decoding " & "LdtkTocInstanceData")
  target.widPx = jsonTo(source{"widPx"}, typeof(target.widPx))
  assert(hasKey(source, "iids"),
         "iids" & " is missing while decoding " & "LdtkTocInstanceData")
  target.iids = jsonTo(source{"iids"}, typeof(target.iids))
  assert(hasKey(source, "heiPx"),
         "heiPx" & " is missing while decoding " & "LdtkTocInstanceData")
  target.heiPx = jsonTo(source{"heiPx"}, typeof(target.heiPx))
  assert(hasKey(source, "worldX"),
         "worldX" & " is missing while decoding " & "LdtkTocInstanceData")
  target.worldX = jsonTo(source{"worldX"}, typeof(target.worldX))

proc toJsonHook*(source: LdtkTocInstanceData): JsonNode =
  result = newJObject()
  result{"worldY"} = toJson(source.worldY)
  result{"fields"} = toJson(source.fields)
  result{"widPx"} = toJson(source.widPx)
  result{"iids"} = toJson(source.iids)
  result{"heiPx"} = toJson(source.heiPx)
  result{"worldX"} = toJson(source.worldX)

proc fromJsonHook*(target: var LdtkTableOfContentEntry; source: JsonNode) =
  assert(hasKey(source, "instancesData"), "instancesData" &
      " is missing while decoding " &
      "LdtkTableOfContentEntry")
  target.instancesData = jsonTo(source{"instancesData"},
                                typeof(target.instancesData))
  assert(hasKey(source, "identifier"), "identifier" &
      " is missing while decoding " &
      "LdtkTableOfContentEntry")
  target.identifier = jsonTo(source{"identifier"}, typeof(target.identifier))
  if hasKey(source, "instances") and source{"instances"}.kind != JNull:
    target.instances = some(jsonTo(source{"instances"},
                                   typeof(unsafeGet(target.instances))))

proc toJsonHook*(source: LdtkTableOfContentEntry): JsonNode =
  result = newJObject()
  result{"instancesData"} = toJson(source.instancesData)
  result{"identifier"} = toJson(source.identifier)
  if isSome(source.instances):
    result{"instances"} = toJson(unsafeGet(source.instances))

proc toJsonHook*(source: LdtkWorldLayout): JsonNode =
  case source
  of LdtkWorldLayout.LinearHorizontal:
    return newJString("LinearHorizontal")
  of LdtkWorldLayout.LinearVertical:
    return newJString("LinearVertical")
  of LdtkWorldLayout.GridVania:
    return newJString("GridVania")
  of LdtkWorldLayout.Free:
    return newJString("Free")
  
proc fromJsonHook*(target: var LdtkWorldLayout; source: JsonNode) =
  target = case getStr(source)
  of "LinearHorizontal":
    LdtkWorldLayout.LinearHorizontal
  of "LinearVertical":
    LdtkWorldLayout.LinearVertical
  of "GridVania":
    LdtkWorldLayout.GridVania
  of "Free":
    LdtkWorldLayout.Free
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc fromJsonHook*(target: var LdtkNeighbourLevel; source: JsonNode) =
  if hasKey(source, "levelUid") and source{"levelUid"}.kind != JNull:
    target.levelUid = some(jsonTo(source{"levelUid"},
                                  typeof(unsafeGet(target.levelUid))))
  assert(hasKey(source, "levelIid"),
         "levelIid" & " is missing while decoding " & "LdtkNeighbourLevel")
  target.levelIid = jsonTo(source{"levelIid"}, typeof(target.levelIid))
  assert(hasKey(source, "dir"),
         "dir" & " is missing while decoding " & "LdtkNeighbourLevel")
  target.dir = jsonTo(source{"dir"}, typeof(target.dir))

proc toJsonHook*(source: LdtkNeighbourLevel): JsonNode =
  result = newJObject()
  if isSome(source.levelUid):
    result{"levelUid"} = toJson(unsafeGet(source.levelUid))
  result{"levelIid"} = toJson(source.levelIid)
  result{"dir"} = toJson(source.dir)

proc toJsonHook*(source: LdtkBgPos): JsonNode =
  case source
  of LdtkBgPos.CoverDirty:
    return newJString("CoverDirty")
  of LdtkBgPos.Repeat:
    return newJString("Repeat")
  of LdtkBgPos.Contain:
    return newJString("Contain")
  of LdtkBgPos.Cover:
    return newJString("Cover")
  of LdtkBgPos.Unscaled:
    return newJString("Unscaled")
  
proc fromJsonHook*(target: var LdtkBgPos; source: JsonNode) =
  target = case getStr(source)
  of "CoverDirty":
    LdtkBgPos.CoverDirty
  of "Repeat":
    LdtkBgPos.Repeat
  of "Contain":
    LdtkBgPos.Contain
  of "Cover":
    LdtkBgPos.Cover
  of "Unscaled":
    LdtkBgPos.Unscaled
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc fromJsonHook*(target: var LdtkTile; source: JsonNode) =
  assert(hasKey(source, "px"), "px" & " is missing while decoding " & "LdtkTile")
  target.px = jsonTo(source{"px"}, typeof(target.px))
  assert(hasKey(source, "t"), "t" & " is missing while decoding " & "LdtkTile")
  target.t = jsonTo(source{"t"}, typeof(target.t))
  assert(hasKey(source, "d"), "d" & " is missing while decoding " & "LdtkTile")
  target.d = jsonTo(source{"d"}, typeof(target.d))
  assert(hasKey(source, "a"), "a" & " is missing while decoding " & "LdtkTile")
  target.a = jsonTo(source{"a"}, typeof(target.a))
  assert(hasKey(source, "src"),
         "src" & " is missing while decoding " & "LdtkTile")
  target.src = jsonTo(source{"src"}, typeof(target.src))
  assert(hasKey(source, "f"), "f" & " is missing while decoding " & "LdtkTile")
  target.f = jsonTo(source{"f"}, typeof(target.f))

proc toJsonHook*(source: LdtkTile): JsonNode =
  result = newJObject()
  result{"px"} = toJson(source.px)
  result{"t"} = toJson(source.t)
  result{"d"} = toJson(source.d)
  result{"a"} = toJson(source.a)
  result{"src"} = toJson(source.src)
  result{"f"} = toJson(source.f)

proc fromJsonHook*(target: var LdtkIntGridValueInstance; source: JsonNode) =
  assert(hasKey(source, "coordId"),
         "coordId" & " is missing while decoding " & "LdtkIntGridValueInstance")
  target.coordId = jsonTo(source{"coordId"}, typeof(target.coordId))
  assert(hasKey(source, "v"),
         "v" & " is missing while decoding " & "LdtkIntGridValueInstance")
  target.v = jsonTo(source{"v"}, typeof(target.v))

proc toJsonHook*(source: LdtkIntGridValueInstance): JsonNode =
  result = newJObject()
  result{"coordId"} = toJson(source.coordId)
  result{"v"} = toJson(source.v)

proc fromJsonHook*(target: var LdtkTilesetRect; source: JsonNode) =
  assert(hasKey(source, "x"),
         "x" & " is missing while decoding " & "LdtkTilesetRect")
  target.x = jsonTo(source{"x"}, typeof(target.x))
  assert(hasKey(source, "w"),
         "w" & " is missing while decoding " & "LdtkTilesetRect")
  target.w = jsonTo(source{"w"}, typeof(target.w))
  assert(hasKey(source, "y"),
         "y" & " is missing while decoding " & "LdtkTilesetRect")
  target.y = jsonTo(source{"y"}, typeof(target.y))
  assert(hasKey(source, "h"),
         "h" & " is missing while decoding " & "LdtkTilesetRect")
  target.h = jsonTo(source{"h"}, typeof(target.h))
  assert(hasKey(source, "tilesetUid"),
         "tilesetUid" & " is missing while decoding " & "LdtkTilesetRect")
  target.tilesetUid = jsonTo(source{"tilesetUid"}, typeof(target.tilesetUid))

proc toJsonHook*(source: LdtkTilesetRect): JsonNode =
  result = newJObject()
  result{"x"} = toJson(source.x)
  result{"w"} = toJson(source.w)
  result{"y"} = toJson(source.y)
  result{"h"} = toJson(source.h)
  result{"tilesetUid"} = toJson(source.tilesetUid)

proc fromJsonHook*(target: var LdtkFieldInstance; source: JsonNode) =
  assert(hasKey(source, "realEditorValues"), "realEditorValues" &
      " is missing while decoding " &
      "LdtkFieldInstance")
  target.realEditorValues = jsonTo(source{"realEditorValues"},
                                   typeof(target.realEditorValues))
  assert(hasKey(source, "__value"),
         "__value" & " is missing while decoding " & "LdtkFieldInstance")
  target.value = jsonTo(source{"__value"}, typeof(target.value))
  if hasKey(source, "__tile") and source{"__tile"}.kind != JNull:
    target.tile = some(jsonTo(source{"__tile"}, typeof(unsafeGet(target.tile))))
  assert(hasKey(source, "__type"),
         "__type" & " is missing while decoding " & "LdtkFieldInstance")
  target.`type` = jsonTo(source{"__type"}, typeof(target.`type`))
  assert(hasKey(source, "__identifier"),
         "__identifier" & " is missing while decoding " & "LdtkFieldInstance")
  target.identifier = jsonTo(source{"__identifier"}, typeof(target.identifier))
  assert(hasKey(source, "defUid"),
         "defUid" & " is missing while decoding " & "LdtkFieldInstance")
  target.defUid = jsonTo(source{"defUid"}, typeof(target.defUid))

proc toJsonHook*(source: LdtkFieldInstance): JsonNode =
  result = newJObject()
  result{"realEditorValues"} = toJson(source.realEditorValues)
  result{"__value"} = toJson(source.value)
  if isSome(source.tile):
    result{"__tile"} = toJson(unsafeGet(source.tile))
  result{"__type"} = toJson(source.`type`)
  result{"__identifier"} = toJson(source.identifier)
  result{"defUid"} = toJson(source.defUid)

proc fromJsonHook*(target: var LdtkEntityInstance; source: JsonNode) =
  if hasKey(source, "__worldY") and source{"__worldY"}.kind != JNull:
    target.worldY = some(jsonTo(source{"__worldY"},
                                typeof(unsafeGet(target.worldY))))
  if hasKey(source, "__tile") and source{"__tile"}.kind != JNull:
    target.tile = some(jsonTo(source{"__tile"}, typeof(unsafeGet(target.tile))))
  assert(hasKey(source, "__identifier"),
         "__identifier" & " is missing while decoding " & "LdtkEntityInstance")
  target.identifier = jsonTo(source{"__identifier"}, typeof(target.identifier))
  assert(hasKey(source, "__tags"),
         "__tags" & " is missing while decoding " & "LdtkEntityInstance")
  target.tags = jsonTo(source{"__tags"}, typeof(target.tags))
  assert(hasKey(source, "height"),
         "height" & " is missing while decoding " & "LdtkEntityInstance")
  target.height = jsonTo(source{"height"}, typeof(target.height))
  assert(hasKey(source, "px"),
         "px" & " is missing while decoding " & "LdtkEntityInstance")
  target.px = jsonTo(source{"px"}, typeof(target.px))
  assert(hasKey(source, "defUid"),
         "defUid" & " is missing while decoding " & "LdtkEntityInstance")
  target.defUid = jsonTo(source{"defUid"}, typeof(target.defUid))
  assert(hasKey(source, "__pivot"),
         "__pivot" & " is missing while decoding " & "LdtkEntityInstance")
  target.pivot = jsonTo(source{"__pivot"}, typeof(target.pivot))
  assert(hasKey(source, "fieldInstances"), "fieldInstances" &
      " is missing while decoding " &
      "LdtkEntityInstance")
  target.fieldInstances = jsonTo(source{"fieldInstances"},
                                 typeof(target.fieldInstances))
  assert(hasKey(source, "iid"),
         "iid" & " is missing while decoding " & "LdtkEntityInstance")
  target.iid = jsonTo(source{"iid"}, typeof(target.iid))
  assert(hasKey(source, "width"),
         "width" & " is missing while decoding " & "LdtkEntityInstance")
  target.width = jsonTo(source{"width"}, typeof(target.width))
  if hasKey(source, "__worldX") and source{"__worldX"}.kind != JNull:
    target.worldX = some(jsonTo(source{"__worldX"},
                                typeof(unsafeGet(target.worldX))))
  assert(hasKey(source, "__grid"),
         "__grid" & " is missing while decoding " & "LdtkEntityInstance")
  target.grid = jsonTo(source{"__grid"}, typeof(target.grid))
  assert(hasKey(source, "__smartColor"),
         "__smartColor" & " is missing while decoding " & "LdtkEntityInstance")
  target.smartColor = jsonTo(source{"__smartColor"}, typeof(target.smartColor))

proc toJsonHook*(source: LdtkEntityInstance): JsonNode =
  result = newJObject()
  if isSome(source.worldY):
    result{"__worldY"} = toJson(unsafeGet(source.worldY))
  if isSome(source.tile):
    result{"__tile"} = toJson(unsafeGet(source.tile))
  result{"__identifier"} = toJson(source.identifier)
  result{"__tags"} = toJson(source.tags)
  result{"height"} = toJson(source.height)
  result{"px"} = toJson(source.px)
  result{"defUid"} = toJson(source.defUid)
  result{"__pivot"} = toJson(source.pivot)
  result{"fieldInstances"} = toJson(source.fieldInstances)
  result{"iid"} = toJson(source.iid)
  result{"width"} = toJson(source.width)
  if isSome(source.worldX):
    result{"__worldX"} = toJson(unsafeGet(source.worldX))
  result{"__grid"} = toJson(source.grid)
  result{"__smartColor"} = toJson(source.smartColor)

proc fromJsonHook*(target: var LdtkLayerInstance; source: JsonNode) =
  assert(hasKey(source, "__opacity"),
         "__opacity" & " is missing while decoding " & "LdtkLayerInstance")
  target.opacity = jsonTo(source{"__opacity"}, typeof(target.opacity))
  assert(hasKey(source, "optionalRules"),
         "optionalRules" & " is missing while decoding " & "LdtkLayerInstance")
  target.optionalRules = jsonTo(source{"optionalRules"},
                                typeof(target.optionalRules))
  assert(hasKey(source, "__gridSize"),
         "__gridSize" & " is missing while decoding " & "LdtkLayerInstance")
  target.gridSize = jsonTo(source{"__gridSize"}, typeof(target.gridSize))
  assert(hasKey(source, "__pxTotalOffsetX"), "__pxTotalOffsetX" &
      " is missing while decoding " &
      "LdtkLayerInstance")
  target.pxTotalOffsetX = jsonTo(source{"__pxTotalOffsetX"},
                                 typeof(target.pxTotalOffsetX))
  assert(hasKey(source, "gridTiles"),
         "gridTiles" & " is missing while decoding " & "LdtkLayerInstance")
  target.gridTiles = jsonTo(source{"gridTiles"}, typeof(target.gridTiles))
  assert(hasKey(source, "__type"),
         "__type" & " is missing while decoding " & "LdtkLayerInstance")
  target.`type` = jsonTo(source{"__type"}, typeof(target.`type`))
  assert(hasKey(source, "__identifier"),
         "__identifier" & " is missing while decoding " & "LdtkLayerInstance")
  target.identifier = jsonTo(source{"__identifier"}, typeof(target.identifier))
  if hasKey(source, "overrideTilesetUid") and
      source{"overrideTilesetUid"}.kind != JNull:
    target.overrideTilesetUid = some(jsonTo(source{"overrideTilesetUid"},
        typeof(unsafeGet(target.overrideTilesetUid))))
  assert(hasKey(source, "levelId"),
         "levelId" & " is missing while decoding " & "LdtkLayerInstance")
  target.levelId = jsonTo(source{"levelId"}, typeof(target.levelId))
  if hasKey(source, "intGrid") and source{"intGrid"}.kind != JNull:
    target.intGrid = some(jsonTo(source{"intGrid"},
                                 typeof(unsafeGet(target.intGrid))))
  assert(hasKey(source, "autoLayerTiles"),
         "autoLayerTiles" & " is missing while decoding " & "LdtkLayerInstance")
  target.autoLayerTiles = jsonTo(source{"autoLayerTiles"},
                                 typeof(target.autoLayerTiles))
  assert(hasKey(source, "layerDefUid"),
         "layerDefUid" & " is missing while decoding " & "LdtkLayerInstance")
  target.layerDefUid = jsonTo(source{"layerDefUid"}, typeof(target.layerDefUid))
  assert(hasKey(source, "entityInstances"), "entityInstances" &
      " is missing while decoding " &
      "LdtkLayerInstance")
  target.entityInstances = jsonTo(source{"entityInstances"},
                                  typeof(target.entityInstances))
  assert(hasKey(source, "intGridCsv"),
         "intGridCsv" & " is missing while decoding " & "LdtkLayerInstance")
  target.intGridCsv = jsonTo(source{"intGridCsv"}, typeof(target.intGridCsv))
  assert(hasKey(source, "pxOffsetX"),
         "pxOffsetX" & " is missing while decoding " & "LdtkLayerInstance")
  target.pxOffsetX = jsonTo(source{"pxOffsetX"}, typeof(target.pxOffsetX))
  if hasKey(source, "__tilesetRelPath") and
      source{"__tilesetRelPath"}.kind != JNull:
    target.tilesetRelPath = some(jsonTo(source{"__tilesetRelPath"}, typeof(
        unsafeGet(target.tilesetRelPath))))
  if hasKey(source, "__tilesetDefUid") and
      source{"__tilesetDefUid"}.kind != JNull:
    target.tilesetDefUid = some(jsonTo(source{"__tilesetDefUid"},
                                       typeof(unsafeGet(target.tilesetDefUid))))
  assert(hasKey(source, "__cHei"),
         "__cHei" & " is missing while decoding " & "LdtkLayerInstance")
  target.cHei = jsonTo(source{"__cHei"}, typeof(target.cHei))
  assert(hasKey(source, "seed"),
         "seed" & " is missing while decoding " & "LdtkLayerInstance")
  target.seed = jsonTo(source{"seed"}, typeof(target.seed))
  assert(hasKey(source, "visible"),
         "visible" & " is missing while decoding " & "LdtkLayerInstance")
  target.visible = jsonTo(source{"visible"}, typeof(target.visible))
  assert(hasKey(source, "pxOffsetY"),
         "pxOffsetY" & " is missing while decoding " & "LdtkLayerInstance")
  target.pxOffsetY = jsonTo(source{"pxOffsetY"}, typeof(target.pxOffsetY))
  assert(hasKey(source, "iid"),
         "iid" & " is missing while decoding " & "LdtkLayerInstance")
  target.iid = jsonTo(source{"iid"}, typeof(target.iid))
  assert(hasKey(source, "__pxTotalOffsetY"), "__pxTotalOffsetY" &
      " is missing while decoding " &
      "LdtkLayerInstance")
  target.pxTotalOffsetY = jsonTo(source{"__pxTotalOffsetY"},
                                 typeof(target.pxTotalOffsetY))
  assert(hasKey(source, "__cWid"),
         "__cWid" & " is missing while decoding " & "LdtkLayerInstance")
  target.cWid = jsonTo(source{"__cWid"}, typeof(target.cWid))

proc toJsonHook*(source: LdtkLayerInstance): JsonNode =
  result = newJObject()
  result{"__opacity"} = toJson(source.opacity)
  result{"optionalRules"} = toJson(source.optionalRules)
  result{"__gridSize"} = toJson(source.gridSize)
  result{"__pxTotalOffsetX"} = toJson(source.pxTotalOffsetX)
  result{"gridTiles"} = toJson(source.gridTiles)
  result{"__type"} = toJson(source.`type`)
  result{"__identifier"} = toJson(source.identifier)
  if isSome(source.overrideTilesetUid):
    result{"overrideTilesetUid"} = toJson(unsafeGet(source.overrideTilesetUid))
  result{"levelId"} = toJson(source.levelId)
  if isSome(source.intGrid):
    result{"intGrid"} = toJson(unsafeGet(source.intGrid))
  result{"autoLayerTiles"} = toJson(source.autoLayerTiles)
  result{"layerDefUid"} = toJson(source.layerDefUid)
  result{"entityInstances"} = toJson(source.entityInstances)
  result{"intGridCsv"} = toJson(source.intGridCsv)
  result{"pxOffsetX"} = toJson(source.pxOffsetX)
  if isSome(source.tilesetRelPath):
    result{"__tilesetRelPath"} = toJson(unsafeGet(source.tilesetRelPath))
  if isSome(source.tilesetDefUid):
    result{"__tilesetDefUid"} = toJson(unsafeGet(source.tilesetDefUid))
  result{"__cHei"} = toJson(source.cHei)
  result{"seed"} = toJson(source.seed)
  result{"visible"} = toJson(source.visible)
  result{"pxOffsetY"} = toJson(source.pxOffsetY)
  result{"iid"} = toJson(source.iid)
  result{"__pxTotalOffsetY"} = toJson(source.pxTotalOffsetY)
  result{"__cWid"} = toJson(source.cWid)

proc fromJsonHook*(target: var LdtkLevelBgPosInfos; source: JsonNode) =
  assert(hasKey(source, "scale"),
         "scale" & " is missing while decoding " & "LdtkLevelBgPosInfos")
  target.scale = jsonTo(source{"scale"}, typeof(target.scale))
  assert(hasKey(source, "cropRect"),
         "cropRect" & " is missing while decoding " & "LdtkLevelBgPosInfos")
  target.cropRect = jsonTo(source{"cropRect"}, typeof(target.cropRect))
  assert(hasKey(source, "topLeftPx"),
         "topLeftPx" & " is missing while decoding " & "LdtkLevelBgPosInfos")
  target.topLeftPx = jsonTo(source{"topLeftPx"}, typeof(target.topLeftPx))

proc toJsonHook*(source: LdtkLevelBgPosInfos): JsonNode =
  result = newJObject()
  result{"scale"} = toJson(source.scale)
  result{"cropRect"} = toJson(source.cropRect)
  result{"topLeftPx"} = toJson(source.topLeftPx)

proc fromJsonHook*(target: var LdtkLevel; source: JsonNode) =
  assert(hasKey(source, "pxHei"),
         "pxHei" & " is missing while decoding " & "LdtkLevel")
  target.pxHei = jsonTo(source{"pxHei"}, typeof(target.pxHei))
  assert(hasKey(source, "useAutoIdentifier"),
         "useAutoIdentifier" & " is missing while decoding " & "LdtkLevel")
  target.useAutoIdentifier = jsonTo(source{"useAutoIdentifier"},
                                    typeof(target.useAutoIdentifier))
  assert(hasKey(source, "__bgColor"),
         "__bgColor" & " is missing while decoding " & "LdtkLevel")
  target.bgColor = jsonTo(source{"__bgColor"}, typeof(target.bgColor))
  if hasKey(source, "bgColor") and source{"bgColor"}.kind != JNull:
    target.bgColor1 = some(jsonTo(source{"bgColor"},
                                  typeof(unsafeGet(target.bgColor1))))
  if hasKey(source, "externalRelPath") and
      source{"externalRelPath"}.kind != JNull:
    target.externalRelPath = some(jsonTo(source{"externalRelPath"},
        typeof(unsafeGet(target.externalRelPath))))
  assert(hasKey(source, "worldY"),
         "worldY" & " is missing while decoding " & "LdtkLevel")
  target.worldY = jsonTo(source{"worldY"}, typeof(target.worldY))
  if hasKey(source, "bgRelPath") and source{"bgRelPath"}.kind != JNull:
    target.bgRelPath = some(jsonTo(source{"bgRelPath"},
                                   typeof(unsafeGet(target.bgRelPath))))
  assert(hasKey(source, "identifier"),
         "identifier" & " is missing while decoding " & "LdtkLevel")
  target.identifier = jsonTo(source{"identifier"}, typeof(target.identifier))
  assert(hasKey(source, "pxWid"),
         "pxWid" & " is missing while decoding " & "LdtkLevel")
  target.pxWid = jsonTo(source{"pxWid"}, typeof(target.pxWid))
  assert(hasKey(source, "worldDepth"),
         "worldDepth" & " is missing while decoding " & "LdtkLevel")
  target.worldDepth = jsonTo(source{"worldDepth"}, typeof(target.worldDepth))
  assert(hasKey(source, "bgPivotX"),
         "bgPivotX" & " is missing while decoding " & "LdtkLevel")
  target.bgPivotX = jsonTo(source{"bgPivotX"}, typeof(target.bgPivotX))
  assert(hasKey(source, "__neighbours"),
         "__neighbours" & " is missing while decoding " & "LdtkLevel")
  target.neighbours = jsonTo(source{"__neighbours"}, typeof(target.neighbours))
  assert(hasKey(source, "uid"),
         "uid" & " is missing while decoding " & "LdtkLevel")
  target.uid = jsonTo(source{"uid"}, typeof(target.uid))
  if hasKey(source, "bgPos") and source{"bgPos"}.kind != JNull:
    target.bgPos = some(jsonTo(source{"bgPos"}, typeof(unsafeGet(target.bgPos))))
  if hasKey(source, "layerInstances") and
      source{"layerInstances"}.kind != JNull:
    target.layerInstances = some(jsonTo(source{"layerInstances"}, typeof(
        unsafeGet(target.layerInstances))))
  assert(hasKey(source, "fieldInstances"),
         "fieldInstances" & " is missing while decoding " & "LdtkLevel")
  target.fieldInstances = jsonTo(source{"fieldInstances"},
                                 typeof(target.fieldInstances))
  if hasKey(source, "__bgPos") and source{"__bgPos"}.kind != JNull:
    target.bgPos1 = some(jsonTo(source{"__bgPos"},
                                typeof(unsafeGet(target.bgPos1))))
  assert(hasKey(source, "worldX"),
         "worldX" & " is missing while decoding " & "LdtkLevel")
  target.worldX = jsonTo(source{"worldX"}, typeof(target.worldX))
  assert(hasKey(source, "iid"),
         "iid" & " is missing while decoding " & "LdtkLevel")
  target.iid = jsonTo(source{"iid"}, typeof(target.iid))
  assert(hasKey(source, "bgPivotY"),
         "bgPivotY" & " is missing while decoding " & "LdtkLevel")
  target.bgPivotY = jsonTo(source{"bgPivotY"}, typeof(target.bgPivotY))
  assert(hasKey(source, "__smartColor"),
         "__smartColor" & " is missing while decoding " & "LdtkLevel")
  target.smartColor = jsonTo(source{"__smartColor"}, typeof(target.smartColor))

proc toJsonHook*(source: LdtkLevel): JsonNode =
  result = newJObject()
  result{"pxHei"} = toJson(source.pxHei)
  result{"useAutoIdentifier"} = toJson(source.useAutoIdentifier)
  result{"__bgColor"} = toJson(source.bgColor)
  if isSome(source.bgColor1):
    result{"bgColor"} = toJson(unsafeGet(source.bgColor1))
  if isSome(source.externalRelPath):
    result{"externalRelPath"} = toJson(unsafeGet(source.externalRelPath))
  result{"worldY"} = toJson(source.worldY)
  if isSome(source.bgRelPath):
    result{"bgRelPath"} = toJson(unsafeGet(source.bgRelPath))
  result{"identifier"} = toJson(source.identifier)
  result{"pxWid"} = toJson(source.pxWid)
  result{"worldDepth"} = toJson(source.worldDepth)
  result{"bgPivotX"} = toJson(source.bgPivotX)
  result{"__neighbours"} = toJson(source.neighbours)
  result{"uid"} = toJson(source.uid)
  if isSome(source.bgPos):
    result{"bgPos"} = toJson(unsafeGet(source.bgPos))
  if isSome(source.layerInstances):
    result{"layerInstances"} = toJson(unsafeGet(source.layerInstances))
  result{"fieldInstances"} = toJson(source.fieldInstances)
  if isSome(source.bgPos1):
    result{"__bgPos"} = toJson(unsafeGet(source.bgPos1))
  result{"worldX"} = toJson(source.worldX)
  result{"iid"} = toJson(source.iid)
  result{"bgPivotY"} = toJson(source.bgPivotY)
  result{"__smartColor"} = toJson(source.smartColor)

proc fromJsonHook*(target: var LdtkWorld; source: JsonNode) =
  assert(hasKey(source, "worldGridWidth"),
         "worldGridWidth" & " is missing while decoding " & "LdtkWorld")
  target.worldGridWidth = jsonTo(source{"worldGridWidth"},
                                 typeof(target.worldGridWidth))
  assert(hasKey(source, "defaultLevelHeight"),
         "defaultLevelHeight" & " is missing while decoding " & "LdtkWorld")
  target.defaultLevelHeight = jsonTo(source{"defaultLevelHeight"},
                                     typeof(target.defaultLevelHeight))
  assert(hasKey(source, "identifier"),
         "identifier" & " is missing while decoding " & "LdtkWorld")
  target.identifier = jsonTo(source{"identifier"}, typeof(target.identifier))
  if hasKey(source, "worldLayout") and source{"worldLayout"}.kind != JNull:
    target.worldLayout = some(jsonTo(source{"worldLayout"},
                                     typeof(unsafeGet(target.worldLayout))))
  assert(hasKey(source, "iid"),
         "iid" & " is missing while decoding " & "LdtkWorld")
  target.iid = jsonTo(source{"iid"}, typeof(target.iid))
  assert(hasKey(source, "defaultLevelWidth"),
         "defaultLevelWidth" & " is missing while decoding " & "LdtkWorld")
  target.defaultLevelWidth = jsonTo(source{"defaultLevelWidth"},
                                    typeof(target.defaultLevelWidth))
  assert(hasKey(source, "worldGridHeight"),
         "worldGridHeight" & " is missing while decoding " & "LdtkWorld")
  target.worldGridHeight = jsonTo(source{"worldGridHeight"},
                                  typeof(target.worldGridHeight))
  assert(hasKey(source, "levels"),
         "levels" & " is missing while decoding " & "LdtkWorld")
  target.levels = jsonTo(source{"levels"}, typeof(target.levels))

proc toJsonHook*(source: LdtkWorld): JsonNode =
  result = newJObject()
  result{"worldGridWidth"} = toJson(source.worldGridWidth)
  result{"defaultLevelHeight"} = toJson(source.defaultLevelHeight)
  result{"identifier"} = toJson(source.identifier)
  if isSome(source.worldLayout):
    result{"worldLayout"} = toJson(unsafeGet(source.worldLayout))
  result{"iid"} = toJson(source.iid)
  result{"defaultLevelWidth"} = toJson(source.defaultLevelWidth)
  result{"worldGridHeight"} = toJson(source.worldGridHeight)
  result{"levels"} = toJson(source.levels)

proc toJsonHook*(source: LdtkImageExportMode): JsonNode =
  case source
  of LdtkImageExportMode.LayersAndLevels:
    return newJString("LayersAndLevels")
  of LdtkImageExportMode.OneImagePerLayer:
    return newJString("OneImagePerLayer")
  of LdtkImageExportMode.None:
    return newJString("None")
  of LdtkImageExportMode.OneImagePerLevel:
    return newJString("OneImagePerLevel")
  
proc fromJsonHook*(target: var LdtkImageExportMode; source: JsonNode) =
  target = case getStr(source)
  of "LayersAndLevels":
    LdtkImageExportMode.LayersAndLevels
  of "OneImagePerLayer":
    LdtkImageExportMode.OneImagePerLayer
  of "None":
    LdtkImageExportMode.None
  of "OneImagePerLevel":
    LdtkImageExportMode.OneImagePerLevel
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc fromJsonHook*(target: var LdtkIntGridValueDef; source: JsonNode) =
  if hasKey(source, "tile") and source{"tile"}.kind != JNull:
    target.tile = some(jsonTo(source{"tile"}, typeof(unsafeGet(target.tile))))
  assert(hasKey(source, "color"),
         "color" & " is missing while decoding " & "LdtkIntGridValueDef")
  target.color = jsonTo(source{"color"}, typeof(target.color))
  if hasKey(source, "identifier") and source{"identifier"}.kind != JNull:
    target.identifier = some(jsonTo(source{"identifier"},
                                    typeof(unsafeGet(target.identifier))))
  assert(hasKey(source, "groupUid"),
         "groupUid" & " is missing while decoding " & "LdtkIntGridValueDef")
  target.groupUid = jsonTo(source{"groupUid"}, typeof(target.groupUid))
  assert(hasKey(source, "value"),
         "value" & " is missing while decoding " & "LdtkIntGridValueDef")
  target.value = jsonTo(source{"value"}, typeof(target.value))

proc toJsonHook*(source: LdtkIntGridValueDef): JsonNode =
  result = newJObject()
  if isSome(source.tile):
    result{"tile"} = toJson(unsafeGet(source.tile))
  result{"color"} = toJson(source.color)
  if isSome(source.identifier):
    result{"identifier"} = toJson(unsafeGet(source.identifier))
  result{"groupUid"} = toJson(source.groupUid)
  result{"value"} = toJson(source.value)

proc toJsonHook*(source: LdtkTextLanguageMode): JsonNode =
  case source
  of LdtkTextLanguageMode.LangMarkdown:
    return newJString("LangMarkdown")
  of LdtkTextLanguageMode.LangPython:
    return newJString("LangPython")
  of LdtkTextLanguageMode.LangLog:
    return newJString("LangLog")
  of LdtkTextLanguageMode.LangC:
    return newJString("LangC")
  of LdtkTextLanguageMode.LangLua:
    return newJString("LangLua")
  of LdtkTextLanguageMode.LangHaxe:
    return newJString("LangHaxe")
  of LdtkTextLanguageMode.LangJS:
    return newJString("LangJS")
  of LdtkTextLanguageMode.LangRuby:
    return newJString("LangRuby")
  of LdtkTextLanguageMode.LangJson:
    return newJString("LangJson")
  of LdtkTextLanguageMode.LangXml:
    return newJString("LangXml")
  
proc fromJsonHook*(target: var LdtkTextLanguageMode; source: JsonNode) =
  target = case getStr(source)
  of "LangMarkdown":
    LdtkTextLanguageMode.LangMarkdown
  of "LangPython":
    LdtkTextLanguageMode.LangPython
  of "LangLog":
    LdtkTextLanguageMode.LangLog
  of "LangC":
    LdtkTextLanguageMode.LangC
  of "LangLua":
    LdtkTextLanguageMode.LangLua
  of "LangHaxe":
    LdtkTextLanguageMode.LangHaxe
  of "LangJS":
    LdtkTextLanguageMode.LangJS
  of "LangRuby":
    LdtkTextLanguageMode.LangRuby
  of "LangJson":
    LdtkTextLanguageMode.LangJson
  of "LangXml":
    LdtkTextLanguageMode.LangXml
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc toJsonHook*(source: LdtkEditorDisplayPos): JsonNode =
  case source
  of LdtkEditorDisplayPos.Beneath:
    return newJString("Beneath")
  of LdtkEditorDisplayPos.Above:
    return newJString("Above")
  of LdtkEditorDisplayPos.Center:
    return newJString("Center")
  
proc fromJsonHook*(target: var LdtkEditorDisplayPos; source: JsonNode) =
  target = case getStr(source)
  of "Beneath":
    LdtkEditorDisplayPos.Beneath
  of "Above":
    LdtkEditorDisplayPos.Above
  of "Center":
    LdtkEditorDisplayPos.Center
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc toJsonHook*(source: LdtkEditorDisplayMode): JsonNode =
  case source
  of LdtkEditorDisplayMode.PointPath:
    return newJString("PointPath")
  of LdtkEditorDisplayMode.PointStar:
    return newJString("PointStar")
  of LdtkEditorDisplayMode.ValueOnly:
    return newJString("ValueOnly")
  of LdtkEditorDisplayMode.Hidden:
    return newJString("Hidden")
  of LdtkEditorDisplayMode.Points:
    return newJString("Points")
  of LdtkEditorDisplayMode.NameAndValue:
    return newJString("NameAndValue")
  of LdtkEditorDisplayMode.ArrayCountNoLabel:
    return newJString("ArrayCountNoLabel")
  of LdtkEditorDisplayMode.EntityTile:
    return newJString("EntityTile")
  of LdtkEditorDisplayMode.PointPathLoop:
    return newJString("PointPathLoop")
  of LdtkEditorDisplayMode.RadiusPx:
    return newJString("RadiusPx")
  of LdtkEditorDisplayMode.LevelTile:
    return newJString("LevelTile")
  of LdtkEditorDisplayMode.RadiusGrid:
    return newJString("RadiusGrid")
  of LdtkEditorDisplayMode.RefLinkBetweenCenters:
    return newJString("RefLinkBetweenCenters")
  of LdtkEditorDisplayMode.RefLinkBetweenPivots:
    return newJString("RefLinkBetweenPivots")
  of LdtkEditorDisplayMode.ArrayCountWithLabel:
    return newJString("ArrayCountWithLabel")
  
proc fromJsonHook*(target: var LdtkEditorDisplayMode; source: JsonNode) =
  target = case getStr(source)
  of "PointPath":
    LdtkEditorDisplayMode.PointPath
  of "PointStar":
    LdtkEditorDisplayMode.PointStar
  of "ValueOnly":
    LdtkEditorDisplayMode.ValueOnly
  of "Hidden":
    LdtkEditorDisplayMode.Hidden
  of "Points":
    LdtkEditorDisplayMode.Points
  of "NameAndValue":
    LdtkEditorDisplayMode.NameAndValue
  of "ArrayCountNoLabel":
    LdtkEditorDisplayMode.ArrayCountNoLabel
  of "EntityTile":
    LdtkEditorDisplayMode.EntityTile
  of "PointPathLoop":
    LdtkEditorDisplayMode.PointPathLoop
  of "RadiusPx":
    LdtkEditorDisplayMode.RadiusPx
  of "LevelTile":
    LdtkEditorDisplayMode.LevelTile
  of "RadiusGrid":
    LdtkEditorDisplayMode.RadiusGrid
  of "RefLinkBetweenCenters":
    LdtkEditorDisplayMode.RefLinkBetweenCenters
  of "RefLinkBetweenPivots":
    LdtkEditorDisplayMode.RefLinkBetweenPivots
  of "ArrayCountWithLabel":
    LdtkEditorDisplayMode.ArrayCountWithLabel
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc toJsonHook*(source: LdtkEditorLinkStyle): JsonNode =
  case source
  of LdtkEditorLinkStyle.DashedLine:
    return newJString("DashedLine")
  of LdtkEditorLinkStyle.CurvedArrow:
    return newJString("CurvedArrow")
  of LdtkEditorLinkStyle.ArrowsLine:
    return newJString("ArrowsLine")
  of LdtkEditorLinkStyle.ZigZag:
    return newJString("ZigZag")
  of LdtkEditorLinkStyle.StraightArrow:
    return newJString("StraightArrow")
  
proc fromJsonHook*(target: var LdtkEditorLinkStyle; source: JsonNode) =
  target = case getStr(source)
  of "DashedLine":
    LdtkEditorLinkStyle.DashedLine
  of "CurvedArrow":
    LdtkEditorLinkStyle.CurvedArrow
  of "ArrowsLine":
    LdtkEditorLinkStyle.ArrowsLine
  of "ZigZag":
    LdtkEditorLinkStyle.ZigZag
  of "StraightArrow":
    LdtkEditorLinkStyle.StraightArrow
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc toJsonHook*(source: LdtkAllowedRefs): JsonNode =
  case source
  of LdtkAllowedRefs.Any:
    return newJString("Any")
  of LdtkAllowedRefs.OnlyTags:
    return newJString("OnlyTags")
  of LdtkAllowedRefs.OnlySame:
    return newJString("OnlySame")
  of LdtkAllowedRefs.OnlySpecificEntity:
    return newJString("OnlySpecificEntity")
  
proc fromJsonHook*(target: var LdtkAllowedRefs; source: JsonNode) =
  target = case getStr(source)
  of "Any":
    LdtkAllowedRefs.Any
  of "OnlyTags":
    LdtkAllowedRefs.OnlyTags
  of "OnlySame":
    LdtkAllowedRefs.OnlySame
  of "OnlySpecificEntity":
    LdtkAllowedRefs.OnlySpecificEntity
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc fromJsonHook*(target: var LdtkFieldDef; source: JsonNode) =
  assert(hasKey(source, "type"),
         "type" & " is missing while decoding " & "LdtkFieldDef")
  target.type1 = jsonTo(source{"type"}, typeof(target.type1))
  assert(hasKey(source, "editorDisplayScale"),
         "editorDisplayScale" & " is missing while decoding " & "LdtkFieldDef")
  target.editorDisplayScale = jsonTo(source{"editorDisplayScale"},
                                     typeof(target.editorDisplayScale))
  assert(hasKey(source, "__type"),
         "__type" & " is missing while decoding " & "LdtkFieldDef")
  target.`type` = jsonTo(source{"__type"}, typeof(target.`type`))
  if hasKey(source, "allowedRefsEntityUid") and
      source{"allowedRefsEntityUid"}.kind != JNull:
    target.allowedRefsEntityUid = some(jsonTo(
        source{"allowedRefsEntityUid"},
        typeof(unsafeGet(target.allowedRefsEntityUid))))
  if hasKey(source, "textLanguageMode") and
      source{"textLanguageMode"}.kind != JNull:
    target.textLanguageMode = some(jsonTo(source{"textLanguageMode"},
        typeof(unsafeGet(target.textLanguageMode))))
  assert(hasKey(source, "editorAlwaysShow"),
         "editorAlwaysShow" & " is missing while decoding " & "LdtkFieldDef")
  target.editorAlwaysShow = jsonTo(source{"editorAlwaysShow"},
                                   typeof(target.editorAlwaysShow))
  if hasKey(source, "defaultOverride") and
      source{"defaultOverride"}.kind != JNull:
    target.defaultOverride = some(jsonTo(source{"defaultOverride"},
        typeof(unsafeGet(target.defaultOverride))))
  assert(hasKey(source, "autoChainRef"),
         "autoChainRef" & " is missing while decoding " & "LdtkFieldDef")
  target.autoChainRef = jsonTo(source{"autoChainRef"},
                               typeof(target.autoChainRef))
  assert(hasKey(source, "editorDisplayPos"),
         "editorDisplayPos" & " is missing while decoding " & "LdtkFieldDef")
  target.editorDisplayPos = jsonTo(source{"editorDisplayPos"},
                                   typeof(target.editorDisplayPos))
  assert(hasKey(source, "editorDisplayMode"),
         "editorDisplayMode" & " is missing while decoding " & "LdtkFieldDef")
  target.editorDisplayMode = jsonTo(source{"editorDisplayMode"},
                                    typeof(target.editorDisplayMode))
  assert(hasKey(source, "identifier"),
         "identifier" & " is missing while decoding " & "LdtkFieldDef")
  target.identifier = jsonTo(source{"identifier"}, typeof(target.identifier))
  if hasKey(source, "regex") and source{"regex"}.kind != JNull:
    target.regex = some(jsonTo(source{"regex"}, typeof(unsafeGet(target.regex))))
  assert(hasKey(source, "isArray"),
         "isArray" & " is missing while decoding " & "LdtkFieldDef")
  target.isArray = jsonTo(source{"isArray"}, typeof(target.isArray))
  assert(hasKey(source, "editorLinkStyle"),
         "editorLinkStyle" & " is missing while decoding " & "LdtkFieldDef")
  target.editorLinkStyle = jsonTo(source{"editorLinkStyle"},
                                  typeof(target.editorLinkStyle))
  assert(hasKey(source, "allowedRefs"),
         "allowedRefs" & " is missing while decoding " & "LdtkFieldDef")
  target.allowedRefs = jsonTo(source{"allowedRefs"}, typeof(target.allowedRefs))
  assert(hasKey(source, "useForSmartColor"),
         "useForSmartColor" & " is missing while decoding " & "LdtkFieldDef")
  target.useForSmartColor = jsonTo(source{"useForSmartColor"},
                                   typeof(target.useForSmartColor))
  if hasKey(source, "editorTextSuffix") and
      source{"editorTextSuffix"}.kind != JNull:
    target.editorTextSuffix = some(jsonTo(source{"editorTextSuffix"},
        typeof(unsafeGet(target.editorTextSuffix))))
  if hasKey(source, "doc") and source{"doc"}.kind != JNull:
    target.doc = some(jsonTo(source{"doc"}, typeof(unsafeGet(target.doc))))
  if hasKey(source, "editorTextPrefix") and
      source{"editorTextPrefix"}.kind != JNull:
    target.editorTextPrefix = some(jsonTo(source{"editorTextPrefix"},
        typeof(unsafeGet(target.editorTextPrefix))))
  assert(hasKey(source, "editorCutLongValues"),
         "editorCutLongValues" & " is missing while decoding " & "LdtkFieldDef")
  target.editorCutLongValues = jsonTo(source{"editorCutLongValues"},
                                      typeof(target.editorCutLongValues))
  assert(hasKey(source, "canBeNull"),
         "canBeNull" & " is missing while decoding " & "LdtkFieldDef")
  target.canBeNull = jsonTo(source{"canBeNull"}, typeof(target.canBeNull))
  assert(hasKey(source, "allowedRefTags"),
         "allowedRefTags" & " is missing while decoding " & "LdtkFieldDef")
  target.allowedRefTags = jsonTo(source{"allowedRefTags"},
                                 typeof(target.allowedRefTags))
  assert(hasKey(source, "uid"),
         "uid" & " is missing while decoding " & "LdtkFieldDef")
  target.uid = jsonTo(source{"uid"}, typeof(target.uid))
  assert(hasKey(source, "symmetricalRef"),
         "symmetricalRef" & " is missing while decoding " & "LdtkFieldDef")
  target.symmetricalRef = jsonTo(source{"symmetricalRef"},
                                 typeof(target.symmetricalRef))
  if hasKey(source, "editorDisplayColor") and
      source{"editorDisplayColor"}.kind != JNull:
    target.editorDisplayColor = some(jsonTo(source{"editorDisplayColor"},
        typeof(unsafeGet(target.editorDisplayColor))))
  assert(hasKey(source, "allowOutOfLevelRef"),
         "allowOutOfLevelRef" & " is missing while decoding " & "LdtkFieldDef")
  target.allowOutOfLevelRef = jsonTo(source{"allowOutOfLevelRef"},
                                     typeof(target.allowOutOfLevelRef))
  if hasKey(source, "acceptFileTypes") and
      source{"acceptFileTypes"}.kind != JNull:
    target.acceptFileTypes = some(jsonTo(source{"acceptFileTypes"},
        typeof(unsafeGet(target.acceptFileTypes))))
  assert(hasKey(source, "editorShowInWorld"),
         "editorShowInWorld" & " is missing while decoding " & "LdtkFieldDef")
  target.editorShowInWorld = jsonTo(source{"editorShowInWorld"},
                                    typeof(target.editorShowInWorld))
  if hasKey(source, "tilesetUid") and source{"tilesetUid"}.kind != JNull:
    target.tilesetUid = some(jsonTo(source{"tilesetUid"},
                                    typeof(unsafeGet(target.tilesetUid))))
  if hasKey(source, "arrayMaxLength") and
      source{"arrayMaxLength"}.kind != JNull:
    target.arrayMaxLength = some(jsonTo(source{"arrayMaxLength"}, typeof(
        unsafeGet(target.arrayMaxLength))))
  if hasKey(source, "arrayMinLength") and
      source{"arrayMinLength"}.kind != JNull:
    target.arrayMinLength = some(jsonTo(source{"arrayMinLength"}, typeof(
        unsafeGet(target.arrayMinLength))))
  assert(hasKey(source, "searchable"),
         "searchable" & " is missing while decoding " & "LdtkFieldDef")
  target.searchable = jsonTo(source{"searchable"}, typeof(target.searchable))
  if hasKey(source, "min") and source{"min"}.kind != JNull:
    target.min = some(jsonTo(source{"min"}, typeof(unsafeGet(target.min))))
  assert(hasKey(source, "exportToToc"),
         "exportToToc" & " is missing while decoding " & "LdtkFieldDef")
  target.exportToToc = jsonTo(source{"exportToToc"}, typeof(target.exportToToc))
  if hasKey(source, "max") and source{"max"}.kind != JNull:
    target.max = some(jsonTo(source{"max"}, typeof(unsafeGet(target.max))))

proc toJsonHook*(source: LdtkFieldDef): JsonNode =
  result = newJObject()
  result{"type"} = toJson(source.type1)
  result{"editorDisplayScale"} = toJson(source.editorDisplayScale)
  result{"__type"} = toJson(source.`type`)
  if isSome(source.allowedRefsEntityUid):
    result{"allowedRefsEntityUid"} = toJson(
        unsafeGet(source.allowedRefsEntityUid))
  if isSome(source.textLanguageMode):
    result{"textLanguageMode"} = toJson(unsafeGet(source.textLanguageMode))
  result{"editorAlwaysShow"} = toJson(source.editorAlwaysShow)
  if isSome(source.defaultOverride):
    result{"defaultOverride"} = toJson(unsafeGet(source.defaultOverride))
  result{"autoChainRef"} = toJson(source.autoChainRef)
  result{"editorDisplayPos"} = toJson(source.editorDisplayPos)
  result{"editorDisplayMode"} = toJson(source.editorDisplayMode)
  result{"identifier"} = toJson(source.identifier)
  if isSome(source.regex):
    result{"regex"} = toJson(unsafeGet(source.regex))
  result{"isArray"} = toJson(source.isArray)
  result{"editorLinkStyle"} = toJson(source.editorLinkStyle)
  result{"allowedRefs"} = toJson(source.allowedRefs)
  result{"useForSmartColor"} = toJson(source.useForSmartColor)
  if isSome(source.editorTextSuffix):
    result{"editorTextSuffix"} = toJson(unsafeGet(source.editorTextSuffix))
  if isSome(source.doc):
    result{"doc"} = toJson(unsafeGet(source.doc))
  if isSome(source.editorTextPrefix):
    result{"editorTextPrefix"} = toJson(unsafeGet(source.editorTextPrefix))
  result{"editorCutLongValues"} = toJson(source.editorCutLongValues)
  result{"canBeNull"} = toJson(source.canBeNull)
  result{"allowedRefTags"} = toJson(source.allowedRefTags)
  result{"uid"} = toJson(source.uid)
  result{"symmetricalRef"} = toJson(source.symmetricalRef)
  if isSome(source.editorDisplayColor):
    result{"editorDisplayColor"} = toJson(unsafeGet(source.editorDisplayColor))
  result{"allowOutOfLevelRef"} = toJson(source.allowOutOfLevelRef)
  if isSome(source.acceptFileTypes):
    result{"acceptFileTypes"} = toJson(unsafeGet(source.acceptFileTypes))
  result{"editorShowInWorld"} = toJson(source.editorShowInWorld)
  if isSome(source.tilesetUid):
    result{"tilesetUid"} = toJson(unsafeGet(source.tilesetUid))
  if isSome(source.arrayMaxLength):
    result{"arrayMaxLength"} = toJson(unsafeGet(source.arrayMaxLength))
  if isSome(source.arrayMinLength):
    result{"arrayMinLength"} = toJson(unsafeGet(source.arrayMinLength))
  result{"searchable"} = toJson(source.searchable)
  if isSome(source.min):
    result{"min"} = toJson(unsafeGet(source.min))
  result{"exportToToc"} = toJson(source.exportToToc)
  if isSome(source.max):
    result{"max"} = toJson(unsafeGet(source.max))

proc toJsonHook*(source: LdtkEmbedAtlas): JsonNode =
  case source
  of LdtkEmbedAtlas.LdtkIcons:
    return newJString("LdtkIcons")
  
proc fromJsonHook*(target: var LdtkEmbedAtlas; source: JsonNode) =
  target = case getStr(source)
  of "LdtkIcons":
    LdtkEmbedAtlas.LdtkIcons
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc fromJsonHook*(target: var LdtkEnumTagValue; source: JsonNode) =
  assert(hasKey(source, "tileIds"),
         "tileIds" & " is missing while decoding " & "LdtkEnumTagValue")
  target.tileIds = jsonTo(source{"tileIds"}, typeof(target.tileIds))
  assert(hasKey(source, "enumValueId"),
         "enumValueId" & " is missing while decoding " & "LdtkEnumTagValue")
  target.enumValueId = jsonTo(source{"enumValueId"}, typeof(target.enumValueId))

proc toJsonHook*(source: LdtkEnumTagValue): JsonNode =
  result = newJObject()
  result{"tileIds"} = toJson(source.tileIds)
  result{"enumValueId"} = toJson(source.enumValueId)

proc fromJsonHook*(target: var LdtkTileCustomMetadata; source: JsonNode) =
  assert(hasKey(source, "data"),
         "data" & " is missing while decoding " & "LdtkTileCustomMetadata")
  target.data = jsonTo(source{"data"}, typeof(target.data))
  assert(hasKey(source, "tileId"),
         "tileId" & " is missing while decoding " & "LdtkTileCustomMetadata")
  target.tileId = jsonTo(source{"tileId"}, typeof(target.tileId))

proc toJsonHook*(source: LdtkTileCustomMetadata): JsonNode =
  result = newJObject()
  result{"data"} = toJson(source.data)
  result{"tileId"} = toJson(source.tileId)

proc fromJsonHook*(target: var LdtkTilesetDef; source: JsonNode) =
  assert(hasKey(source, "pxHei"),
         "pxHei" & " is missing while decoding " & "LdtkTilesetDef")
  target.pxHei = jsonTo(source{"pxHei"}, typeof(target.pxHei))
  assert(hasKey(source, "savedSelections"),
         "savedSelections" & " is missing while decoding " & "LdtkTilesetDef")
  target.savedSelections = jsonTo(source{"savedSelections"},
                                  typeof(target.savedSelections))
  assert(hasKey(source, "padding"),
         "padding" & " is missing while decoding " & "LdtkTilesetDef")
  target.padding = jsonTo(source{"padding"}, typeof(target.padding))
  assert(hasKey(source, "spacing"),
         "spacing" & " is missing while decoding " & "LdtkTilesetDef")
  target.spacing = jsonTo(source{"spacing"}, typeof(target.spacing))
  if hasKey(source, "tagsSourceEnumUid") and
      source{"tagsSourceEnumUid"}.kind != JNull:
    target.tagsSourceEnumUid = some(jsonTo(source{"tagsSourceEnumUid"},
        typeof(unsafeGet(target.tagsSourceEnumUid))))
  if hasKey(source, "embedAtlas") and source{"embedAtlas"}.kind != JNull:
    target.embedAtlas = some(jsonTo(source{"embedAtlas"},
                                    typeof(unsafeGet(target.embedAtlas))))
  assert(hasKey(source, "identifier"),
         "identifier" & " is missing while decoding " & "LdtkTilesetDef")
  target.identifier = jsonTo(source{"identifier"}, typeof(target.identifier))
  if hasKey(source, "cachedPixelData") and
      source{"cachedPixelData"}.kind != JNull:
    target.cachedPixelData = some(jsonTo(source{"cachedPixelData"},
        typeof(unsafeGet(target.cachedPixelData))))
  assert(hasKey(source, "enumTags"),
         "enumTags" & " is missing while decoding " & "LdtkTilesetDef")
  target.enumTags = jsonTo(source{"enumTags"}, typeof(target.enumTags))
  assert(hasKey(source, "pxWid"),
         "pxWid" & " is missing while decoding " & "LdtkTilesetDef")
  target.pxWid = jsonTo(source{"pxWid"}, typeof(target.pxWid))
  assert(hasKey(source, "tileGridSize"),
         "tileGridSize" & " is missing while decoding " & "LdtkTilesetDef")
  target.tileGridSize = jsonTo(source{"tileGridSize"},
                               typeof(target.tileGridSize))
  assert(hasKey(source, "customData"),
         "customData" & " is missing while decoding " & "LdtkTilesetDef")
  target.customData = jsonTo(source{"customData"}, typeof(target.customData))
  assert(hasKey(source, "uid"),
         "uid" & " is missing while decoding " & "LdtkTilesetDef")
  target.uid = jsonTo(source{"uid"}, typeof(target.uid))
  assert(hasKey(source, "__cHei"),
         "__cHei" & " is missing while decoding " & "LdtkTilesetDef")
  target.cHei = jsonTo(source{"__cHei"}, typeof(target.cHei))
  assert(hasKey(source, "__cWid"),
         "__cWid" & " is missing while decoding " & "LdtkTilesetDef")
  target.cWid = jsonTo(source{"__cWid"}, typeof(target.cWid))
  if hasKey(source, "relPath") and source{"relPath"}.kind != JNull:
    target.relPath = some(jsonTo(source{"relPath"},
                                 typeof(unsafeGet(target.relPath))))
  assert(hasKey(source, "tags"),
         "tags" & " is missing while decoding " & "LdtkTilesetDef")
  target.tags = jsonTo(source{"tags"}, typeof(target.tags))

proc toJsonHook*(source: LdtkTilesetDef): JsonNode =
  result = newJObject()
  result{"pxHei"} = toJson(source.pxHei)
  result{"savedSelections"} = toJson(source.savedSelections)
  result{"padding"} = toJson(source.padding)
  result{"spacing"} = toJson(source.spacing)
  if isSome(source.tagsSourceEnumUid):
    result{"tagsSourceEnumUid"} = toJson(unsafeGet(source.tagsSourceEnumUid))
  if isSome(source.embedAtlas):
    result{"embedAtlas"} = toJson(unsafeGet(source.embedAtlas))
  result{"identifier"} = toJson(source.identifier)
  if isSome(source.cachedPixelData):
    result{"cachedPixelData"} = toJson(unsafeGet(source.cachedPixelData))
  result{"enumTags"} = toJson(source.enumTags)
  result{"pxWid"} = toJson(source.pxWid)
  result{"tileGridSize"} = toJson(source.tileGridSize)
  result{"customData"} = toJson(source.customData)
  result{"uid"} = toJson(source.uid)
  result{"__cHei"} = toJson(source.cHei)
  result{"__cWid"} = toJson(source.cWid)
  if isSome(source.relPath):
    result{"relPath"} = toJson(unsafeGet(source.relPath))
  result{"tags"} = toJson(source.tags)

proc toJsonHook*(source: LdtkLimitScope): JsonNode =
  case source
  of LdtkLimitScope.PerLayer:
    return newJString("PerLayer")
  of LdtkLimitScope.PerWorld:
    return newJString("PerWorld")
  of LdtkLimitScope.PerLevel:
    return newJString("PerLevel")
  
proc fromJsonHook*(target: var LdtkLimitScope; source: JsonNode) =
  target = case getStr(source)
  of "PerLayer":
    LdtkLimitScope.PerLayer
  of "PerWorld":
    LdtkLimitScope.PerWorld
  of "PerLevel":
    LdtkLimitScope.PerLevel
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc toJsonHook*(source: LdtkLimitBehavior): JsonNode =
  case source
  of LdtkLimitBehavior.PreventAdding:
    return newJString("PreventAdding")
  of LdtkLimitBehavior.MoveLastOne:
    return newJString("MoveLastOne")
  of LdtkLimitBehavior.DiscardOldOnes:
    return newJString("DiscardOldOnes")
  
proc fromJsonHook*(target: var LdtkLimitBehavior; source: JsonNode) =
  target = case getStr(source)
  of "PreventAdding":
    LdtkLimitBehavior.PreventAdding
  of "MoveLastOne":
    LdtkLimitBehavior.MoveLastOne
  of "DiscardOldOnes":
    LdtkLimitBehavior.DiscardOldOnes
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc toJsonHook*(source: LdtkRenderMode): JsonNode =
  case source
  of LdtkRenderMode.Tile:
    return newJString("Tile")
  of LdtkRenderMode.Cross:
    return newJString("Cross")
  of LdtkRenderMode.Ellipse:
    return newJString("Ellipse")
  of LdtkRenderMode.Rectangle:
    return newJString("Rectangle")
  
proc fromJsonHook*(target: var LdtkRenderMode; source: JsonNode) =
  target = case getStr(source)
  of "Tile":
    LdtkRenderMode.Tile
  of "Cross":
    LdtkRenderMode.Cross
  of "Ellipse":
    LdtkRenderMode.Ellipse
  of "Rectangle":
    LdtkRenderMode.Rectangle
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc toJsonHook*(source: LdtkTileRenderMode): JsonNode =
  case source
  of LdtkTileRenderMode.FullSizeCropped:
    return newJString("FullSizeCropped")
  of LdtkTileRenderMode.FullSizeUncropped:
    return newJString("FullSizeUncropped")
  of LdtkTileRenderMode.Repeat:
    return newJString("Repeat")
  of LdtkTileRenderMode.FitInside:
    return newJString("FitInside")
  of LdtkTileRenderMode.NineSlice:
    return newJString("NineSlice")
  of LdtkTileRenderMode.Cover:
    return newJString("Cover")
  of LdtkTileRenderMode.Stretch:
    return newJString("Stretch")
  
proc fromJsonHook*(target: var LdtkTileRenderMode; source: JsonNode) =
  target = case getStr(source)
  of "FullSizeCropped":
    LdtkTileRenderMode.FullSizeCropped
  of "FullSizeUncropped":
    LdtkTileRenderMode.FullSizeUncropped
  of "Repeat":
    LdtkTileRenderMode.Repeat
  of "FitInside":
    LdtkTileRenderMode.FitInside
  of "NineSlice":
    LdtkTileRenderMode.NineSlice
  of "Cover":
    LdtkTileRenderMode.Cover
  of "Stretch":
    LdtkTileRenderMode.Stretch
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc fromJsonHook*(target: var LdtkEntityDef; source: JsonNode) =
  assert(hasKey(source, "allowOutOfBounds"),
         "allowOutOfBounds" & " is missing while decoding " & "LdtkEntityDef")
  target.allowOutOfBounds = jsonTo(source{"allowOutOfBounds"},
                                   typeof(target.allowOutOfBounds))
  assert(hasKey(source, "pivotY"),
         "pivotY" & " is missing while decoding " & "LdtkEntityDef")
  target.pivotY = jsonTo(source{"pivotY"}, typeof(target.pivotY))
  assert(hasKey(source, "tileOpacity"),
         "tileOpacity" & " is missing while decoding " & "LdtkEntityDef")
  target.tileOpacity = jsonTo(source{"tileOpacity"}, typeof(target.tileOpacity))
  assert(hasKey(source, "color"),
         "color" & " is missing while decoding " & "LdtkEntityDef")
  target.color = jsonTo(source{"color"}, typeof(target.color))
  assert(hasKey(source, "limitScope"),
         "limitScope" & " is missing while decoding " & "LdtkEntityDef")
  target.limitScope = jsonTo(source{"limitScope"}, typeof(target.limitScope))
  assert(hasKey(source, "limitBehavior"),
         "limitBehavior" & " is missing while decoding " & "LdtkEntityDef")
  target.limitBehavior = jsonTo(source{"limitBehavior"},
                                typeof(target.limitBehavior))
  assert(hasKey(source, "hollow"),
         "hollow" & " is missing while decoding " & "LdtkEntityDef")
  target.hollow = jsonTo(source{"hollow"}, typeof(target.hollow))
  assert(hasKey(source, "height"),
         "height" & " is missing while decoding " & "LdtkEntityDef")
  target.height = jsonTo(source{"height"}, typeof(target.height))
  assert(hasKey(source, "renderMode"),
         "renderMode" & " is missing while decoding " & "LdtkEntityDef")
  target.renderMode = jsonTo(source{"renderMode"}, typeof(target.renderMode))
  if hasKey(source, "tilesetId") and source{"tilesetId"}.kind != JNull:
    target.tilesetId = some(jsonTo(source{"tilesetId"},
                                   typeof(unsafeGet(target.tilesetId))))
  assert(hasKey(source, "keepAspectRatio"),
         "keepAspectRatio" & " is missing while decoding " & "LdtkEntityDef")
  target.keepAspectRatio = jsonTo(source{"keepAspectRatio"},
                                  typeof(target.keepAspectRatio))
  if hasKey(source, "minWidth") and source{"minWidth"}.kind != JNull:
    target.minWidth = some(jsonTo(source{"minWidth"},
                                  typeof(unsafeGet(target.minWidth))))
  assert(hasKey(source, "showName"),
         "showName" & " is missing while decoding " & "LdtkEntityDef")
  target.showName = jsonTo(source{"showName"}, typeof(target.showName))
  assert(hasKey(source, "resizableX"),
         "resizableX" & " is missing while decoding " & "LdtkEntityDef")
  target.resizableX = jsonTo(source{"resizableX"}, typeof(target.resizableX))
  assert(hasKey(source, "identifier"),
         "identifier" & " is missing while decoding " & "LdtkEntityDef")
  target.identifier = jsonTo(source{"identifier"}, typeof(target.identifier))
  assert(hasKey(source, "maxCount"),
         "maxCount" & " is missing while decoding " & "LdtkEntityDef")
  target.maxCount = jsonTo(source{"maxCount"}, typeof(target.maxCount))
  if hasKey(source, "tileId") and source{"tileId"}.kind != JNull:
    target.tileId = some(jsonTo(source{"tileId"},
                                typeof(unsafeGet(target.tileId))))
  assert(hasKey(source, "pivotX"),
         "pivotX" & " is missing while decoding " & "LdtkEntityDef")
  target.pivotX = jsonTo(source{"pivotX"}, typeof(target.pivotX))
  if hasKey(source, "doc") and source{"doc"}.kind != JNull:
    target.doc = some(jsonTo(source{"doc"}, typeof(unsafeGet(target.doc))))
  assert(hasKey(source, "fieldDefs"),
         "fieldDefs" & " is missing while decoding " & "LdtkEntityDef")
  target.fieldDefs = jsonTo(source{"fieldDefs"}, typeof(target.fieldDefs))
  assert(hasKey(source, "uid"),
         "uid" & " is missing while decoding " & "LdtkEntityDef")
  target.uid = jsonTo(source{"uid"}, typeof(target.uid))
  assert(hasKey(source, "tileRenderMode"),
         "tileRenderMode" & " is missing while decoding " & "LdtkEntityDef")
  target.tileRenderMode = jsonTo(source{"tileRenderMode"},
                                 typeof(target.tileRenderMode))
  if hasKey(source, "uiTileRect") and source{"uiTileRect"}.kind != JNull:
    target.uiTileRect = some(jsonTo(source{"uiTileRect"},
                                    typeof(unsafeGet(target.uiTileRect))))
  assert(hasKey(source, "resizableY"),
         "resizableY" & " is missing while decoding " & "LdtkEntityDef")
  target.resizableY = jsonTo(source{"resizableY"}, typeof(target.resizableY))
  assert(hasKey(source, "lineOpacity"),
         "lineOpacity" & " is missing while decoding " & "LdtkEntityDef")
  target.lineOpacity = jsonTo(source{"lineOpacity"}, typeof(target.lineOpacity))
  if hasKey(source, "minHeight") and source{"minHeight"}.kind != JNull:
    target.minHeight = some(jsonTo(source{"minHeight"},
                                   typeof(unsafeGet(target.minHeight))))
  if hasKey(source, "tileRect") and source{"tileRect"}.kind != JNull:
    target.tileRect = some(jsonTo(source{"tileRect"},
                                  typeof(unsafeGet(target.tileRect))))
  assert(hasKey(source, "nineSliceBorders"),
         "nineSliceBorders" & " is missing while decoding " & "LdtkEntityDef")
  target.nineSliceBorders = jsonTo(source{"nineSliceBorders"},
                                   typeof(target.nineSliceBorders))
  if hasKey(source, "maxWidth") and source{"maxWidth"}.kind != JNull:
    target.maxWidth = some(jsonTo(source{"maxWidth"},
                                  typeof(unsafeGet(target.maxWidth))))
  assert(hasKey(source, "width"),
         "width" & " is missing while decoding " & "LdtkEntityDef")
  target.width = jsonTo(source{"width"}, typeof(target.width))
  assert(hasKey(source, "tags"),
         "tags" & " is missing while decoding " & "LdtkEntityDef")
  target.tags = jsonTo(source{"tags"}, typeof(target.tags))
  if hasKey(source, "maxHeight") and source{"maxHeight"}.kind != JNull:
    target.maxHeight = some(jsonTo(source{"maxHeight"},
                                   typeof(unsafeGet(target.maxHeight))))
  assert(hasKey(source, "exportToToc"),
         "exportToToc" & " is missing while decoding " & "LdtkEntityDef")
  target.exportToToc = jsonTo(source{"exportToToc"}, typeof(target.exportToToc))
  assert(hasKey(source, "fillOpacity"),
         "fillOpacity" & " is missing while decoding " & "LdtkEntityDef")
  target.fillOpacity = jsonTo(source{"fillOpacity"}, typeof(target.fillOpacity))

proc toJsonHook*(source: LdtkEntityDef): JsonNode =
  result = newJObject()
  result{"allowOutOfBounds"} = toJson(source.allowOutOfBounds)
  result{"pivotY"} = toJson(source.pivotY)
  result{"tileOpacity"} = toJson(source.tileOpacity)
  result{"color"} = toJson(source.color)
  result{"limitScope"} = toJson(source.limitScope)
  result{"limitBehavior"} = toJson(source.limitBehavior)
  result{"hollow"} = toJson(source.hollow)
  result{"height"} = toJson(source.height)
  result{"renderMode"} = toJson(source.renderMode)
  if isSome(source.tilesetId):
    result{"tilesetId"} = toJson(unsafeGet(source.tilesetId))
  result{"keepAspectRatio"} = toJson(source.keepAspectRatio)
  if isSome(source.minWidth):
    result{"minWidth"} = toJson(unsafeGet(source.minWidth))
  result{"showName"} = toJson(source.showName)
  result{"resizableX"} = toJson(source.resizableX)
  result{"identifier"} = toJson(source.identifier)
  result{"maxCount"} = toJson(source.maxCount)
  if isSome(source.tileId):
    result{"tileId"} = toJson(unsafeGet(source.tileId))
  result{"pivotX"} = toJson(source.pivotX)
  if isSome(source.doc):
    result{"doc"} = toJson(unsafeGet(source.doc))
  result{"fieldDefs"} = toJson(source.fieldDefs)
  result{"uid"} = toJson(source.uid)
  result{"tileRenderMode"} = toJson(source.tileRenderMode)
  if isSome(source.uiTileRect):
    result{"uiTileRect"} = toJson(unsafeGet(source.uiTileRect))
  result{"resizableY"} = toJson(source.resizableY)
  result{"lineOpacity"} = toJson(source.lineOpacity)
  if isSome(source.minHeight):
    result{"minHeight"} = toJson(unsafeGet(source.minHeight))
  if isSome(source.tileRect):
    result{"tileRect"} = toJson(unsafeGet(source.tileRect))
  result{"nineSliceBorders"} = toJson(source.nineSliceBorders)
  if isSome(source.maxWidth):
    result{"maxWidth"} = toJson(unsafeGet(source.maxWidth))
  result{"width"} = toJson(source.width)
  result{"tags"} = toJson(source.tags)
  if isSome(source.maxHeight):
    result{"maxHeight"} = toJson(unsafeGet(source.maxHeight))
  result{"exportToToc"} = toJson(source.exportToToc)
  result{"fillOpacity"} = toJson(source.fillOpacity)

proc fromJsonHook*(target: var LdtkEnumDefValues; source: JsonNode) =
  if hasKey(source, "__tileSrcRect") and
      source{"__tileSrcRect"}.kind != JNull:
    target.tileSrcRect = some(jsonTo(source{"__tileSrcRect"},
                                     typeof(unsafeGet(target.tileSrcRect))))
  assert(hasKey(source, "color"),
         "color" & " is missing while decoding " & "LdtkEnumDefValues")
  target.color = jsonTo(source{"color"}, typeof(target.color))
  assert(hasKey(source, "id"),
         "id" & " is missing while decoding " & "LdtkEnumDefValues")
  target.id = jsonTo(source{"id"}, typeof(target.id))
  if hasKey(source, "tileId") and source{"tileId"}.kind != JNull:
    target.tileId = some(jsonTo(source{"tileId"},
                                typeof(unsafeGet(target.tileId))))
  if hasKey(source, "tileRect") and source{"tileRect"}.kind != JNull:
    target.tileRect = some(jsonTo(source{"tileRect"},
                                  typeof(unsafeGet(target.tileRect))))

proc toJsonHook*(source: LdtkEnumDefValues): JsonNode =
  result = newJObject()
  if isSome(source.tileSrcRect):
    result{"__tileSrcRect"} = toJson(unsafeGet(source.tileSrcRect))
  result{"color"} = toJson(source.color)
  result{"id"} = toJson(source.id)
  if isSome(source.tileId):
    result{"tileId"} = toJson(unsafeGet(source.tileId))
  if isSome(source.tileRect):
    result{"tileRect"} = toJson(unsafeGet(source.tileRect))

proc fromJsonHook*(target: var LdtkEnumDef; source: JsonNode) =
  assert(hasKey(source, "values"),
         "values" & " is missing while decoding " & "LdtkEnumDef")
  target.values = jsonTo(source{"values"}, typeof(target.values))
  if hasKey(source, "externalRelPath") and
      source{"externalRelPath"}.kind != JNull:
    target.externalRelPath = some(jsonTo(source{"externalRelPath"},
        typeof(unsafeGet(target.externalRelPath))))
  assert(hasKey(source, "identifier"),
         "identifier" & " is missing while decoding " & "LdtkEnumDef")
  target.identifier = jsonTo(source{"identifier"}, typeof(target.identifier))
  if hasKey(source, "externalFileChecksum") and
      source{"externalFileChecksum"}.kind != JNull:
    target.externalFileChecksum = some(jsonTo(
        source{"externalFileChecksum"},
        typeof(unsafeGet(target.externalFileChecksum))))
  if hasKey(source, "iconTilesetUid") and
      source{"iconTilesetUid"}.kind != JNull:
    target.iconTilesetUid = some(jsonTo(source{"iconTilesetUid"}, typeof(
        unsafeGet(target.iconTilesetUid))))
  assert(hasKey(source, "uid"),
         "uid" & " is missing while decoding " & "LdtkEnumDef")
  target.uid = jsonTo(source{"uid"}, typeof(target.uid))
  assert(hasKey(source, "tags"),
         "tags" & " is missing while decoding " & "LdtkEnumDef")
  target.tags = jsonTo(source{"tags"}, typeof(target.tags))

proc toJsonHook*(source: LdtkEnumDef): JsonNode =
  result = newJObject()
  result{"values"} = toJson(source.values)
  if isSome(source.externalRelPath):
    result{"externalRelPath"} = toJson(unsafeGet(source.externalRelPath))
  result{"identifier"} = toJson(source.identifier)
  if isSome(source.externalFileChecksum):
    result{"externalFileChecksum"} = toJson(
        unsafeGet(source.externalFileChecksum))
  if isSome(source.iconTilesetUid):
    result{"iconTilesetUid"} = toJson(unsafeGet(source.iconTilesetUid))
  result{"uid"} = toJson(source.uid)
  result{"tags"} = toJson(source.tags)

proc toJsonHook*(source: LdtkType): JsonNode =
  case source
  of LdtkType.Tiles:
    return newJString("Tiles")
  of LdtkType.Entities:
    return newJString("Entities")
  of LdtkType.AutoLayer:
    return newJString("AutoLayer")
  of LdtkType.IntGrid:
    return newJString("IntGrid")
  
proc fromJsonHook*(target: var LdtkType; source: JsonNode) =
  target = case getStr(source)
  of "Tiles":
    LdtkType.Tiles
  of "Entities":
    LdtkType.Entities
  of "AutoLayer":
    LdtkType.AutoLayer
  of "IntGrid":
    LdtkType.IntGrid
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc toJsonHook*(source: LdtkChecker): JsonNode =
  case source
  of LdtkChecker.Horizontal:
    return newJString("Horizontal")
  of LdtkChecker.Vertical:
    return newJString("Vertical")
  of LdtkChecker.None:
    return newJString("None")
  
proc fromJsonHook*(target: var LdtkChecker; source: JsonNode) =
  target = case getStr(source)
  of "Horizontal":
    LdtkChecker.Horizontal
  of "Vertical":
    LdtkChecker.Vertical
  of "None":
    LdtkChecker.None
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc toJsonHook*(source: LdtkTileMode): JsonNode =
  case source
  of LdtkTileMode.Single:
    return newJString("Single")
  of LdtkTileMode.Stamp:
    return newJString("Stamp")
  
proc fromJsonHook*(target: var LdtkTileMode; source: JsonNode) =
  target = case getStr(source)
  of "Single":
    LdtkTileMode.Single
  of "Stamp":
    LdtkTileMode.Stamp
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc fromJsonHook*(target: var LdtkAutoRuleDef; source: JsonNode) =
  assert(hasKey(source, "checker"),
         "checker" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.checker = jsonTo(source{"checker"}, typeof(target.checker))
  assert(hasKey(source, "pivotY"),
         "pivotY" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.pivotY = jsonTo(source{"pivotY"}, typeof(target.pivotY))
  assert(hasKey(source, "breakOnMatch"),
         "breakOnMatch" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.breakOnMatch = jsonTo(source{"breakOnMatch"},
                               typeof(target.breakOnMatch))
  assert(hasKey(source, "perlinOctaves"),
         "perlinOctaves" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.perlinOctaves = jsonTo(source{"perlinOctaves"},
                                typeof(target.perlinOctaves))
  assert(hasKey(source, "yModulo"),
         "yModulo" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.yModulo = jsonTo(source{"yModulo"}, typeof(target.yModulo))
  assert(hasKey(source, "size"),
         "size" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.size = jsonTo(source{"size"}, typeof(target.size))
  assert(hasKey(source, "tileMode"),
         "tileMode" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.tileMode = jsonTo(source{"tileMode"}, typeof(target.tileMode))
  assert(hasKey(source, "tileRandomXMax"),
         "tileRandomXMax" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.tileRandomXMax = jsonTo(source{"tileRandomXMax"},
                                 typeof(target.tileRandomXMax))
  assert(hasKey(source, "tileRandomXMin"),
         "tileRandomXMin" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.tileRandomXMin = jsonTo(source{"tileRandomXMin"},
                                 typeof(target.tileRandomXMin))
  assert(hasKey(source, "xModulo"),
         "xModulo" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.xModulo = jsonTo(source{"xModulo"}, typeof(target.xModulo))
  assert(hasKey(source, "yOffset"),
         "yOffset" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.yOffset = jsonTo(source{"yOffset"}, typeof(target.yOffset))
  assert(hasKey(source, "flipX"),
         "flipX" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.flipX = jsonTo(source{"flipX"}, typeof(target.flipX))
  assert(hasKey(source, "tileYOffset"),
         "tileYOffset" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.tileYOffset = jsonTo(source{"tileYOffset"}, typeof(target.tileYOffset))
  assert(hasKey(source, "chance"),
         "chance" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.chance = jsonTo(source{"chance"}, typeof(target.chance))
  assert(hasKey(source, "tileRandomYMax"),
         "tileRandomYMax" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.tileRandomYMax = jsonTo(source{"tileRandomYMax"},
                                 typeof(target.tileRandomYMax))
  assert(hasKey(source, "perlinActive"),
         "perlinActive" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.perlinActive = jsonTo(source{"perlinActive"},
                               typeof(target.perlinActive))
  assert(hasKey(source, "perlinScale"),
         "perlinScale" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.perlinScale = jsonTo(source{"perlinScale"}, typeof(target.perlinScale))
  if hasKey(source, "outOfBoundsValue") and
      source{"outOfBoundsValue"}.kind != JNull:
    target.outOfBoundsValue = some(jsonTo(source{"outOfBoundsValue"},
        typeof(unsafeGet(target.outOfBoundsValue))))
  assert(hasKey(source, "pivotX"),
         "pivotX" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.pivotX = jsonTo(source{"pivotX"}, typeof(target.pivotX))
  assert(hasKey(source, "flipY"),
         "flipY" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.flipY = jsonTo(source{"flipY"}, typeof(target.flipY))
  assert(hasKey(source, "active"),
         "active" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.active = jsonTo(source{"active"}, typeof(target.active))
  assert(hasKey(source, "uid"),
         "uid" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.uid = jsonTo(source{"uid"}, typeof(target.uid))
  if hasKey(source, "tileIds") and source{"tileIds"}.kind != JNull:
    target.tileIds = some(jsonTo(source{"tileIds"},
                                 typeof(unsafeGet(target.tileIds))))
  assert(hasKey(source, "invalidated"),
         "invalidated" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.invalidated = jsonTo(source{"invalidated"}, typeof(target.invalidated))
  assert(hasKey(source, "pattern"),
         "pattern" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.pattern = jsonTo(source{"pattern"}, typeof(target.pattern))
  assert(hasKey(source, "alpha"),
         "alpha" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.alpha = jsonTo(source{"alpha"}, typeof(target.alpha))
  assert(hasKey(source, "tileRectsIds"),
         "tileRectsIds" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.tileRectsIds = jsonTo(source{"tileRectsIds"},
                               typeof(target.tileRectsIds))
  assert(hasKey(source, "tileXOffset"),
         "tileXOffset" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.tileXOffset = jsonTo(source{"tileXOffset"}, typeof(target.tileXOffset))
  assert(hasKey(source, "xOffset"),
         "xOffset" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.xOffset = jsonTo(source{"xOffset"}, typeof(target.xOffset))
  assert(hasKey(source, "tileRandomYMin"),
         "tileRandomYMin" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.tileRandomYMin = jsonTo(source{"tileRandomYMin"},
                                 typeof(target.tileRandomYMin))
  assert(hasKey(source, "perlinSeed"),
         "perlinSeed" & " is missing while decoding " & "LdtkAutoRuleDef")
  target.perlinSeed = jsonTo(source{"perlinSeed"}, typeof(target.perlinSeed))

proc toJsonHook*(source: LdtkAutoRuleDef): JsonNode =
  result = newJObject()
  result{"checker"} = toJson(source.checker)
  result{"pivotY"} = toJson(source.pivotY)
  result{"breakOnMatch"} = toJson(source.breakOnMatch)
  result{"perlinOctaves"} = toJson(source.perlinOctaves)
  result{"yModulo"} = toJson(source.yModulo)
  result{"size"} = toJson(source.size)
  result{"tileMode"} = toJson(source.tileMode)
  result{"tileRandomXMax"} = toJson(source.tileRandomXMax)
  result{"tileRandomXMin"} = toJson(source.tileRandomXMin)
  result{"xModulo"} = toJson(source.xModulo)
  result{"yOffset"} = toJson(source.yOffset)
  result{"flipX"} = toJson(source.flipX)
  result{"tileYOffset"} = toJson(source.tileYOffset)
  result{"chance"} = toJson(source.chance)
  result{"tileRandomYMax"} = toJson(source.tileRandomYMax)
  result{"perlinActive"} = toJson(source.perlinActive)
  result{"perlinScale"} = toJson(source.perlinScale)
  if isSome(source.outOfBoundsValue):
    result{"outOfBoundsValue"} = toJson(unsafeGet(source.outOfBoundsValue))
  result{"pivotX"} = toJson(source.pivotX)
  result{"flipY"} = toJson(source.flipY)
  result{"active"} = toJson(source.active)
  result{"uid"} = toJson(source.uid)
  if isSome(source.tileIds):
    result{"tileIds"} = toJson(unsafeGet(source.tileIds))
  result{"invalidated"} = toJson(source.invalidated)
  result{"pattern"} = toJson(source.pattern)
  result{"alpha"} = toJson(source.alpha)
  result{"tileRectsIds"} = toJson(source.tileRectsIds)
  result{"tileXOffset"} = toJson(source.tileXOffset)
  result{"xOffset"} = toJson(source.xOffset)
  result{"tileRandomYMin"} = toJson(source.tileRandomYMin)
  result{"perlinSeed"} = toJson(source.perlinSeed)

proc fromJsonHook*(target: var LdtkAutoLayerRuleGroup; source: JsonNode) =
  assert(hasKey(source, "isOptional"), "isOptional" &
      " is missing while decoding " &
      "LdtkAutoLayerRuleGroup")
  target.isOptional = jsonTo(source{"isOptional"}, typeof(target.isOptional))
  if hasKey(source, "color") and source{"color"}.kind != JNull:
    target.color = some(jsonTo(source{"color"}, typeof(unsafeGet(target.color))))
  if hasKey(source, "collapsed") and source{"collapsed"}.kind != JNull:
    target.collapsed = some(jsonTo(source{"collapsed"},
                                   typeof(unsafeGet(target.collapsed))))
  assert(hasKey(source, "usesWizard"), "usesWizard" &
      " is missing while decoding " &
      "LdtkAutoLayerRuleGroup")
  target.usesWizard = jsonTo(source{"usesWizard"}, typeof(target.usesWizard))
  assert(hasKey(source, "biomeRequirementMode"), "biomeRequirementMode" &
      " is missing while decoding " &
      "LdtkAutoLayerRuleGroup")
  target.biomeRequirementMode = jsonTo(source{"biomeRequirementMode"},
                                       typeof(target.biomeRequirementMode))
  assert(hasKey(source, "rules"),
         "rules" & " is missing while decoding " & "LdtkAutoLayerRuleGroup")
  target.rules = jsonTo(source{"rules"}, typeof(target.rules))
  if hasKey(source, "icon") and source{"icon"}.kind != JNull:
    target.icon = some(jsonTo(source{"icon"}, typeof(unsafeGet(target.icon))))
  assert(hasKey(source, "active"),
         "active" & " is missing while decoding " & "LdtkAutoLayerRuleGroup")
  target.active = jsonTo(source{"active"}, typeof(target.active))
  assert(hasKey(source, "uid"),
         "uid" & " is missing while decoding " & "LdtkAutoLayerRuleGroup")
  target.uid = jsonTo(source{"uid"}, typeof(target.uid))
  assert(hasKey(source, "name"),
         "name" & " is missing while decoding " & "LdtkAutoLayerRuleGroup")
  target.name = jsonTo(source{"name"}, typeof(target.name))
  assert(hasKey(source, "requiredBiomeValues"), "requiredBiomeValues" &
      " is missing while decoding " &
      "LdtkAutoLayerRuleGroup")
  target.requiredBiomeValues = jsonTo(source{"requiredBiomeValues"},
                                      typeof(target.requiredBiomeValues))

proc toJsonHook*(source: LdtkAutoLayerRuleGroup): JsonNode =
  result = newJObject()
  result{"isOptional"} = toJson(source.isOptional)
  if isSome(source.color):
    result{"color"} = toJson(unsafeGet(source.color))
  if isSome(source.collapsed):
    result{"collapsed"} = toJson(unsafeGet(source.collapsed))
  result{"usesWizard"} = toJson(source.usesWizard)
  result{"biomeRequirementMode"} = toJson(source.biomeRequirementMode)
  result{"rules"} = toJson(source.rules)
  if isSome(source.icon):
    result{"icon"} = toJson(unsafeGet(source.icon))
  result{"active"} = toJson(source.active)
  result{"uid"} = toJson(source.uid)
  result{"name"} = toJson(source.name)
  result{"requiredBiomeValues"} = toJson(source.requiredBiomeValues)

proc fromJsonHook*(target: var LdtkIntGridValueGroupDef; source: JsonNode) =
  if hasKey(source, "color") and source{"color"}.kind != JNull:
    target.color = some(jsonTo(source{"color"}, typeof(unsafeGet(target.color))))
  if hasKey(source, "identifier") and source{"identifier"}.kind != JNull:
    target.identifier = some(jsonTo(source{"identifier"},
                                    typeof(unsafeGet(target.identifier))))
  assert(hasKey(source, "uid"),
         "uid" & " is missing while decoding " & "LdtkIntGridValueGroupDef")
  target.uid = jsonTo(source{"uid"}, typeof(target.uid))

proc toJsonHook*(source: LdtkIntGridValueGroupDef): JsonNode =
  result = newJObject()
  if isSome(source.color):
    result{"color"} = toJson(unsafeGet(source.color))
  if isSome(source.identifier):
    result{"identifier"} = toJson(unsafeGet(source.identifier))
  result{"uid"} = toJson(source.uid)

proc fromJsonHook*(target: var LdtkLayerDef; source: JsonNode) =
  assert(hasKey(source, "type"),
         "type" & " is missing while decoding " & "LdtkLayerDef")
  target.type1 = jsonTo(source{"type"}, typeof(target.type1))
  if hasKey(source, "autoTilesetDefUid") and
      source{"autoTilesetDefUid"}.kind != JNull:
    target.autoTilesetDefUid = some(jsonTo(source{"autoTilesetDefUid"},
        typeof(unsafeGet(target.autoTilesetDefUid))))
  assert(hasKey(source, "parallaxScaling"),
         "parallaxScaling" & " is missing while decoding " & "LdtkLayerDef")
  target.parallaxScaling = jsonTo(source{"parallaxScaling"},
                                  typeof(target.parallaxScaling))
  if hasKey(source, "biomeFieldUid") and
      source{"biomeFieldUid"}.kind != JNull:
    target.biomeFieldUid = some(jsonTo(source{"biomeFieldUid"},
                                       typeof(unsafeGet(target.biomeFieldUid))))
  if hasKey(source, "autoTilesKilledByOtherLayerUid") and
      source{"autoTilesKilledByOtherLayerUid"}.kind != JNull:
    target.autoTilesKilledByOtherLayerUid = some(jsonTo(
        source{"autoTilesKilledByOtherLayerUid"},
        typeof(unsafeGet(target.autoTilesKilledByOtherLayerUid))))
  assert(hasKey(source, "inactiveOpacity"),
         "inactiveOpacity" & " is missing while decoding " & "LdtkLayerDef")
  target.inactiveOpacity = jsonTo(source{"inactiveOpacity"},
                                  typeof(target.inactiveOpacity))
  assert(hasKey(source, "__type"),
         "__type" & " is missing while decoding " & "LdtkLayerDef")
  target.`type` = jsonTo(source{"__type"}, typeof(target.`type`))
  assert(hasKey(source, "autoRuleGroups"),
         "autoRuleGroups" & " is missing while decoding " & "LdtkLayerDef")
  target.autoRuleGroups = jsonTo(source{"autoRuleGroups"},
                                 typeof(target.autoRuleGroups))
  assert(hasKey(source, "gridSize"),
         "gridSize" & " is missing while decoding " & "LdtkLayerDef")
  target.gridSize = jsonTo(source{"gridSize"}, typeof(target.gridSize))
  assert(hasKey(source, "hideInList"),
         "hideInList" & " is missing while decoding " & "LdtkLayerDef")
  target.hideInList = jsonTo(source{"hideInList"}, typeof(target.hideInList))
  if hasKey(source, "tilesetDefUid") and
      source{"tilesetDefUid"}.kind != JNull:
    target.tilesetDefUid = some(jsonTo(source{"tilesetDefUid"},
                                       typeof(unsafeGet(target.tilesetDefUid))))
  if hasKey(source, "uiColor") and source{"uiColor"}.kind != JNull:
    target.uiColor = some(jsonTo(source{"uiColor"},
                                 typeof(unsafeGet(target.uiColor))))
  assert(hasKey(source, "requiredTags"),
         "requiredTags" & " is missing while decoding " & "LdtkLayerDef")
  target.requiredTags = jsonTo(source{"requiredTags"},
                               typeof(target.requiredTags))
  assert(hasKey(source, "tilePivotX"),
         "tilePivotX" & " is missing while decoding " & "LdtkLayerDef")
  target.tilePivotX = jsonTo(source{"tilePivotX"}, typeof(target.tilePivotX))
  assert(hasKey(source, "uiFilterTags"),
         "uiFilterTags" & " is missing while decoding " & "LdtkLayerDef")
  target.uiFilterTags = jsonTo(source{"uiFilterTags"},
                               typeof(target.uiFilterTags))
  assert(hasKey(source, "guideGridWid"),
         "guideGridWid" & " is missing while decoding " & "LdtkLayerDef")
  target.guideGridWid = jsonTo(source{"guideGridWid"},
                               typeof(target.guideGridWid))
  assert(hasKey(source, "parallaxFactorX"),
         "parallaxFactorX" & " is missing while decoding " & "LdtkLayerDef")
  target.parallaxFactorX = jsonTo(source{"parallaxFactorX"},
                                  typeof(target.parallaxFactorX))
  assert(hasKey(source, "identifier"),
         "identifier" & " is missing while decoding " & "LdtkLayerDef")
  target.identifier = jsonTo(source{"identifier"}, typeof(target.identifier))
  assert(hasKey(source, "canSelectWhenInactive"), "canSelectWhenInactive" &
      " is missing while decoding " &
      "LdtkLayerDef")
  target.canSelectWhenInactive = jsonTo(source{"canSelectWhenInactive"},
                                        typeof(target.canSelectWhenInactive))
  assert(hasKey(source, "pxOffsetX"),
         "pxOffsetX" & " is missing while decoding " & "LdtkLayerDef")
  target.pxOffsetX = jsonTo(source{"pxOffsetX"}, typeof(target.pxOffsetX))
  assert(hasKey(source, "tilePivotY"),
         "tilePivotY" & " is missing while decoding " & "LdtkLayerDef")
  target.tilePivotY = jsonTo(source{"tilePivotY"}, typeof(target.tilePivotY))
  assert(hasKey(source, "excludedTags"),
         "excludedTags" & " is missing while decoding " & "LdtkLayerDef")
  target.excludedTags = jsonTo(source{"excludedTags"},
                               typeof(target.excludedTags))
  if hasKey(source, "doc") and source{"doc"}.kind != JNull:
    target.doc = some(jsonTo(source{"doc"}, typeof(unsafeGet(target.doc))))
  assert(hasKey(source, "uid"),
         "uid" & " is missing while decoding " & "LdtkLayerDef")
  target.uid = jsonTo(source{"uid"}, typeof(target.uid))
  assert(hasKey(source, "guideGridHei"),
         "guideGridHei" & " is missing while decoding " & "LdtkLayerDef")
  target.guideGridHei = jsonTo(source{"guideGridHei"},
                               typeof(target.guideGridHei))
  if hasKey(source, "autoSourceLayerDefUid") and
      source{"autoSourceLayerDefUid"}.kind != JNull:
    target.autoSourceLayerDefUid = some(jsonTo(
        source{"autoSourceLayerDefUid"},
        typeof(unsafeGet(target.autoSourceLayerDefUid))))
  assert(hasKey(source, "displayOpacity"),
         "displayOpacity" & " is missing while decoding " & "LdtkLayerDef")
  target.displayOpacity = jsonTo(source{"displayOpacity"},
                                 typeof(target.displayOpacity))
  assert(hasKey(source, "intGridValuesGroups"),
         "intGridValuesGroups" & " is missing while decoding " & "LdtkLayerDef")
  target.intGridValuesGroups = jsonTo(source{"intGridValuesGroups"},
                                      typeof(target.intGridValuesGroups))
  assert(hasKey(source, "hideFieldsWhenInactive"), "hideFieldsWhenInactive" &
      " is missing while decoding " &
      "LdtkLayerDef")
  target.hideFieldsWhenInactive = jsonTo(source{"hideFieldsWhenInactive"},
      typeof(target.hideFieldsWhenInactive))
  assert(hasKey(source, "useAsyncRender"),
         "useAsyncRender" & " is missing while decoding " & "LdtkLayerDef")
  target.useAsyncRender = jsonTo(source{"useAsyncRender"},
                                 typeof(target.useAsyncRender))
  assert(hasKey(source, "pxOffsetY"),
         "pxOffsetY" & " is missing while decoding " & "LdtkLayerDef")
  target.pxOffsetY = jsonTo(source{"pxOffsetY"}, typeof(target.pxOffsetY))
  assert(hasKey(source, "parallaxFactorY"),
         "parallaxFactorY" & " is missing while decoding " & "LdtkLayerDef")
  target.parallaxFactorY = jsonTo(source{"parallaxFactorY"},
                                  typeof(target.parallaxFactorY))
  assert(hasKey(source, "intGridValues"),
         "intGridValues" & " is missing while decoding " & "LdtkLayerDef")
  target.intGridValues = jsonTo(source{"intGridValues"},
                                typeof(target.intGridValues))
  assert(hasKey(source, "renderInWorldView"),
         "renderInWorldView" & " is missing while decoding " & "LdtkLayerDef")
  target.renderInWorldView = jsonTo(source{"renderInWorldView"},
                                    typeof(target.renderInWorldView))

proc toJsonHook*(source: LdtkLayerDef): JsonNode =
  result = newJObject()
  result{"type"} = toJson(source.type1)
  if isSome(source.autoTilesetDefUid):
    result{"autoTilesetDefUid"} = toJson(unsafeGet(source.autoTilesetDefUid))
  result{"parallaxScaling"} = toJson(source.parallaxScaling)
  if isSome(source.biomeFieldUid):
    result{"biomeFieldUid"} = toJson(unsafeGet(source.biomeFieldUid))
  if isSome(source.autoTilesKilledByOtherLayerUid):
    result{"autoTilesKilledByOtherLayerUid"} = toJson(
        unsafeGet(source.autoTilesKilledByOtherLayerUid))
  result{"inactiveOpacity"} = toJson(source.inactiveOpacity)
  result{"__type"} = toJson(source.`type`)
  result{"autoRuleGroups"} = toJson(source.autoRuleGroups)
  result{"gridSize"} = toJson(source.gridSize)
  result{"hideInList"} = toJson(source.hideInList)
  if isSome(source.tilesetDefUid):
    result{"tilesetDefUid"} = toJson(unsafeGet(source.tilesetDefUid))
  if isSome(source.uiColor):
    result{"uiColor"} = toJson(unsafeGet(source.uiColor))
  result{"requiredTags"} = toJson(source.requiredTags)
  result{"tilePivotX"} = toJson(source.tilePivotX)
  result{"uiFilterTags"} = toJson(source.uiFilterTags)
  result{"guideGridWid"} = toJson(source.guideGridWid)
  result{"parallaxFactorX"} = toJson(source.parallaxFactorX)
  result{"identifier"} = toJson(source.identifier)
  result{"canSelectWhenInactive"} = toJson(source.canSelectWhenInactive)
  result{"pxOffsetX"} = toJson(source.pxOffsetX)
  result{"tilePivotY"} = toJson(source.tilePivotY)
  result{"excludedTags"} = toJson(source.excludedTags)
  if isSome(source.doc):
    result{"doc"} = toJson(unsafeGet(source.doc))
  result{"uid"} = toJson(source.uid)
  result{"guideGridHei"} = toJson(source.guideGridHei)
  if isSome(source.autoSourceLayerDefUid):
    result{"autoSourceLayerDefUid"} = toJson(
        unsafeGet(source.autoSourceLayerDefUid))
  result{"displayOpacity"} = toJson(source.displayOpacity)
  result{"intGridValuesGroups"} = toJson(source.intGridValuesGroups)
  result{"hideFieldsWhenInactive"} = toJson(source.hideFieldsWhenInactive)
  result{"useAsyncRender"} = toJson(source.useAsyncRender)
  result{"pxOffsetY"} = toJson(source.pxOffsetY)
  result{"parallaxFactorY"} = toJson(source.parallaxFactorY)
  result{"intGridValues"} = toJson(source.intGridValues)
  result{"renderInWorldView"} = toJson(source.renderInWorldView)

proc fromJsonHook*(target: var LdtkDefinitions; source: JsonNode) =
  assert(hasKey(source, "levelFields"),
         "levelFields" & " is missing while decoding " & "LdtkDefinitions")
  target.levelFields = jsonTo(source{"levelFields"}, typeof(target.levelFields))
  assert(hasKey(source, "tilesets"),
         "tilesets" & " is missing while decoding " & "LdtkDefinitions")
  target.tilesets = jsonTo(source{"tilesets"}, typeof(target.tilesets))
  assert(hasKey(source, "entities"),
         "entities" & " is missing while decoding " & "LdtkDefinitions")
  target.entities = jsonTo(source{"entities"}, typeof(target.entities))
  assert(hasKey(source, "enums"),
         "enums" & " is missing while decoding " & "LdtkDefinitions")
  target.enums = jsonTo(source{"enums"}, typeof(target.enums))
  assert(hasKey(source, "layers"),
         "layers" & " is missing while decoding " & "LdtkDefinitions")
  target.layers = jsonTo(source{"layers"}, typeof(target.layers))
  assert(hasKey(source, "externalEnums"),
         "externalEnums" & " is missing while decoding " & "LdtkDefinitions")
  target.externalEnums = jsonTo(source{"externalEnums"},
                                typeof(target.externalEnums))

proc toJsonHook*(source: LdtkDefinitions): JsonNode =
  result = newJObject()
  result{"levelFields"} = toJson(source.levelFields)
  result{"tilesets"} = toJson(source.tilesets)
  result{"entities"} = toJson(source.entities)
  result{"enums"} = toJson(source.enums)
  result{"layers"} = toJson(source.layers)
  result{"externalEnums"} = toJson(source.externalEnums)

proc fromJsonHook*(target: var LdtkGridPoint; source: JsonNode) =
  assert(hasKey(source, "cx"),
         "cx" & " is missing while decoding " & "LdtkGridPoint")
  target.cx = jsonTo(source{"cx"}, typeof(target.cx))
  assert(hasKey(source, "cy"),
         "cy" & " is missing while decoding " & "LdtkGridPoint")
  target.cy = jsonTo(source{"cy"}, typeof(target.cy))

proc toJsonHook*(source: LdtkGridPoint): JsonNode =
  result = newJObject()
  result{"cx"} = toJson(source.cx)
  result{"cy"} = toJson(source.cy)

proc fromJsonHook*(target: var Ldtk_FORCED_REFS; source: JsonNode) =
  if hasKey(source, "CustomCommand") and
      source{"CustomCommand"}.kind != JNull:
    target.CustomCommand = some(jsonTo(source{"CustomCommand"},
                                       typeof(unsafeGet(target.CustomCommand))))
  if hasKey(source, "IntGridValueDef") and
      source{"IntGridValueDef"}.kind != JNull:
    target.IntGridValueDef = some(jsonTo(source{"IntGridValueDef"},
        typeof(unsafeGet(target.IntGridValueDef))))
  if hasKey(source, "Level") and source{"Level"}.kind != JNull:
    target.Level = some(jsonTo(source{"Level"}, typeof(unsafeGet(target.Level))))
  if hasKey(source, "Definitions") and source{"Definitions"}.kind != JNull:
    target.Definitions = some(jsonTo(source{"Definitions"},
                                     typeof(unsafeGet(target.Definitions))))
  if hasKey(source, "EnumDef") and source{"EnumDef"}.kind != JNull:
    target.EnumDef = some(jsonTo(source{"EnumDef"},
                                 typeof(unsafeGet(target.EnumDef))))
  if hasKey(source, "FieldDef") and source{"FieldDef"}.kind != JNull:
    target.FieldDef = some(jsonTo(source{"FieldDef"},
                                  typeof(unsafeGet(target.FieldDef))))
  if hasKey(source, "AutoLayerRuleGroup") and
      source{"AutoLayerRuleGroup"}.kind != JNull:
    target.AutoLayerRuleGroup = some(jsonTo(source{"AutoLayerRuleGroup"},
        typeof(unsafeGet(target.AutoLayerRuleGroup))))
  if hasKey(source, "TilesetDef") and source{"TilesetDef"}.kind != JNull:
    target.TilesetDef = some(jsonTo(source{"TilesetDef"},
                                    typeof(unsafeGet(target.TilesetDef))))
  if hasKey(source, "TableOfContentEntry") and
      source{"TableOfContentEntry"}.kind != JNull:
    target.TableOfContentEntry = some(jsonTo(source{"TableOfContentEntry"},
        typeof(unsafeGet(target.TableOfContentEntry))))
  if hasKey(source, "EntityDef") and source{"EntityDef"}.kind != JNull:
    target.EntityDef = some(jsonTo(source{"EntityDef"},
                                   typeof(unsafeGet(target.EntityDef))))
  if hasKey(source, "FieldInstance") and
      source{"FieldInstance"}.kind != JNull:
    target.FieldInstance = some(jsonTo(source{"FieldInstance"},
                                       typeof(unsafeGet(target.FieldInstance))))
  if hasKey(source, "EntityReferenceInfos") and
      source{"EntityReferenceInfos"}.kind != JNull:
    target.EntityReferenceInfos = some(jsonTo(
        source{"EntityReferenceInfos"},
        typeof(unsafeGet(target.EntityReferenceInfos))))
  if hasKey(source, "LevelBgPosInfos") and
      source{"LevelBgPosInfos"}.kind != JNull:
    target.LevelBgPosInfos = some(jsonTo(source{"LevelBgPosInfos"},
        typeof(unsafeGet(target.LevelBgPosInfos))))
  if hasKey(source, "TileCustomMetadata") and
      source{"TileCustomMetadata"}.kind != JNull:
    target.TileCustomMetadata = some(jsonTo(source{"TileCustomMetadata"},
        typeof(unsafeGet(target.TileCustomMetadata))))
  if hasKey(source, "Tile") and source{"Tile"}.kind != JNull:
    target.Tile = some(jsonTo(source{"Tile"}, typeof(unsafeGet(target.Tile))))
  if hasKey(source, "AutoRuleDef") and source{"AutoRuleDef"}.kind != JNull:
    target.AutoRuleDef = some(jsonTo(source{"AutoRuleDef"},
                                     typeof(unsafeGet(target.AutoRuleDef))))
  if hasKey(source, "NeighbourLevel") and
      source{"NeighbourLevel"}.kind != JNull:
    target.NeighbourLevel = some(jsonTo(source{"NeighbourLevel"}, typeof(
        unsafeGet(target.NeighbourLevel))))
  if hasKey(source, "GridPoint") and source{"GridPoint"}.kind != JNull:
    target.GridPoint = some(jsonTo(source{"GridPoint"},
                                   typeof(unsafeGet(target.GridPoint))))
  if hasKey(source, "EntityInstance") and
      source{"EntityInstance"}.kind != JNull:
    target.EntityInstance = some(jsonTo(source{"EntityInstance"}, typeof(
        unsafeGet(target.EntityInstance))))
  if hasKey(source, "TilesetRect") and source{"TilesetRect"}.kind != JNull:
    target.TilesetRect = some(jsonTo(source{"TilesetRect"},
                                     typeof(unsafeGet(target.TilesetRect))))
  if hasKey(source, "EnumTagValue") and source{"EnumTagValue"}.kind != JNull:
    target.EnumTagValue = some(jsonTo(source{"EnumTagValue"},
                                      typeof(unsafeGet(target.EnumTagValue))))
  if hasKey(source, "LayerInstance") and
      source{"LayerInstance"}.kind != JNull:
    target.LayerInstance = some(jsonTo(source{"LayerInstance"},
                                       typeof(unsafeGet(target.LayerInstance))))
  if hasKey(source, "IntGridValueInstance") and
      source{"IntGridValueInstance"}.kind != JNull:
    target.IntGridValueInstance = some(jsonTo(
        source{"IntGridValueInstance"},
        typeof(unsafeGet(target.IntGridValueInstance))))
  if hasKey(source, "World") and source{"World"}.kind != JNull:
    target.World = some(jsonTo(source{"World"}, typeof(unsafeGet(target.World))))
  if hasKey(source, "LayerDef") and source{"LayerDef"}.kind != JNull:
    target.LayerDef = some(jsonTo(source{"LayerDef"},
                                  typeof(unsafeGet(target.LayerDef))))
  if hasKey(source, "IntGridValueGroupDef") and
      source{"IntGridValueGroupDef"}.kind != JNull:
    target.IntGridValueGroupDef = some(jsonTo(
        source{"IntGridValueGroupDef"},
        typeof(unsafeGet(target.IntGridValueGroupDef))))
  if hasKey(source, "TocInstanceData") and
      source{"TocInstanceData"}.kind != JNull:
    target.TocInstanceData = some(jsonTo(source{"TocInstanceData"},
        typeof(unsafeGet(target.TocInstanceData))))
  if hasKey(source, "EnumDefValues") and
      source{"EnumDefValues"}.kind != JNull:
    target.EnumDefValues = some(jsonTo(source{"EnumDefValues"},
                                       typeof(unsafeGet(target.EnumDefValues))))

proc toJsonHook*(source: Ldtk_FORCED_REFS): JsonNode =
  result = newJObject()
  if isSome(source.CustomCommand):
    result{"CustomCommand"} = toJson(unsafeGet(source.CustomCommand))
  if isSome(source.IntGridValueDef):
    result{"IntGridValueDef"} = toJson(unsafeGet(source.IntGridValueDef))
  if isSome(source.Level):
    result{"Level"} = toJson(unsafeGet(source.Level))
  if isSome(source.Definitions):
    result{"Definitions"} = toJson(unsafeGet(source.Definitions))
  if isSome(source.EnumDef):
    result{"EnumDef"} = toJson(unsafeGet(source.EnumDef))
  if isSome(source.FieldDef):
    result{"FieldDef"} = toJson(unsafeGet(source.FieldDef))
  if isSome(source.AutoLayerRuleGroup):
    result{"AutoLayerRuleGroup"} = toJson(unsafeGet(source.AutoLayerRuleGroup))
  if isSome(source.TilesetDef):
    result{"TilesetDef"} = toJson(unsafeGet(source.TilesetDef))
  if isSome(source.TableOfContentEntry):
    result{"TableOfContentEntry"} = toJson(unsafeGet(source.TableOfContentEntry))
  if isSome(source.EntityDef):
    result{"EntityDef"} = toJson(unsafeGet(source.EntityDef))
  if isSome(source.FieldInstance):
    result{"FieldInstance"} = toJson(unsafeGet(source.FieldInstance))
  if isSome(source.EntityReferenceInfos):
    result{"EntityReferenceInfos"} = toJson(
        unsafeGet(source.EntityReferenceInfos))
  if isSome(source.LevelBgPosInfos):
    result{"LevelBgPosInfos"} = toJson(unsafeGet(source.LevelBgPosInfos))
  if isSome(source.TileCustomMetadata):
    result{"TileCustomMetadata"} = toJson(unsafeGet(source.TileCustomMetadata))
  if isSome(source.Tile):
    result{"Tile"} = toJson(unsafeGet(source.Tile))
  if isSome(source.AutoRuleDef):
    result{"AutoRuleDef"} = toJson(unsafeGet(source.AutoRuleDef))
  if isSome(source.NeighbourLevel):
    result{"NeighbourLevel"} = toJson(unsafeGet(source.NeighbourLevel))
  if isSome(source.GridPoint):
    result{"GridPoint"} = toJson(unsafeGet(source.GridPoint))
  if isSome(source.EntityInstance):
    result{"EntityInstance"} = toJson(unsafeGet(source.EntityInstance))
  if isSome(source.TilesetRect):
    result{"TilesetRect"} = toJson(unsafeGet(source.TilesetRect))
  if isSome(source.EnumTagValue):
    result{"EnumTagValue"} = toJson(unsafeGet(source.EnumTagValue))
  if isSome(source.LayerInstance):
    result{"LayerInstance"} = toJson(unsafeGet(source.LayerInstance))
  if isSome(source.IntGridValueInstance):
    result{"IntGridValueInstance"} = toJson(
        unsafeGet(source.IntGridValueInstance))
  if isSome(source.World):
    result{"World"} = toJson(unsafeGet(source.World))
  if isSome(source.LayerDef):
    result{"LayerDef"} = toJson(unsafeGet(source.LayerDef))
  if isSome(source.IntGridValueGroupDef):
    result{"IntGridValueGroupDef"} = toJson(
        unsafeGet(source.IntGridValueGroupDef))
  if isSome(source.TocInstanceData):
    result{"TocInstanceData"} = toJson(unsafeGet(source.TocInstanceData))
  if isSome(source.EnumDefValues):
    result{"EnumDefValues"} = toJson(unsafeGet(source.EnumDefValues))

proc toJsonHook*(source: LdtkldtkWorldLayout): JsonNode =
  case source
  of LdtkldtkWorldLayout.LinearHorizontal:
    return newJString("LinearHorizontal")
  of LdtkldtkWorldLayout.LinearVertical:
    return newJString("LinearVertical")
  of LdtkldtkWorldLayout.GridVania:
    return newJString("GridVania")
  of LdtkldtkWorldLayout.Free:
    return newJString("Free")
  
proc fromJsonHook*(target: var LdtkldtkWorldLayout; source: JsonNode) =
  target = case getStr(source)
  of "LinearHorizontal":
    LdtkldtkWorldLayout.LinearHorizontal
  of "LinearVertical":
    LdtkldtkWorldLayout.LinearVertical
  of "GridVania":
    LdtkldtkWorldLayout.GridVania
  of "Free":
    LdtkldtkWorldLayout.Free
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc toJsonHook*(source: LdtkFlags): JsonNode =
  case source
  of LdtkFlags.ExportPreCsvIntGridFormat:
    return newJString("ExportPreCsvIntGridFormat")
  of LdtkFlags.DiscardPreCsvIntGrid:
    return newJString("DiscardPreCsvIntGrid")
  of LdtkFlags.ExportOldTableOfContentData:
    return newJString("ExportOldTableOfContentData")
  of LdtkFlags.PrependIndexToLevelFileNames:
    return newJString("PrependIndexToLevelFileNames")
  of LdtkFlags.MultiWorlds:
    return newJString("MultiWorlds")
  of LdtkFlags.UseMultilinesType:
    return newJString("UseMultilinesType")
  of LdtkFlags.IgnoreBackupSuggest:
    return newJString("IgnoreBackupSuggest")
  
proc fromJsonHook*(target: var LdtkFlags; source: JsonNode) =
  target = case getStr(source)
  of "ExportPreCsvIntGridFormat":
    LdtkFlags.ExportPreCsvIntGridFormat
  of "DiscardPreCsvIntGrid":
    LdtkFlags.DiscardPreCsvIntGrid
  of "ExportOldTableOfContentData":
    LdtkFlags.ExportOldTableOfContentData
  of "PrependIndexToLevelFileNames":
    LdtkFlags.PrependIndexToLevelFileNames
  of "MultiWorlds":
    LdtkFlags.MultiWorlds
  of "UseMultilinesType":
    LdtkFlags.UseMultilinesType
  of "IgnoreBackupSuggest":
    LdtkFlags.IgnoreBackupSuggest
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc toJsonHook*(source: LdtkIdentifierStyle): JsonNode =
  case source
  of LdtkIdentifierStyle.Lowercase:
    return newJString("Lowercase")
  of LdtkIdentifierStyle.Free:
    return newJString("Free")
  of LdtkIdentifierStyle.Capitalize:
    return newJString("Capitalize")
  of LdtkIdentifierStyle.Uppercase:
    return newJString("Uppercase")
  
proc fromJsonHook*(target: var LdtkIdentifierStyle; source: JsonNode) =
  target = case getStr(source)
  of "Lowercase":
    LdtkIdentifierStyle.Lowercase
  of "Free":
    LdtkIdentifierStyle.Free
  of "Capitalize":
    LdtkIdentifierStyle.Capitalize
  of "Uppercase":
    LdtkIdentifierStyle.Uppercase
  else:
    raise newException(ValueError, "Unable to decode enum: " & $source)
  
proc fromJsonHook*(target: var LdtkLdtkJsonRoot; source: JsonNode) =
  assert(hasKey(source, "backupLimit"),
         "backupLimit" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.backupLimit = jsonTo(source{"backupLimit"}, typeof(target.backupLimit))
  assert(hasKey(source, "simplifiedExport"), "simplifiedExport" &
      " is missing while decoding " &
      "LdtkLdtkJsonRoot")
  target.simplifiedExport = jsonTo(source{"simplifiedExport"},
                                   typeof(target.simplifiedExport))
  assert(hasKey(source, "externalLevels"),
         "externalLevels" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.externalLevels = jsonTo(source{"externalLevels"},
                                 typeof(target.externalLevels))
  if hasKey(source, "backupRelPath") and
      source{"backupRelPath"}.kind != JNull:
    target.backupRelPath = some(jsonTo(source{"backupRelPath"},
                                       typeof(unsafeGet(target.backupRelPath))))
  assert(hasKey(source, "jsonVersion"),
         "jsonVersion" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.jsonVersion = jsonTo(source{"jsonVersion"}, typeof(target.jsonVersion))
  assert(hasKey(source, "bgColor"),
         "bgColor" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.bgColor = jsonTo(source{"bgColor"}, typeof(target.bgColor))
  assert(hasKey(source, "appBuildId"),
         "appBuildId" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.appBuildId = jsonTo(source{"appBuildId"}, typeof(target.appBuildId))
  assert(hasKey(source, "defaultEntityHeight"), "defaultEntityHeight" &
      " is missing while decoding " &
      "LdtkLdtkJsonRoot")
  target.defaultEntityHeight = jsonTo(source{"defaultEntityHeight"},
                                      typeof(target.defaultEntityHeight))
  if hasKey(source, "pngFilePattern") and
      source{"pngFilePattern"}.kind != JNull:
    target.pngFilePattern = some(jsonTo(source{"pngFilePattern"}, typeof(
        unsafeGet(target.pngFilePattern))))
  assert(hasKey(source, "customCommands"),
         "customCommands" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.customCommands = jsonTo(source{"customCommands"},
                                 typeof(target.customCommands))
  assert(hasKey(source, "exportTiled"),
         "exportTiled" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.exportTiled = jsonTo(source{"exportTiled"}, typeof(target.exportTiled))
  if hasKey(source, "exportPng") and source{"exportPng"}.kind != JNull:
    target.exportPng = some(jsonTo(source{"exportPng"},
                                   typeof(unsafeGet(target.exportPng))))
  if hasKey(source, "worldGridWidth") and
      source{"worldGridWidth"}.kind != JNull:
    target.worldGridWidth = some(jsonTo(source{"worldGridWidth"}, typeof(
        unsafeGet(target.worldGridWidth))))
  if hasKey(source, "defaultLevelHeight") and
      source{"defaultLevelHeight"}.kind != JNull:
    target.defaultLevelHeight = some(jsonTo(source{"defaultLevelHeight"},
        typeof(unsafeGet(target.defaultLevelHeight))))
  assert(hasKey(source, "toc"),
         "toc" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.toc = jsonTo(source{"toc"}, typeof(target.toc))
  assert(hasKey(source, "worlds"),
         "worlds" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.worlds = jsonTo(source{"worlds"}, typeof(target.worlds))
  assert(hasKey(source, "imageExportMode"),
         "imageExportMode" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.imageExportMode = jsonTo(source{"imageExportMode"},
                                  typeof(target.imageExportMode))
  assert(hasKey(source, "dummyWorldIid"),
         "dummyWorldIid" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.dummyWorldIid = jsonTo(source{"dummyWorldIid"},
                                typeof(target.dummyWorldIid))
  if hasKey(source, "__FORCED_REFS") and
      source{"__FORCED_REFS"}.kind != JNull:
    target.FORCED_REFS = some(jsonTo(source{"__FORCED_REFS"},
                                     typeof(unsafeGet(target.FORCED_REFS))))
  assert(hasKey(source, "defaultPivotY"),
         "defaultPivotY" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.defaultPivotY = jsonTo(source{"defaultPivotY"},
                                typeof(target.defaultPivotY))
  assert(hasKey(source, "exportLevelBg"),
         "exportLevelBg" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.exportLevelBg = jsonTo(source{"exportLevelBg"},
                                typeof(target.exportLevelBg))
  assert(hasKey(source, "nextUid"),
         "nextUid" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.nextUid = jsonTo(source{"nextUid"}, typeof(target.nextUid))
  assert(hasKey(source, "levelNamePattern"), "levelNamePattern" &
      " is missing while decoding " &
      "LdtkLdtkJsonRoot")
  target.levelNamePattern = jsonTo(source{"levelNamePattern"},
                                   typeof(target.levelNamePattern))
  assert(hasKey(source, "defs"),
         "defs" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.defs = jsonTo(source{"defs"}, typeof(target.defs))
  assert(hasKey(source, "defaultPivotX"),
         "defaultPivotX" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.defaultPivotX = jsonTo(source{"defaultPivotX"},
                                typeof(target.defaultPivotX))
  if hasKey(source, "tutorialDesc") and source{"tutorialDesc"}.kind != JNull:
    target.tutorialDesc = some(jsonTo(source{"tutorialDesc"},
                                      typeof(unsafeGet(target.tutorialDesc))))
  if hasKey(source, "worldLayout") and source{"worldLayout"}.kind != JNull:
    target.worldLayout = some(jsonTo(source{"worldLayout"},
                                     typeof(unsafeGet(target.worldLayout))))
  assert(hasKey(source, "defaultEntityWidth"), "defaultEntityWidth" &
      " is missing while decoding " &
      "LdtkLdtkJsonRoot")
  target.defaultEntityWidth = jsonTo(source{"defaultEntityWidth"},
                                     typeof(target.defaultEntityWidth))
  assert(hasKey(source, "iid"),
         "iid" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.iid = jsonTo(source{"iid"}, typeof(target.iid))
  assert(hasKey(source, "defaultGridSize"),
         "defaultGridSize" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.defaultGridSize = jsonTo(source{"defaultGridSize"},
                                  typeof(target.defaultGridSize))
  if hasKey(source, "defaultLevelWidth") and
      source{"defaultLevelWidth"}.kind != JNull:
    target.defaultLevelWidth = some(jsonTo(source{"defaultLevelWidth"},
        typeof(unsafeGet(target.defaultLevelWidth))))
  assert(hasKey(source, "minifyJson"),
         "minifyJson" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.minifyJson = jsonTo(source{"minifyJson"}, typeof(target.minifyJson))
  assert(hasKey(source, "backupOnSave"),
         "backupOnSave" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.backupOnSave = jsonTo(source{"backupOnSave"},
                               typeof(target.backupOnSave))
  assert(hasKey(source, "flags"),
         "flags" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.flags = jsonTo(source{"flags"}, typeof(target.flags))
  assert(hasKey(source, "defaultLevelBgColor"), "defaultLevelBgColor" &
      " is missing while decoding " &
      "LdtkLdtkJsonRoot")
  target.defaultLevelBgColor = jsonTo(source{"defaultLevelBgColor"},
                                      typeof(target.defaultLevelBgColor))
  assert(hasKey(source, "identifierStyle"),
         "identifierStyle" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.identifierStyle = jsonTo(source{"identifierStyle"},
                                  typeof(target.identifierStyle))
  if hasKey(source, "worldGridHeight") and
      source{"worldGridHeight"}.kind != JNull:
    target.worldGridHeight = some(jsonTo(source{"worldGridHeight"},
        typeof(unsafeGet(target.worldGridHeight))))
  assert(hasKey(source, "levels"),
         "levels" & " is missing while decoding " & "LdtkLdtkJsonRoot")
  target.levels = jsonTo(source{"levels"}, typeof(target.levels))

proc toJsonHook*(source: LdtkLdtkJsonRoot): JsonNode =
  result = newJObject()
  result{"backupLimit"} = toJson(source.backupLimit)
  result{"simplifiedExport"} = toJson(source.simplifiedExport)
  result{"externalLevels"} = toJson(source.externalLevels)
  if isSome(source.backupRelPath):
    result{"backupRelPath"} = toJson(unsafeGet(source.backupRelPath))
  result{"jsonVersion"} = toJson(source.jsonVersion)
  result{"bgColor"} = toJson(source.bgColor)
  result{"appBuildId"} = toJson(source.appBuildId)
  result{"defaultEntityHeight"} = toJson(source.defaultEntityHeight)
  if isSome(source.pngFilePattern):
    result{"pngFilePattern"} = toJson(unsafeGet(source.pngFilePattern))
  result{"customCommands"} = toJson(source.customCommands)
  result{"exportTiled"} = toJson(source.exportTiled)
  if isSome(source.exportPng):
    result{"exportPng"} = toJson(unsafeGet(source.exportPng))
  if isSome(source.worldGridWidth):
    result{"worldGridWidth"} = toJson(unsafeGet(source.worldGridWidth))
  if isSome(source.defaultLevelHeight):
    result{"defaultLevelHeight"} = toJson(unsafeGet(source.defaultLevelHeight))
  result{"toc"} = toJson(source.toc)
  result{"worlds"} = toJson(source.worlds)
  result{"imageExportMode"} = toJson(source.imageExportMode)
  result{"dummyWorldIid"} = toJson(source.dummyWorldIid)
  if isSome(source.FORCED_REFS):
    result{"__FORCED_REFS"} = toJson(unsafeGet(source.FORCED_REFS))
  result{"defaultPivotY"} = toJson(source.defaultPivotY)
  result{"exportLevelBg"} = toJson(source.exportLevelBg)
  result{"nextUid"} = toJson(source.nextUid)
  result{"levelNamePattern"} = toJson(source.levelNamePattern)
  result{"defs"} = toJson(source.defs)
  result{"defaultPivotX"} = toJson(source.defaultPivotX)
  if isSome(source.tutorialDesc):
    result{"tutorialDesc"} = toJson(unsafeGet(source.tutorialDesc))
  if isSome(source.worldLayout):
    result{"worldLayout"} = toJson(unsafeGet(source.worldLayout))
  result{"defaultEntityWidth"} = toJson(source.defaultEntityWidth)
  result{"iid"} = toJson(source.iid)
  result{"defaultGridSize"} = toJson(source.defaultGridSize)
  if isSome(source.defaultLevelWidth):
    result{"defaultLevelWidth"} = toJson(unsafeGet(source.defaultLevelWidth))
  result{"minifyJson"} = toJson(source.minifyJson)
  result{"backupOnSave"} = toJson(source.backupOnSave)
  result{"flags"} = toJson(source.flags)
  result{"defaultLevelBgColor"} = toJson(source.defaultLevelBgColor)
  result{"identifierStyle"} = toJson(source.identifierStyle)
  if isSome(source.worldGridHeight):
    result{"worldGridHeight"} = toJson(unsafeGet(source.worldGridHeight))
  result{"levels"} = toJson(source.levels)
