!* GDI+ support
!* Class implementations
!* mikeduglas 2023
!* mikeduglas@yandex.ru

  MEMBER

  INCLUDE('svcomdef.inc'), ONCE
  INCLUDE('winapi.inc'), ONCE
  INCLUDE('gdiplus.inc'), ONCE

!!!region GDI+ function names
szGdiplusStartup              CSTRING('GdiplusStartup'), STATIC
szGdiplusShutdown             CSTRING('GdiplusShutdown'), STATIC
szGdipFree                    CSTRING('GdipFree'), STATIC
szGdipLoadImageFromFile       CSTRING('GdipLoadImageFromFile'), STATIC
szGdipLoadImageFromFileICM    CSTRING('GdipLoadImageFromFileICM'), STATIC
szGdipLoadImageFromStream     CSTRING('GdipLoadImageFromStream'), STATIC
szGdipLoadImageFromStreamICM  CSTRING('GdipLoadImageFromStreamICM'), STATIC
szGdipCloneImage              CSTRING('GdipCloneImage'), STATIC
szGdipGetImageThumbnail       CSTRING('GdipGetImageThumbnail'), STATIC
szGdipSaveImageToFile         CSTRING('GdipSaveImageToFile'), STATIC
szGdipSaveImageToStream       CSTRING('GdipSaveImageToStream'), STATIC
szGdipDisposeImage            CSTRING('GdipDisposeImage'), STATIC
szGdipGetImageWidth           CSTRING('GdipGetImageWidth'), STATIC
szGdipGetImageHeight          CSTRING('GdipGetImageHeight'), STATIC
szGdipGetImageHorizontalResolution    CSTRING('GdipGetImageHorizontalResolution'), STATIC
szGdipGetImageVerticalResolution  CSTRING('GdipGetImageVerticalResolution'), STATIC
szGdipGetImageBounds          CSTRING('GdipGetImageBounds'), STATIC
szGdipGetImageDimension       CSTRING('GdipGetImageDimension'), STATIC
szGdipGetImageType            CSTRING('GdipGetImageType'), STATIC
szGdipGetImageFlags           CSTRING('GdipGetImageFlags'), STATIC
szGdipGetImageRawFormat       CSTRING('GdipGetImageRawFormat'), STATIC
szGdipGetImagePixelFormat     CSTRING('GdipGetImagePixelFormat'), STATIC
szGdipGetPropertyCount        CSTRING('GdipGetPropertyCount'), STATIC
szGdipGetPropertyIdList       CSTRING('GdipGetPropertyIdList'), STATIC
szGdipGetPropertyItemSize     CSTRING('GdipGetPropertyItemSize'), STATIC
szGdipGetPropertyItem         CSTRING('GdipGetPropertyItem'), STATIC
szGdipSetPropertyItem         CSTRING('GdipSetPropertyItem'), STATIC
szGdipRemovePropertyItem      CSTRING('GdipRemovePropertyItem'), STATIC
szGdipGetImageEncodersSize    CSTRING('GdipGetImageEncodersSize'), STATIC
szGdipGetImageEncoders        CSTRING('GdipGetImageEncoders'), STATIC
szGdipImageRotateFlip         CSTRING('GdipImageRotateFlip'), STATIC
szGdipGetImagePaletteSize     CSTRING('GdipGetImagePaletteSize'), STATIC
szGdipGetImagePalette         CSTRING('GdipGetImagePalette'), STATIC
szGdipSetImagePalette         CSTRING('GdipSetImagePalette'), STATIC
szGdipFindFirstImageItem      CSTRING('GdipFindFirstImageItem'), STATIC
szGdipFindNextImageItem       CSTRING('GdipFindNextImageItem'), STATIC
szGdipGetImageItemData        CSTRING('GdipGetImageItemData'), STATIC
szGdipCreateBitmapFromFile    CSTRING('GdipCreateBitmapFromFile'), STATIC
szGdipCreateBitmapFromFileICM CSTRING('GdipCreateBitmapFromFileICM'), STATIC
szGdipCreateBitmapFromStream  CSTRING('GdipCreateBitmapFromStream'), STATIC
szGdipCreateBitmapFromStreamICM   CSTRING('GdipCreateBitmapFromStreamICM'), STATIC
szGdipCreateBitmapFromScan0   CSTRING('GdipCreateBitmapFromScan0'), STATIC
szGdipCreateBitmapFromGraphics    CSTRING('GdipCreateBitmapFromGraphics'), STATIC
szGdipCreateBitmapFromGdiDib  CSTRING('GdipCreateBitmapFromGdiDib'), STATIC
szGdipCreateBitmapFromHBITMAP CSTRING('GdipCreateBitmapFromHBITMAP'), STATIC
szGdipCreateHBITMAPFromBitmap CSTRING('GdipCreateHBITMAPFromBitmap'), STATIC
szGdipCreateBitmapFromHICON   CSTRING('GdipCreateBitmapFromHICON'), STATIC
szGdipCreateHICONFromBitmap   CSTRING('GdipCreateHICONFromBitmap'), STATIC
szGdipCreateBitmapFromResource    CSTRING('GdipCreateBitmapFromResource'), STATIC
szGdipCloneBitmapArea         CSTRING('GdipCloneBitmapArea'), STATIC
szGdipCloneBitmapAreaI        CSTRING('GdipCloneBitmapAreaI'), STATIC
szGdipBitmapLockBits          CSTRING('GdipBitmapLockBits'), STATIC
szGdipBitmapUnlockBits        CSTRING('GdipBitmapUnlockBits'), STATIC
szGdipBitmapGetPixel          CSTRING('GdipBitmapGetPixel'), STATIC
szGdipBitmapSetPixel          CSTRING('GdipBitmapSetPixel'), STATIC
szGdipBitmapSetResolution     CSTRING('GdipBitmapSetResolution'), STATIC
szGdipBitmapConvertFormat     CSTRING('GdipBitmapConvertFormat'), STATIC
szGdipBitmapApplyEffect       CSTRING('GdipBitmapApplyEffect'), STATIC
szGdipBitmapCreateApplyEffect CSTRING('GdipBitmapCreateApplyEffect'), STATIC
szGdipBitmapGetHistogramSize  CSTRING('GdipBitmapGetHistogramSize'), STATIC
szGdipBitmapGetHistogram      CSTRING('GdipBitmapGetHistogram'), STATIC
szGdipGetImageGraphicsContext CSTRING('GdipGetImageGraphicsContext'), STATIC
szGdipDeleteGraphics          CSTRING('GdipDeleteGraphics'), STATIC
szGdipCreateFromHDC           CSTRING('GdipCreateFromHDC'), STATIC
szGdipCreateFromHDC2          CSTRING('GdipCreateFromHDC2'), STATIC
szGdipCreateFromHWND          CSTRING('GdipCreateFromHWND'), STATIC
szGdipCreateFromHWNDICM       CSTRING('GdipCreateFromHWNDICM'), STATIC
szGdipGetDC                   CSTRING('GdipGetDC'), STATIC
szGdipReleaseDC               CSTRING('GdipReleaseDC'), STATIC
szGdipSetCompositingMode      CSTRING('GdipSetCompositingMode'), STATIC
szGdipGetCompositingMode      CSTRING('GdipGetCompositingMode'), STATIC
szGdipSetRenderingOrigin      CSTRING('GdipSetRenderingOrigin'), STATIC
szGdipGetRenderingOrigin      CSTRING('GdipGetRenderingOrigin'), STATIC
szGdipSetCompositingQuality   CSTRING('GdipSetCompositingQuality'), STATIC
szGdipGetCompositingQuality   CSTRING('GdipGetCompositingQuality'), STATIC
szGdipSetSmoothingMode        CSTRING('GdipSetSmoothingMode'), STATIC
szGdipGetSmoothingMode        CSTRING('GdipGetSmoothingMode'), STATIC
szGdipSetPixelOffsetMode      CSTRING('GdipSetPixelOffsetMode'), STATIC
szGdipGetPixelOffsetMode      CSTRING('GdipGetPixelOffsetMode'), STATIC
szGdipSetTextRenderingHint    CSTRING('GdipSetTextRenderingHint'), STATIC
szGdipGetTextRenderingHint    CSTRING('GdipGetTextRenderingHint'), STATIC
szGdipSetTextContrast         CSTRING('GdipSetTextContrast'), STATIC
szGdipGetTextContrast         CSTRING('GdipGetTextContrast'), STATIC
szGdipSetInterpolationMode    CSTRING('GdipSetInterpolationMode'), STATIC
szGdipGetInterpolationMode    CSTRING('GdipGetInterpolationMode'), STATIC
szGdipSetWorldTransform       CSTRING('GdipSetWorldTransform'), STATIC
szGdipResetWorldTransform     CSTRING('GdipResetWorldTransform'), STATIC
szGdipMultiplyWorldTransform  CSTRING('GdipMultiplyWorldTransform'), STATIC
szGdipTranslateWorldTransform CSTRING('GdipTranslateWorldTransform'), STATIC
szGdipScaleWorldTransform     CSTRING('GdipScaleWorldTransform'), STATIC
szGdipRotateWorldTransform    CSTRING('GdipRotateWorldTransform'), STATIC
szGdipGetWorldTransform       CSTRING('GdipGetWorldTransform'), STATIC
szGdipResetPageTransform      CSTRING('GdipResetPageTransform'), STATIC
szGdipSetPageUnit             CSTRING('GdipSetPageUnit'), STATIC
szGdipGetPageUnit             CSTRING('GdipGetPageUnit'), STATIC
szGdipSetPageScale            CSTRING('GdipSetPageScale'), STATIC
szGdipGetPageScale            CSTRING('GdipGetPageScale'), STATIC
szGdipGetDpiX                 CSTRING('GdipGetDpiX'), STATIC
szGdipGetDpiY                 CSTRING('GdipGetDpiY'), STATIC
szGdipTransformPoints         CSTRING('GdipTransformPoints'), STATIC
szGdipTransformPointsI        CSTRING('GdipTransformPointsI'), STATIC
szGdipGetNearestColor         CSTRING('GdipGetNearestColor'), STATIC
szGdipCreateHalftonePalette   CSTRING('GdipCreateHalftonePalette'), STATIC
szGdipDrawLine                CSTRING('GdipDrawLine'), STATIC
szGdipDrawLineI               CSTRING('GdipDrawLineI'), STATIC
szGdipDrawLines               CSTRING('GdipDrawLines'), STATIC
szGdipDrawLinesI              CSTRING('GdipDrawLinesI'), STATIC
szGdipDrawArc                 CSTRING('GdipDrawArc'), STATIC
szGdipDrawArcI                CSTRING('GdipDrawArcI'), STATIC
szGdipDrawBezier              CSTRING('GdipDrawBezier'), STATIC
szGdipDrawBezierI             CSTRING('GdipDrawBezierI'), STATIC
szGdipDrawBeziers             CSTRING('GdipDrawBeziers'), STATIC
szGdipDrawBeziersI            CSTRING('GdipDrawBeziersI'), STATIC
szGdipDrawRectangle           CSTRING('GdipDrawRectangle'), STATIC
szGdipDrawRectangleI          CSTRING('GdipDrawRectangleI'), STATIC
szGdipDrawRectangles          CSTRING('GdipDrawRectangles'), STATIC
szGdipDrawRectanglesI         CSTRING('GdipDrawRectanglesI'), STATIC
szGdipDrawEllipse             CSTRING('GdipDrawEllipse'), STATIC
szGdipDrawEllipseI            CSTRING('GdipDrawEllipseI'), STATIC
szGdipDrawPie                 CSTRING('GdipDrawPie'), STATIC
szGdipDrawPieI                CSTRING('GdipDrawPieI'), STATIC
szGdipDrawPolygon             CSTRING('GdipDrawPolygon'), STATIC
szGdipDrawPolygonI            CSTRING('GdipDrawPolygonI'), STATIC
szGdipDrawPath                CSTRING('GdipDrawPath'), STATIC
szGdipDrawCurve               CSTRING('GdipDrawCurve'), STATIC
szGdipDrawCurve2              CSTRING('GdipDrawCurve2'), STATIC
szGdipDrawCurve3              CSTRING('GdipDrawCurve3'), STATIC
szGdipDrawCurveI              CSTRING('GdipDrawCurveI'), STATIC
szGdipDrawCurve2I             CSTRING('GdipDrawCurve2I'), STATIC
szGdipDrawCurve3I             CSTRING('GdipDrawCurve3I'), STATIC
szGdipDrawClosedCurve         CSTRING('GdipDrawClosedCurve'), STATIC
szGdipDrawClosedCurve2        CSTRING('GdipDrawClosedCurve2'), STATIC
szGdipDrawClosedCurveI        CSTRING('GdipDrawClosedCurveI'), STATIC
szGdipDrawClosedCurve2I       CSTRING('GdipDrawClosedCurve2I'), STATIC
szGdipGraphicsClear           CSTRING('GdipGraphicsClear'), STATIC
szGdipFillRectangle           CSTRING('GdipFillRectangle'), STATIC
szGdipFillRectangleI          CSTRING('GdipFillRectangleI'), STATIC
szGdipFillRectangles          CSTRING('GdipFillRectangles'), STATIC
szGdipFillRectanglesI         CSTRING('GdipFillRectanglesI'), STATIC
szGdipFillPolygon             CSTRING('GdipFillPolygon'), STATIC
szGdipFillPolygonI            CSTRING('GdipFillPolygonI'), STATIC
szGdipFillEllipse             CSTRING('GdipFillEllipse'), STATIC
szGdipFillEllipseI            CSTRING('GdipFillEllipseI'), STATIC
szGdipFillPie                 CSTRING('GdipFillPie'), STATIC
szGdipFillPieI                CSTRING('GdipFillPieI'), STATIC
szGdipFillPath                CSTRING('GdipFillPath'), STATIC
szGdipFillClosedCurve         CSTRING('GdipFillClosedCurve'), STATIC
szGdipFillClosedCurve2        CSTRING('GdipFillClosedCurve2'), STATIC
szGdipFillClosedCurveI        CSTRING('GdipFillClosedCurveI'), STATIC
szGdipFillClosedCurve2I       CSTRING('GdipFillClosedCurve2I'), STATIC
szGdipFillRegion              CSTRING('GdipFillRegion'), STATIC
szGdipCreateEffect            CSTRING('GdipCreateEffect'), STATIC
szGdipDeleteEffect            CSTRING('GdipDeleteEffect'), STATIC
szGdipGetEffectParameterSize  CSTRING('GdipGetEffectParameterSize'), STATIC
szGdipSetEffectParameters     CSTRING('GdipSetEffectParameters'), STATIC
szGdipGetEffectParameters     CSTRING('GdipGetEffectParameters'), STATIC
szGdipInitializePalette       CSTRING('GdipInitializePalette'), STATIC
szGdipCreateMatrix            CSTRING('GdipCreateMatrix'), STATIC
szGdipCreateMatrix2           CSTRING('GdipCreateMatrix2'), STATIC
szGdipCreateMatrix3           CSTRING('GdipCreateMatrix3'), STATIC
szGdipCreateMatrix3I          CSTRING('GdipCreateMatrix3I'), STATIC
szGdipDeleteMatrix            CSTRING('GdipDeleteMatrix'), STATIC
szGdipCloneMatrix             CSTRING('GdipCloneMatrix'), STATIC
szGdipGetMatrixElements       CSTRING('GdipGetMatrixElements'), STATIC
szGdipSetMatrixElements       CSTRING('GdipSetMatrixElements'), STATIC
szGdipMultiplyMatrix          CSTRING('GdipMultiplyMatrix'), STATIC
szGdipTranslateMatrix         CSTRING('GdipTranslateMatrix'), STATIC
szGdipScaleMatrix             CSTRING('GdipScaleMatrix'), STATIC
szGdipRotateMatrix            CSTRING('GdipRotateMatrix'), STATIC
szGdipShearMatrix             CSTRING('GdipShearMatrix'), STATIC
szGdipInvertMatrix            CSTRING('GdipInvertMatrix'), STATIC
szGdipTransformMatrixPoints   CSTRING('GdipTransformMatrixPoints'), STATIC
szGdipTransformMatrixPointsI  CSTRING('GdipTransformMatrixPointsI'), STATIC
szGdipVectorTransformMatrixPoints CSTRING('GdipVectorTransformMatrixPoints'), STATIC
szGdipVectorTransformMatrixPointsI    CSTRING('GdipVectorTransformMatrixPointsI'), STATIC
szGdipIsMatrixInvertible      CSTRING('GdipIsMatrixInvertible'), STATIC
szGdipIsMatrixIdentity        CSTRING('GdipIsMatrixIdentity'), STATIC
szGdipIsMatrixEqual           CSTRING('GdipIsMatrixEqual'), STATIC
szGdipCreateFontFromDC        CSTRING('GdipCreateFontFromDC'), STATIC
szGdipCreateFontFromLogfontA  CSTRING('GdipCreateFontFromLogfontA'), STATIC
szGdipCreateFont              CSTRING('GdipCreateFont'), STATIC
szGdipGetLogFontA             CSTRING('GdipGetLogFontA'), STATIC
szGdipCloneFont               CSTRING('GdipCloneFont'), STATIC
szGdipDeleteFont              CSTRING('GdipDeleteFont'), STATIC
szGdipGetFamily               CSTRING('GdipGetFamily'), STATIC
szGdipGetFontStyle            CSTRING('GdipGetFontStyle'), STATIC
szGdipGetFontSize             CSTRING('GdipGetFontSize'), STATIC
szGdipGetFontUnit             CSTRING('GdipGetFontUnit'), STATIC
szGdipGetFontHeight           CSTRING('GdipGetFontHeight'), STATIC
szGdipGetFontHeightGivenDPI   CSTRING('GdipGetFontHeightGivenDPI'), STATIC
szGdipCreateFontFamilyFromName    CSTRING('GdipCreateFontFamilyFromName'), STATIC
szGdipGetGenericFontFamilySansSerif   CSTRING('GdipGetGenericFontFamilySansSerif'), STATIC
szGdipGetGenericFontFamilySerif   CSTRING('GdipGetGenericFontFamilySerif'), STATIC
szGdipGetGenericFontFamilyMonospace   CSTRING('GdipGetGenericFontFamilyMonospace'), STATIC
szGdipDeleteFontFamily        CSTRING('GdipDeleteFontFamily'), STATIC
szGdipCloneFontFamily         CSTRING('GdipCloneFontFamily'), STATIC
szGdipGetFamilyName           CSTRING('GdipGetFamilyName'), STATIC
szGdipIsStyleAvailable        CSTRING('GdipIsStyleAvailable'), STATIC
szGdipGetEmHeight             CSTRING('GdipGetEmHeight'), STATIC
szGdipGetCellAscent           CSTRING('GdipGetCellAscent'), STATIC
szGdipGetCellDescent          CSTRING('GdipGetCellDescent'), STATIC
szGdipGetLineSpacing          CSTRING('GdipGetLineSpacing'), STATIC
szGdipGetFontCollectionFamilyCount    CSTRING('GdipGetFontCollectionFamilyCount'), STATIC
szGdipGetFontCollectionFamilyList CSTRING('GdipGetFontCollectionFamilyList'), STATIC
szGdipNewInstalledFontCollection  CSTRING('GdipNewInstalledFontCollection'), STATIC
szGdipNewPrivateFontCollection    CSTRING('GdipNewPrivateFontCollection'), STATIC
szGdipDeletePrivateFontCollection CSTRING('GdipDeletePrivateFontCollection'), STATIC
szGdipPrivateAddFontFile      CSTRING('GdipPrivateAddFontFile'), STATIC
szGdipCreatePath              CSTRING('GdipCreatePath'), STATIC
szGdipCreatePath2             CSTRING('GdipCreatePath2'), STATIC
szGdipCreatePath2I            CSTRING('GdipCreatePath2I'), STATIC
szGdipDeletePath              CSTRING('GdipDeletePath'), STATIC
szGdipClonePath               CSTRING('GdipClonePath'), STATIC
szGdipResetPath               CSTRING('GdipResetPath'), STATIC
szGdipGetPathFillMode         CSTRING('GdipGetPathFillMode'), STATIC
szGdipSetPathFillMode         CSTRING('GdipSetPathFillMode'), STATIC
szGdipGetPathData             CSTRING('GdipGetPathData'), STATIC
szGdipStartPathFigure         CSTRING('GdipStartPathFigure'), STATIC
szGdipClosePathFigure         CSTRING('GdipClosePathFigure'), STATIC
szGdipClosePathFigures        CSTRING('GdipClosePathFigures'), STATIC
szGdipSetPathMarker           CSTRING('GdipSetPathMarker'), STATIC
szGdipClearPathMarkers        CSTRING('GdipClearPathMarkers'), STATIC
szGdipReversePath             CSTRING('GdipReversePath'), STATIC
szGdipGetPathLastPoint        CSTRING('GdipGetPathLastPoint'), STATIC
szGdipAddPathLine             CSTRING('GdipAddPathLine'), STATIC
szGdipAddPathLine2            CSTRING('GdipAddPathLine2'), STATIC
szGdipAddPathLineI            CSTRING('GdipAddPathLineI'), STATIC
szGdipAddPathLine2I           CSTRING('GdipAddPathLine2I'), STATIC
szGdipAddPathArc              CSTRING('GdipAddPathArc'), STATIC
szGdipAddPathArcI             CSTRING('GdipAddPathArcI'), STATIC
szGdipAddPathBezier           CSTRING('GdipAddPathBezier'), STATIC
szGdipAddPathBeziers          CSTRING('GdipAddPathBeziers'), STATIC
szGdipAddPathBezierI          CSTRING('GdipAddPathBezierI'), STATIC
szGdipAddPathBeziersI         CSTRING('GdipAddPathBeziersI'), STATIC
szGdipAddPathCurve            CSTRING('GdipAddPathCurve'), STATIC
szGdipAddPathCurve2           CSTRING('GdipAddPathCurve2'), STATIC
szGdipAddPathCurve3           CSTRING('GdipAddPathCurve3'), STATIC
szGdipAddPathCurveI           CSTRING('GdipAddPathCurveI'), STATIC
szGdipAddPathCurve2I          CSTRING('GdipAddPathCurve2I'), STATIC
szGdipAddPathCurve3I          CSTRING('GdipAddPathCurve3I'), STATIC
szGdipAddPathClosedCurve      CSTRING('GdipAddPathClosedCurve'), STATIC
szGdipAddPathClosedCurve2     CSTRING('GdipAddPathClosedCurve2'), STATIC
szGdipAddPathClosedCurveI     CSTRING('GdipAddPathClosedCurveI'), STATIC
szGdipAddPathClosedCurve2I    CSTRING('GdipAddPathClosedCurve2I'), STATIC
szGdipAddPathRectangle        CSTRING('GdipAddPathRectangle'), STATIC
szGdipAddPathRectangles       CSTRING('GdipAddPathRectangles'), STATIC
szGdipAddPathRectangleI       CSTRING('GdipAddPathRectangleI'), STATIC
szGdipAddPathRectanglesI      CSTRING('GdipAddPathRectanglesI'), STATIC
szGdipAddPathEllipse          CSTRING('GdipAddPathEllipse'), STATIC
szGdipAddPathEllipseI         CSTRING('GdipAddPathEllipseI'), STATIC
szGdipAddPathPie              CSTRING('GdipAddPathPie'), STATIC
szGdipAddPathPieI             CSTRING('GdipAddPathPieI'), STATIC
szGdipAddPathPolygon          CSTRING('GdipAddPathPolygon'), STATIC
szGdipAddPathPolygonI         CSTRING('GdipAddPathPolygonI'), STATIC
szGdipAddPathPath             CSTRING('GdipAddPathPath'), STATIC
szGdipAddPathString           CSTRING('GdipAddPathString'), STATIC
szGdipAddPathStringI          CSTRING('GdipAddPathStringI'), STATIC
szGdipTransformPath           CSTRING('GdipTransformPath'), STATIC
szGdipFlattenPath             CSTRING('GdipFlattenPath'), STATIC
szGdipWidenPath               CSTRING('GdipWidenPath'), STATIC
szGdipWindingModeOutline      CSTRING('GdipWindingModeOutline'), STATIC
szGdipWarpPath                CSTRING('GdipWarpPath'), STATIC
szGdipGetPointCount           CSTRING('GdipGetPointCount'), STATIC
szGdipGetPathTypes            CSTRING('GdipGetPathTypes'), STATIC
szGdipGetPathPoints           CSTRING('GdipGetPathPoints'), STATIC
szGdipGetPathPointsI          CSTRING('GdipGetPathPointsI'), STATIC
szGdipGetPathWorldBounds      CSTRING('GdipGetPathWorldBounds'), STATIC
szGdipGetPathWorldBoundsI     CSTRING('GdipGetPathWorldBoundsI'), STATIC
szGdipIsVisiblePathPoint      CSTRING('GdipIsVisiblePathPoint'), STATIC
szGdipIsVisiblePathPointI     CSTRING('GdipIsVisiblePathPointI'), STATIC
szGdipIsOutlineVisiblePathPoint   CSTRING('GdipIsOutlineVisiblePathPoint'), STATIC
szGdipIsOutlineVisiblePathPointI  CSTRING('GdipIsOutlineVisiblePathPointI'), STATIC
szGdipCreatePen1              CSTRING('GdipCreatePen1'), STATIC
szGdipCreatePen2              CSTRING('GdipCreatePen2'), STATIC
szGdipDeletePen               CSTRING('GdipDeletePen'), STATIC
szGdipClonePen                CSTRING('GdipClonePen'), STATIC
szGdipSetPenWidth             CSTRING('GdipSetPenWidth'), STATIC
szGdipGetPenWidth             CSTRING('GdipGetPenWidth'), STATIC
szGdipSetPenLineCap197819     CSTRING('GdipSetPenLineCap197819'), STATIC
szGdipSetPenStartCap          CSTRING('GdipSetPenStartCap'), STATIC
szGdipSetPenEndCap            CSTRING('GdipSetPenEndCap'), STATIC
szGdipSetPenDashCap197819     CSTRING('GdipSetPenDashCap197819'), STATIC
szGdipGetPenStartCap          CSTRING('GdipGetPenStartCap'), STATIC
szGdipGetPenEndCap            CSTRING('GdipGetPenEndCap'), STATIC
szGdipGetPenDashCap197819     CSTRING('GdipGetPenDashCap197819'), STATIC
szGdipSetPenLineJoin          CSTRING('GdipSetPenLineJoin'), STATIC
szGdipGetPenLineJoin          CSTRING('GdipGetPenLineJoin'), STATIC
szGdipSetPenCustomStartCap    CSTRING('GdipSetPenCustomStartCap'), STATIC
szGdipGetPenCustomStartCap    CSTRING('GdipGetPenCustomStartCap'), STATIC
szGdipSetPenCustomEndCap      CSTRING('GdipSetPenCustomEndCap'), STATIC
szGdipGetPenCustomEndCap      CSTRING('GdipGetPenCustomEndCap'), STATIC
szGdipSetPenMiterLimit        CSTRING('GdipSetPenMiterLimit'), STATIC
szGdipGetPenMiterLimit        CSTRING('GdipGetPenMiterLimit'), STATIC
szGdipSetPenMode              CSTRING('GdipSetPenMode'), STATIC
szGdipGetPenMode              CSTRING('GdipGetPenMode'), STATIC
szGdipSetPenTransform         CSTRING('GdipSetPenTransform'), STATIC
szGdipGetPenTransform         CSTRING('GdipGetPenTransform'), STATIC
szGdipResetPenTransform       CSTRING('GdipResetPenTransform'), STATIC
szGdipMultiplyPenTransform    CSTRING('GdipMultiplyPenTransform'), STATIC
szGdipTranslatePenTransform   CSTRING('GdipTranslatePenTransform'), STATIC
szGdipScalePenTransform       CSTRING('GdipScalePenTransform'), STATIC
szGdipRotatePenTransform      CSTRING('GdipRotatePenTransform'), STATIC
szGdipGetPenFillType          CSTRING('GdipGetPenFillType'), STATIC
szGdipSetPenColor             CSTRING('GdipSetPenColor'), STATIC
szGdipSetPenBrushFill         CSTRING('GdipSetPenBrushFill'), STATIC
szGdipGetPenColor             CSTRING('GdipGetPenColor'), STATIC
szGdipGetPenBrushFill         CSTRING('GdipGetPenBrushFill'), STATIC
szGdipGetPenDashStyle         CSTRING('GdipGetPenDashStyle'), STATIC
szGdipSetPenDashStyle         CSTRING('GdipSetPenDashStyle'), STATIC
szGdipGetPenDashOffset        CSTRING('GdipGetPenDashOffset'), STATIC
szGdipSetPenDashOffset        CSTRING('GdipSetPenDashOffset'), STATIC
szGdipSetPenDashArray         CSTRING('GdipSetPenDashArray'), STATIC
szGdipGetPenDashCount         CSTRING('GdipGetPenDashCount'), STATIC
szGdipGetPenDashArray         CSTRING('GdipGetPenDashArray'), STATIC
szGdipSetPenCompoundArray     CSTRING('GdipSetPenCompoundArray'), STATIC
szGdipGetPenCompoundCount     CSTRING('GdipGetPenCompoundCount'), STATIC
szGdipGetPenCompoundArray     CSTRING('GdipGetPenCompoundArray'), STATIC
szGdipDeleteBrush             CSTRING('GdipDeleteBrush'), STATIC
szGdipCloneBrush              CSTRING('GdipCloneBrush'), STATIC
szGdipGetBrushType            CSTRING('GdipGetBrushType'), STATIC
szGdipCreateSolidFill         CSTRING('GdipCreateSolidFill'), STATIC
szGdipGetSolidFillColor       CSTRING('GdipGetSolidFillColor'), STATIC
szGdipSetSolidFillColor       CSTRING('GdipSetSolidFillColor'), STATIC
szGdipCreateTexture           CSTRING('GdipCreateTexture'), STATIC
szGdipCreateTexture2          CSTRING('GdipCreateTexture2'), STATIC
szGdipCreateTexture2I         CSTRING('GdipCreateTexture2I'), STATIC
szGdipCreateTextureIA         CSTRING('GdipCreateTextureIA'), STATIC
szGdipCreateTextureIAI        CSTRING('GdipCreateTextureIAI'), STATIC
szGdipSetTextureTransform     CSTRING('GdipSetTextureTransform'), STATIC
szGdipGetTextureTransform     CSTRING('GdipGetTextureTransform'), STATIC
szGdipResetTextureTransform   CSTRING('GdipResetTextureTransform'), STATIC
szGdipMultiplyTextureTransform    CSTRING('GdipMultiplyTextureTransform'), STATIC
szGdipTranslateTextureTransform   CSTRING('GdipTranslateTextureTransform'), STATIC
szGdipScaleTextureTransform   CSTRING('GdipScaleTextureTransform'), STATIC
szGdipRotateTextureTransform   CSTRING('GdipRotateTextureTransform'), STATIC
szGdipSetTextureWrapMode      CSTRING('GdipSetTextureWrapMode'), STATIC
szGdipGetTextureWrapMode      CSTRING('GdipGetTextureWrapMode'), STATIC
szGdipGetTextureImage         CSTRING('GdipGetTextureImage'), STATIC
szGdipCreateLineBrush         CSTRING('GdipCreateLineBrush'), STATIC
szGdipCreateLineBrushI        CSTRING('GdipCreateLineBrushI'), STATIC
szGdipCreateLineBrushFromRect CSTRING('GdipCreateLineBrushFromRect'), STATIC
szGdipCreateLineBrushFromRectI    CSTRING('GdipCreateLineBrushFromRectI'), STATIC
szGdipCreateLineBrushFromRectWithAngle    CSTRING('GdipCreateLineBrushFromRectWithAngle'), STATIC
szGdipCreateLineBrushFromRectWithAngleI   CSTRING('GdipCreateLineBrushFromRectWithAngleI'), STATIC
szGdipSetLineColors           CSTRING('GdipSetLineColors'), STATIC
szGdipGetLineColors           CSTRING('GdipGetLineColors'), STATIC
szGdipGetLineRect             CSTRING('GdipGetLineRect'), STATIC
szGdipGetLineRectI            CSTRING('GdipGetLineRectI'), STATIC
szGdipSetLineGammaCorrection  CSTRING('GdipSetLineGammaCorrection'), STATIC
szGdipGetLineGammaCorrection  CSTRING('GdipGetLineGammaCorrection'), STATIC
szGdipGetLineBlendCount       CSTRING('GdipGetLineBlendCount'), STATIC
szGdipSetLineBlend            CSTRING('GdipSetLineBlend'), STATIC
szGdipGetLineBlend            CSTRING('GdipGetLineBlend'), STATIC
szGdipGetLinePresetBlendCount CSTRING('GdipGetLinePresetBlendCount'), STATIC
szGdipSetLinePresetBlend      CSTRING('GdipSetLinePresetBlend'), STATIC
szGdipGetLinePresetBlend      CSTRING('GdipGetLinePresetBlend'), STATIC
szGdipSetLineSigmaBlend       CSTRING('GdipSetLineSigmaBlend'), STATIC
szGdipSetLineLinearBlend      CSTRING('GdipSetLineLinearBlend'), STATIC
szGdipSetLineTransform        CSTRING('GdipSetLineTransform'), STATIC
szGdipGetLineTransform        CSTRING('GdipGetLineTransform'), STATIC
szGdipResetLineTransform      CSTRING('GdipResetLineTransform'), STATIC
szGdipMultiplyLineTransform   CSTRING('GdipMultiplyLineTransform'), STATIC
szGdipTranslateLineTransform  CSTRING('GdipTranslateLineTransform'), STATIC
szGdipScaleLineTransform      CSTRING('GdipScaleLineTransform'), STATIC
szGdipRotateLineTransform     CSTRING('GdipRotateLineTransform'), STATIC
szGdipSetLineWrapMode         CSTRING('GdipSetLineWrapMode'), STATIC
szGdipGetLineWrapMode         CSTRING('GdipGetLineWrapMode'), STATIC
szGdipCreateHatchBrush        CSTRING('GdipCreateHatchBrush'), STATIC
szGdipGetHatchStyle           CSTRING('GdipGetHatchStyle'), STATIC
szGdipGetHatchForegroundColor CSTRING('GdipGetHatchForegroundColor'), STATIC
szGdipGetHatchBackgroundColor CSTRING('GdipGetHatchBackgroundColor'), STATIC
szGdipCreateRegion            CSTRING('GdipCreateRegion'), STATIC
szGdipCreateRegionRect        CSTRING('GdipCreateRegionRect'), STATIC
szGdipCreateRegionRectI       CSTRING('GdipCreateRegionRectI'), STATIC
szGdipCreateRegionPath        CSTRING('GdipCreateRegionPath'), STATIC
szGdipCreateRegionRgnData     CSTRING('GdipCreateRegionRgnData'), STATIC
szGdipCreateRegionHrgn        CSTRING('GdipCreateRegionHrgn'), STATIC
szGdipDeleteRegion            CSTRING('GdipDeleteRegion'), STATIC
szGdipCloneRegion             CSTRING('GdipCloneRegion'), STATIC
szGdipSetInfinite             CSTRING('GdipSetInfinite'), STATIC
szGdipSetEmpty                CSTRING('GdipSetEmpty'), STATIC
szGdipCombineRegionRect       CSTRING('GdipCombineRegionRect'), STATIC
szGdipCombineRegionRectI      CSTRING('GdipCombineRegionRectI'), STATIC
szGdipCombineRegionPath       CSTRING('GdipCombineRegionPath'), STATIC
szGdipCombineRegionRegion     CSTRING('GdipCombineRegionRegion'), STATIC
szGdipTranslateRegion         CSTRING('GdipTranslateRegion'), STATIC
szGdipTranslateRegionI        CSTRING('GdipTranslateRegionI'), STATIC
szGdipTransformRegion         CSTRING('GdipTransformRegion'), STATIC
szGdipGetRegionBounds         CSTRING('GdipGetRegionBounds'), STATIC
szGdipGetRegionBoundsI        CSTRING('GdipGetRegionBoundsI'), STATIC
szGdipGetRegionHRgn           CSTRING('GdipGetRegionHRgn'), STATIC
szGdipIsEmptyRegion           CSTRING('GdipIsEmptyRegion'), STATIC
szGdipIsInfiniteRegion        CSTRING('GdipIsInfiniteRegion'), STATIC
szGdipIsEqualRegion           CSTRING('GdipIsEqualRegion'), STATIC
szGdipGetRegionDataSize       CSTRING('GdipGetRegionDataSize'), STATIC
szGdipGetRegionData           CSTRING('GdipGetRegionData'), STATIC
szGdipIsVisibleRegionPoint    CSTRING('GdipIsVisibleRegionPoint'), STATIC
szGdipIsVisibleRegionPointI   CSTRING('GdipIsVisibleRegionPointI'), STATIC
szGdipIsVisibleRegionRect     CSTRING('GdipIsVisibleRegionRect'), STATIC
szGdipIsVisibleRegionRectI    CSTRING('GdipIsVisibleRegionRectI'), STATIC
szGdipGetRegionScansCount     CSTRING('GdipGetRegionScansCount'), STATIC
szGdipGetRegionScans          CSTRING('GdipGetRegionScans'), STATIC
szGdipGetRegionScansI         CSTRING('GdipGetRegionScansI'), STATIC
szGdipFlush                   CSTRING('GdipFlush'), STATIC
szGdipDrawString              CSTRING('GdipDrawString'), STATIC
szGdipMeasureString           CSTRING('GdipMeasureString'), STATIC
szGdipDrawCachedBitmap        CSTRING('GdipDrawCachedBitmap'), STATIC
szGdipDrawImage               CSTRING('GdipDrawImage'), STATIC
szGdipDrawImageI              CSTRING('GdipDrawImageI'), STATIC
szGdipDrawImageRect           CSTRING('GdipDrawImageRect'), STATIC
szGdipDrawImageRectI          CSTRING('GdipDrawImageRectI'), STATIC
szGdipDrawImagePoints         CSTRING('GdipDrawImagePoints'), STATIC
szGdipDrawImagePointsI        CSTRING('GdipDrawImagePointsI'), STATIC
szGdipDrawImagePointRect      CSTRING('GdipDrawImagePointRect'), STATIC
szGdipDrawImagePointRectI     CSTRING('GdipDrawImagePointRectI'), STATIC
szGdipDrawImageRectRect       CSTRING('GdipDrawImageRectRect'), STATIC
szGdipDrawImageRectRectI      CSTRING('GdipDrawImageRectRectI'), STATIC
szGdipDrawImagePointsRect     CSTRING('GdipDrawImagePointsRect'), STATIC
szGdipDrawImagePointsRectI    CSTRING('GdipDrawImagePointsRectI'), STATIC
szGdipDrawImageFX             CSTRING('GdipDrawImageFX'), STATIC
szGdipSetClipGraphics         CSTRING('GdipSetClipGraphics'), STATIC
szGdipSetClipRect             CSTRING('GdipSetClipRect'), STATIC
szGdipSetClipRectI            CSTRING('GdipSetClipRectI'), STATIC
szGdipSetClipPath             CSTRING('GdipSetClipPath'), STATIC
szGdipSetClipRegion           CSTRING('GdipSetClipRegion'), STATIC
szGdipSetClipHrgn             CSTRING('GdipSetClipHrgn'), STATIC
szGdipResetClip               CSTRING('GdipResetClip'), STATIC
szGdipTranslateClip           CSTRING('GdipTranslateClip'), STATIC
szGdipTranslateClipI          CSTRING('GdipTranslateClipI'), STATIC
szGdipGetClip                 CSTRING('GdipGetClip'), STATIC
szGdipGetClipBounds           CSTRING('GdipGetClipBounds'), STATIC
szGdipGetClipBoundsI          CSTRING('GdipGetClipBoundsI'), STATIC
szGdipIsClipEmpty             CSTRING('GdipIsClipEmpty'), STATIC
szGdipGetVisibleClipBounds    CSTRING('GdipGetVisibleClipBounds'), STATIC
szGdipGetVisibleClipBoundsI   CSTRING('GdipGetVisibleClipBoundsI'), STATIC
szGdipIsVisibleClipEmpty      CSTRING('GdipIsVisibleClipEmpty'), STATIC
szGdipIsVisiblePoint          CSTRING('GdipIsVisiblePoint'), STATIC
szGdipIsVisiblePointI         CSTRING('GdipIsVisiblePointI'), STATIC
szGdipIsVisibleRect           CSTRING('GdipIsVisibleRect'), STATIC
szGdipIsVisibleRectI          CSTRING('GdipIsVisibleRectI'), STATIC
szGdipSaveGraphics            CSTRING('GdipSaveGraphics'), STATIC
szGdipRestoreGraphics         CSTRING('GdipRestoreGraphics'), STATIC
szGdipCreateCachedBitmap      CSTRING('GdipCreateCachedBitmap'), STATIC
szGdipDeleteCachedBitmap      CSTRING('GdipDeleteCachedBitmap'), STATIC
szGdipCreateStringFormat      CSTRING('GdipCreateStringFormat'), STATIC
szGdipDeleteStringFormat      CSTRING('GdipDeleteStringFormat'), STATIC
szGdipCloneStringFormat       CSTRING('GdipCloneStringFormat'), STATIC
szGdipSetStringFormatFlags    CSTRING('GdipSetStringFormatFlags'), STATIC
szGdipGetStringFormatFlags    CSTRING('GdipGetStringFormatFlags'), STATIC
szGdipSetStringFormatAlign    CSTRING('GdipSetStringFormatAlign'), STATIC
szGdipGetStringFormatAlign    CSTRING('GdipGetStringFormatAlign'), STATIC
szGdipSetStringFormatLineAlign    CSTRING('GdipSetStringFormatLineAlign'), STATIC
szGdipGetStringFormatLineAlign    CSTRING('GdipGetStringFormatLineAlign'), STATIC
szGdipSetStringFormatHotkeyPrefix CSTRING('GdipSetStringFormatHotkeyPrefix'), STATIC
szGdipGetStringFormatHotkeyPrefix CSTRING('GdipGetStringFormatHotkeyPrefix'), STATIC
szGdipSetStringFormatTabStops CSTRING('GdipSetStringFormatTabStops'), STATIC
szGdipGetStringFormatTabStopCount CSTRING('GdipGetStringFormatTabStopCount'), STATIC
szGdipGetStringFormatTabStops CSTRING('GdipGetStringFormatTabStops'), STATIC
szGdipSetStringFormatDigitSubstitution    CSTRING('GdipSetStringFormatDigitSubstitution'), STATIC
szGdipGetStringFormatDigitSubstitution    CSTRING('GdipGetStringFormatDigitSubstitution'), STATIC
szGdipSetStringFormatTrimming CSTRING('GdipSetStringFormatTrimming'), STATIC
szGdipGetStringFormatTrimming CSTRING('GdipGetStringFormatTrimming'), STATIC
szGdipSetStringFormatMeasurableCharacterRanges    CSTRING('GdipSetStringFormatMeasurableCharacterRanges'), STATIC
szGdipGetStringFormatMeasurableCharacterRangeCount    CSTRING('GdipGetStringFormatMeasurableCharacterRangeCount'), STATIC
szGdipStringFormatGetGenericDefault   CSTRING('GdipStringFormatGetGenericDefault'), STATIC
szGdipStringFormatGetGenericTypographic   CSTRING('GdipStringFormatGetGenericTypographic'), STATIC
szGdipCreateImageAttributes   CSTRING('GdipCreateImageAttributes'), STATIC
szGdipDisposeImageAttributes  CSTRING('GdipDisposeImageAttributes'), STATIC
szGdipCloneImageAttributes    CSTRING('GdipCloneImageAttributes'), STATIC
szGdipSetImageAttributesToIdentity    CSTRING('GdipSetImageAttributesToIdentity'), STATIC
szGdipResetImageAttributes    CSTRING('GdipResetImageAttributes'), STATIC
szGdipSetImageAttributesColorMatrix   CSTRING('GdipSetImageAttributesColorMatrix'), STATIC
szGdipSetImageAttributesThreshold CSTRING('GdipSetImageAttributesThreshold'), STATIC
szGdipSetImageAttributesGamma CSTRING('GdipSetImageAttributesGamma'), STATIC
szGdipSetImageAttributesNoOp  CSTRING('GdipSetImageAttributesNoOp'), STATIC
szGdipSetImageAttributesColorKeys CSTRING('GdipSetImageAttributesColorKeys'), STATIC
szGdipSetImageAttributesOutputChannel CSTRING('GdipSetImageAttributesOutputChannel'), STATIC
szGdipSetImageAttributesOutputChannelColorProfile CSTRING('GdipSetImageAttributesOutputChannelColorProfile'), STATIC
szGdipSetImageAttributesRemapTable    CSTRING('GdipSetImageAttributesRemapTable'), STATIC
szGdipSetImageAttributesWrapMode  CSTRING('GdipSetImageAttributesWrapMode'), STATIC
szGdipGetImageAttributesAdjustedPalette   CSTRING('GdipGetImageAttributesAdjustedPalette'), STATIC
szGdipCreatePathIter          CSTRING('GdipCreatePathIter'), STATIC
szGdipDeletePathIter          CSTRING('GdipDeletePathIter'), STATIC
szGdipPathIterNextSubpath     CSTRING('GdipPathIterNextSubpath'), STATIC
szGdipPathIterNextSubpathPath CSTRING('GdipPathIterNextSubpathPath'), STATIC
szGdipPathIterNextPathType    CSTRING('GdipPathIterNextPathType'), STATIC
szGdipPathIterNextMarker      CSTRING('GdipPathIterNextMarker'), STATIC
szGdipPathIterNextMarkerPath  CSTRING('GdipPathIterNextMarkerPath'), STATIC
szGdipPathIterGetCount        CSTRING('GdipPathIterGetCount'), STATIC
szGdipPathIterGetSubpathCount CSTRING('GdipPathIterGetSubpathCount'), STATIC
szGdipPathIterHasCurve        CSTRING('GdipPathIterHasCurve'), STATIC
szGdipPathIterRewind          CSTRING('GdipPathIterRewind'), STATIC
szGdipPathIterEnumerate       CSTRING('GdipPathIterEnumerate'), STATIC
szGdipPathIterCopyData        CSTRING('GdipPathIterCopyData'), STATIC
szGdipCreatePathGradient      CSTRING('GdipCreatePathGradient'), STATIC
szGdipCreatePathGradientI     CSTRING('GdipCreatePathGradientI'), STATIC
szGdipCreatePathGradientFromPath  CSTRING('GdipCreatePathGradientFromPath'), STATIC
szGdipGetPathGradientCenterColor  CSTRING('GdipGetPathGradientCenterColor'), STATIC
szGdipSetPathGradientCenterColor  CSTRING('GdipSetPathGradientCenterColor'), STATIC
szGdipGetPathGradientPointCount   CSTRING('GdipGetPathGradientPointCount'), STATIC
szGdipGetPathGradientSurroundColorCount   CSTRING('GdipGetPathGradientSurroundColorCount'), STATIC
szGdipGetPathGradientSurroundColorsWithCount  CSTRING('GdipGetPathGradientSurroundColorsWithCount'), STATIC
szGdipSetPathGradientSurroundColorsWithCount  CSTRING('GdipSetPathGradientSurroundColorsWithCount'), STATIC
szGdipGetPathGradientPath     CSTRING('GdipGetPathGradientPath'), STATIC
szGdipSetPathGradientPath     CSTRING('GdipSetPathGradientPath'), STATIC
szGdipGetPathGradientCenterPoint  CSTRING('GdipGetPathGradientCenterPoint'), STATIC
szGdipGetPathGradientCenterPointI CSTRING('GdipGetPathGradientCenterPointI'), STATIC
szGdipSetPathGradientCenterPoint  CSTRING('GdipSetPathGradientCenterPoint'), STATIC
szGdipSetPathGradientCenterPointI CSTRING('GdipSetPathGradientCenterPointI'), STATIC
szGdipGetPathGradientRect     CSTRING('GdipGetPathGradientRect'), STATIC
szGdipGetPathGradientRectI    CSTRING('GdipGetPathGradientRectI'), STATIC
szGdipSetPathGradientGammaCorrection  CSTRING('GdipSetPathGradientGammaCorrection'), STATIC
szGdipGetPathGradientGammaCorrection  CSTRING('GdipGetPathGradientGammaCorrection'), STATIC
szGdipGetPathGradientBlendCount   CSTRING('GdipGetPathGradientBlendCount'), STATIC
szGdipGetPathGradientBlend    CSTRING('GdipGetPathGradientBlend'), STATIC
szGdipSetPathGradientBlend    CSTRING('GdipSetPathGradientBlend'), STATIC
szGdipGetPathGradientPresetBlendCount CSTRING('GdipGetPathGradientPresetBlendCount'), STATIC
szGdipSetPathGradientPresetBlend  CSTRING('GdipSetPathGradientPresetBlend'), STATIC
szGdipGetPathGradientPresetBlend  CSTRING('GdipGetPathGradientPresetBlend'), STATIC
szGdipSetPathGradientSigmaBlend   CSTRING('GdipSetPathGradientSigmaBlend'), STATIC
szGdipSetPathGradientLinearBlend  CSTRING('GdipSetPathGradientLinearBlend'), STATIC
szGdipGetPathGradientTransform    CSTRING('GdipGetPathGradientTransform'), STATIC
szGdipSetPathGradientTransform    CSTRING('GdipSetPathGradientTransform'), STATIC
szGdipResetPathGradientTransform  CSTRING('GdipResetPathGradientTransform'), STATIC
szGdipMultiplyPathGradientTransform   CSTRING('GdipMultiplyPathGradientTransform'), STATIC
szGdipTranslatePathGradientTransform  CSTRING('GdipTranslatePathGradientTransform'), STATIC
szGdipScalePathGradientTransform  CSTRING('GdipScalePathGradientTransform'), STATIC
szGdipRotatePathGradientTransform CSTRING('GdipRotatePathGradientTransform'), STATIC
szGdipGetPathGradientFocusScales  CSTRING('GdipGetPathGradientFocusScales'), STATIC
szGdipSetPathGradientFocusScales  CSTRING('GdipSetPathGradientFocusScales'), STATIC
szGdipGetPathGradientWrapMode CSTRING('GdipGetPathGradientWrapMode'), STATIC
szGdipSetPathGradientWrapMode CSTRING('GdipSetPathGradientWrapMode'), STATIC
szGdipGetEncoderParameterListSize CSTRING('GdipGetEncoderParameterListSize'), STATIC
szGdipGetEncoderParameterList CSTRING('GdipGetEncoderParameterList'), STATIC
szGdipSaveAdd                 CSTRING('GdipSaveAdd'), STATIC
szGdipSaveAddImage            CSTRING('GdipSaveAddImage'), STATIC
szGdipImageGetFrameDimensionsCount    CSTRING('GdipImageGetFrameDimensionsCount'), STATIC
szGdipImageGetFrameDimensionsList CSTRING('GdipImageGetFrameDimensionsList'), STATIC
szGdipImageGetFrameCount      CSTRING('GdipImageGetFrameCount'), STATIC
szGdipImageSelectActiveFrame  CSTRING('GdipImageSelectActiveFrame'), STATIC
szGdipGetPropertySize         CSTRING('GdipGetPropertySize'), STATIC
szGdipGetAllPropertyItems     CSTRING('GdipGetAllPropertyItems'), STATIC
szGdipCreateMetafileFromWmf   CSTRING('GdipCreateMetafileFromWmf'), STATIC
szGdipCreateMetafileFromEmf   CSTRING('GdipCreateMetafileFromEmf'), STATIC
szGdipCreateMetafileFromFile  CSTRING('GdipCreateMetafileFromFile'), STATIC
szGdipCreateMetafileFromWmfFile   CSTRING('GdipCreateMetafileFromWmfFile'), STATIC
szGdipCreateMetafileFromStream    CSTRING('GdipCreateMetafileFromStream'), STATIC
szGdipRecordMetafile          CSTRING('GdipRecordMetafile'), STATIC
szGdipRecordMetafileI         CSTRING('GdipRecordMetafileI'), STATIC
szGdipRecordMetafileFileName  CSTRING('GdipRecordMetafileFileName'), STATIC
szGdipRecordMetafileFileNameI CSTRING('GdipRecordMetafileFileNameI'), STATIC
szGdipGetMetafileHeaderFromWmf    CSTRING('GdipGetMetafileHeaderFromWmf'), STATIC
szGdipGetMetafileHeaderFromEmf    CSTRING('GdipGetMetafileHeaderFromEmf'), STATIC
szGdipGetMetafileHeaderFromFile   CSTRING('GdipGetMetafileHeaderFromFile'), STATIC
szGdipGetMetafileHeaderFromStream CSTRING('GdipGetMetafileHeaderFromStream'), STATIC
szGdipGetMetafileHeaderFromMetafile   CSTRING('GdipGetMetafileHeaderFromMetafile'), STATIC
szGdipGetHemfFromMetafile     CSTRING('GdipGetHemfFromMetafile'), STATIC
szGdipPlayMetafileRecord      CSTRING('GdipPlayMetafileRecord'), STATIC
szGdipSetMetafileDownLevelRasterizationLimit  CSTRING('GdipSetMetafileDownLevelRasterizationLimit'), STATIC
szGdipGetMetafileDownLevelRasterizationLimit  CSTRING('GdipGetMetafileDownLevelRasterizationLimit'), STATIC
szGdipEmfToWmfBits            CSTRING('GdipEmfToWmfBits'), STATIC
szGdipConvertToEmfPlus        CSTRING('GdipConvertToEmfPlus'), STATIC
szGdipConvertToEmfPlusToFile  CSTRING('GdipConvertToEmfPlusToFile'), STATIC
szGdipEnumerateMetafileDestPoint  CSTRING('GdipEnumerateMetafileDestPoint'), STATIC
szGdipEnumerateMetafileDestPointI CSTRING('GdipEnumerateMetafileDestPointI'), STATIC
szGdipEnumerateMetafileDestRect   CSTRING('GdipEnumerateMetafileDestRect'), STATIC
szGdipEnumerateMetafileDestRectI  CSTRING('GdipEnumerateMetafileDestRectI'), STATIC
szGdipEnumerateMetafileDestPoints CSTRING('GdipEnumerateMetafileDestPoints'), STATIC
szGdipEnumerateMetafileDestPointsI    CSTRING('GdipEnumerateMetafileDestPointsI'), STATIC
szGdipEnumerateMetafileSrcRectDestPoint   CSTRING('GdipEnumerateMetafileSrcRectDestPoint'), STATIC
szGdipEnumerateMetafileSrcRectDestPointI  CSTRING('GdipEnumerateMetafileSrcRectDestPointI'), STATIC
szGdipEnumerateMetafileSrcRectDestRect    CSTRING('GdipEnumerateMetafileSrcRectDestRect'), STATIC
szGdipEnumerateMetafileSrcRectDestRectI   CSTRING('GdipEnumerateMetafileSrcRectDestRectI'), STATIC
szGdipEnumerateMetafileSrcRectDestPoints  CSTRING('GdipEnumerateMetafileSrcRectDestPoints'), STATIC
szGdipEnumerateMetafileSrcRectDestPointsI CSTRING('GdipEnumerateMetafileSrcRectDestPointsI'), STATIC
szGdipComment                 CSTRING('GdipComment'), STATIC
szGdipBeginContainer          CSTRING('GdipBeginContainer'), STATIC
szGdipBeginContainerI         CSTRING('GdipBeginContainerI'), STATIC
szGdipBeginContainer2         CSTRING('GdipBeginContainer2'), STATIC
szGdipEndContainer            CSTRING('GdipEndContainer'), STATIC
szGdipCreateCustomLineCap     CSTRING('GdipCreateCustomLineCap'), STATIC
szGdipDeleteCustomLineCap     CSTRING('GdipDeleteCustomLineCap'), STATIC
szGdipSetCustomLineCapStrokeCaps  CSTRING('GdipSetCustomLineCapStrokeCaps'), STATIC
szGdipGetCustomLineCapStrokeCaps  CSTRING('GdipGetCustomLineCapStrokeCaps'), STATIC
szGdipSetCustomLineCapStrokeJoin  CSTRING('GdipSetCustomLineCapStrokeJoin'), STATIC
szGdipGetCustomLineCapStrokeJoin  CSTRING('GdipGetCustomLineCapStrokeJoin'), STATIC
szGdipSetCustomLineCapBaseCap CSTRING('GdipSetCustomLineCapBaseCap'), STATIC
szGdipGetCustomLineCapBaseCap CSTRING('GdipGetCustomLineCapBaseCap'), STATIC
szGdipSetCustomLineCapBaseInset   CSTRING('GdipSetCustomLineCapBaseInset'), STATIC
szGdipGetCustomLineCapBaseInset   CSTRING('GdipGetCustomLineCapBaseInset'), STATIC
szGdipSetCustomLineCapWidthScale  CSTRING('GdipSetCustomLineCapWidthScale'), STATIC
szGdipGetCustomLineCapWidthScale  CSTRING('GdipGetCustomLineCapWidthScale'), STATIC
szGdipCloneCustomLineCap      CSTRING('GdipCloneCustomLineCap'), STATIC
szGdipCreateAdjustableArrowCap    CSTRING('GdipCreateAdjustableArrowCap'), STATIC
szGdipSetAdjustableArrowCapHeight CSTRING('GdipSetAdjustableArrowCapHeight'), STATIC
szGdipGetAdjustableArrowCapHeight CSTRING('GdipGetAdjustableArrowCapHeight'), STATIC
szGdipSetAdjustableArrowCapWidth  CSTRING('GdipSetAdjustableArrowCapWidth'), STATIC
szGdipGetAdjustableArrowCapWidth  CSTRING('GdipGetAdjustableArrowCapWidth'), STATIC
szGdipSetAdjustableArrowCapMiddleInset    CSTRING('GdipSetAdjustableArrowCapMiddleInset'), STATIC
szGdipGetAdjustableArrowCapMiddleInset    CSTRING('GdipGetAdjustableArrowCapMiddleInset'), STATIC
szGdipSetAdjustableArrowCapFillState  CSTRING('GdipSetAdjustableArrowCapFillState'), STATIC
szGdipGetAdjustableArrowCapFillState  CSTRING('GdipGetAdjustableArrowCapFillState'), STATIC
szGdipCreateStreamOnFile      CSTRING('GdipCreateStreamOnFile'), STATIC
!!!endregion

!!!region GDI+ function pointers
paGdiplusStartup              LONG, NAME('fptr_GdiplusStartup')
paGdiplusShutdown             LONG, NAME('fptr_GdiplusShutdown')
paGdipFree                    LONG, NAME('fptr_GdipFree')
paGdipLoadImageFromFile       LONG, NAME('fptr_GdipLoadImageFromFile')
paGdipLoadImageFromFileICM    LONG, NAME('fptr_GdipLoadImageFromFileICM')
paGdipLoadImageFromStream     LONG, NAME('fptr_GdipLoadImageFromStream')
paGdipLoadImageFromStreamICM  LONG, NAME('fptr_GdipLoadImageFromStreamICM')
paGdipCloneImage              LONG, NAME('fptr_GdipCloneImage')
paGdipGetImageThumbnail       LONG, NAME('fptr_GdipGetImageThumbnail')
paGdipSaveImageToFile         LONG, NAME('fptr_GdipSaveImageToFile')
paGdipSaveImageToStream       LONG, NAME('fptr_GdipSaveImageToStream')
paGdipDisposeImage            LONG, NAME('fptr_GdipDisposeImage')
paGdipGetImageWidth           LONG, NAME('fptr_GdipGetImageWidth')
paGdipGetImageHeight          LONG, NAME('fptr_GdipGetImageHeight')
paGdipGetImageHorizontalResolution    LONG, NAME('fptr_GdipGetImageHorizontalResolution')
paGdipGetImageVerticalResolution  LONG, NAME('fptr_GdipGetImageVerticalResolution')
paGdipGetImageBounds          LONG, NAME('fptr_GdipGetImageBounds')
paGdipGetImageDimension       LONG, NAME('fptr_GdipGetImageDimension')
paGdipGetImageType            LONG, NAME('fptr_GdipGetImageType')
paGdipGetImageFlags           LONG, NAME('fptr_GdipGetImageFlags')
paGdipGetImageRawFormat       LONG, NAME('fptr_GdipGetImageRawFormat')
paGdipGetImagePixelFormat     LONG, NAME('fptr_GdipGetImagePixelFormat')
paGdipGetPropertyCount        LONG, NAME('fptr_GdipGetPropertyCount')
paGdipGetPropertyIdList       LONG, NAME('fptr_GdipGetPropertyIdList')
paGdipGetPropertyItemSize     LONG, NAME('fptr_GdipGetPropertyItemSize')
paGdipGetPropertyItem         LONG, NAME('fptr_GdipGetPropertyItem')
paGdipSetPropertyItem         LONG, NAME('fptr_GdipSetPropertyItem')
paGdipRemovePropertyItem      LONG, NAME('fptr_GdipRemovePropertyItem')
paGdipGetImageEncodersSize    LONG, NAME('fptr_GdipGetImageEncodersSize')
paGdipGetImageEncoders        LONG, NAME('fptr_GdipGetImageEncoders')
paGdipImageRotateFlip         LONG, NAME('fptr_GdipImageRotateFlip')
paGdipGetImagePaletteSize     LONG, NAME('fptr_GdipGetImagePaletteSize')
paGdipGetImagePalette         LONG, NAME('fptr_GdipGetImagePalette')
paGdipSetImagePalette         LONG, NAME('fptr_GdipSetImagePalette')
paGdipFindFirstImageItem      LONG, NAME('fptr_GdipFindFirstImageItem')
paGdipFindNextImageItem       LONG, NAME('fptr_GdipFindNextImageItem')
paGdipGetImageItemData        LONG, NAME('fptr_GdipGetImageItemData')
paGdipCreateBitmapFromFile    LONG, NAME('fptr_GdipCreateBitmapFromFile')
paGdipCreateBitmapFromFileICM LONG, NAME('fptr_GdipCreateBitmapFromFileICM')
paGdipCreateBitmapFromStream  LONG, NAME('fptr_GdipCreateBitmapFromStream')
paGdipCreateBitmapFromStreamICM   LONG, NAME('fptr_GdipCreateBitmapFromStreamICM')
paGdipCreateBitmapFromScan0   LONG, NAME('fptr_GdipCreateBitmapFromScan0')
paGdipCreateBitmapFromGraphics    LONG, NAME('fptr_GdipCreateBitmapFromGraphics')
paGdipCreateBitmapFromGdiDib  LONG, NAME('fptr_GdipCreateBitmapFromGdiDib')
paGdipCreateBitmapFromHBITMAP LONG, NAME('fptr_GdipCreateBitmapFromHBITMAP')
paGdipCreateHBITMAPFromBitmap LONG, NAME('fptr_GdipCreateHBITMAPFromBitmap')
paGdipCreateBitmapFromHICON   LONG, NAME('fptr_GdipCreateBitmapFromHICON')
paGdipCreateHICONFromBitmap   LONG, NAME('fptr_GdipCreateHICONFromBitmap')
paGdipCreateBitmapFromResource    LONG, NAME('fptr_GdipCreateBitmapFromResource')
paGdipCloneBitmapArea         LONG, NAME('fptr_GdipCloneBitmapArea')
paGdipCloneBitmapAreaI        LONG, NAME('fptr_GdipCloneBitmapAreaI')
paGdipBitmapLockBits          LONG, NAME('fptr_GdipBitmapLockBits')
paGdipBitmapUnlockBits        LONG, NAME('fptr_GdipBitmapUnlockBits')
paGdipBitmapGetPixel          LONG, NAME('fptr_GdipBitmapGetPixel')
paGdipBitmapSetPixel          LONG, NAME('fptr_GdipBitmapSetPixel')
paGdipBitmapSetResolution     LONG, NAME('fptr_GdipBitmapSetResolution')
paGdipBitmapConvertFormat     LONG, NAME('fptr_GdipBitmapConvertFormat')
paGdipBitmapApplyEffect       LONG, NAME('fptr_GdipBitmapApplyEffect')
paGdipBitmapCreateApplyEffect LONG, NAME('fptr_GdipBitmapCreateApplyEffect')
paGdipBitmapGetHistogramSize  LONG, NAME('fptr_GdipBitmapGetHistogramSize')
paGdipBitmapGetHistogram      LONG, NAME('fptr_GdipBitmapGetHistogram')
paGdipGetImageGraphicsContext LONG, NAME('fptr_GdipGetImageGraphicsContext')
paGdipDeleteGraphics          LONG, NAME('fptr_GdipDeleteGraphics')
paGdipCreateFromHDC           LONG, NAME('fptr_GdipCreateFromHDC')
paGdipCreateFromHDC2          LONG, NAME('fptr_GdipCreateFromHDC2')
paGdipCreateFromHWND          LONG, NAME('fptr_GdipCreateFromHWND')
paGdipCreateFromHWNDICM       LONG, NAME('fptr_GdipCreateFromHWNDICM')
paGdipGetDC                   LONG, NAME('fptr_GdipGetDC')
paGdipReleaseDC               LONG, NAME('fptr_GdipReleaseDC')
paGdipSetCompositingMode      LONG, NAME('fptr_GdipSetCompositingMode')
paGdipGetCompositingMode      LONG, NAME('fptr_GdipGetCompositingMode')
paGdipSetRenderingOrigin      LONG, NAME('fptr_GdipSetRenderingOrigin')
paGdipGetRenderingOrigin      LONG, NAME('fptr_GdipGetRenderingOrigin')
paGdipSetCompositingQuality   LONG, NAME('fptr_GdipSetCompositingQuality')
paGdipGetCompositingQuality   LONG, NAME('fptr_GdipGetCompositingQuality')
paGdipSetSmoothingMode        LONG, NAME('fptr_GdipSetSmoothingMode')
paGdipGetSmoothingMode        LONG, NAME('fptr_GdipGetSmoothingMode')
paGdipSetPixelOffsetMode      LONG, NAME('fptr_GdipSetPixelOffsetMode')
paGdipGetPixelOffsetMode      LONG, NAME('fptr_GdipGetPixelOffsetMode')
paGdipSetTextRenderingHint    LONG, NAME('fptr_GdipSetTextRenderingHint')
paGdipGetTextRenderingHint    LONG, NAME('fptr_GdipGetTextRenderingHint')
paGdipSetTextContrast         LONG, NAME('fptr_GdipSetTextContrast')
paGdipGetTextContrast         LONG, NAME('fptr_GdipGetTextContrast')
paGdipSetInterpolationMode    LONG, NAME('fptr_GdipSetInterpolationMode')
paGdipGetInterpolationMode    LONG, NAME('fptr_GdipGetInterpolationMode')
paGdipSetWorldTransform       LONG, NAME('fptr_GdipSetWorldTransform')
paGdipResetWorldTransform     LONG, NAME('fptr_GdipResetWorldTransform')
paGdipMultiplyWorldTransform  LONG, NAME('fptr_GdipMultiplyWorldTransform')
paGdipTranslateWorldTransform LONG, NAME('fptr_GdipTranslateWorldTransform')
paGdipScaleWorldTransform     LONG, NAME('fptr_GdipScaleWorldTransform')
paGdipRotateWorldTransform    LONG, NAME('fptr_GdipRotateWorldTransform')
paGdipGetWorldTransform       LONG, NAME('fptr_GdipGetWorldTransform')
paGdipResetPageTransform      LONG, NAME('fptr_GdipResetPageTransform')
paGdipSetPageUnit             LONG, NAME('fptr_GdipSetPageUnit')
paGdipGetPageUnit             LONG, NAME('fptr_GdipGetPageUnit')
paGdipSetPageScale            LONG, NAME('fptr_GdipSetPageScale')
paGdipGetPageScale            LONG, NAME('fptr_GdipGetPageScale')
paGdipGetDpiX                 LONG, NAME('fptr_GdipGetDpiX')
paGdipGetDpiY                 LONG, NAME('fptr_GdipGetDpiY')
paGdipTransformPoints         LONG, NAME('fptr_GdipTransformPoints')
paGdipTransformPointsI        LONG, NAME('fptr_GdipTransformPointsI')
paGdipGetNearestColor         LONG, NAME('fptr_GdipGetNearestColor')
paGdipCreateHalftonePalette   LONG, NAME('fptr_GdipCreateHalftonePalette')
paGdipDrawLine                LONG, NAME('fptr_GdipDrawLine')
paGdipDrawLineI               LONG, NAME('fptr_GdipDrawLineI')
paGdipDrawLines               LONG, NAME('fptr_GdipDrawLines')
paGdipDrawLinesI              LONG, NAME('fptr_GdipDrawLinesI')
paGdipDrawArc                 LONG, NAME('fptr_GdipDrawArc')
paGdipDrawArcI                LONG, NAME('fptr_GdipDrawArcI')
paGdipDrawBezier              LONG, NAME('fptr_GdipDrawBezier')
paGdipDrawBezierI             LONG, NAME('fptr_GdipDrawBezierI')
paGdipDrawBeziers             LONG, NAME('fptr_GdipDrawBeziers')
paGdipDrawBeziersI            LONG, NAME('fptr_GdipDrawBeziersI')
paGdipDrawRectangle           LONG, NAME('fptr_GdipDrawRectangle')
paGdipDrawRectangleI          LONG, NAME('fptr_GdipDrawRectangleI')
paGdipDrawRectangles          LONG, NAME('fptr_GdipDrawRectangles')
paGdipDrawRectanglesI         LONG, NAME('fptr_GdipDrawRectanglesI')
paGdipDrawEllipse             LONG, NAME('fptr_GdipDrawEllipse')
paGdipDrawEllipseI            LONG, NAME('fptr_GdipDrawEllipseI')
paGdipDrawPie                 LONG, NAME('fptr_GdipDrawPie')
paGdipDrawPieI                LONG, NAME('fptr_GdipDrawPieI')
paGdipDrawPolygon             LONG, NAME('fptr_GdipDrawPolygon')
paGdipDrawPolygonI            LONG, NAME('fptr_GdipDrawPolygonI')
paGdipDrawPath                LONG, NAME('fptr_GdipDrawPath')
paGdipDrawCurve               LONG, NAME('fptr_GdipDrawCurve')
paGdipDrawCurve2              LONG, NAME('fptr_GdipDrawCurve2')
paGdipDrawCurve3              LONG, NAME('fptr_GdipDrawCurve3')
paGdipDrawCurveI              LONG, NAME('fptr_GdipDrawCurveI')
paGdipDrawCurve2I             LONG, NAME('fptr_GdipDrawCurve2I')
paGdipDrawCurve3I             LONG, NAME('fptr_GdipDrawCurve3I')
paGdipDrawClosedCurve         LONG, NAME('fptr_GdipDrawClosedCurve')
paGdipDrawClosedCurve2        LONG, NAME('fptr_GdipDrawClosedCurve2')
paGdipDrawClosedCurveI        LONG, NAME('fptr_GdipDrawClosedCurveI')
paGdipDrawClosedCurve2I       LONG, NAME('fptr_GdipDrawClosedCurve2I')
paGdipGraphicsClear           LONG, NAME('fptr_GdipGraphicsClear')
paGdipFillRectangle           LONG, NAME('fptr_GdipFillRectangle')
paGdipFillRectangleI          LONG, NAME('fptr_GdipFillRectangleI')
paGdipFillRectangles          LONG, NAME('fptr_GdipFillRectangles')
paGdipFillRectanglesI         LONG, NAME('fptr_GdipFillRectanglesI')
paGdipFillPolygon             LONG, NAME('fptr_GdipFillPolygon')
paGdipFillPolygonI            LONG, NAME('fptr_GdipFillPolygonI')
paGdipFillEllipse             LONG, NAME('fptr_GdipFillEllipse')
paGdipFillEllipseI            LONG, NAME('fptr_GdipFillEllipseI')
paGdipFillPie                 LONG, NAME('fptr_GdipFillPie')
paGdipFillPieI                LONG, NAME('fptr_GdipFillPieI')
paGdipFillPath                LONG, NAME('fptr_GdipFillPath')
paGdipFillClosedCurve         LONG, NAME('fptr_GdipFillClosedCurve')
paGdipFillClosedCurve2        LONG, NAME('fptr_GdipFillClosedCurve2')
paGdipFillClosedCurveI        LONG, NAME('fptr_GdipFillClosedCurveI')
paGdipFillClosedCurve2I       LONG, NAME('fptr_GdipFillClosedCurve2I')
paGdipFillRegion              LONG, NAME('fptr_GdipFillRegion')
paGdipCreateEffect            LONG, NAME('fptr_GdipCreateEffect')
paGdipDeleteEffect            LONG, NAME('fptr_GdipDeleteEffect')
paGdipGetEffectParameterSize  LONG, NAME('fptr_GdipGetEffectParameterSize')
paGdipSetEffectParameters     LONG, NAME('fptr_GdipSetEffectParameters')
paGdipGetEffectParameters     LONG, NAME('fptr_GdipGetEffectParameters')
paGdipInitializePalette       LONG, NAME('fptr_GdipInitializePalette')
paGdipCreateMatrix            LONG, NAME('fptr_GdipCreateMatrix')
paGdipCreateMatrix2           LONG, NAME('fptr_GdipCreateMatrix2')
paGdipCreateMatrix3           LONG, NAME('fptr_GdipCreateMatrix3')
paGdipCreateMatrix3I          LONG, NAME('fptr_GdipCreateMatrix3I')
paGdipDeleteMatrix            LONG, NAME('fptr_GdipDeleteMatrix')
paGdipCloneMatrix             LONG, NAME('fptr_GdipCloneMatrix')
paGdipGetMatrixElements       LONG, NAME('fptr_GdipGetMatrixElements')
paGdipSetMatrixElements       LONG, NAME('fptr_GdipSetMatrixElements')
paGdipMultiplyMatrix          LONG, NAME('fptr_GdipMultiplyMatrix')
paGdipTranslateMatrix         LONG, NAME('fptr_GdipTranslateMatrix')
paGdipScaleMatrix             LONG, NAME('fptr_GdipScaleMatrix')
paGdipRotateMatrix            LONG, NAME('fptr_GdipRotateMatrix')
paGdipShearMatrix             LONG, NAME('fptr_GdipShearMatrix')
paGdipInvertMatrix            LONG, NAME('fptr_GdipInvertMatrix')
paGdipTransformMatrixPoints   LONG, NAME('fptr_GdipTransformMatrixPoints')
paGdipTransformMatrixPointsI  LONG, NAME('fptr_GdipTransformMatrixPointsI')
paGdipVectorTransformMatrixPoints LONG, NAME('fptr_GdipVectorTransformMatrixPoints')
paGdipVectorTransformMatrixPointsI    LONG, NAME('fptr_GdipVectorTransformMatrixPointsI')
paGdipIsMatrixInvertible      LONG, NAME('fptr_GdipIsMatrixInvertible')
paGdipIsMatrixIdentity        LONG, NAME('fptr_GdipIsMatrixIdentity')
paGdipIsMatrixEqual           LONG, NAME('fptr_GdipIsMatrixEqual')
paGdipCreateFontFromDC        LONG, NAME('fptr_GdipCreateFontFromDC')
paGdipCreateFontFromLogfontA  LONG, NAME('fptr_GdipCreateFontFromLogfontA')
paGdipCreateFont              LONG, NAME('fptr_GdipCreateFont')
paGdipGetLogFontA             LONG, NAME('fptr_GdipGetLogFontA')
paGdipCloneFont               LONG, NAME('fptr_GdipCloneFont')
paGdipDeleteFont              LONG, NAME('fptr_GdipDeleteFont')
paGdipGetFamily               LONG, NAME('fptr_GdipGetFamily')
paGdipGetFontStyle            LONG, NAME('fptr_GdipGetFontStyle')
paGdipGetFontSize             LONG, NAME('fptr_GdipGetFontSize')
paGdipGetFontUnit             LONG, NAME('fptr_GdipGetFontUnit')
paGdipGetFontHeight           LONG, NAME('fptr_GdipGetFontHeight')
paGdipGetFontHeightGivenDPI   LONG, NAME('fptr_GdipGetFontHeightGivenDPI')
paGdipCreateFontFamilyFromName    LONG, NAME('fptr_GdipCreateFontFamilyFromName')
paGdipGetGenericFontFamilySansSerif   LONG, NAME('fptr_GdipGetGenericFontFamilySansSerif')
paGdipGetGenericFontFamilySerif   LONG, NAME('fptr_GdipGetGenericFontFamilySerif')
paGdipGetGenericFontFamilyMonospace   LONG, NAME('fptr_GdipGetGenericFontFamilyMonospace')
paGdipDeleteFontFamily        LONG, NAME('fptr_GdipDeleteFontFamily')
paGdipCloneFontFamily         LONG, NAME('fptr_GdipCloneFontFamily')
paGdipGetFamilyName           LONG, NAME('fptr_GdipGetFamilyName')
paGdipIsStyleAvailable        LONG, NAME('fptr_GdipIsStyleAvailable')
paGdipGetEmHeight             LONG, NAME('fptr_GdipGetEmHeight')
paGdipGetCellAscent           LONG, NAME('fptr_GdipGetCellAscent')
paGdipGetCellDescent          LONG, NAME('fptr_GdipGetCellDescent')
paGdipGetLineSpacing          LONG, NAME('fptr_GdipGetLineSpacing')
paGdipGetFontCollectionFamilyCount    LONG, NAME('fptr_GdipGetFontCollectionFamilyCount')
paGdipGetFontCollectionFamilyList LONG, NAME('fptr_GdipGetFontCollectionFamilyList')
paGdipNewInstalledFontCollection  LONG, NAME('fptr_GdipNewInstalledFontCollection')
paGdipNewPrivateFontCollection    LONG, NAME('fptr_GdipNewPrivateFontCollection')
paGdipDeletePrivateFontCollection LONG, NAME('fptr_GdipDeletePrivateFontCollection')
paGdipPrivateAddFontFile      LONG, NAME('fptr_GdipPrivateAddFontFile')
paGdipCreatePath              LONG, NAME('fptr_GdipCreatePath')
paGdipCreatePath2             LONG, NAME('fptr_GdipCreatePath2')
paGdipCreatePath2I            LONG, NAME('fptr_GdipCreatePath2I')
paGdipDeletePath              LONG, NAME('fptr_GdipDeletePath')
paGdipClonePath               LONG, NAME('fptr_GdipClonePath')
paGdipResetPath               LONG, NAME('fptr_GdipResetPath')
paGdipGetPathFillMode         LONG, NAME('fptr_GdipGetPathFillMode')
paGdipSetPathFillMode         LONG, NAME('fptr_GdipSetPathFillMode')
paGdipGetPathData             LONG, NAME('fptr_GdipGetPathData')
paGdipStartPathFigure         LONG, NAME('fptr_GdipStartPathFigure')
paGdipClosePathFigure         LONG, NAME('fptr_GdipClosePathFigure')
paGdipClosePathFigures        LONG, NAME('fptr_GdipClosePathFigures')
paGdipSetPathMarker           LONG, NAME('fptr_GdipSetPathMarker')
paGdipClearPathMarkers        LONG, NAME('fptr_GdipClearPathMarkers')
paGdipReversePath             LONG, NAME('fptr_GdipReversePath')
paGdipGetPathLastPoint        LONG, NAME('fptr_GdipGetPathLastPoint')
paGdipAddPathLine             LONG, NAME('fptr_GdipAddPathLine')
paGdipAddPathLine2            LONG, NAME('fptr_GdipAddPathLine2')
paGdipAddPathLineI            LONG, NAME('fptr_GdipAddPathLineI')
paGdipAddPathLine2I           LONG, NAME('fptr_GdipAddPathLine2I')
paGdipAddPathArc              LONG, NAME('fptr_GdipAddPathArc')
paGdipAddPathArcI             LONG, NAME('fptr_GdipAddPathArcI')
paGdipAddPathBezier           LONG, NAME('fptr_GdipAddPathBezier')
paGdipAddPathBeziers          LONG, NAME('fptr_GdipAddPathBeziers')
paGdipAddPathBezierI          LONG, NAME('fptr_GdipAddPathBezierI')
paGdipAddPathBeziersI         LONG, NAME('fptr_GdipAddPathBeziersI')
paGdipAddPathCurve            LONG, NAME('fptr_GdipAddPathCurve')
paGdipAddPathCurve2           LONG, NAME('fptr_GdipAddPathCurve2')
paGdipAddPathCurve3           LONG, NAME('fptr_GdipAddPathCurve3')
paGdipAddPathCurveI           LONG, NAME('fptr_GdipAddPathCurveI')
paGdipAddPathCurve2I          LONG, NAME('fptr_GdipAddPathCurve2I')
paGdipAddPathCurve3I          LONG, NAME('fptr_GdipAddPathCurve3I')
paGdipAddPathClosedCurve      LONG, NAME('fptr_GdipAddPathClosedCurve')
paGdipAddPathClosedCurve2     LONG, NAME('fptr_GdipAddPathClosedCurve2')
paGdipAddPathClosedCurveI     LONG, NAME('fptr_GdipAddPathClosedCurveI')
paGdipAddPathClosedCurve2I    LONG, NAME('fptr_GdipAddPathClosedCurve2I')
paGdipAddPathRectangle        LONG, NAME('fptr_GdipAddPathRectangle')
paGdipAddPathRectangles       LONG, NAME('fptr_GdipAddPathRectangles')
paGdipAddPathRectangleI       LONG, NAME('fptr_GdipAddPathRectangleI')
paGdipAddPathRectanglesI      LONG, NAME('fptr_GdipAddPathRectanglesI')
paGdipAddPathEllipse          LONG, NAME('fptr_GdipAddPathEllipse')
paGdipAddPathEllipseI         LONG, NAME('fptr_GdipAddPathEllipseI')
paGdipAddPathPie              LONG, NAME('fptr_GdipAddPathPie')
paGdipAddPathPieI             LONG, NAME('fptr_GdipAddPathPieI')
paGdipAddPathPolygon          LONG, NAME('fptr_GdipAddPathPolygon')
paGdipAddPathPolygonI         LONG, NAME('fptr_GdipAddPathPolygonI')
paGdipAddPathPath             LONG, NAME('fptr_GdipAddPathPath')
paGdipAddPathString           LONG, NAME('fptr_GdipAddPathString')
paGdipAddPathStringI          LONG, NAME('fptr_GdipAddPathStringI')
paGdipTransformPath           LONG, NAME('fptr_GdipTransformPath')
paGdipFlattenPath             LONG, NAME('fptr_GdipFlattenPath')
paGdipWidenPath               LONG, NAME('fptr_GdipWidenPath')
paGdipWindingModeOutline      LONG, NAME('fptr_GdipWindingModeOutline')
paGdipWarpPath                LONG, NAME('fptr_GdipWarpPath')
paGdipGetPointCount           LONG, NAME('fptr_GdipGetPointCount')
paGdipGetPathTypes            LONG, NAME('fptr_GdipGetPathTypes')
paGdipGetPathPoints           LONG, NAME('fptr_GdipGetPathPoints')
paGdipGetPathPointsI          LONG, NAME('fptr_GdipGetPathPointsI')
paGdipGetPathWorldBounds      LONG, NAME('fptr_GdipGetPathWorldBounds')
paGdipGetPathWorldBoundsI     LONG, NAME('fptr_GdipGetPathWorldBoundsI')
paGdipIsVisiblePathPoint      LONG, NAME('fptr_GdipIsVisiblePathPoint')
paGdipIsVisiblePathPointI     LONG, NAME('fptr_GdipIsVisiblePathPointI')
paGdipIsOutlineVisiblePathPoint   LONG, NAME('fptr_GdipIsOutlineVisiblePathPoint')
paGdipIsOutlineVisiblePathPointI  LONG, NAME('fptr_GdipIsOutlineVisiblePathPointI')
paGdipCreatePen1              LONG, NAME('fptr_GdipCreatePen1')
paGdipCreatePen2              LONG, NAME('fptr_GdipCreatePen2')
paGdipDeletePen               LONG, NAME('fptr_GdipDeletePen')
paGdipClonePen                LONG, NAME('fptr_GdipClonePen')
paGdipSetPenWidth             LONG, NAME('fptr_GdipSetPenWidth')
paGdipGetPenWidth             LONG, NAME('fptr_GdipGetPenWidth')
paGdipSetPenLineCap197819     LONG, NAME('fptr_GdipSetPenLineCap197819')
paGdipSetPenStartCap          LONG, NAME('fptr_GdipSetPenStartCap')
paGdipSetPenEndCap            LONG, NAME('fptr_GdipSetPenEndCap')
paGdipSetPenDashCap197819     LONG, NAME('fptr_GdipSetPenDashCap197819')
paGdipGetPenStartCap          LONG, NAME('fptr_GdipGetPenStartCap')
paGdipGetPenEndCap            LONG, NAME('fptr_GdipGetPenEndCap')
paGdipGetPenDashCap197819     LONG, NAME('fptr_GdipGetPenDashCap197819')
paGdipSetPenLineJoin          LONG, NAME('fptr_GdipSetPenLineJoin')
paGdipGetPenLineJoin          LONG, NAME('fptr_GdipGetPenLineJoin')
paGdipSetPenCustomStartCap    LONG, NAME('fptr_GdipSetPenCustomStartCap')
paGdipGetPenCustomStartCap    LONG, NAME('fptr_GdipGetPenCustomStartCap')
paGdipSetPenCustomEndCap      LONG, NAME('fptr_GdipSetPenCustomEndCap')
paGdipGetPenCustomEndCap      LONG, NAME('fptr_GdipGetPenCustomEndCap')
paGdipSetPenMiterLimit        LONG, NAME('fptr_GdipSetPenMiterLimit')
paGdipGetPenMiterLimit        LONG, NAME('fptr_GdipGetPenMiterLimit')
paGdipSetPenMode              LONG, NAME('fptr_GdipSetPenMode')
paGdipGetPenMode              LONG, NAME('fptr_GdipGetPenMode')
paGdipSetPenTransform         LONG, NAME('fptr_GdipSetPenTransform')
paGdipGetPenTransform         LONG, NAME('fptr_GdipGetPenTransform')
paGdipResetPenTransform       LONG, NAME('fptr_GdipResetPenTransform')
paGdipMultiplyPenTransform    LONG, NAME('fptr_GdipMultiplyPenTransform')
paGdipTranslatePenTransform   LONG, NAME('fptr_GdipTranslatePenTransform')
paGdipScalePenTransform       LONG, NAME('fptr_GdipScalePenTransform')
paGdipRotatePenTransform      LONG, NAME('fptr_GdipRotatePenTransform')
paGdipGetPenFillType          LONG, NAME('fptr_GdipGetPenFillType')
paGdipSetPenColor             LONG, NAME('fptr_GdipSetPenColor')
paGdipSetPenBrushFill         LONG, NAME('fptr_GdipSetPenBrushFill')
paGdipGetPenColor             LONG, NAME('fptr_GdipGetPenColor')
paGdipGetPenBrushFill         LONG, NAME('fptr_GdipGetPenBrushFill')
paGdipGetPenDashStyle         LONG, NAME('fptr_GdipGetPenDashStyle')
paGdipSetPenDashStyle         LONG, NAME('fptr_GdipSetPenDashStyle')
paGdipGetPenDashOffset        LONG, NAME('fptr_GdipGetPenDashOffset')
paGdipSetPenDashOffset        LONG, NAME('fptr_GdipSetPenDashOffset')
paGdipSetPenDashArray         LONG, NAME('fptr_GdipSetPenDashArray')
paGdipGetPenDashCount         LONG, NAME('fptr_GdipGetPenDashCount')
paGdipGetPenDashArray         LONG, NAME('fptr_GdipGetPenDashArray')
paGdipSetPenCompoundArray     LONG, NAME('fptr_GdipSetPenCompoundArray')
paGdipGetPenCompoundCount     LONG, NAME('fptr_GdipGetPenCompoundCount')
paGdipGetPenCompoundArray     LONG, NAME('fptr_GdipGetPenCompoundArray')
paGdipDeleteBrush             LONG, NAME('fptr_GdipDeleteBrush')
paGdipCloneBrush              LONG, NAME('fptr_GdipCloneBrush')
paGdipGetBrushType            LONG, NAME('fptr_GdipGetBrushType')
paGdipCreateSolidFill         LONG, NAME('fptr_GdipCreateSolidFill')
paGdipGetSolidFillColor       LONG, NAME('fptr_GdipGetSolidFillColor')
paGdipSetSolidFillColor       LONG, NAME('fptr_GdipSetSolidFillColor')
paGdipCreateTexture           LONG, NAME('fptr_GdipCreateTexture')
paGdipCreateTexture2          LONG, NAME('fptr_GdipCreateTexture2')
paGdipCreateTexture2I         LONG, NAME('fptr_GdipCreateTexture2I')
paGdipCreateTextureIA         LONG, NAME('fptr_GdipCreateTextureIA')
paGdipCreateTextureIAI        LONG, NAME('fptr_GdipCreateTextureIAI')
paGdipSetTextureTransform     LONG, NAME('fptr_GdipSetTextureTransform')
paGdipGetTextureTransform     LONG, NAME('fptr_GdipGetTextureTransform')
paGdipResetTextureTransform   LONG, NAME('fptr_GdipResetTextureTransform')
paGdipMultiplyTextureTransform    LONG, NAME('fptr_GdipMultiplyTextureTransform')
paGdipTranslateTextureTransform   LONG, NAME('fptr_GdipTranslateTextureTransform')
paGdipScaleTextureTransform   LONG, NAME('fptr_GdipScaleTextureTransform')
paGdipRotateTextureTransform   LONG, NAME('fptr_GdipRotateTextureTransform')
paGdipSetTextureWrapMode      LONG, NAME('fptr_GdipSetTextureWrapMode')
paGdipGetTextureWrapMode      LONG, NAME('fptr_GdipGetTextureWrapMode')
paGdipGetTextureImage         LONG, NAME('fptr_GdipGetTextureImage')
paGdipCreateLineBrush         LONG, NAME('fptr_GdipCreateLineBrush')
paGdipCreateLineBrushI        LONG, NAME('fptr_GdipCreateLineBrushI')
paGdipCreateLineBrushFromRect LONG, NAME('fptr_GdipCreateLineBrushFromRect')
paGdipCreateLineBrushFromRectI    LONG, NAME('fptr_GdipCreateLineBrushFromRectI')
paGdipCreateLineBrushFromRectWithAngle    LONG, NAME('fptr_GdipCreateLineBrushFromRectWithAngle')
paGdipCreateLineBrushFromRectWithAngleI   LONG, NAME('fptr_GdipCreateLineBrushFromRectWithAngleI')
paGdipSetLineColors           LONG, NAME('fptr_GdipSetLineColors')
paGdipGetLineColors           LONG, NAME('fptr_GdipGetLineColors')
paGdipGetLineRect             LONG, NAME('fptr_GdipGetLineRect')
paGdipGetLineRectI            LONG, NAME('fptr_GdipGetLineRectI')
paGdipSetLineGammaCorrection  LONG, NAME('fptr_GdipSetLineGammaCorrection')
paGdipGetLineGammaCorrection  LONG, NAME('fptr_GdipGetLineGammaCorrection')
paGdipGetLineBlendCount       LONG, NAME('fptr_GdipGetLineBlendCount')
paGdipSetLineBlend            LONG, NAME('fptr_GdipSetLineBlend')
paGdipGetLineBlend            LONG, NAME('fptr_GdipGetLineBlend')
paGdipGetLinePresetBlendCount LONG, NAME('fptr_GdipGetLinePresetBlendCount')
paGdipSetLinePresetBlend      LONG, NAME('fptr_GdipSetLinePresetBlend')
paGdipGetLinePresetBlend      LONG, NAME('fptr_GdipGetLinePresetBlend')
paGdipSetLineSigmaBlend       LONG, NAME('fptr_GdipSetLineSigmaBlend')
paGdipSetLineLinearBlend      LONG, NAME('fptr_GdipSetLineLinearBlend')
paGdipSetLineTransform        LONG, NAME('fptr_GdipSetLineTransform')
paGdipGetLineTransform        LONG, NAME('fptr_GdipGetLineTransform')
paGdipResetLineTransform      LONG, NAME('fptr_GdipResetLineTransform')
paGdipMultiplyLineTransform   LONG, NAME('fptr_GdipMultiplyLineTransform')
paGdipTranslateLineTransform  LONG, NAME('fptr_GdipTranslateLineTransform')
paGdipScaleLineTransform      LONG, NAME('fptr_GdipScaleLineTransform')
paGdipRotateLineTransform     LONG, NAME('fptr_GdipRotateLineTransform')
paGdipSetLineWrapMode         LONG, NAME('fptr_GdipSetLineWrapMode')
paGdipGetLineWrapMode         LONG, NAME('fptr_GdipGetLineWrapMode')
paGdipCreateHatchBrush        LONG, NAME('fptr_GdipCreateHatchBrush')
paGdipGetHatchStyle           LONG, NAME('fptr_GdipGetHatchStyle')
paGdipGetHatchForegroundColor LONG, NAME('fptr_GdipGetHatchForegroundColor')
paGdipGetHatchBackgroundColor LONG, NAME('fptr_GdipGetHatchBackgroundColor')
paGdipCreateRegion            LONG, NAME('fptr_GdipCreateRegion')
paGdipCreateRegionRect        LONG, NAME('fptr_GdipCreateRegionRect')
paGdipCreateRegionRectI       LONG, NAME('fptr_GdipCreateRegionRectI')
paGdipCreateRegionPath        LONG, NAME('fptr_GdipCreateRegionPath')
paGdipCreateRegionRgnData     LONG, NAME('fptr_GdipCreateRegionRgnData')
paGdipCreateRegionHrgn        LONG, NAME('fptr_GdipCreateRegionHrgn')
paGdipDeleteRegion            LONG, NAME('fptr_GdipDeleteRegion')
paGdipCloneRegion             LONG, NAME('fptr_GdipCloneRegion')
paGdipSetInfinite             LONG, NAME('fptr_GdipSetInfinite')
paGdipSetEmpty                LONG, NAME('fptr_GdipSetEmpty')
paGdipCombineRegionRect       LONG, NAME('fptr_GdipCombineRegionRect')
paGdipCombineRegionRectI      LONG, NAME('fptr_GdipCombineRegionRectI')
paGdipCombineRegionPath       LONG, NAME('fptr_GdipCombineRegionPath')
paGdipCombineRegionRegion     LONG, NAME('fptr_GdipCombineRegionRegion')
paGdipTranslateRegion         LONG, NAME('fptr_GdipTranslateRegion')
paGdipTranslateRegionI        LONG, NAME('fptr_GdipTranslateRegionI')
paGdipTransformRegion         LONG, NAME('fptr_GdipTransformRegion')
paGdipGetRegionBounds         LONG, NAME('fptr_GdipGetRegionBounds')
paGdipGetRegionBoundsI        LONG, NAME('fptr_GdipGetRegionBoundsI')
paGdipGetRegionHRgn           LONG, NAME('fptr_GdipGetRegionHRgn')
paGdipIsEmptyRegion           LONG, NAME('fptr_GdipIsEmptyRegion')
paGdipIsInfiniteRegion        LONG, NAME('fptr_GdipIsInfiniteRegion')
paGdipIsEqualRegion           LONG, NAME('fptr_GdipIsEqualRegion')
paGdipGetRegionDataSize       LONG, NAME('fptr_GdipGetRegionDataSize')
paGdipGetRegionData           LONG, NAME('fptr_GdipGetRegionData')
paGdipIsVisibleRegionPoint    LONG, NAME('fptr_GdipIsVisibleRegionPoint')
paGdipIsVisibleRegionPointI   LONG, NAME('fptr_GdipIsVisibleRegionPointI')
paGdipIsVisibleRegionRect     LONG, NAME('fptr_GdipIsVisibleRegionRect')
paGdipIsVisibleRegionRectI    LONG, NAME('fptr_GdipIsVisibleRegionRectI')
paGdipGetRegionScansCount     LONG, NAME('fptr_GdipGetRegionScansCount')
paGdipGetRegionScans          LONG, NAME('fptr_GdipGetRegionScans')
paGdipGetRegionScansI         LONG, NAME('fptr_GdipGetRegionScansI')
paGdipFlush                   LONG, NAME('fptr_GdipFlush')
paGdipDrawString              LONG, NAME('fptr_GdipDrawString')
paGdipMeasureString           LONG, NAME('fptr_GdipMeasureString')
paGdipDrawCachedBitmap        LONG, NAME('fptr_GdipDrawCachedBitmap')
paGdipDrawImage               LONG, NAME('fptr_GdipDrawImage')
paGdipDrawImageI              LONG, NAME('fptr_GdipDrawImageI')
paGdipDrawImageRect           LONG, NAME('fptr_GdipDrawImageRect')
paGdipDrawImageRectI          LONG, NAME('fptr_GdipDrawImageRectI')
paGdipDrawImagePoints         LONG, NAME('fptr_GdipDrawImagePoints')
paGdipDrawImagePointsI        LONG, NAME('fptr_GdipDrawImagePointsI')
paGdipDrawImagePointRect      LONG, NAME('fptr_GdipDrawImagePointRect')
paGdipDrawImagePointRectI     LONG, NAME('fptr_GdipDrawImagePointRectI')
paGdipDrawImageRectRect       LONG, NAME('fptr_GdipDrawImageRectRect')
paGdipDrawImageRectRectI      LONG, NAME('fptr_GdipDrawImageRectRectI')
paGdipDrawImagePointsRect     LONG, NAME('fptr_GdipDrawImagePointsRect')
paGdipDrawImagePointsRectI    LONG, NAME('fptr_GdipDrawImagePointsRectI')
paGdipDrawImageFX             LONG, NAME('fptr_GdipDrawImageFX')
paGdipSetClipGraphics         LONG, NAME('fptr_GdipSetClipGraphics')
paGdipSetClipRect             LONG, NAME('fptr_GdipSetClipRect')
paGdipSetClipRectI            LONG, NAME('fptr_GdipSetClipRectI')
paGdipSetClipPath             LONG, NAME('fptr_GdipSetClipPath')
paGdipSetClipRegion           LONG, NAME('fptr_GdipSetClipRegion')
paGdipSetClipHrgn             LONG, NAME('fptr_GdipSetClipHrgn')
paGdipResetClip               LONG, NAME('fptr_GdipResetClip')
paGdipTranslateClip           LONG, NAME('fptr_GdipTranslateClip')
paGdipTranslateClipI          LONG, NAME('fptr_GdipTranslateClipI')
paGdipGetClip                 LONG, NAME('fptr_GdipGetClip')
paGdipGetClipBounds           LONG, NAME('fptr_GdipGetClipBounds')
paGdipGetClipBoundsI          LONG, NAME('fptr_GdipGetClipBoundsI')
paGdipIsClipEmpty             LONG, NAME('fptr_GdipIsClipEmpty')
paGdipGetVisibleClipBounds    LONG, NAME('fptr_GdipGetVisibleClipBounds')
paGdipGetVisibleClipBoundsI   LONG, NAME('fptr_GdipGetVisibleClipBoundsI')
paGdipIsVisibleClipEmpty      LONG, NAME('fptr_GdipIsVisibleClipEmpty')
paGdipIsVisiblePoint          LONG, NAME('fptr_GdipIsVisiblePoint')
paGdipIsVisiblePointI         LONG, NAME('fptr_GdipIsVisiblePointI')
paGdipIsVisibleRect           LONG, NAME('fptr_GdipIsVisibleRect')
paGdipIsVisibleRectI          LONG, NAME('fptr_GdipIsVisibleRectI')
paGdipSaveGraphics            LONG, NAME('fptr_GdipSaveGraphics')
paGdipRestoreGraphics         LONG, NAME('fptr_GdipRestoreGraphics')
paGdipCreateCachedBitmap      LONG, NAME('fptr_GdipCreateCachedBitmap')
paGdipDeleteCachedBitmap      LONG, NAME('fptr_GdipDeleteCachedBitmap')
paGdipCreateStringFormat      LONG, NAME('fptr_GdipCreateStringFormat')
paGdipDeleteStringFormat      LONG, NAME('fptr_GdipDeleteStringFormat')
paGdipCloneStringFormat       LONG, NAME('fptr_GdipCloneStringFormat')
paGdipSetStringFormatFlags    LONG, NAME('fptr_GdipSetStringFormatFlags')
paGdipGetStringFormatFlags    LONG, NAME('fptr_GdipGetStringFormatFlags')
paGdipSetStringFormatAlign    LONG, NAME('fptr_GdipSetStringFormatAlign')
paGdipGetStringFormatAlign    LONG, NAME('fptr_GdipGetStringFormatAlign')
paGdipSetStringFormatLineAlign    LONG, NAME('fptr_GdipSetStringFormatLineAlign')
paGdipGetStringFormatLineAlign    LONG, NAME('fptr_GdipGetStringFormatLineAlign')
paGdipSetStringFormatHotkeyPrefix LONG, NAME('fptr_GdipSetStringFormatHotkeyPrefix')
paGdipGetStringFormatHotkeyPrefix LONG, NAME('fptr_GdipGetStringFormatHotkeyPrefix')
paGdipSetStringFormatTabStops LONG, NAME('fptr_GdipSetStringFormatTabStops')
paGdipGetStringFormatTabStopCount LONG, NAME('fptr_GdipGetStringFormatTabStopCount')
paGdipGetStringFormatTabStops LONG, NAME('fptr_GdipGetStringFormatTabStops')
paGdipSetStringFormatDigitSubstitution    LONG, NAME('fptr_GdipSetStringFormatDigitSubstitution')
paGdipGetStringFormatDigitSubstitution    LONG, NAME('fptr_GdipGetStringFormatDigitSubstitution')
paGdipSetStringFormatTrimming LONG, NAME('fptr_GdipSetStringFormatTrimming')
paGdipGetStringFormatTrimming LONG, NAME('fptr_GdipGetStringFormatTrimming')
paGdipSetStringFormatMeasurableCharacterRanges    LONG, NAME('fptr_GdipSetStringFormatMeasurableCharacterRanges')
paGdipGetStringFormatMeasurableCharacterRangeCount    LONG, NAME('fptr_GdipGetStringFormatMeasurableCharacterRangeCount')
paGdipStringFormatGetGenericDefault   LONG, NAME('fptr_GdipStringFormatGetGenericDefault')
paGdipStringFormatGetGenericTypographic   LONG, NAME('fptr_GdipStringFormatGetGenericTypographic')
paGdipCreateImageAttributes   LONG, NAME('fptr_GdipCreateImageAttributes')
paGdipDisposeImageAttributes  LONG, NAME('fptr_GdipDisposeImageAttributes')
paGdipCloneImageAttributes    LONG, NAME('fptr_GdipCloneImageAttributes')
paGdipSetImageAttributesToIdentity    LONG, NAME('fptr_GdipSetImageAttributesToIdentity')
paGdipResetImageAttributes    LONG, NAME('fptr_GdipResetImageAttributes')
paGdipSetImageAttributesColorMatrix   LONG, NAME('fptr_GdipSetImageAttributesColorMatrix')
paGdipSetImageAttributesThreshold LONG, NAME('fptr_GdipSetImageAttributesThreshold')
paGdipSetImageAttributesGamma LONG, NAME('fptr_GdipSetImageAttributesGamma')
paGdipSetImageAttributesNoOp  LONG, NAME('fptr_GdipSetImageAttributesNoOp')
paGdipSetImageAttributesColorKeys LONG, NAME('fptr_GdipSetImageAttributesColorKeys')
paGdipSetImageAttributesOutputChannel LONG, NAME('fptr_GdipSetImageAttributesOutputChannel')
paGdipSetImageAttributesOutputChannelColorProfile LONG, NAME('fptr_GdipSetImageAttributesOutputChannelColorProfile')
paGdipSetImageAttributesRemapTable    LONG, NAME('fptr_GdipSetImageAttributesRemapTable')
paGdipSetImageAttributesWrapMode  LONG, NAME('fptr_GdipSetImageAttributesWrapMode')
paGdipGetImageAttributesAdjustedPalette   LONG, NAME('fptr_GdipGetImageAttributesAdjustedPalette')
paGdipCreatePathIter          LONG, NAME('fptr_GdipCreatePathIter')
paGdipDeletePathIter          LONG, NAME('fptr_GdipDeletePathIter')
paGdipPathIterNextSubpath     LONG, NAME('fptr_GdipPathIterNextSubpath')
paGdipPathIterNextSubpathPath LONG, NAME('fptr_GdipPathIterNextSubpathPath')
paGdipPathIterNextPathType    LONG, NAME('fptr_GdipPathIterNextPathType')
paGdipPathIterNextMarker      LONG, NAME('fptr_GdipPathIterNextMarker')
paGdipPathIterNextMarkerPath  LONG, NAME('fptr_GdipPathIterNextMarkerPath')
paGdipPathIterGetCount        LONG, NAME('fptr_GdipPathIterGetCount')
paGdipPathIterGetSubpathCount LONG, NAME('fptr_GdipPathIterGetSubpathCount')
paGdipPathIterHasCurve        LONG, NAME('fptr_GdipPathIterHasCurve')
paGdipPathIterRewind          LONG, NAME('fptr_GdipPathIterRewind')
paGdipPathIterEnumerate       LONG, NAME('fptr_GdipPathIterEnumerate')
paGdipPathIterCopyData        LONG, NAME('fptr_GdipPathIterCopyData')
paGdipCreatePathGradient      LONG, NAME('fptr_GdipCreatePathGradient')
paGdipCreatePathGradientI     LONG, NAME('fptr_GdipCreatePathGradientI')
paGdipCreatePathGradientFromPath  LONG, NAME('fptr_GdipCreatePathGradientFromPath')
paGdipGetPathGradientCenterColor  LONG, NAME('fptr_GdipGetPathGradientCenterColor')
paGdipSetPathGradientCenterColor  LONG, NAME('fptr_GdipSetPathGradientCenterColor')
paGdipGetPathGradientPointCount   LONG, NAME('fptr_GdipGetPathGradientPointCount')
paGdipGetPathGradientSurroundColorCount   LONG, NAME('fptr_GdipGetPathGradientSurroundColorCount')
paGdipGetPathGradientSurroundColorsWithCount  LONG, NAME('fptr_GdipGetPathGradientSurroundColorsWithCount')
paGdipSetPathGradientSurroundColorsWithCount  LONG, NAME('fptr_GdipSetPathGradientSurroundColorsWithCount')
paGdipGetPathGradientPath     LONG, NAME('fptr_GdipGetPathGradientPath')
paGdipSetPathGradientPath     LONG, NAME('fptr_GdipSetPathGradientPath')
paGdipGetPathGradientCenterPoint  LONG, NAME('fptr_GdipGetPathGradientCenterPoint')
paGdipGetPathGradientCenterPointI LONG, NAME('fptr_GdipGetPathGradientCenterPointI')
paGdipSetPathGradientCenterPoint  LONG, NAME('fptr_GdipSetPathGradientCenterPoint')
paGdipSetPathGradientCenterPointI LONG, NAME('fptr_GdipSetPathGradientCenterPointI')
paGdipGetPathGradientRect     LONG, NAME('fptr_GdipGetPathGradientRect')
paGdipGetPathGradientRectI    LONG, NAME('fptr_GdipGetPathGradientRectI')
paGdipSetPathGradientGammaCorrection  LONG, NAME('fptr_GdipSetPathGradientGammaCorrection')
paGdipGetPathGradientGammaCorrection  LONG, NAME('fptr_GdipGetPathGradientGammaCorrection')
paGdipGetPathGradientBlendCount   LONG, NAME('fptr_GdipGetPathGradientBlendCount')
paGdipGetPathGradientBlend    LONG, NAME('fptr_GdipGetPathGradientBlend')
paGdipSetPathGradientBlend    LONG, NAME('fptr_GdipSetPathGradientBlend')
paGdipGetPathGradientPresetBlendCount LONG, NAME('fptr_GdipGetPathGradientPresetBlendCount')
paGdipSetPathGradientPresetBlend  LONG, NAME('fptr_GdipSetPathGradientPresetBlend')
paGdipGetPathGradientPresetBlend  LONG, NAME('fptr_GdipGetPathGradientPresetBlend')
paGdipSetPathGradientSigmaBlend   LONG, NAME('fptr_GdipSetPathGradientSigmaBlend')
paGdipSetPathGradientLinearBlend  LONG, NAME('fptr_GdipSetPathGradientLinearBlend')
paGdipGetPathGradientTransform    LONG, NAME('fptr_GdipGetPathGradientTransform')
paGdipSetPathGradientTransform    LONG, NAME('fptr_GdipSetPathGradientTransform')
paGdipResetPathGradientTransform  LONG, NAME('fptr_GdipResetPathGradientTransform')
paGdipMultiplyPathGradientTransform   LONG, NAME('fptr_GdipMultiplyPathGradientTransform')
paGdipTranslatePathGradientTransform  LONG, NAME('fptr_GdipTranslatePathGradientTransform')
paGdipScalePathGradientTransform  LONG, NAME('fptr_GdipScalePathGradientTransform')
paGdipRotatePathGradientTransform LONG, NAME('fptr_GdipRotatePathGradientTransform')
paGdipGetPathGradientFocusScales  LONG, NAME('fptr_GdipGetPathGradientFocusScales')
paGdipSetPathGradientFocusScales  LONG, NAME('fptr_GdipSetPathGradientFocusScales')
paGdipGetPathGradientWrapMode LONG, NAME('fptr_GdipGetPathGradientWrapMode')
paGdipSetPathGradientWrapMode LONG, NAME('fptr_GdipSetPathGradientWrapMode')
paGdipGetEncoderParameterListSize LONG, NAME('fptr_GdipGetEncoderParameterListSize')
paGdipGetEncoderParameterList LONG, NAME('fptr_GdipGetEncoderParameterList')
paGdipSaveAdd                 LONG, NAME('fptr_GdipSaveAdd')
paGdipSaveAddImage            LONG, NAME('fptr_GdipSaveAddImage')
paGdipImageGetFrameDimensionsCount    LONG, NAME('fptr_GdipImageGetFrameDimensionsCount')
paGdipImageGetFrameDimensionsList LONG, NAME('fptr_GdipImageGetFrameDimensionsList')
paGdipImageGetFrameCount      LONG, NAME('fptr_GdipImageGetFrameCount')
paGdipImageSelectActiveFrame  LONG, NAME('fptr_GdipImageSelectActiveFrame')
paGdipGetPropertySize         LONG, NAME('fptr_GdipGetPropertySize')
paGdipGetAllPropertyItems     LONG, NAME('fptr_GdipGetAllPropertyItems')
paGdipCreateMetafileFromWmf   LONG, NAME('fptr_GdipCreateMetafileFromWmf')
paGdipCreateMetafileFromEmf   LONG, NAME('fptr_GdipCreateMetafileFromEmf')
paGdipCreateMetafileFromFile  LONG, NAME('fptr_GdipCreateMetafileFromFile')
paGdipCreateMetafileFromWmfFile   LONG, NAME('fptr_GdipCreateMetafileFromWmfFile')
paGdipCreateMetafileFromStream    LONG, NAME('fptr_GdipCreateMetafileFromStream')
paGdipRecordMetafile          LONG, NAME('fptr_GdipRecordMetafile')
paGdipRecordMetafileI         LONG, NAME('fptr_GdipRecordMetafileI')
paGdipRecordMetafileFileName  LONG, NAME('fptr_GdipRecordMetafileFileName')
paGdipRecordMetafileFileNameI LONG, NAME('fptr_GdipRecordMetafileFileNameI')
paGdipGetMetafileHeaderFromWmf    LONG, NAME('fptr_GdipGetMetafileHeaderFromWmf')
paGdipGetMetafileHeaderFromEmf    LONG, NAME('fptr_GdipGetMetafileHeaderFromEmf')
paGdipGetMetafileHeaderFromFile   LONG, NAME('fptr_GdipGetMetafileHeaderFromFile')
paGdipGetMetafileHeaderFromStream LONG, NAME('fptr_GdipGetMetafileHeaderFromStream')
paGdipGetMetafileHeaderFromMetafile   LONG, NAME('fptr_GdipGetMetafileHeaderFromMetafile')
paGdipGetHemfFromMetafile     LONG, NAME('fptr_GdipGetHemfFromMetafile')
paGdipPlayMetafileRecord      LONG, NAME('fptr_GdipPlayMetafileRecord')
paGdipSetMetafileDownLevelRasterizationLimit  LONG, NAME('fptr_GdipSetMetafileDownLevelRasterizationLimit')
paGdipGetMetafileDownLevelRasterizationLimit  LONG, NAME('fptr_GdipGetMetafileDownLevelRasterizationLimit')
paGdipEmfToWmfBits            LONG, NAME('fptr_GdipEmfToWmfBits')
paGdipConvertToEmfPlus        LONG, NAME('fptr_GdipConvertToEmfPlus')
paGdipConvertToEmfPlusToFile  LONG, NAME('fptr_GdipConvertToEmfPlusToFile')
paGdipEnumerateMetafileDestPoint  LONG, NAME('fptr_GdipEnumerateMetafileDestPoint')
paGdipEnumerateMetafileDestPointI LONG, NAME('fptr_GdipEnumerateMetafileDestPointI')
paGdipEnumerateMetafileDestRect   LONG, NAME('fptr_GdipEnumerateMetafileDestRect')
paGdipEnumerateMetafileDestRectI  LONG, NAME('fptr_GdipEnumerateMetafileDestRectI')
paGdipEnumerateMetafileDestPoints LONG, NAME('fptr_GdipEnumerateMetafileDestPoints')
paGdipEnumerateMetafileDestPointsI    LONG, NAME('fptr_GdipEnumerateMetafileDestPointsI')
paGdipEnumerateMetafileSrcRectDestPoint   LONG, NAME('fptr_GdipEnumerateMetafileSrcRectDestPoint')
paGdipEnumerateMetafileSrcRectDestPointI  LONG, NAME('fptr_GdipEnumerateMetafileSrcRectDestPointI')
paGdipEnumerateMetafileSrcRectDestRect    LONG, NAME('fptr_GdipEnumerateMetafileSrcRectDestRect')
paGdipEnumerateMetafileSrcRectDestRectI   LONG, NAME('fptr_GdipEnumerateMetafileSrcRectDestRectI')
paGdipEnumerateMetafileSrcRectDestPoints  LONG, NAME('fptr_GdipEnumerateMetafileSrcRectDestPoints')
paGdipEnumerateMetafileSrcRectDestPointsI LONG, NAME('fptr_GdipEnumerateMetafileSrcRectDestPointsI')
paGdipComment                 LONG, NAME('fptr_GdipComment')
paGdipBeginContainer          LONG, NAME('fptr_GdipBeginContainer')
paGdipBeginContainerI         LONG, NAME('fptr_GdipBeginContainerI')
paGdipBeginContainer2         LONG, NAME('fptr_GdipBeginContainer2')
paGdipEndContainer            LONG, NAME('fptr_GdipEndContainer')
paGdipCreateCustomLineCap     LONG, NAME('fptr_GdipCreateCustomLineCap')
paGdipDeleteCustomLineCap     LONG, NAME('fptr_GdipDeleteCustomLineCap')
paGdipSetCustomLineCapStrokeCaps  LONG, NAME('fptr_GdipSetCustomLineCapStrokeCaps')
paGdipGetCustomLineCapStrokeCaps  LONG, NAME('fptr_GdipGetCustomLineCapStrokeCaps')
paGdipSetCustomLineCapStrokeJoin  LONG, NAME('fptr_GdipSetCustomLineCapStrokeJoin')
paGdipGetCustomLineCapStrokeJoin  LONG, NAME('fptr_GdipGetCustomLineCapStrokeJoin')
paGdipSetCustomLineCapBaseCap LONG, NAME('fptr_GdipSetCustomLineCapBaseCap')
paGdipGetCustomLineCapBaseCap LONG, NAME('fptr_GdipGetCustomLineCapBaseCap')
paGdipSetCustomLineCapBaseInset   LONG, NAME('fptr_GdipSetCustomLineCapBaseInset')
paGdipGetCustomLineCapBaseInset   LONG, NAME('fptr_GdipGetCustomLineCapBaseInset')
paGdipSetCustomLineCapWidthScale  LONG, NAME('fptr_GdipSetCustomLineCapWidthScale')
paGdipGetCustomLineCapWidthScale  LONG, NAME('fptr_GdipGetCustomLineCapWidthScale')
paGdipCloneCustomLineCap      LONG, NAME('fptr_GdipCloneCustomLineCap')
paGdipCreateAdjustableArrowCap    LONG, NAME('fptr_GdipCreateAdjustableArrowCap')
paGdipSetAdjustableArrowCapHeight LONG, NAME('fptr_GdipSetAdjustableArrowCapHeight')
paGdipGetAdjustableArrowCapHeight LONG, NAME('fptr_GdipGetAdjustableArrowCapHeight')
paGdipSetAdjustableArrowCapWidth  LONG, NAME('fptr_GdipSetAdjustableArrowCapWidth')
paGdipGetAdjustableArrowCapWidth  LONG, NAME('fptr_GdipGetAdjustableArrowCapWidth')
paGdipSetAdjustableArrowCapMiddleInset    LONG, NAME('fptr_GdipSetAdjustableArrowCapMiddleInset')
paGdipGetAdjustableArrowCapMiddleInset    LONG, NAME('fptr_GdipGetAdjustableArrowCapMiddleInset')
paGdipSetAdjustableArrowCapFillState  LONG, NAME('fptr_GdipSetAdjustableArrowCapFillState')
paGdipGetAdjustableArrowCapFillState  LONG, NAME('fptr_GdipGetAdjustableArrowCapFillState')
paGdipCreateStreamOnFile      LONG, NAME('fptr_GdipCreateStreamOnFile')
!!!endregion


  MAP
    MODULE('win api')
      winapi::LoadLibrary(*CSTRING szLibFileName),HINSTANCE,PASCAL,RAW,NAME('LoadLibraryA')
      winapi::FreeLibrary(LONG hModule),BOOL,PASCAL,PROC,NAME('FreeLibrary')
      winapi::GetProcAddress(LONG hModule, *CSTRING szProcName),LONG,PASCAL,RAW,NAME('GetProcAddress')
      winapi::GetProcAddress(LONG hModule, LONG pOrdinalValue),LONG,PASCAL,RAW,NAME('GetProcAddress')
      winapi::GetLastError(),LONG,PASCAL,NAME('GetLastError')
    END
    MODULE('GdiPlus api')
      !c:\Program Files (x86)\Windows Kits\10\Include\10.0.22621.0\um\gdiplusinit.h
      GdipStartup(*ULONG pToken, LONG pInput, LONG pOutput),GpStatus,PASCAL,NAME('fptr_GdiplusStartup'),DLL
      GdipShutdown(ULONG pToken),PASCAL,NAME('fptr_GdiplusShutdown'),DLL
      GdipFree(LONG pPtr),PASCAL,NAME('fptr_GdipFree'),DLL
      !c:\Program Files (x86)\Windows Kits\10\Include\10.0.22621.0\um\gdiplusflat.h
      GdipLoadImageFromFile(LONG pFileName, *LONG pImage),GpStatus,PASCAL,NAME('fptr_GdipLoadImageFromFile'),DLL
      GdipLoadImageFromFileICM(LONG pFileName, *LONG pImage),GpStatus,PASCAL,NAME('fptr_GdipLoadImageFromFileICM'),DLL
      GdipLoadImageFromStream(LONG pStream, *LONG pImage),GpStatus,PASCAL,NAME('fptr_GdipLoadImageFromStream'),DLL
      GdipLoadImageFromStreamICM(LONG pStream, *LONG pImage),GpStatus,PASCAL,NAME('fptr_GdipLoadImageFromStreamICM'),DLL
      GdipCloneImage(LONG pImage,*LONG pCLoneImage),GpStatus,PASCAL,NAME('fptr_GdipCloneImage'),DLL
      GdipGetImageThumbnail(LONG pImage,UNSIGNED pThumbWidth,UNSIGNED pThumbHeight,*LONG pThumbImage,LONG pCallback,LONG pCallbackData),GpStatus,PASCAL,NAME('fptr_GdipGetImageThumbnail'),DLL
      GdipSaveImageToFile(LONG pImage,LONG pFileName,LONG pClsidEncoder,LONG pEncoderParams),GpStatus,PASCAL,NAME('fptr_GdipSaveImageToFile'),DLL
      GdipSaveImageToStream(LONG pImage,LONG pStream,LONG pClsidEncoder,LONG pEncoderParams),GpStatus,PASCAL,NAME('fptr_GdipSaveImageToStream'),DLL
      GdipDisposeImage(LONG pImage),GpStatus,PROC,PASCAL,NAME('fptr_GdipDisposeImage'),DLL
      GdipGetImageWidth(LONG pImage, *UNSIGNED pWidth),GpStatus,PASCAL,NAME('fptr_GdipGetImageWidth'),DLL
      GdipGetImageHeight(LONG pImage, *UNSIGNED pHeight),GpStatus,PASCAL,NAME('fptr_GdipGetImageHeight'),DLL
      GdipGetImageHorizontalResolution(LONG pImage, *SREAL pResolution),GpStatus,PASCAL,NAME('fptr_GdipGetImageHorizontalResolution'),DLL
      GdipGetImageVerticalResolution(LONG pImage, *SREAL pResolution),GpStatus,PASCAL,NAME('fptr_GdipGetImageVerticalResolution'),DLL
      GdipGetImageBounds(LONG pImage,LONG pRect,LONG pUnit),GpStatus,PASCAL,NAME('fptr_GdipGetImageBounds'),DLL
      GdipGetImageDimension(LONG pImage,*SREAL pWidth,*SREAL pHeight),GpStatus,PASCAL,NAME('fptr_GdipGetImageDimension'),DLL
      GdipGetImageType(LONG pImage,*GpImageType pType),GpStatus,PASCAL,NAME('fptr_GdipGetImageType'),DLL
      GdipGetImageFlags(LONG pImage,*ULONG pFlags),GpStatus,PASCAL,NAME('fptr_GdipGetImageFlags'),DLL
      GdipGetImageRawFormat(LONG pImage,LONG pGuid),GpStatus,PASCAL,NAME('fptr_GdipGetImageRawFormat'),DLL
      GdipGetImagePixelFormat(LONG pImage,*GpPixelFormat pFmt),GpStatus,PASCAL,NAME('fptr_GdipGetImagePixelFormat'),DLL
      GdipGetPropertyCount(LONG pImage,*UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPropertyCount'),DLL
      GdipGetPropertyIdList(LONG pImage,UNSIGNED pCount,LONG pList),GpStatus,PASCAL,NAME('fptr_GdipGetPropertyIdList'),DLL
      GdipGetPropertyItemSize(LONG pImage,ULONG pPropId,*UNSIGNED pSize),GpStatus,PASCAL,NAME('fptr_GdipGetPropertyItemSize'),DLL
      GdipGetPropertyItem(LONG pImage,ULONG pPropId,UNSIGNED pSize,LONG pBuffer),GpStatus,PASCAL,NAME('fptr_GdipGetPropertyItem'),DLL
      GdipSetPropertyItem(LONG pImage,LONG pItem),GpStatus,PASCAL,NAME('fptr_GdipSetPropertyItem'),DLL
      GdipRemovePropertyItem(LONG pImage,ULONG pPropId),GpStatus,PASCAL,NAME('fptr_GdipRemovePropertyItem'),DLL
      GdipGetImageEncodersSize(*UNSIGNED pNumEncoders,*UNSIGNED pSize),GpStatus,PROC,PASCAL,NAME('fptr_GdipGetImageEncodersSize'),DLL
      GdipGetImageEncoders(UNSIGNED pNumEncoders,UNSIGNED pSize,LONG pEncoders),GpStatus,PROC,PASCAL,NAME('fptr_GdipGetImageEncoders'),DLL
      GdipImageRotateFlip(LONG pImage,GpRotateFlipType pRfType),GpStatus,PROC,PASCAL,NAME('fptr_GdipImageRotateFlip'),DLL
      GdipGetImagePaletteSize(LONG pImage,*UNSIGNED pSize),GpStatus,PROC,PASCAL,NAME('fptr_GdipGetImagePaletteSize'),DLL
      GdipGetImagePalette(LONG pImage,LONG pPalette,UNSIGNED pSize),GpStatus,PROC,PASCAL,NAME('fptr_GdipGetImagePalette'),DLL
      GdipSetImagePalette(LONG pImage,LONG pPalette),GpStatus,PROC,PASCAL,NAME('fptr_GdipSetImagePalette'),DLL
      GdipGetEncoderParameterListSize(LONG pImage,LONG pEncoder,*UNSIGNED pSize),GpStatus,PROC,PASCAL,NAME('fptr_GdipGetEncoderParameterListSize'),DLL
      GdipGetEncoderParameterList(LONG pImage,LONG pEncoder,UNSIGNED pSize,LONG pBuffer),GpStatus,PROC,PASCAL,NAME('fptr_GdipGetEncoderParameterList'),DLL
      GdipSaveAdd(LONG pImage,LONG pEncoderParams),GpStatus,PROC,PASCAL,NAME('fptr_GdipSaveAdd'),DLL
      GdipSaveAddImage(LONG pImage,LONG pNewImage,LONG pEncoderParams),GpStatus,PROC,PASCAL,NAME('fptr_GdipSaveAddImage'),DLL
      GdipImageGetFrameDimensionsCount(LONG pImage,*UNSIGNED pCount),GpStatus,PROC,PASCAL,NAME('fptr_GdipImageGetFrameDimensionsCount'),DLL
      GdipImageGetFrameDimensionsList(LONG pImage,LONG pDimensionIds,UNSIGNED pCount),GpStatus,PROC,PASCAL,NAME('fptr_GdipImageGetFrameDimensionsList'),DLL
      GdipImageGetFrameCount(LONG pImage,LONG pDimensionId,*UNSIGNED pCount),GpStatus,PROC,PASCAL,NAME('fptr_GdipImageGetFrameCount'),DLL
      GdipImageSelectActiveFrame(LONG pImage,LONG pDimensionId,UNSIGNED pFrameIndex),GpStatus,PROC,PASCAL,NAME('fptr_GdipImageSelectActiveFrame'),DLL
      GdipGetPropertySize(LONG pImage,*UNSIGNED pTotalSize,*UNSIGNED pNumProps),GpStatus,PROC,PASCAL,NAME('fptr_GdipGetPropertySize'),DLL
      GdipGetAllPropertyItems(LONG pImage,UNSIGNED pTotalSize,UNSIGNED pNumProps,LONG pAllItems),GpStatus,PROC,PASCAL,NAME('fptr_GdipGetAllPropertyItems'),DLL
      GdipFindFirstImageItem(LONG pImage,LONG pItem),GpStatus,PROC,PASCAL,NAME('fptr_GdipFindFirstImageItem'),DLL
      GdipFindNextImageItem(LONG pImage,LONG pItem),GpStatus,PROC,PASCAL,NAME('fptr_GdipFindNextImageItem'),DLL
      GdipGetImageItemData(LONG pImage,LONG pItem),GpStatus,PROC,PASCAL,NAME('fptr_GdipGetImageItemData'),DLL
      GdipCreateBitmapFromFile(LONG pFileName,*LONG pBitmap),GpStatus,PROC,PASCAL,NAME('fptr_GdipCreateBitmapFromFile'),DLL
      GdipCreateBitmapFromFileICM(LONG pFileName,*LONG pBitmap),GpStatus,PROC,PASCAL,NAME('fptr_GdipCreateBitmapFromFileICM'),DLL
      GdipCreateBitmapFromStream(LONG pStream,*LONG pBitmap),GpStatus,PROC,PASCAL,NAME('fptr_GdipCreateBitmapFromStream'),DLL
      GdipCreateBitmapFromScan0(LONG pWidth,LONG pheight,LONG pStride,GpPixelFormat pFormat,LONG pScan0,*LONG pBitmap),GpStatus,PROC,PASCAL,NAME('fptr_GdipCreateBitmapFromScan0'),DLL
      GdipCreateBitmapFromStreamICM(LONG pStream,*LONG pBitmap),GpStatus,PROC,PASCAL,NAME('fptr_GdipCreateBitmapFromStreamICM'),DLL
      GdipCreateBitmapFromGraphics(LONG pWidth,LONG pHeight,LONG pTarget,*LONG pBitmap),GpStatus,PROC,PASCAL,NAME('fptr_GdipCreateBitmapFromGraphics'),DLL
      GdipCreateBitmapFromGdiDib(LONG pgdiBitmapInfo,LONG gdiBitmapData,*LONG pBitmap),GpStatus,PROC,PASCAL,NAME('fptr_GdipCreateBitmapFromGdiDib'),DLL
      GdipCreateBitmapFromHBITMAP(HBITMAP phbm,HANDLE phpal,*LONG pBitmap),GpStatus,PROC,PASCAL,NAME('fptr_GdipCreateBitmapFromHBITMAP'),DLL
      GdipCreateHBITMAPFromBitmap(LONG pBitmap,*HBITMAP pHbmReturn, ULONG pBackground),GpStatus,PASCAL,NAME('fptr_GdipCreateHBITMAPFromBitmap'),DLL
      GdipCreateBitmapFromHICON(HICON pHicon,*LONG pBitmap),GpStatus,PASCAL,NAME('fptr_GdipCreateBitmapFromHICON'),DLL
      GdipCreateHICONFromBitmap(LONG pBitmap,*HICON pHicon),GpStatus,PASCAL,NAME('fptr_GdipCreateHICONFromBitmap'),DLL
      GdipCreateBitmapFromResource(HINSTANCE phInstance,LONG pBitmapName,*LONG pBitmap),GpStatus,PASCAL,NAME('fptr_GdipCreateBitmapFromResource'),DLL
      GdipCloneBitmapArea(SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight,GpPixelFormat pFormat,LONG pSrcBitmap,*LONG pDstBitmap),GpStatus,PASCAL,NAME('fptr_GdipCloneBitmapArea'),DLL
      GdipCloneBitmapAreaI(LONG pX,LONG pY,LONG pWidth,LONG pHeight,GpPixelFormat pFormat,LONG pSrcBitmap,*LONG pDstBitmap),GpStatus,PASCAL,NAME('fptr_GdipCloneBitmapAreaI'),DLL
      GdipBitmapLockBits(LONG pBitmap,LONG pRect,ULONG pFlags,GpPixelFormat pFormat,LONG pLockedBitmapData),GpStatus,PASCAL,NAME('fptr_GdipBitmapLockBits'),DLL
      GdipBitmapUnlockBits(LONG pBitmap,LONG pLockedBitmapData),GpStatus,PASCAL,NAME('fptr_GdipBitmapUnlockBits'),DLL
      GdipBitmapGetPixel(LONG pBitmap,LONG pX,LONG pY,*GpARGB pColor),GpStatus,PASCAL,NAME('fptr_GdipBitmapGetPixel'),DLL
      GdipBitmapSetPixel(LONG pBitmap,LONG pX,LONG pY,GpARGB pColor),GpStatus,PASCAL,NAME('fptr_GdipBitmapGetPixel'),DLL
      GdipBitmapSetResolution(LONG pBitmap,SREAL pXDpi,SREAL pYDpi),GpStatus,PASCAL,NAME('fptr_GdipBitmapSetResolution'),DLL
      GdipBitmapConvertFormat(LONG pBitmap,GpPixelFormat pFormat,GpDitherType pDithertype,GpPaletteType pPalettetype,LONG pPalette,SREAL pAlphaThresholdPercent),GpStatus,PASCAL,NAME('fptr_GdipBitmapConvertFormat'),DLL
      GdipBitmapApplyEffect(LONG pBitmap,LONG pEffect,LONG pRect,BOOL pUseAuxData,*LONG pAuxData,*UNSIGNED pAuxDataSize),GpStatus,PASCAL,NAME('fptr_GdipBitmapApplyEffect'),DLL
      GdipBitmapCreateApplyEffect(LONG pBitmaps,UNSIGNED pNumInputs,LONG pEffect,LONG pRect,LONG pOutRect,*LONG pOutputBitmap,BOOL pUseAuxData,*LONG pAuxData,*UNSIGNED pAuxDataSize),GpStatus,PASCAL,NAME('fptr_GdipBitmapCreateApplyEffect'),DLL
      GdipBitmapGetHistogramSize(GpHistogramFormat pFormat,*UNSIGNED pNumberOfEntries),GpStatus,PASCAL,NAME('fptr_GdipBitmapGetHistogramSize'),DLL
      GdipBitmapGetHistogram(LONG pBitmaps,GpHistogramFormat pFormat,UNSIGNED pNumberOfEntries,LONG pChannel0,LONG pChannel1,LONG pChannel2,LONG pChannel3),GpStatus,PASCAL,NAME('fptr_GdipBitmapGetHistogram'),DLL
      GdipInitializePalette(LONG pPalette,GpPaletteType pType,UNSIGNED pOptimalColors,BOOL pUseTransparentColor,LONG pBitmaps),GpStatus,PASCAL,NAME('fptr_GdipInitializePalette'),DLL
      GdipGetImageGraphicsContext(LONG pImage,*LONG pGraphics),GpStatus,PASCAL,NAME('fptr_GdipGetImageGraphicsContext'),DLL
      GdipFlush(LONG pGraphics,GpFlushIntention pIntention),GpStatus,PASCAL,NAME('fptr_GdipFlush'),DLL
      GdipDeleteGraphics(LONG pGraphics),GpStatus,PASCAL,NAME('fptr_GdipDeleteGraphics'),DLL
      GdipCreateFromHDC(HDC pDc,*LONG pGraphics),GpStatus,PASCAL,NAME('fptr_GdipCreateFromHDC'),DLL
      GdipCreateFromHDC2(HDC pDc,HANDLE pDevice,*LONG pGraphics),GpStatus,PASCAL,NAME('fptr_GdipCreateFromHDC2'),DLL
      GdipCreateFromHWND(HWND pWnd,*LONG pGraphics),GpStatus,PASCAL,NAME('fptr_GdipCreateFromHWND'),DLL
      GdipCreateFromHWNDICM(HWND pWnd,*LONG pGraphics),GpStatus,PASCAL,NAME('fptr_GdipCreateFromHWNDICM'),DLL
      GdipGetDC(LONG pGraphics,*HDC phdc),GpStatus,PASCAL,NAME('fptr_GdipGetDC'),DLL
      GdipReleaseDC(LONG pGraphics,HDC phdc),GpStatus,PASCAL,NAME('fptr_GdipReleaseDC'),DLL
      GdipSetCompositingMode(LONG pGraphics,GpCompositingMode pMode),GpStatus,PASCAL,NAME('fptr_GdipSetCompositingMode'),DLL
      GdipGetCompositingMode(LONG pGraphics,*GpCompositingMode pMode),GpStatus,PASCAL,NAME('fptr_GdipGetCompositingMode'),DLL
      GdipSetRenderingOrigin(LONG pGraphics,SIGNED pX,SIGNED pY),GpStatus,PASCAL,NAME('fptr_GdipSetRenderingOrigin'),DLL
      GdipGetRenderingOrigin(LONG pGraphics,*SIGNED pX,*SIGNED pY),GpStatus,PASCAL,NAME('fptr_GdipGetRenderingOrigin'),DLL
      GdipSetCompositingQuality(LONG pGraphics,GpCompositingQuality pQuality),GpStatus,PASCAL,NAME('fptr_GdipSetCompositingQuality'),DLL
      GdipGetCompositingQuality(LONG pGraphics,*GpCompositingQuality pQuality),GpStatus,PASCAL,NAME('fptr_GdipGetCompositingQuality'),DLL
      GdipSetSmoothingMode(LONG pGraphics,GpSmoothingMode pMode),GpStatus,PASCAL,NAME('fptr_GdipSetSmoothingMode'),DLL
      GdipGetSmoothingMode(LONG pGraphics,*GpSmoothingMode pMode),GpStatus,PASCAL,NAME('fptr_GdipGetSmoothingMode'),DLL
      GdipSetPixelOffsetMode(LONG pGraphics,GpPixelOffsetMode pMode),GpStatus,PASCAL,NAME('fptr_GdipSetPixelOffsetMode'),DLL
      GdipGetPixelOffsetMode(LONG pGraphics,*GpPixelOffsetMode pMode),GpStatus,PASCAL,NAME('fptr_GdipGetPixelOffsetMode'),DLL
      GdipSetTextRenderingHint(LONG pGraphics,GpTextRenderingHint pMode),GpStatus,PASCAL,NAME('fptr_GdipSetTextRenderingHint'),DLL
      GdipGetTextRenderingHint(LONG pGraphics,*GpTextRenderingHint pMode),GpStatus,PASCAL,NAME('fptr_GdipGetTextRenderingHint'),DLL
      GdipSetTextContrast(LONG pGraphics,UNSIGNED pContrast),GpStatus,PASCAL,NAME('fptr_GdipSetTextContrast'),DLL
      GdipGetTextContrast(LONG pGraphics,*UNSIGNED pContrast),GpStatus,PASCAL,NAME('fptr_GdipGetTextContrast'),DLL
      GdipSetInterpolationMode(LONG pGraphics,GpInterpolationMode pMode),GpStatus,PASCAL,NAME('fptr_GdipSetInterpolationMode'),DLL
      GdipGetInterpolationMode(LONG pGraphics,*GpInterpolationMode pMode),GpStatus,PASCAL,NAME('fptr_GdipGetInterpolationMode'),DLL
      GdipSetWorldTransform(LONG pGraphics,LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipSetWorldTransform'),DLL
      GdipResetWorldTransform(LONG pGraphics),GpStatus,PASCAL,NAME('fptr_GdipResetWorldTransform'),DLL
      GdipMultiplyWorldTransform(LONG pGraphics,LONG pMatrix,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipMultiplyWorldTransform'),DLL
      GdipTranslateWorldTransform(LONG pGraphics,SREAL pdx,SREAL pdy,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipTranslateWorldTransform'),DLL
      GdipScaleWorldTransform(LONG pGraphics,SREAL psx,SREAL psy,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipScaleWorldTransform'),DLL
      GdipRotateWorldTransform(LONG pGraphics,SREAL pAngle,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipRotateWorldTransform'),DLL
      GdipGetWorldTransform(LONG pGraphics,*LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipGetWorldTransform'),DLL
      GdipResetPageTransform(LONG pGraphics),GpStatus,PASCAL,NAME('fptr_GdipResetPageTransform'),DLL
      GdipSetPageUnit(LONG pGraphics,GpUnit pUnit),GpStatus,PASCAL,NAME('fptr_GdipSetPageUnit'),DLL
      GdipGetPageUnit(LONG pGraphics,*GpUnit pUnit),GpStatus,PASCAL,NAME('fptr_GdipGetPageUnit'),DLL
      GdipSetPageScale(LONG pGraphics,SREAL pScale),GpStatus,PASCAL,NAME('fptr_GdipSetPageScale'),DLL
      GdipGetPageScale(LONG pGraphics,*SREAL pScale),GpStatus,PASCAL,NAME('fptr_GdipGetPageScale'),DLL
      GdipGetDpiX(LONG pGraphics,*SREAL pDpi),GpStatus,PASCAL,NAME('fptr_GdipGetDpiX'),DLL
      GdipGetDpiY(LONG pGraphics,*SREAL pDpi),GpStatus,PASCAL,NAME('fptr_GdipGetDpiY'),DLL
      GdipTransformPoints(LONG pGraphics,GpCoordinateSpace pDestSpace,GpCoordinateSpace pSrcSpace,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipTransformPoints'),DLL
      GdipTransformPointsI(LONG pGraphics,GpCoordinateSpace pDestSpace,GpCoordinateSpace pSrcSpace,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipTransformPointsI'),DLL
      GdipGetNearestColor(LONG pGraphics,*GpARGB pColor),GpStatus,PASCAL,NAME('fptr_GdipGetNearestColor'),DLL
      GdipCreateHalftonePalette(),HPALETTE,PASCAL,NAME('fptr_GdipCreateHalftonePalette'),DLL
      GdipDrawLine(LONG pGraphics,LONG pPen,SREAL pX1,SREAL pY1,SREAL pX2,SREAL pY2),GpStatus,PASCAL,NAME('fptr_GdipDrawLine'),DLL
      GdipDrawLineI(LONG pGraphics,LONG pPen,SIGNED pX1,SIGNED pY1,SIGNED pX2,SIGNED pY2),GpStatus,PASCAL,NAME('fptr_GdipDrawLineI'),DLL
      GdipDrawLines(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipDrawLines'),DLL
      GdipDrawLinesI(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipDrawLinesI'),DLL
      GdipDrawArc(LONG pGraphics,LONG pPen,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight,SREAL pStartAngle,SREAL pSweepAngle),GpStatus,PASCAL,NAME('fptr_GdipDrawArc'),DLL
      GdipDrawArcI(LONG pGraphics,LONG pPen,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight,SREAL pStartAngle,SREAL pSweepAngle),GpStatus,PASCAL,NAME('fptr_GdipDrawArcI'),DLL
      GdipDrawBezier(LONG pGraphics,LONG pPen,SREAL pX1,SREAL pY1,SREAL pX2,SREAL pY2,SREAL pX3,SREAL pY3,SREAL pX4,SREAL pY4),GpStatus,PASCAL,NAME('fptr_GdipDrawBezier'),DLL
      GdipDrawBezierI(LONG pGraphics,LONG pPen,SIGNED pX1,SIGNED pY1,SIGNED pX2,SIGNED pY2,SIGNED pX3,SIGNED pY3,SIGNED pX4,SIGNED pY4),GpStatus,PASCAL,NAME('fptr_GdipDrawBezierI'),DLL
      GdipDrawBeziers(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipDrawBeziers'),DLL
      GdipDrawBeziersI(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipDrawBeziersI'),DLL
      GdipDrawRectangle(LONG pGraphics,LONG pPen,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight),GpStatus,PASCAL,NAME('fptr_GdipDrawRectangle'),DLL
      GdipDrawRectangleI(LONG pGraphics,LONG pPen,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight),GpStatus,PASCAL,NAME('fptr_GdipDrawRectangleI'),DLL
      GdipDrawRectangles(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipDrawRectangles'),DLL
      GdipDrawRectanglesI(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipDrawRectanglesI'),DLL
      GdipDrawEllipse(LONG pGraphics,LONG pPen,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight),GpStatus,PASCAL,NAME('fptr_GdipDrawEllipse'),DLL
      GdipDrawEllipseI(LONG pGraphics,LONG pPen,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight),GpStatus,PASCAL,NAME('fptr_GdipDrawEllipseI'),DLL
      GdipDrawPie(LONG pGraphics,LONG pPen,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight,SREAL pStartAngle,SREAL pSweepAngle),GpStatus,PASCAL,NAME('fptr_GdipDrawPie'),DLL
      GdipDrawPieI(LONG pGraphics,LONG pPen,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight,SREAL pStartAngle,SREAL pSweepAngle),GpStatus,PASCAL,NAME('fptr_GdipDrawPieI'),DLL
      GdipDrawPolygon(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipDrawPolygon'),DLL
      GdipDrawPolygonI(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipDrawPolygonI'),DLL
      GdipDrawPath(LONG pGraphics,LONG pPen,LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipDrawPath'),DLL
      GdipDrawCurve(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipDrawCurve'),DLL
      GdipDrawCurve2(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount,SREAL pTension),GpStatus,PASCAL,NAME('fptr_GdipDrawCurve2'),DLL
      GdipDrawCurve3(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount,SIGNED pOffset,UNSIGNED pNumberOfSegments,SREAL pTension),GpStatus,PASCAL,NAME('fptr_GdipDrawCurve3'),DLL
      GdipDrawCurveI(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipDrawCurveI'),DLL
      GdipDrawCurve2I(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount,SREAL pTension),GpStatus,PASCAL,NAME('fptr_GdipDrawCurve2I'),DLL
      GdipDrawCurve3I(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount,SIGNED pOffset,UNSIGNED pNumberOfSegments,SREAL pTension),GpStatus,PASCAL,NAME('fptr_GdipDrawCurve3I'),DLL
      GdipDrawClosedCurve(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipDrawClosedCurve'),DLL
      GdipDrawClosedCurve2(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount,SREAL pTension),GpStatus,PASCAL,NAME('fptr_GdipDrawClosedCurve2'),DLL
      GdipDrawClosedCurveI(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipDrawClosedCurveI'),DLL
      GdipDrawClosedCurve2I(LONG pGraphics,LONG pPen,LONG pPoints,UNSIGNED pCount,SREAL pTension),GpStatus,PASCAL,NAME('fptr_GdipDrawClosedCurve2I'),DLL
      GdipGraphicsClear(LONG pGraphics,GpARGB pColor),GpStatus,PASCAL,NAME('fptr_GdipGraphicsClear'),DLL
      GdipFillRectangle(LONG pGraphics,LONG pBrush,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight),GpStatus,PASCAL,NAME('fptr_GdipFillRectangle'),DLL
      GdipFillRectangleI(LONG pGraphics,LONG pBrush,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight),GpStatus,PASCAL,NAME('fptr_GdipFillRectangleI'),DLL
      GdipFillRectangles(LONG pGraphics,LONG pBrush,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipFillRectangles'),DLL
      GdipFillRectanglesI(LONG pGraphics,LONG pBrush,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipFillRectanglesI'),DLL
      GdipFillPolygon(LONG pGraphics,LONG pBrush,LONG pPoints,UNSIGNED pCount,GpFillMode pMode),GpStatus,PASCAL,NAME('fptr_GdipFillPolygon'),DLL
      GdipFillPolygonI(LONG pGraphics,LONG pBrush,LONG pPoints,UNSIGNED pCount,GpFillMode pMode),GpStatus,PASCAL,NAME('fptr_GdipFillPolygonI'),DLL
      GdipFillEllipse(LONG pGraphics,LONG pBrush,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight),GpStatus,PASCAL,NAME('fptr_GdipFillEllipse'),DLL
      GdipFillEllipseI(LONG pGraphics,LONG pBrush,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight),GpStatus,PASCAL,NAME('fptr_GdipFillEllipseI'),DLL
      GdipFillPie(LONG pGraphics,LONG pBrush,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight,SREAL pStartAngle,SREAL pSweepAngle),GpStatus,PASCAL,NAME('fptr_GdipFillPie'),DLL
      GdipFillPieI(LONG pGraphics,LONG pBrush,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight,SREAL pStartAngle,SREAL pSweepAngle),GpStatus,PASCAL,NAME('fptr_GdipFillPieI'),DLL
      GdipFillPath(LONG pGraphics,LONG pBrush,LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipFillPath'),DLL
      GdipFillClosedCurve(LONG pGraphics,LONG pBrush,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipFillClosedCurve'),DLL
      GdipFillClosedCurve2(LONG pGraphics,LONG pBrush,LONG pPoints,UNSIGNED pCount,GpFillMode pMode,SREAL pTension),GpStatus,PASCAL,NAME('fptr_GdipFillClosedCurve2'),DLL
      GdipFillClosedCurveI(LONG pGraphics,LONG pBrush,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipFillClosedCurveI'),DLL
      GdipFillClosedCurve2I(LONG pGraphics,LONG pBrush,LONG pPoints,UNSIGNED pCount,GpFillMode pMode,SREAL pTension),GpStatus,PASCAL,NAME('fptr_GdipFillClosedCurve2I'),DLL
      GdipFillRegion(LONG pGraphics,LONG pBrush,LONG pRegion),GpStatus,PASCAL,NAME('fptr_GdipFillRegion'),DLL
      GdipDrawString(LONG pGraphics,LONG pStr,UNSIGNED pLen,LONG pFont,LONG pRect,LONG pFormat,LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipDrawString'),DLL
      GdipMeasureString(LONG pGraphics,LONG pStr,UNSIGNED pLen,LONG pFont,LONG pRect,LONG pFormat,LONG pBoundingBox,*UNSIGNED pCodepointsFitted,*UNSIGNED pLinesFilled),GpStatus,PASCAL,NAME('fptr_GdipMeasureString'),DLL
      GdipDrawCachedBitmap(LONG pGraphics,LONG pCachedBitmap,SIGNED pX,SIGNED pY),GpStatus,PASCAL,NAME('fptr_GdipDrawCachedBitmap'),DLL
      GdipDrawImage(LONG pGraphics,LONG pImage,SREAL pX,SREAL pY),GpStatus,PASCAL,NAME('fptr_GdipDrawImage'),DLL
      GdipDrawImageI(LONG pGraphics,LONG pImage,SIGNED pX,SIGNED pY),GpStatus,PASCAL,NAME('fptr_GdipDrawImageI'),DLL
      GdipDrawImageRect(LONG pGraphics,LONG pImage,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight),GpStatus,PASCAL,NAME('fptr_GdipDrawImageRect'),DLL
      GdipDrawImageRectI(LONG pGraphics,LONG pImage,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight),GpStatus,PASCAL,NAME('fptr_GdipDrawImageRectI'),DLL
      GdipDrawImagePoints(LONG pGraphics,LONG pImage,LONG pDestPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipDrawImagePoints'),DLL
      GdipDrawImagePointsI(LONG pGraphics,LONG pImage,LONG pDestPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipDrawImagePointsI'),DLL
      GdipDrawImagePointRect(LONG pGraphics,LONG pImage,SREAL pX,SREAL pY,SREAL pSrcX,SREAL pSrcY,SREAL pSrcWidth,SREAL pSrcHeight,GpUnit pSrcUnit),GpStatus,PASCAL,NAME('fptr_GdipDrawImagePointRect'),DLL
      GdipDrawImagePointRectI(LONG pGraphics,LONG pImage,SIGNED pX,SIGNED pY,SIGNED pSrcX,SIGNED pSrcY,SIGNED pSrcWidth,SIGNED pSrcHeight,GpUnit pSrcUnit),GpStatus,PASCAL,NAME('fptr_GdipDrawImagePointRectI'),DLL
      GdipDrawImageRectRect(LONG pGraphics,LONG pImage,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight,SREAL pSrcX,SREAL pSrcY,SREAL pSrcWidth,SREAL pSrcHeight,GpUnit pSrcUnit,LONG pImageAttr,LONG pCallback,LONG pCallbackData),GpStatus,PASCAL,NAME('fptr_GdipDrawImageRectRect'),DLL
      GdipDrawImageRectRectI(LONG pGraphics,LONG pImage,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight,SIGNED pSrcX,SIGNED pSrcY,SIGNED pSrcWidth,SIGNED pSrcHeight,GpUnit pSrcUnit,LONG pImageAttr,LONG pCallback,LONG pCallbackData),GpStatus,PASCAL,NAME('fptr_GdipDrawImageRectRectI'),DLL
      GdipDrawImagePointsRect(LONG pGraphics,LONG pImage,LONG pPoints,UNSIGNED pCount,SREAL pSrcX,SREAL pSrcY,SREAL pSrcWidth,SREAL pSrcHeight,GpUnit pSrcUnit,LONG pImageAttr,LONG pCallback,LONG pCallbackData),GpStatus,PASCAL,NAME('fptr_GdipDrawImagePointsRect'),DLL
      GdipDrawImagePointsRectI(LONG pGraphics,LONG pImage,LONG pPoints,UNSIGNED pCount,SIGNED pSrcX,SIGNED pSrcY,SIGNED pSrcWidth,SIGNED pSrcHeight,GpUnit pSrcUnit,LONG pImageAttr,LONG pCallback,LONG pCallbackData),GpStatus,PASCAL,NAME('fptr_GdipDrawImagePointsRectI'),DLL
      GdipDrawImageFX(LONG pGraphics,LONG pImage,LONG pSrcRect,LONG pmatrix,LONG pEffect,LONG pImageAttr,GpUnit pSrcUnit),GpStatus,PASCAL,NAME('fptr_GdipDrawImageFX'),DLL
      GdipSetClipGraphics(LONG pGraphics,LONG pOtherGraphics,GpCombineMode pCombineMode),GpStatus,PASCAL,NAME('fptr_GdipSetClipGraphics'),DLL
      GdipSetClipRect(LONG pGraphics,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight,GpCombineMode pCombineMode),GpStatus,PASCAL,NAME('fptr_GdipSetClipRect'),DLL
      GdipSetClipRectI(LONG pGraphics,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight,GpCombineMode pCombineMode),GpStatus,PASCAL,NAME('fptr_GdipSetClipRectI'),DLL
      GdipSetClipPath(LONG pGraphics,LONG pPath,GpCombineMode pCombineMode),GpStatus,PASCAL,NAME('fptr_GdipSetClipPath'),DLL
      GdipSetClipRegion(LONG pGraphics,LONG pRegion,GpCombineMode pCombineMode),GpStatus,PASCAL,NAME('fptr_GdipSetClipRegion'),DLL
      GdipSetClipHrgn(LONG pGraphics,HRGN pHrgn,GpCombineMode pCombineMode),GpStatus,PASCAL,NAME('fptr_GdipSetClipHrgn'),DLL
      GdipResetClip(LONG pGraphics),GpStatus,PASCAL,NAME('fptr_GdipResetClip'),DLL
      GdipTranslateClip(LONG pGraphics,SREAL pDx,SREAL pDy),GpStatus,PASCAL,NAME('fptr_GdipTranslateClip'),DLL
      GdipTranslateClipI(LONG pGraphics,SREAL pDx,SREAL pDy),GpStatus,PASCAL,NAME('fptr_GdipTranslateClipI'),DLL
      GdipGetClip(LONG pGraphics,*LONG pRegion),GpStatus,PASCAL,NAME('fptr_GdipGetClip'),DLL
      GdipGetClipBounds(LONG pGraphics,LONG pRect),GpStatus,PASCAL,NAME('fptr_GdipGetClipBounds'),DLL
      GdipGetClipBoundsI(LONG pGraphics,LONG pRect),GpStatus,PASCAL,NAME('fptr_GdipGetClipBoundsI'),DLL
      GdipIsClipEmpty(LONG pGraphics,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsClipEmpty'),DLL
      GdipGetVisibleClipBounds(LONG pGraphics,LONG pRect),GpStatus,PASCAL,NAME('fptr_GdipGetVisibleClipBounds'),DLL
      GdipGetVisibleClipBoundsI(LONG pGraphics,LONG pRect),GpStatus,PASCAL,NAME('fptr_GdipGetVisibleClipBoundsI'),DLL
      GdipIsVisibleClipEmpty(LONG pGraphics,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsVisibleClipEmpty'),DLL
      GdipIsVisiblePoint(LONG pGraphics,SREAL pX,SREAL pY,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsVisiblePoint'),DLL
      GdipIsVisiblePointI(LONG pGraphics,SIGNED pX,SIGNED pY,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsVisiblePointI'),DLL
      GdipIsVisibleRect(LONG pGraphics,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsVisibleRect'),DLL
      GdipIsVisibleRectI(LONG pGraphics,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsVisibleRectI'),DLL
      GdipSaveGraphics(LONG pGraphics,*GpGraphicsState pState),GpStatus,PASCAL,NAME('fptr_GdipSaveGraphics'),DLL
      GdipRestoreGraphics(LONG pGraphics,GpGraphicsState pState),GpStatus,PASCAL,NAME('fptr_GdipRestoreGraphics'),DLL
      GdipCreateEffect(_GUID pGuid,*LONG pEffect),GpStatus,RAW,PASCAL,NAME('fptr_GdipCreateEffect'),DLL
      GdipDeleteEffect(LONG pEffect),GpStatus,PASCAL,NAME('fptr_GdipDeleteEffect'),DLL
      GdipGetEffectParameterSize(LONG pEffect,*UNSIGNED pSize),GpStatus,PASCAL,NAME('fptr_GdipGetEffectParameterSize'),DLL
      GdipSetEffectParameters(LONG pEffect,LONG pParams,UNSIGNED pSize),GpStatus,PASCAL,NAME('fptr_GdipSetEffectParameters'),DLL
      GdipGetEffectParameters(LONG pEffect,*UNSIGNED pSize,LONG pParams),GpStatus,PASCAL,NAME('fptr_GdipGetEffectParameters'),DLL
      GdipCreateMatrix(*LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipCreateMatrix'),DLL
      GdipCreateMatrix2(SREAL pM11,SREAL pM12,SREAL pM21,SREAL pM22,SREAL pDx,SREAL pDy,*LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipCreateMatrix2'),DLL
      GdipCreateMatrix3(LONG pRect,LONG pDstplg,*LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipCreateMatrix3'),DLL
      GdipCreateMatrix3I(LONG pRect,LONG pDstplg,*LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipCreateMatrix3I'),DLL
      GdipDeleteMatrix(LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipDeleteMatrix'),DLL
      GdipCloneMatrix(LONG pMatrix,*LONG pCloneMatrix),GpStatus,PASCAL,NAME('fptr_GdipCloneMatrix'),DLL
      GdipGetMatrixElements(LONG pMatrix,LONG pElements),GpStatus,PASCAL,NAME('fptr_GdipGetMatrixElements'),DLL
      GdipSetMatrixElements(LONG pMatrix,SREAL pM11,SREAL pM12,SREAL pM21,SREAL pM22,SREAL pDx,SREAL pDy),GpStatus,PASCAL,NAME('fptr_GdipSetMatrixElements'),DLL
      GdipMultiplyMatrix(LONG pMatrix,LONG pOtherMatrix,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipMultiplyMatrix'),DLL
      GdipTranslateMatrix(LONG pMatrix,SREAL pOffsetX,SREAL pOffsetY,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipTranslateMatrix'),DLL
      GdipScaleMatrix(LONG pMatrix,SREAL pScaleX,SREAL pScaleY,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipScaleMatrix'),DLL
      GdipRotateMatrix(LONG pMatrix,SREAL pAngle,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipRotateMatrix'),DLL
      GdipShearMatrix(LONG pMatrix,SREAL pShearX,SREAL pShearY,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipShearMatrix'),DLL
      GdipInvertMatrix(LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipInvertMatrix'),DLL
      GdipTransformMatrixPoints(LONG pMatrix,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipTransformMatrixPoints'),DLL
      GdipTransformMatrixPointsI(LONG pMatrix,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipTransformMatrixPointsI'),DLL
      GdipVectorTransformMatrixPoints(LONG pMatrix,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipVectorTransformMatrixPoints'),DLL
      GdipVectorTransformMatrixPointsI(LONG pMatrix,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipVectorTransformMatrixPointsI'),DLL
      GdipIsMatrixInvertible(LONG pMatrix,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsMatrixInvertible'),DLL
      GdipIsMatrixIdentity(LONG pMatrix,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsMatrixIdentity'),DLL
      GdipIsMatrixEqual(LONG pMatrix,LONG pOtherMatrix,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsMatrixEqual'),DLL
      GdipCreateFontFromDC(HDC phdc,*LONG pFont),GpStatus,PASCAL,NAME('fptr_GdipCreateFontFromDC'),DLL
      GdipCreateFontFromLogfontA(HDC phdc,LONG pLf,*LONG pFont),GpStatus,PASCAL,NAME('fptr_GdipCreateFontFromLogfontA'),DLL
      GdipCreateFont(LONG pFamily,SREAL pEmSize,UNSIGNED pStyle,GpUnit pUnit,*LONG pFont),GpStatus,PASCAL,NAME('fptr_GdipCreateFont'),DLL
      GdipGetLogFontA(LONG pFont,LONG pGraphics,LONG pLogFont),GpStatus,PASCAL,NAME('fptr_GdipGetLogFontA'),DLL
      GdipCloneFont(LONG pFont,*LONG pCloneFont),GpStatus,PASCAL,NAME('fptr_GdipCloneFont'),DLL
      GdipDeleteFont(LONG pFont),GpStatus,PASCAL,NAME('fptr_GdipDeleteFont'),DLL
      GdipGetFamily(LONG pFont,*LONG pFamily),GpStatus,PASCAL,NAME('fptr_GdipGetFamily'),DLL
      GdipGetFontStyle(LONG pFont,*UNSIGNED pStyle),GpStatus,PASCAL,NAME('fptr_GdipGetFontStyle'),DLL
      GdipGetFontSize(LONG pFont,*SREAL pSize),GpStatus,PASCAL,NAME('fptr_GdipGetFontSize'),DLL
      GdipGetFontUnit(LONG pFont,*GpUnit pUnit),GpStatus,PASCAL,NAME('fptr_GdipGetFontUnit'),DLL
      GdipGetFontHeight(LONG pFont,LONG pGraphics,*SREAL pHeight),GpStatus,PASCAL,NAME('fptr_GdipGetFontHeight'),DLL
      GdipGetFontHeightGivenDPI(LONG pFont,SREAL pDpi,*SREAL pHeight),GpStatus,PASCAL,NAME('fptr_GdipGetFontHeightGivenDPI'),DLL
      GdipCreateFontFamilyFromName(LONG pName,LONG pFontCollection,*LONG pFamily),GpStatus,PASCAL,NAME('fptr_GdipCreateFontFamilyFromName'),DLL
      GdipGetGenericFontFamilySansSerif(*LONG pFamily),GpStatus,PASCAL,NAME('fptr_GdipGetGenericFontFamilySansSerif'),DLL
      GdipGetGenericFontFamilySerif(*LONG pFamily),GpStatus,PASCAL,NAME('fptr_GdipGetGenericFontFamilySerif'),DLL
      GdipGetGenericFontFamilyMonospace(*LONG pFamily),GpStatus,PASCAL,NAME('fptr_GdipGetGenericFontFamilyMonospace'),DLL
      GdipDeleteFontFamily(LONG pFamily),GpStatus,PASCAL,NAME('fptr_GdipDeleteFontFamily'),DLL
      GdipCloneFontFamily(LONG pFamily,*LONG pCloneFamily),GpStatus,PASCAL,NAME('fptr_GdipCloneFontFamily'),DLL
      GdipGetFamilyName(LONG pFamily,LONG pName,*USHORT pLanguage),GpStatus,PASCAL,NAME('fptr_GdipGetFamilyName'),DLL
      GdipIsStyleAvailable(LONG pFamily,UNSIGNED pStyle,*BOOL pIsAvailable),GpStatus,PASCAL,NAME('fptr_GdipIsStyleAvailable'),DLL
      GdipGetEmHeight(LONG pFamily,UNSIGNED pStyle,*USHORT pEmHeight),GpStatus,PASCAL,NAME('fptr_GdipGetEmHeight'),DLL
      GdipGetCellAscent(LONG pFamily,UNSIGNED pStyle,*USHORT pCellAscent),GpStatus,PASCAL,NAME('fptr_GdipGetCellAscent'),DLL
      GdipGetCellDescent(LONG pFamily,UNSIGNED pStyle,*USHORT pCellDescent),GpStatus,PASCAL,NAME('fptr_GdipGetCellDescent'),DLL
      GdipGetLineSpacing(LONG pFamily,UNSIGNED pStyle,*USHORT pLineSpacing),GpStatus,PASCAL,NAME('fptr_GdipGetLineSpacing'),DLL
      GdipGetFontCollectionFamilyCount(LONG pFontCollection,*UNSIGNED pNumFound),GpStatus,PASCAL,NAME('fptr_GdipGetFontCollectionFamilyCount'),DLL
      GdipGetFontCollectionFamilyList(LONG pFontCollection,UNSIGNED pNumSought,LONG pFamilyList,*UNSIGNED pNumFound),GpStatus,PASCAL,NAME('fptr_GdipGetFontCollectionFamilyList'),DLL
      GdipNewInstalledFontCollection(*LONG pFontCollection),GpStatus,PASCAL,NAME('fptr_GdipNewInstalledFontCollection'),DLL
      GdipNewPrivateFontCollection(*LONG pFontCollection),GpStatus,PASCAL,NAME('fptr_GdipNewPrivateFontCollection'),DLL
      GdipDeletePrivateFontCollection(LONG pFontCollection),GpStatus,PASCAL,NAME('fptr_GdipDeletePrivateFontCollection'),DLL
      GdipPrivateAddFontFile(LONG pFontCollection,LONG pFileName),GpStatus,PASCAL,NAME('fptr_GdipPrivateAddFontFile'),DLL
      GdipCreatePath(GpFillMode pFillMode,*LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipCreatePath'),DLL
      GdipCreatePath2(LONG pPoints,LONG pTypes,UNSIGNED pCount,GpFillMode pFillMode,*LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipCreatePath2'),DLL
      GdipCreatePath2I(LONG pPoints,LONG pTypes,UNSIGNED pCount,GpFillMode pFillMode,*LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipCreatePath2I'),DLL
      GdipDeletePath(LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipDeletePath'),DLL
      GdipClonePath(LONG pPath,*LONG pClonePath),GpStatus,PASCAL,NAME('fptr_GdipClonePath'),DLL
      GdipResetPath(LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipResetPath'),DLL
      GdipGetPathFillMode(LONG pPath,*GpFillMode pFillMode),GpStatus,PASCAL,NAME('fptr_GdipGetPathFillMode'),DLL
      GdipSetPathFillMode(LONG pPath,GpFillMode pFillMode),GpStatus,PASCAL,NAME('fptr_GdipSetPathFillMode'),DLL
      GdipGetPathData(LONG pPath,LONG pPathData),GpStatus,PASCAL,NAME('fptr_GdipGetPathData'),DLL
      GdipStartPathFigure(LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipStartPathFigure'),DLL
      GdipClosePathFigure(LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipClosePathFigure'),DLL
      GdipClosePathFigures(LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipClosePathFigures'),DLL
      GdipSetPathMarker(LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipSetPathMarker'),DLL
      GdipClearPathMarkers(LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipClearPathMarkers'),DLL
      GdipReversePath(LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipReversePath'),DLL
      GdipGetPathLastPoint(LONG pPath,LONG pLastPoint),GpStatus,PASCAL,NAME('fptr_GdipGetPathLastPoint'),DLL
      GdipAddPathLine(LONG pPath,SREAL px1,SREAL py1,SREAL px2,SREAL py2),GpStatus,PASCAL,NAME('fptr_GdipAddPathLine'),DLL
      GdipAddPathLine2(LONG pPath,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipAddPathLine2'),DLL
      GdipAddPathLineI(LONG pPath,SIGNED px1,SIGNED py1,SIGNED px2,SIGNED py2),GpStatus,PASCAL,NAME('fptr_GdipAddPathLineI'),DLL
      GdipAddPathLine2I(LONG pPath,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipAddPathLine2I'),DLL
      GdipAddPathArc(LONG pPath,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight,SREAL pStartAngle,SREAL pSweepAngle),GpStatus,PASCAL,NAME('fptr_GdipAddPathArc'),DLL
      GdipAddPathArcI(LONG pPath,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight,SREAL pStartAngle,SREAL pSweepAngle),GpStatus,PASCAL,NAME('fptr_GdipAddPathArcI'),DLL
      GdipAddPathBezier(LONG pPath,SREAL px1,SREAL py1,SREAL px2,SREAL py2,SREAL px3,SREAL py3,SREAL px4,SREAL py4),GpStatus,PASCAL,NAME('fptr_GdipAddPathBezier'),DLL
      GdipAddPathBeziers(LONG pPath,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipAddPathBeziers'),DLL
      GdipAddPathBezierI(LONG pPath,SIGNED px1,SIGNED py1,SIGNED px2,SIGNED py2,SIGNED px3,SIGNED py3,SIGNED px4,SIGNED py4),GpStatus,PASCAL,NAME('fptr_GdipAddPathBezierI'),DLL
      GdipAddPathBeziersI(LONG pPath,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipAddPathBeziersI'),DLL
      GdipAddPathCurve(LONG pPath,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipAddPathCurve'),DLL
      GdipAddPathCurve2(LONG pPath,LONG pPoints,UNSIGNED pCount,SREAL pTension),GpStatus,PASCAL,NAME('fptr_GdipAddPathCurve2'),DLL
      GdipAddPathCurve3(LONG pPath,LONG pPoints,UNSIGNED pCount,SIGNED pOffset,UNSIGNED pNumberOfSegments,SREAL pTension),GpStatus,PASCAL,NAME('fptr_GdipAddPathCurve3'),DLL
      GdipAddPathCurveI(LONG pPath,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipAddPathCurveI'),DLL
      GdipAddPathCurve2I(LONG pPath,LONG pPoints,UNSIGNED pCount,SREAL pTension),GpStatus,PASCAL,NAME('fptr_GdipAddPathCurve2I'),DLL
      GdipAddPathCurve3I(LONG pPath,LONG pPoints,UNSIGNED pCount,SIGNED pOffset,UNSIGNED pNumberOfSegments,SREAL pTension),GpStatus,PASCAL,NAME('fptr_GdipAddPathCurve3I'),DLL
      GdipAddPathClosedCurve(LONG pPath,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipAddPathClosedCurve'),DLL
      GdipAddPathClosedCurve2(LONG pPath,LONG pPoints,UNSIGNED pCount,SREAL pTension),GpStatus,PASCAL,NAME('fptr_GdipAddPathClosedCurve2'),DLL
      GdipAddPathClosedCurveI(LONG pPath,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipAddPathClosedCurveI'),DLL
      GdipAddPathClosedCurve2I(LONG pPath,LONG pPoints,UNSIGNED pCount,SREAL pTension),GpStatus,PASCAL,NAME('fptr_GdipAddPathClosedCurve2I'),DLL
      GdipAddPathRectangle(LONG pPath,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight),GpStatus,PASCAL,NAME('fptr_GdipAddPathRectangle'),DLL
      GdipAddPathRectangles(LONG pPath,LONG pRects,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipAddPathRectangles'),DLL
      GdipAddPathRectangleI(LONG pPath,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight),GpStatus,PASCAL,NAME('fptr_GdipAddPathRectangleI'),DLL
      GdipAddPathRectanglesI(LONG pPath,LONG pRects,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipAddPathRectanglesI'),DLL
      GdipAddPathEllipse(LONG pPath,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight),GpStatus,PASCAL,NAME('fptr_GdipAddPathEllipse'),DLL
      GdipAddPathEllipseI(LONG pPath,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight),GpStatus,PASCAL,NAME('fptr_GdipAddPathEllipseI'),DLL
      GdipAddPathPie(LONG pPath,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight,SREAL pStartAngle,SREAL pSweepAngle),GpStatus,PASCAL,NAME('fptr_GdipAddPathPie'),DLL
      GdipAddPathPieI(LONG pPath,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight,SREAL pStartAngle,SREAL pSweepAngle),GpStatus,PASCAL,NAME('fptr_GdipAddPathPieI'),DLL
      GdipAddPathPolygon(LONG pPath,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipAddPathPolygon'),DLL
      GdipAddPathPolygonI(LONG pPath,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipAddPathPolygonI'),DLL
      GdipAddPathPath(LONG pPath,LONG pPath2,BOOL pConnect),GpStatus,PASCAL,NAME('fptr_GdipAddPathPath'),DLL
      GdipAddPathString(LONG pPath,LONG pStr,UNSIGNED pLength,LONG pFamily,UNSIGNED pStyle,SREAL pEmSize,LONG pRect,LONG pFormat),GpStatus,PASCAL,NAME('fptr_GdipAddPathString'),DLL
      GdipAddPathStringI(LONG pPath,LONG pStr,UNSIGNED pLength,LONG pFamily,UNSIGNED pStyle,SREAL pEmSize,LONG pRect,LONG pFormat),GpStatus,PASCAL,NAME('fptr_GdipAddPathStringI'),DLL
      GdipTransformPath(LONG pPath,LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipTransformPath'),DLL
      GdipFlattenPath(LONG pPath,LONG pMatrix,SREAL pFlatness),GpStatus,PASCAL,NAME('fptr_GdipFlattenPath'),DLL
      GdipWidenPath(LONG pPath,LONG pPen,LONG pMatrix,SREAL pFlatness),GpStatus,PASCAL,NAME('fptr_GdipWidenPath'),DLL
      GdipWindingModeOutline(LONG pPath,LONG pMatrix,SREAL pFlatness),GpStatus,PASCAL,NAME('fptr_GdipWindingModeOutline'),DLL
      GdipWarpPath(LONG pPath,LONG pMatrix,LONG pDestPonts, UNSIGNED pCount,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight,GpWarpMode pWarpMode,SREAL pFlatness),GpStatus,PASCAL,NAME('fptr_GdipWarpPath'),DLL
      GdipGetPointCount(LONG pPath,*UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPointCount'),DLL
      GdipGetPathTypes(LONG pPath,LONG pTypes,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPathTypes'),DLL
      GdipGetPathPoints(LONG pPath,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPathPoints'),DLL
      GdipGetPathPointsI(LONG pPath,LONG pPoints,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPathPointsI'),DLL
      GdipGetPathWorldBounds(LONG pPath,LONG pBounds,LONG pMatrix,LONG pPen),GpStatus,PASCAL,NAME('fptr_GdipGetPathWorldBounds'),DLL
      GdipGetPathWorldBoundsI(LONG pPath,LONG pBounds,LONG pMatrix,LONG pPen),GpStatus,PASCAL,NAME('fptr_GdipGetPathWorldBoundsI'),DLL
      GdipIsVisiblePathPoint(LONG pPath,SREAL pX,SREAL pY,LONG pGraphics,*BOOL pVal),GpStatus,PASCAL,NAME('fptr_GdipIsVisiblePathPoint'),DLL
      GdipIsVisiblePathPointI(LONG pPath,SIGNED pX,SIGNED pY,LONG pGraphics,*BOOL pVal),GpStatus,PASCAL,NAME('fptr_GdipIsVisiblePathPointI'),DLL
      GdipIsOutlineVisiblePathPoint(LONG pPath,SREAL pX,SREAL pY,LONG pPen,LONG pGraphics,*BOOL pVal),GpStatus,PASCAL,NAME('fptr_GdipIsOutlineVisiblePathPoint'),DLL
      GdipIsOutlineVisiblePathPointI(LONG pPath,SIGNED pX,SIGNED pY,LONG pPen,LONG pGraphics,*BOOL pVal),GpStatus,PASCAL,NAME('fptr_GdipIsOutlineVisiblePathPointI'),DLL
      GdipCreatePen1(GpARGB pColor,SREAL pWidth,GpUnit pUnit,*LONG pPen),GpStatus,PASCAL,NAME('fptr_GdipCreatePen1'),DLL
      GdipCreatePen2(LONG pBrush,SREAL pWidth,GpUnit pUnit,*LONG pPen),GpStatus,PASCAL,NAME('fptr_GdipCreatePen2'),DLL
      GdipDeletePen(LONG pPen),GpStatus,PASCAL,NAME('fptr_GdipDeletePen'),DLL
      GdipClonePen(LONG pPen,*LONG pClonePen),GpStatus,PASCAL,NAME('fptr_GdipClonePen'),DLL
      GdipSetPenWidth(LONG pPen,SREAL pWidth),GpStatus,PASCAL,NAME('fptr_GdipSetPenWidth'),DLL
      GdipGetPenWidth(LONG pPen,*SREAL pWidth),GpStatus,PASCAL,NAME('fptr_GdipGetPenWidth'),DLL
      GdipSetPenLineCap197819(LONG pPen,GpLineCap pStartCap,GpLineCap pEndCap,GpDashCap pDashCap),GpStatus,PASCAL,NAME('fptr_GdipSetPenLineCap197819'),DLL
      GdipSetPenStartCap(LONG pPen,GpLineCap pStartCap),GpStatus,PASCAL,NAME('fptr_GdipSetPenStartCap'),DLL
      GdipSetPenEndCap(LONG pPen,GpLineCap pEndCap),GpStatus,PASCAL,NAME('fptr_GdipSetPenEndCap'),DLL
      GdipSetPenDashCap197819(LONG pPen,GpDashCap pDashCap),GpStatus,PASCAL,NAME('fptr_GdipSetPenDashCap197819'),DLL
      GdipGetPenStartCap(LONG pPen,*GpLineCap pStartCap),GpStatus,PASCAL,NAME('fptr_GdipGetPenStartCap'),DLL
      GdipGetPenEndCap(LONG pPen,*GpLineCap pEndCap),GpStatus,PASCAL,NAME('fptr_GdipGetPenEndCap'),DLL
      GdipGetPenDashCap197819(LONG pPen,*GpDashCap pDashCap),GpStatus,PASCAL,NAME('fptr_GdipGetPenDashCap197819'),DLL
      GdipSetPenLineJoin(LONG pPen,GpLineJoin pLineJoin),GpStatus,PASCAL,NAME('fptr_GdipSetPenLineJoin'),DLL
      GdipGetPenLineJoin(LONG pPen,*GpLineJoin pLineJoin),GpStatus,PASCAL,NAME('fptr_GdipGetPenLineJoin'),DLL
      GdipSetPenCustomStartCap(LONG pPen,LONG pCap),GpStatus,PASCAL,NAME('fptr_GdipSetPenCustomStartCap'),DLL
      GdipGetPenCustomStartCap(LONG pPen,*LONG pCap),GpStatus,PASCAL,NAME('fptr_GdipGetPenCustomStartCap'),DLL
      GdipSetPenCustomEndCap(LONG pPen,LONG pCap),GpStatus,PASCAL,NAME('fptr_GdipSetPenCustomEndCap'),DLL
      GdipGetPenCustomEndCap(LONG pPen,*LONG pCap),GpStatus,PASCAL,NAME('fptr_GdipGetPenCustomEndCap'),DLL
      GdipSetPenMiterLimit(LONG pPen,SREAL pLimit),GpStatus,PASCAL,NAME('fptr_GdipSetPenMiterLimit'),DLL
      GdipGetPenMiterLimit(LONG pPen,*SREAL pLimit),GpStatus,PASCAL,NAME('fptr_GdipGetPenMiterLimit'),DLL
      GdipSetPenMode(LONG pPen,GpPenAlignment pPenAlignment),GpStatus,PASCAL,NAME('fptr_GdipSetPenMode'),DLL
      GdipGetPenMode(LONG pPen,*GpPenAlignment pPenAlignment),GpStatus,PASCAL,NAME('fptr_GdipGetPenMode'),DLL
      GdipSetPenTransform(LONG pPen,LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipSetPenTransform'),DLL
      GdipGetPenTransform(LONG pPen,*LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipGetPenTransform'),DLL
      GdipResetPenTransform(LONG pPen),GpStatus,PASCAL,NAME('fptr_GdipResetPenTransform'),DLL
      GdipMultiplyPenTransform(LONG pPen,LONG pMatrix,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipMultiplyPenTransform'),DLL
      GdipTranslatePenTransform(LONG pPen,SREAL pdx,SREAL pdy,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipTranslatePenTransform'),DLL
      GdipScalePenTransform(LONG pPen,SREAL psx,SREAL psy,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipScalePenTransform'),DLL
      GdipRotatePenTransform(LONG pPen,SREAL pAngle,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipRotatePenTransform'),DLL
      GdipGetPenFillType(LONG pPen,*GpPenType pType),GpStatus,PASCAL,NAME('fptr_GdipGetPenFillType'),DLL
      GdipSetPenColor(LONG pPen,GpARGB pColor),GpStatus,PASCAL,NAME('fptr_GdipSetPenColor'),DLL
      GdipSetPenBrushFill(LONG pPen,LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipSetPenBrushFill'),DLL
      GdipGetPenColor(LONG pPen,*GpARGB pColor),GpStatus,PASCAL,NAME('fptr_GdipGetPenColor'),DLL
      GdipGetPenBrushFill(LONG pPen,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipGetPenBrushFill'),DLL
      GdipGetPenDashStyle(LONG pPen,*GpDashStyle pStyle),GpStatus,PASCAL,NAME('fptr_GdipGetPenDashStyle'),DLL
      GdipSetPenDashStyle(LONG pPen,GpDashStyle pStyle),GpStatus,PASCAL,NAME('fptr_GdipSetPenDashStyle'),DLL
      GdipGetPenDashOffset(LONG pPen,*SREAL pOffset),GpStatus,PASCAL,NAME('fptr_GdipGetPenDashOffset'),DLL
      GdipSetPenDashOffset(LONG pPen,SREAL pOffset),GpStatus,PASCAL,NAME('fptr_GdipSetPenDashOffset'),DLL
      GdipSetPenDashArray(LONG pPen,LONG pArray,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipSetPenDashArray'),DLL
      GdipGetPenDashCount(LONG pPen,*UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPenDashCount'),DLL
      GdipGetPenDashArray(LONG pPen,LONG pArray,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPenDashArray'),DLL
      GdipSetPenCompoundArray(LONG pPen,LONG pArray,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipSetPenCompoundArray'),DLL
      GdipGetPenCompoundCount(LONG pPen,*UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPenCompoundCount'),DLL
      GdipGetPenCompoundArray(LONG pPen,LONG pArray,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPenCompoundArray'),DLL
      GdipDeleteBrush(LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipDeleteBrush'),DLL
      GdipCloneBrush(LONG pBrush,*LONG pCloneBrush),GpStatus,PASCAL,NAME('fptr_GdipCloneBrush'),DLL
      GdipGetBrushType(LONG pBrush,*GpBrushType pType),GpStatus,PASCAL,NAME('fptr_GdipGetBrushType'),DLL
      GdipCreateSolidFill(GpARGB pColor,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreateSolidFill'),DLL
      GdipGetSolidFillColor(LONG pBrush,*GpARGB pColor),GpStatus,PASCAL,NAME('fptr_GdipGetSolidFillColor'),DLL
      GdipSetSolidFillColor(LONG pBrush,GpARGB pColor),GpStatus,PASCAL,NAME('fptr_GdipSetSolidFillColor'),DLL
      GdipCreateTexture(LONG pImage,GpWrapMode pMode,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreateTexture'),DLL
      GdipCreateTexture2(LONG pImage,GpWrapMode pMode,SREAL px,SREAL py,SREAL pwidth,SREAL pheight,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreateTexture2'),DLL
      GdipCreateTexture2I(LONG pImage,GpWrapMode pMode,SIGNED px,SIGNED py,SIGNED pwidth,SIGNED pheight,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreateTexture2I'),DLL
      GdipCreateTextureIA(LONG pImage,LONG pImageAttr,SREAL px,SREAL py,SREAL pwidth,SREAL pheight,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreateTextureIA'),DLL
      GdipCreateTextureIAI(LONG pImage,LONG pImageAttr,SIGNED px,SIGNED py,SIGNED pwidth,SIGNED pheight,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreateTextureIAI'),DLL
      GdipSetTextureTransform(LONG pBrush,LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipSetTextureTransform'),DLL
      GdipGetTextureTransform(LONG pBrush,*LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipGetTextureTransform'),DLL
      GdipResetTextureTransform(LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipResetTextureTransform'),DLL
      GdipMultiplyTextureTransform(LONG pBrush,LONG pMatrix,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipMultiplyTextureTransform'),DLL
      GdipTranslateTextureTransform(LONG pBrush,SREAL pdx,SREAL pdy,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipTranslateTextureTransform'),DLL
      GdipScaleTextureTransform(LONG pBrush,SREAL psx,SREAL psy,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipScaleTextureTransform'),DLL
      GdipRotateTextureTransform(LONG pBrush,SREAL pAngle,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipRotateTextureTransform'),DLL
      GdipSetTextureWrapMode(LONG pBrush,GpWrapMode pMode),GpStatus,PASCAL,NAME('fptr_GdipSetTextureWrapMode'),DLL
      GdipGetTextureWrapMode(LONG pBrush,*GpWrapMode pMode),GpStatus,PASCAL,NAME('fptr_GdipGetTextureWrapMode'),DLL
      GdipGetTextureImage(LONG pBrush,*LONG pImage),GpStatus,PASCAL,NAME('fptr_GdipGetTextureImage'),DLL
      GdipCreateLineBrush(LONG pPt1,LONG pPt2,GpARGB pColor1,GpARGB pColor2,GpWrapMode pWrapMode,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreateLineBrush'),DLL
      GdipCreateLineBrushI(LONG pPt1,LONG pPt2,GpARGB pColor1,GpARGB pColor2,GpWrapMode pWrapMode,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreateLineBrushI'),DLL
      GdipCreateLineBrushFromRect(LONG pRect,GpARGB pColor1,GpARGB pColor2,GpLinearGradientMode pLinearGradientMode,GpWrapMode pWrapMode,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreateLineBrushFromRect'),DLL
      GdipCreateLineBrushFromRectI(LONG pRect,GpARGB pColor1,GpARGB pColor2,GpLinearGradientMode pLinearGradientMode,GpWrapMode pWrapMode,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreateLineBrushFromRectI'),DLL
      GdipCreateLineBrushFromRectWithAngle(LONG pRect,GpARGB pColor1,GpARGB pColor2,REAL pAngle,BOOL pIsAngleScalable,GpWrapMode pWrapMode,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreateLineBrushFromRectWithAngle'),DLL
      GdipCreateLineBrushFromRectWithAngleI(LONG pRect,GpARGB pColor1,GpARGB pColor2,REAL pAngle,BOOL pIsAngleScalable,GpWrapMode pWrapMode,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreateLineBrushFromRectWithAngleI'),DLL
      GdipSetLineColors(LONG pBrush,GpARGB pColor1,GpARGB pColor2),GpStatus,PASCAL,NAME('fptr_GdipSetLineColors'),DLL
      GdipGetLineColors(LONG pBrush,LONG pColors),GpStatus,PASCAL,NAME('fptr_GdipGetLineColors'),DLL
      GdipGetLineRect(LONG pBrush,LONG pRect),GpStatus,PASCAL,NAME('fptr_GdipGetLineRect'),DLL
      GdipGetLineRectI(LONG pBrush,LONG pRect),GpStatus,PASCAL,NAME('fptr_GdipGetLineRectI'),DLL
      GdipSetLineGammaCorrection(LONG pBrush,BOOL pUseGammaCorrection),GpStatus,PASCAL,NAME('fptr_GdipSetLineGammaCorrection'),DLL
      GdipGetLineGammaCorrection(LONG pBrush,*BOOL pUseGammaCorrection),GpStatus,PASCAL,NAME('fptr_GdipGetLineGammaCorrection'),DLL
      GdipGetLineBlendCount(LONG pBrush,*UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetLineBlendCount'),DLL
      GdipSetLineBlend(LONG pBrush,LONG pBlendFactors,LONG pBlendPositions,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipSetLineBlend'),DLL
      GdipGetLineBlend(LONG pBrush,LONG pBlendFactors,LONG pBlendPositions,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetLineBlend'),DLL
      GdipGetLinePresetBlendCount(LONG pBrush,*UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetLinePresetBlendCount'),DLL
      GdipSetLinePresetBlend(LONG pBrush,LONG pColors,LONG pBlendPositions,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipSetLinePresetBlend'),DLL
      GdipGetLinePresetBlend(LONG pBrush,LONG pColors,LONG pBlendPositions,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetLinePresetBlend'),DLL
      GdipSetLineSigmaBlend(LONG pBrush,SREAL pFocus,SREAL pScale),GpStatus,PASCAL,NAME('fptr_GdipSetLineSigmaBlend'),DLL
      GdipSetLineLinearBlend(LONG pBrush,SREAL pFocus,SREAL pScale),GpStatus,PASCAL,NAME('fptr_GdipSetLineLinearBlend'),DLL
      GdipSetLineTransform(LONG pBrush,LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipSetLineTransform'),DLL
      GdipGetLineTransform(LONG pBrush,*LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipGetLineTransform'),DLL
      GdipResetLineTransform(LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipResetLineTransform'),DLL
      GdipMultiplyLineTransform(LONG pBrush,LONG pMatrix,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipMultiplyLineTransform'),DLL
      GdipTranslateLineTransform(LONG pBrush,SREAL pDx,SREAL pDy,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipTranslateLineTransform'),DLL
      GdipScaleLineTransform(LONG pBrush,SREAL pSx,SREAL pSy,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipScaleLineTransform'),DLL
      GdipRotateLineTransform(LONG pBrush,SREAL pAngle,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipRotateLineTransform'),DLL
      GdipSetLineWrapMode(LONG pBrush,GpWrapMode pWrapMode),GpStatus,PASCAL,NAME('fptr_GdipSetLineWrapMode'),DLL
      GdipGetLineWrapMode(LONG pBrush,*GpWrapMode pWrapMode),GpStatus,PASCAL,NAME('fptr_GdipGetLineWrapMode'),DLL
      GdipCreateHatchBrush(GpHatchStyle pHatchStyle,GpARGB pForeColor,GpARGB pBackColor,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreateHatchBrush'),DLL
      GdipGetHatchStyle(LONG pBrush,*GpHatchStyle pHatchStyle),GpStatus,PASCAL,NAME('fptr_GdipGetHatchStyle'),DLL
      GdipGetHatchForegroundColor(LONG pBrush,*GpARGB pColor),GpStatus,PASCAL,NAME('fptr_GdipGetHatchForegroundColor'),DLL
      GdipGetHatchBackgroundColor(LONG pBrush,*GpARGB pColor),GpStatus,PASCAL,NAME('fptr_GdipGetHatchBackgroundColor'),DLL
      GdipCreateRegion(*LONG pRegion),GpStatus,PASCAL,NAME('fptr_GdipCreateRegion'),DLL
      GdipCreateRegionRect(LONG pRect,*LONG pRegion),GpStatus,PASCAL,NAME('fptr_GdipCreateRegionRect'),DLL
      GdipCreateRegionRectI(LONG pRect,*LONG pRegion),GpStatus,PASCAL,NAME('fptr_GdipCreateRegionRectI'),DLL
      GdipCreateRegionPath(LONG pPath,*LONG pRegion),GpStatus,PASCAL,NAME('fptr_GdipCreateRegionPath'),DLL
      GdipCreateRegionRgnData(LONG pData,UNSIGNED pSize,*LONG pRegion),GpStatus,PASCAL,NAME('fptr_GdipCreateRegionRgnData'),DLL
      GdipCreateRegionHrgn(HRGN pHrgn,*LONG pRegion),GpStatus,PASCAL,NAME('fptr_GdipCreateRegionHrgn'),DLL
      GdipDeleteRegion(LONG pRegion),GpStatus,PASCAL,NAME('fptr_GdipDeleteRegion'),DLL
      GdipCloneRegion(LONG pRegion,*LONG pCloneRegion),GpStatus,PASCAL,NAME('fptr_GdipCloneRegion'),DLL
      GdipSetInfinite(LONG pRegion),GpStatus,PASCAL,NAME('fptr_GdipSetInfinite'),DLL
      GdipSetEmpty(LONG pRegion),GpStatus,PASCAL,NAME('fptr_GdipSetEmpty'),DLL
      GdipCombineRegionRect(LONG pRegion,LONG pRect,GpCombineMode pMode),GpStatus,PASCAL,NAME('fptr_GdipCombineRegionRect'),DLL
      GdipCombineRegionRectI(LONG pRegion,LONG pRect,GpCombineMode pMode),GpStatus,PASCAL,NAME('fptr_GdipCombineRegionRectI'),DLL
      GdipCombineRegionPath(LONG pRegion,LONG pPath,GpCombineMode pMode),GpStatus,PASCAL,NAME('fptr_GdipCombineRegionPath'),DLL
      GdipCombineRegionRegion(LONG pRegion,LONG pOtherRegion,GpCombineMode pMode),GpStatus,PASCAL,NAME('fptr_GdipCombineRegionRegion'),DLL
      GdipTranslateRegion(LONG pRegion,SREAL pdx,SREAL pdy),GpStatus,PASCAL,NAME('fptr_GdipTranslateRegion'),DLL
      GdipTranslateRegionI(LONG pRegion,SIGNED pdx,SIGNED pdy),GpStatus,PASCAL,NAME('fptr_GdipTranslateRegionI'),DLL
      GdipTransformRegion(LONG pRegion,LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipTransformRegion'),DLL
      GdipGetRegionBounds(LONG pRegion,LONG pPath,LONG pRect),GpStatus,PASCAL,NAME('fptr_GdipGetRegionBounds'),DLL
      GdipGetRegionBoundsI(LONG pRegion,LONG pPath,LONG pRect),GpStatus,PASCAL,NAME('fptr_GdipGetRegionBoundsI'),DLL
      GdipGetRegionHRgn(LONG pRegion,LONG pPath,*HRGN phrgn),GpStatus,PASCAL,NAME('fptr_GdipGetRegionHRgn'),DLL
      GdipIsEmptyRegion(LONG pRegion,LONG pPath,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsEmptyRegion'),DLL
      GdipIsInfiniteRegion(LONG pRegion,LONG pPath,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsInfiniteRegion'),DLL
      GdipIsEqualRegion(LONG pRegion,LONG pOtherRegion,LONG pPath,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsEqualRegion'),DLL
      GdipGetRegionDataSize(LONG pRegion,*UNSIGNED pBufferSize),GpStatus,PASCAL,NAME('fptr_GdipGetRegionDataSize'),DLL
      GdipGetRegionData(LONG pRegion,LONG pBuffer,UNSIGNED pBufferSize,*UNSIGNED pSizeFilled),GpStatus,PASCAL,NAME('fptr_GdipGetRegionData'),DLL
      GdipIsVisibleRegionPoint(LONG pRegion,SREAL pX,SREAL pY,LONG pPath,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsVisibleRegionPoint'),DLL
      GdipIsVisibleRegionPointI(LONG pRegion,SIGNED pX,SIGNED pY,LONG pPath,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsVisibleRegionPointI'),DLL
      GdipIsVisibleRegionRect(LONG pRegion,SREAL pX,SREAL pY,SREAL pWidth,SREAL pHeight,LONG pPath,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsVisibleRegionRect'),DLL
      GdipIsVisibleRegionRectI(LONG pRegion,SIGNED pX,SIGNED pY,SIGNED pWidth,SIGNED pHeight,LONG pPath,*BOOL pRes),GpStatus,PASCAL,NAME('fptr_GdipIsVisibleRegionRectI'),DLL
      GdipGetRegionScansCount(LONG pRegion,*UNSIGNED pCount,LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipGetRegionScansCount'),DLL
      GdipGetRegionScans(LONG pRegion,LONG pRects,*UNSIGNED pCount,LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipGetRegionScans'),DLL
      GdipGetRegionScansI(LONG pRegion,LONG pRects,*UNSIGNED pCount,LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipGetRegionScansI'),DLL
      GdipCreateCachedBitmap(LONG pBitmap,LONG pGraphics,*LONG pCachedBitmap),GpStatus,PASCAL,NAME('fptr_GdipCreateCachedBitmap'),DLL
      GdipDeleteCachedBitmap(LONG pCachedBitmap),GpStatus,PASCAL,NAME('fptr_GdipDeleteCachedBitmap'),DLL
      GdipCreateStringFormat(UNSIGNED pFlags,USHORT pLang,*LONG pFormat),GpStatus,PASCAL,NAME('fptr_GdipCreateStringFormat'),DLL
      GdipDeleteStringFormat(LONG pFormat),GpStatus,PASCAL,NAME('fptr_GdipDeleteStringFormat'),DLL
      GdipCloneStringFormat(LONG pFormat,*LONG pCloneFormat),GpStatus,PASCAL,NAME('fptr_GdipCloneStringFormat'),DLL
      GdipSetStringFormatFlags(LONG pFormat,UNSIGNED pFlags),GpStatus,PASCAL,NAME('fptr_GdipSetStringFormatFlags'),DLL
      GdipGetStringFormatFlags(LONG pFormat,*UNSIGNED pFlags),GpStatus,PASCAL,NAME('fptr_GdipGetStringFormatFlags'),DLL
      GdipSetStringFormatAlign(LONG pFormat,GpStringAlignment pAlign),GpStatus,PASCAL,NAME('fptr_GdipSetStringFormatAlign'),DLL
      GdipGetStringFormatAlign(LONG pFormat,*GpStringAlignment pAlign),GpStatus,PASCAL,NAME('fptr_GdipGetStringFormatAlign'),DLL
      GdipSetStringFormatLineAlign(LONG pFormat,GpStringAlignment pAlign),GpStatus,PASCAL,NAME('fptr_GdipSetStringFormatLineAlign'),DLL
      GdipGetStringFormatLineAlign(LONG pFormat,*GpStringAlignment pAlign),GpStatus,PASCAL,NAME('fptr_GdipGetStringFormatLineAlign'),DLL
      GdipSetStringFormatHotkeyPrefix(LONG pFormat,GpHotkeyPrefix pHotkeyPrefix),GpStatus,PASCAL,NAME('fptr_GdipSetStringFormatHotkeyPrefix'),DLL
      GdipGetStringFormatHotkeyPrefix(LONG pFormat,*GpHotkeyPrefix pHotkeyPrefix),GpStatus,PASCAL,NAME('fptr_GdipGetStringFormatHotkeyPrefix'),DLL
      GdipSetStringFormatTabStops(LONG pFormat,SREAL pFirstTabOffset,UNSIGNED pCount,LONG pTabStops),GpStatus,PASCAL,NAME('fptr_GdipSetStringFormatTabStops'),DLL
      GdipGetStringFormatTabStopCount(LONG pFormat,*UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetStringFormatTabStopCount'),DLL
      GdipGetStringFormatTabStops(LONG pFormat,UNSIGNED pCount,*SREAL pFirstTabOffset,LONG pTabStops),GpStatus,PASCAL,NAME('fptr_GdipSetStringFormatTabStops'),DLL
      GdipSetStringFormatDigitSubstitution(LONG pFormat,USHORT pLanguage,GpStringDigitSubstitute pSubstitute),GpStatus,PASCAL,NAME('fptr_GdipSetStringFormatDigitSubstitution'),DLL
      GdipGetStringFormatDigitSubstitution(LONG pFormat,*USHORT pLanguage,*GpStringDigitSubstitute pSubstitute),GpStatus,PASCAL,NAME('fptr_GdipGetStringFormatDigitSubstitution'),DLL
      GdipSetStringFormatTrimming(LONG pFormat,GpStringTrimming pTrimming),GpStatus,PASCAL,NAME('fptr_GdipSetStringFormatTrimming'),DLL
      GdipGetStringFormatTrimming(LONG pFormat,*GpStringTrimming pTrimming),GpStatus,PASCAL,NAME('fptr_GdipGetStringFormatTrimming'),DLL
      GdipSetStringFormatMeasurableCharacterRanges(LONG pFormat,UNSIGNED pRangeCount,LONG pRanges),GpStatus,PASCAL,NAME('fptr_GdipSetStringFormatMeasurableCharacterRanges'),DLL
      GdipGetStringFormatMeasurableCharacterRangeCount(LONG pFormat,*LONG pRanges),GpStatus,PASCAL,NAME('fptr_GdipGetStringFormatMeasurableCharacterRangeCount'),DLL
      GdipStringFormatGetGenericDefault(*LONG pFormat),GpStatus,PASCAL,NAME('fptr_GdipStringFormatGetGenericDefault'),DLL
      GdipStringFormatGetGenericTypographic(*LONG pFormat),GpStatus,PASCAL,NAME('fptr_GdipStringFormatGetGenericTypographic'),DLL
      GdipCreateImageAttributes(*LONG pImageAttr),GpStatus,PASCAL,NAME('fptr_GdipCreateImageAttributes'),DLL
      GdipDisposeImageAttributes(LONG pImageAttr),GpStatus,PASCAL,NAME('fptr_GdipDisposeImageAttributes'),DLL
      GdipCloneImageAttributes(LONG pImageAttr,*LONG pCloneAttr),GpStatus,PASCAL,NAME('fptr_GdipCloneImageAttributes'),DLL
      GdipSetImageAttributesToIdentity(LONG pImageAttr,GpColorAdjustType pType),GpStatus,PASCAL,NAME('fptr_GdipSetImageAttributesToIdentity'),DLL
      GdipResetImageAttributes(LONG pImageAttr,GpColorAdjustType pType),GpStatus,PASCAL,NAME('fptr_GdipResetImageAttributes'),DLL
      GdipSetImageAttributesColorMatrix(LONG pImageAttr,GpColorAdjustType pType,BOOL pEnableFlag,LONG pColorMatrix,LONG pGrayMatrix,GpColorMatrixFlags pMode),GpStatus,PASCAL,NAME('fptr_GdipSetImageAttributesColorMatrix'),DLL
      GdipSetImageAttributesThreshold(LONG pImageAttr,GpColorAdjustType pType,BOOL pEnableFlag,SREAL pThreshold),GpStatus,PASCAL,NAME('fptr_GdipSetImageAttributesThreshold'),DLL
      GdipSetImageAttributesGamma(LONG pImageAttr,GpColorAdjustType pType,BOOL pEnableFlag,SREAL pGamma),GpStatus,PASCAL,NAME('fptr_GdipSetImageAttributesGamma'),DLL
      GdipSetImageAttributesNoOp(LONG pImageAttr,GpColorAdjustType pType,BOOL pEnableFlag),GpStatus,PASCAL,NAME('fptr_GdipSetImageAttributesNoOp'),DLL
      GdipSetImageAttributesColorKeys(LONG pImageAttr,GpColorAdjustType pType,BOOL pEnableFlag,GpARGB pColorLow,GpARGB pColorHigh),GpStatus,PASCAL,NAME('fptr_GdipSetImageAttributesColorKeys'),DLL
      GdipSetImageAttributesOutputChannel(LONG pImageAttr,GpColorAdjustType pType,BOOL pEnableFlag,GpColorChannelFlags pFlags),GpStatus,PASCAL,NAME('fptr_GdipSetImageAttributesOutputChannel'),DLL
      GdipSetImageAttributesOutputChannelColorProfile(LONG pImageAttr,GpColorAdjustType pType,BOOL pEnableFlag,LONG pProfileName),GpStatus,PASCAL,NAME('fptr_GdipSetImageAttributesOutputChannelColorProfile'),DLL
      GdipSetImageAttributesRemapTable(LONG pImageAttr,GpColorAdjustType pType,BOOL pEnableFlag,UNSIGNED pMapSize,LONG pMap),GpStatus,PASCAL,NAME('fptr_GdipSetImageAttributesRemapTable'),DLL
      GdipSetImageAttributesWrapMode(LONG pImageAttr,GpWrapMode pWrap,GpARGB pColor,BOOL pClamp),GpStatus,PASCAL,NAME('fptr_GdipSetImageAttributesWrapMode'),DLL
      GdipGetImageAttributesAdjustedPalette(LONG pImageAttr,LONG pPalette,GpColorAdjustType pType),GpStatus,PASCAL,NAME('fptr_GdipGetImageAttributesAdjustedPalette'),DLL
      GdipCreatePathIter(*LONG pIter,LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipCreatePathIter'),DLL
      GdipDeletePathIter(LONG pIter),GpStatus,PASCAL,NAME('fptr_GdipDeletePathIter'),DLL
      GdipPathIterNextSubpath(LONG pIter,*UNSIGNED pResultCount,*UNSIGNED pStartIndex,*UNSIGNED pEndIndex,*BOOL pIsClosed),GpStatus,PASCAL,NAME('fptr_GdipPathIterNextSubpath'),DLL
      GdipPathIterNextSubpathPath(LONG pIter,*UNSIGNED pResultCount,*LONG pPath,*BOOL pIsClosed),GpStatus,PASCAL,NAME('fptr_GdipPathIterNextSubpathPath'),DLL
      GdipPathIterNextPathType(LONG pIter,*UNSIGNED pResultCount,*BYTE pType,*UNSIGNED pStartIndex,*UNSIGNED pEndIndex),GpStatus,PASCAL,NAME('fptr_GdipPathIterNextPathType'),DLL
      GdipPathIterNextMarker(LONG pIter,*UNSIGNED pResultCount,*UNSIGNED pStartIndex,*UNSIGNED pEndIndex),GpStatus,PASCAL,NAME('fptr_GdipPathIterNextMarker'),DLL
      GdipPathIterNextMarkerPath(LONG pIter,*UNSIGNED pResultCount,*LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipPathIterNextMarkerPath'),DLL
      GdipPathIterGetCount(LONG pIter,*UNSIGNED pResultCount),GpStatus,PASCAL,NAME('fptr_GdipPathIterGetCount'),DLL
      GdipPathIterGetSubpathCount(LONG pIter,*UNSIGNED pResultCount),GpStatus,PASCAL,NAME('fptr_GdipPathIterGetSubpathCount'),DLL
      GdipPathIterHasCurve(LONG pIter,*BOOL pHasCurve),GpStatus,PASCAL,NAME('fptr_GdipPathIterHasCurve'),DLL
      GdipPathIterRewind(LONG pIter),GpStatus,PASCAL,NAME('fptr_GdipPathIterRewind'),DLL
      GdipPathIterEnumerate(LONG pIter,*UNSIGNED pResultCount,LONG pPoints,LONG pTypes,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipPathIterEnumerate'),DLL
      GdipPathIterCopyData(LONG pIter,*UNSIGNED pResultCount,LONG pPoints,LONG pTypes,UNSIGNED pStartIndex,UNSIGNED pEndIndex),GpStatus,PASCAL,NAME('fptr_GdipPathIterCopyData'),DLL
      GdipCreatePathGradient(LONG pPoints,UNSIGNED pCount,GpWrapMode pMode,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreatePathGradient'),DLL
      GdipCreatePathGradientI(LONG pPoints,UNSIGNED pCount,GpWrapMode pMode,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreatePathGradientI'),DLL
      GdipCreatePathGradientFromPath(LONG pPath,*LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipCreatePathGradientFromPath'),DLL
      GdipGetPathGradientCenterColor(LONG pBrush,*GpARGB pColor),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientCenterColor'),DLL
      GdipSetPathGradientCenterColor(LONG pBrush,GpARGB pColor),GpStatus,PASCAL,NAME('fptr_GdipSetPathGradientCenterColor'),DLL
      GdipGetPathGradientPointCount(LONG pBrush,*UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientPointCount'),DLL
      GdipGetPathGradientSurroundColorCount(LONG pBrush,*UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientSurroundColorCount'),DLL
      GdipGetPathGradientSurroundColorsWithCount(LONG pBrush,LONG pColors,*UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientSurroundColorsWithCount'),DLL
      GdipSetPathGradientSurroundColorsWithCount(LONG pBrush,LONG pColors,*UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipSetPathGradientSurroundColorsWithCount'),DLL
      GdipGetPathGradientPath(LONG pBrush,*LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientPath'),DLL
      GdipSetPathGradientPath(LONG pBrush,LONG pPath),GpStatus,PASCAL,NAME('fptr_GdipSetPathGradientPath'),DLL
      GdipGetPathGradientCenterPoint(LONG pBrush,LONG pPoint),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientCenterPoint'),DLL
      GdipGetPathGradientCenterPointI(LONG pBrush,LONG pPoint),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientCenterPointI'),DLL
      GdipSetPathGradientCenterPoint(LONG pBrush,LONG pPoint),GpStatus,PASCAL,NAME('fptr_GdipSetPathGradientCenterPoint'),DLL
      GdipSetPathGradientCenterPointI(LONG pBrush,LONG pPoint),GpStatus,PASCAL,NAME('fptr_GdipSetPathGradientCenterPointI'),DLL
      GdipGetPathGradientRect(LONG pBrush,LONG pRect),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientRect'),DLL
      GdipGetPathGradientRectI(LONG pBrush,LONG pRect),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientRectI'),DLL
      GdipSetPathGradientGammaCorrection(LONG pBrush,BOOL pUseGammaCorrection),GpStatus,PASCAL,NAME('fptr_GdipSetPathGradientGammaCorrection'),DLL
      GdipGetPathGradientGammaCorrection(LONG pBrush,*BOOL pUseGammaCorrection),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientGammaCorrection'),DLL
      GdipGetPathGradientBlendCount(LONG pBrush,*UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientBlendCount'),DLL
      GdipGetPathGradientBlend(LONG pBrush,LONG pFactors,LONG pPositions,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientBlend'),DLL
      GdipSetPathGradientBlend(LONG pBrush,LONG pFactors,LONG pPositions,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipSetPathGradientBlend'),DLL
      GdipGetPathGradientPresetBlendCount(LONG pBrush,*UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientPresetBlendCount'),DLL
      GdipSetPathGradientPresetBlend(LONG pBrush,LONG pColors,LONG pPositions,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipSetPathGradientPresetBlend'),DLL
      GdipGetPathGradientPresetBlend(LONG pBrush,LONG pColors,LONG pPositions,UNSIGNED pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientPresetBlend'),DLL
      GdipSetPathGradientSigmaBlend(LONG pBrush,SREAL pFocus,SREAL pScale),GpStatus,PASCAL,NAME('fptr_GdipSetPathGradientSigmaBlend'),DLL
      GdipSetPathGradientLinearBlend(LONG pBrush,SREAL pFocus,SREAL pScale),GpStatus,PASCAL,NAME('fptr_GdipSetPathGradientLinearBlend'),DLL
      GdipGetPathGradientTransform(LONG pBrush,*LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientTransform'),DLL
      GdipSetPathGradientTransform(LONG pBrush,LONG pMatrix),GpStatus,PASCAL,NAME('fptr_GdipSetPathGradientTransform'),DLL
      GdipResetPathGradientTransform(LONG pBrush),GpStatus,PASCAL,NAME('fptr_GdipResetPathGradientTransform'),DLL
      GdipMultiplyPathGradientTransform(LONG pBrush,LONG pMatrix,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipMultiplyPathGradientTransform'),DLL
      GdipTranslatePathGradientTransform(LONG pBrush,SREAL pDx,SREAL pDy,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipTranslatePathGradientTransform'),DLL
      GdipScalePathGradientTransform(LONG pBrush,SREAL pSx,SREAL pSy,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipScalePathGradientTransform'),DLL
      GdipRotatePathGradientTransform(LONG pBrush,SREAL pAngle,GpMatrixOrder pOrder),GpStatus,PASCAL,NAME('fptr_GdipRotatePathGradientTransform'),DLL
      GdipGetPathGradientFocusScales(LONG pBrush,*SREAL pXScale,*SREAL pYScale),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientFocusScales'),DLL
      GdipSetPathGradientFocusScales(LONG pBrush,SREAL pXScale,SREAL pYScale),GpStatus,PASCAL,NAME('fptr_GdipSetPathGradientFocusScales'),DLL
      GdipGetPathGradientWrapMode(LONG pBrush,*GpWrapMode pMode),GpStatus,PASCAL,NAME('fptr_GdipGetPathGradientWrapMode'),DLL
      GdipSetPathGradientWrapMode(LONG pBrush,GpWrapMode pMode),GpStatus,PASCAL,NAME('fptr_GdipSetPathGradientWrapMode'),DLL
      GdipCreateMetafileFromWmf(HMETAFILE phWmf,LONG pFileHeader,BOOL pDeleteWmf,*LONG pMetafile),GpStatus,PASCAL,NAME('fptr_GdipCreateMetafileFromWmf'),DLL
      GdipCreateMetafileFromEmf(HMETAFILE phEmf,BOOL pDeleteEmf,*LONG pMetafile),GpStatus,PASCAL,NAME('fptr_GdipCreateMetafileFromEmf'),DLL
      GdipCreateMetafileFromFile(LONG pFileName,*LONG pMetafile),GpStatus,PASCAL,NAME('fptr_GdipCreateMetafileFromFile'),DLL
      GdipCreateMetafileFromWmfFile(LONG pFileName,LONG pFileHeader,*LONG pMetafile),GpStatus,PASCAL,NAME('fptr_GdipCreateMetafileFromWmfFile'),DLL
      GdipCreateMetafileFromStream(LONG pStream,*LONG pMetafile),GpStatus,PASCAL,NAME('fptr_GdipCreateMetafileFromStream'),DLL
      GdipRecordMetafile(HDC pReferenceHdc,GpEmfType pType,LONG pFrameRect,GpMetafileFrameUnit pFrameUnit,LONG pDescription,*LONG pMetafile),GpStatus,PASCAL,NAME('fptr_GdipRecordMetafile'),DLL
      GdipRecordMetafileI(HDC pReferenceHdc,GpEmfType pType,LONG pFrameRect,GpMetafileFrameUnit pFrameUnit,LONG pDescription,*LONG pMetafile),GpStatus,PASCAL,NAME('fptr_GdipRecordMetafileI'),DLL
      GdipRecordMetafileFileName(LONG pFileName,HDC pReferenceHdc,GpEmfType pType,LONG pFrameRect,GpMetafileFrameUnit pFrameUnit,LONG pDescription,*LONG pMetafile),GpStatus,PASCAL,NAME('fptr_GdipRecordMetafileFileName'),DLL
      GdipRecordMetafileFileNameI(LONG pFileName,HDC pReferenceHdc,GpEmfType pType,LONG pFrameRect,GpMetafileFrameUnit pFrameUnit,LONG pDescription,*LONG pMetafile),GpStatus,PASCAL,NAME('fptr_GdipRecordMetafileFileNameI'),DLL
      GdipGetMetafileHeaderFromWmf(HMETAFILE phWmf,LONG pFileHeader,LONG pHeader),GpStatus,PASCAL,NAME('fptr_GdipGetMetafileHeaderFromWmf'),DLL
      GdipGetMetafileHeaderFromEmf(HMETAFILE phWmf,LONG pHeader),GpStatus,PASCAL,NAME('fptr_GdipGetMetafileHeaderFromEmf'),DLL
      GdipGetMetafileHeaderFromFile(LONG pFileName,LONG pHeader),GpStatus,PASCAL,NAME('fptr_GdipGetMetafileHeaderFromFile'),DLL
      GdipGetMetafileHeaderFromStream(LONG pStream,LONG pHeader),GpStatus,PASCAL,NAME('fptr_GdipGetMetafileHeaderFromStream'),DLL
      GdipGetMetafileHeaderFromMetafile(LONG pMetafile,LONG pHeader),GpStatus,PASCAL,NAME('fptr_GdipGetMetafileHeaderFromMetafile'),DLL
      GdipGetHemfFromMetafile(LONG pMetafile,*HENHMETAFILE phemf),GpStatus,PASCAL,NAME('fptr_GdipGetHemfFromMetafile'),DLL
      GdipPlayMetafileRecord(LONG pMetafile,GpEmfPlusRecordType pRecordType,ULONG pFlags,ULONG pDataSize,LONG pData),GpStatus,PASCAL,NAME('fptr_GdipPlayMetafileRecord'),DLL
      GdipSetMetafileDownLevelRasterizationLimit(LONG pMetafile,ULONG pDpi),GpStatus,PASCAL,NAME('fptr_GdipSetMetafileDownLevelRasterizationLimit'),DLL
      GdipGetMetafileDownLevelRasterizationLimit(LONG pMetafile,*ULONG pDpi),GpStatus,PASCAL,NAME('fptr_GdipGetMetafileDownLevelRasterizationLimit'),DLL
      GdipEmfToWmfBits(HENHMETAFILE phemf,ULONG pDataSize,LONG pData,LONG pMapMode,LONG pFlags),ULONG,PASCAL,NAME('fptr_GdipEmfToWmfBits'),DLL
      GdipConvertToEmfPlus(LONG pGraphics,LONG pMetafile,*LONG pFlag,GpEmfType pEmfType,LONG pDescription,*LONG pOutMetafile),GpStatus,PASCAL,NAME('fptr_GdipConvertToEmfPlus'),DLL
      GdipConvertToEmfPlusToFile(LONG pGraphics,LONG pMetafile,*LONG pFlag,LONG pFileName,GpEmfType pEmfType,LONG pDescription,*LONG pOutMetafile),GpStatus,PASCAL,NAME('fptr_GdipConvertToEmfPlusToFile'),DLL
      GdipEnumerateMetafileDestPoint(LONG pGraphics,LONG pMetafile,LONG pDestPoint,LONG pCallback,LONG pCallbackData,LONG pImageAttributes),GpStatus,PASCAL,NAME('fptr_GdipEnumerateMetafileDestPoint'),DLL
      GdipEnumerateMetafileDestPointI(LONG pGraphics,LONG pMetafile,LONG pDestPoint,LONG pCallback,LONG pCallbackData,LONG pImageAttributes),GpStatus,PASCAL,NAME('fptr_GdipEnumerateMetafileDestPointI'),DLL
      GdipEnumerateMetafileDestRect(LONG pGraphics,LONG pMetafile,LONG pDestRect,LONG pCallback,LONG pCallbackData,LONG pImageAttributes),GpStatus,PASCAL,NAME('fptr_GdipEnumerateMetafileDestRect'),DLL
      GdipEnumerateMetafileDestRectI(LONG pGraphics,LONG pMetafile,LONG pDestRect,LONG pCallback,LONG pCallbackData,LONG pImageAttributes),GpStatus,PASCAL,NAME('fptr_GdipEnumerateMetafileDestRectI'),DLL
      GdipEnumerateMetafileDestPoints(LONG pGraphics,LONG pMetafile,LONG pDestPoints,UNSIGNED pCount,LONG pCallback,LONG pCallbackData,LONG pImageAttributes),GpStatus,PASCAL,NAME('fptr_GdipEnumerateMetafileDestPoints'),DLL
      GdipEnumerateMetafileDestPointsI(LONG pGraphics,LONG pMetafile,LONG pDestPoints,UNSIGNED pCount,LONG pCallback,LONG pCallbackData,LONG pImageAttributes),GpStatus,PASCAL,NAME('fptr_GdipEnumerateMetafileDestPointsI'),DLL
      GdipEnumerateMetafileSrcRectDestPoint(LONG pGraphics,LONG pMetafile,LONG pDestPoint,LONG pSrcRect,GpUnit pSrcUnit,LONG pCallback,LONG pCallbackData,LONG pImageAttributes),GpStatus,PASCAL,NAME('fptr_GdipEnumerateMetafileSrcRectDestPoint'),DLL
      GdipEnumerateMetafileSrcRectDestPointI(LONG pGraphics,LONG pMetafile,LONG pDestPoint,LONG pSrcRect,GpUnit pSrcUnit,LONG pCallback,LONG pCallbackData,LONG pImageAttributes),GpStatus,PASCAL,NAME('fptr_GdipEnumerateMetafileSrcRectDestPointI'),DLL
      GdipEnumerateMetafileSrcRectDestRect(LONG pGraphics,LONG pMetafile,LONG pDestRect,LONG pSrcRect,GpUnit pSrcUnit,LONG pCallback,LONG pCallbackData,LONG pImageAttributes),GpStatus,PASCAL,NAME('fptr_GdipEnumerateMetafileSrcRectDestRect'),DLL
      GdipEnumerateMetafileSrcRectDestRectI(LONG pGraphics,LONG pMetafile,LONG pDestRect,LONG pSrcRect,GpUnit pSrcUnit,LONG pCallback,LONG pCallbackData,LONG pImageAttributes),GpStatus,PASCAL,NAME('fptr_GdipEnumerateMetafileSrcRectDestRectI'),DLL
      GdipEnumerateMetafileSrcRectDestPoints(LONG pGraphics,LONG pMetafile,LONG pDestPoints,UNSIGNED pCount,LONG pSrcRect,GpUnit pSrcUnit,LONG pCallback,LONG pCallbackData,LONG pImageAttributes),GpStatus,PASCAL,NAME('fptr_GdipEnumerateMetafileSrcRectDestPoints'),DLL
      GdipEnumerateMetafileSrcRectDestPointsI(LONG pGraphics,LONG pMetafile,LONG pDestPoints,UNSIGNED pCount,LONG pSrcRect,GpUnit pSrcUnit,LONG pCallback,LONG pCallbackData,LONG pImageAttributes),GpStatus,PASCAL,NAME('fptr_GdipEnumerateMetafileSrcRectDestPointsI'),DLL
      GdipComment(LONG pGraphics,LONG pData,UNSIGNED pdataSize),GpStatus,PASCAL,NAME('fptr_GdipComment'),DLL
      GdipBeginContainer(LONG pGraphics,LONG pDstRect,LONG pSrcRect,GpUnit pSrcUnit,*GpGraphicsContainer pState),GpStatus,PASCAL,NAME('fptr_GdipBeginContainer'),DLL
      GdipBeginContainerI(LONG pGraphics,LONG pDstRect,LONG pSrcRect,GpUnit pSrcUnit,*GpGraphicsContainer pState),GpStatus,PASCAL,NAME('fptr_GdipBeginContainerI'),DLL
      GdipBeginContainer2(LONG pGraphics,*GpGraphicsContainer pState),GpStatus,PASCAL,NAME('fptr_GdipBeginContainer2'),DLL
      GdipEndContainer(LONG pGraphics,GpGraphicsContainer pState),GpStatus,PASCAL,NAME('fptr_GdipEndContainer'),DLL
      GdipCreateCustomLineCap(LONG pFillPath,LONG pStrokePath,GpLineCap pBaseCap,SREAL pBaseInset,*LONG pCap),GpStatus,PASCAL,NAME('fptr_GdipCreateCustomLineCap'),DLL
      GdipDeleteCustomLineCap(LONG pCap),GpStatus,PASCAL,NAME('fptr_GdipDeleteCustomLineCap'),DLL
      GdipSetCustomLineCapStrokeCaps(LONG pCap,GpLineCap pStartCap,GpLineCap pEndCap),GpStatus,PASCAL,NAME('fptr_GdipSetCustomLineCapStrokeCaps'),DLL
      GdipGetCustomLineCapStrokeCaps(LONG pCap,*GpLineCap pStartCap,*GpLineCap pEndCap),GpStatus,PASCAL,NAME('fptr_GdipGetCustomLineCapStrokeCaps'),DLL
      GdipSetCustomLineCapStrokeJoin(LONG pCap,GpLineJoin pLineJoin),GpStatus,PASCAL,NAME('fptr_GdipSetCustomLineCapStrokeJoin'),DLL
      GdipGetCustomLineCapStrokeJoin(LONG pCap,*GpLineJoin pLineJoin),GpStatus,PASCAL,NAME('fptr_GdipGetCustomLineCapStrokeJoin'),DLL
      GdipSetCustomLineCapBaseCap(LONG pCap,GpLineCap pBaseCap),GpStatus,PASCAL,NAME('fptr_GdipSetCustomLineCapBaseCap'),DLL
      GdipGetCustomLineCapBaseCap(LONG pCap,*GpLineCap pBaseCap),GpStatus,PASCAL,NAME('fptr_GdipGetCustomLineCapBaseCap'),DLL
      GdipSetCustomLineCapBaseInset(LONG pCap,SREAL pInset),GpStatus,PASCAL,NAME('fptr_GdipSetCustomLineCapBaseInset'),DLL
      GdipGetCustomLineCapBaseInset(LONG pCap,*SREAL pInset),GpStatus,PASCAL,NAME('fptr_GdipGetCustomLineCapBaseInset'),DLL
      GdipSetCustomLineCapWidthScale(LONG pCap,SREAL pWidthScale),GpStatus,PASCAL,NAME('fptr_GdipSetCustomLineCapWidthScale'),DLL
      GdipGetCustomLineCapWidthScale(LONG pCap,*SREAL pWidthScale),GpStatus,PASCAL,NAME('fptr_GdipGetCustomLineCapWidthScale'),DLL
      GdipCloneCustomLineCap(LONG pCap,*LONG pCloneCap),GpStatus,PASCAL,NAME('fptr_GdipCloneCustomLineCap'),DLL
      GdipCreateAdjustableArrowCap(SREAL pHeight,SREAL pWidth,BOOL pIsFilled,*LONG pCap),GpStatus,PASCAL,NAME('fptr_GdipCreateAdjustableArrowCap'),DLL
      GdipSetAdjustableArrowCapHeight(LONG pCap,SREAL pHeight),GpStatus,PASCAL,NAME('fptr_GdipSetAdjustableArrowCapHeight'),DLL
      GdipGetAdjustableArrowCapHeight(LONG pCap,*SREAL pHeight),GpStatus,PASCAL,NAME('fptr_GdipGetAdjustableArrowCapHeight'),DLL
      GdipSetAdjustableArrowCapWidth(LONG pCap,SREAL pWidth),GpStatus,PASCAL,NAME('fptr_GdipSetAdjustableArrowCapWidth'),DLL
      GdipGetAdjustableArrowCapWidth(LONG pCap,*SREAL pWidth),GpStatus,PASCAL,NAME('fptr_GdipGetAdjustableArrowCapWidth'),DLL
      GdipSetAdjustableArrowCapMiddleInset(LONG pCap,SREAL pInset),GpStatus,PASCAL,NAME('fptr_GdipSetAdjustableArrowCapMiddleInset'),DLL
      GdipGetAdjustableArrowCapMiddleInset(LONG pCap,*SREAL pInset),GpStatus,PASCAL,NAME('fptr_GdipGetAdjustableArrowCapMiddleInset'),DLL
      GdipSetAdjustableArrowCapFillState(LONG pCap,BOOL pIsFilled),GpStatus,PASCAL,NAME('fptr_GdipSetAdjustableArrowCapFillState'),DLL
      GdipGetAdjustableArrowCapFillState(LONG pCap,*BOOL pIsFilled),GpStatus,PASCAL,NAME('fptr_GdipGetAdjustableArrowCapFillState'),DLL

      GdipCreateStreamOnFile(LONG pFileName,ULONG pAccess,*LONG pStream),GpStatus,PASCAL,NAME('fptr_GdipCreateStreamOnFile'),DLL
    END
    MODULE('Global memory api')
      winapi::memcpy(LONG lpDest,LONG lpSource,LONG nCount),LONG,PROC,NAME('_memcpy')
      winapi::CreateStreamOnHGlobal(LONG hGlobal,BOOL fDeleteOnRelease,LONG ppstm),LONG,PASCAL,PROC,NAME('CreateStreamOnHGlobal')
      winapi::IIDFromString(LONG lpsz, LONG lpiid),HRESULT,PASCAL,NAME('IIDFromString')
    END
    MODULE('C++')
      lstrlenW(LONG lpWString),SIGNED,PROC,PASCAL
    END

    GdipReportError(STRING pMethodName, GpStatus pErr),PRIVATE
    GdipCreateEffectFromGuid(STRING pGuid, *LONG pHandle), GpStatus, PRIVATE
    ToStream(STRING pData),LONG,PRIVATE
    GetEncoderClsid(STRING pFormat, *_CLSID pClsId),BOOL,PROC,PRIVATE
    GetFileMimeType(STRING pFileName),STRING,PRIVATE
    IIDFromString(STRING pStr, *_GUID pGuid),BOOL,PROC,PRIVATE

    INCLUDE('printf.inc'), ONCE
  END

!!!region IStream types
tagSTATSTG                    GROUP, TYPE
pwcsName                        LONG !LPOLESTR
type                            ULONG
cbSize                          LIKE(_ULARGE_INTEGER)
mtime                           LIKE(_FILETIME)
ctime                           LIKE(_FILETIME)
atime                           LIKE(_FILETIME)
grfMode                         ULONG
grfLocksSupported               ULONG
clsid                           LIKE(_CLSID)
grfStateBits                    ULONG
reserved                        ULONG
                              END

STATFLAG_DEFAULT              EQUATE(0) !- Requests that the statistics include the pwcsName member of the STATSTG structure.
STATFLAG_NONAME               EQUATE(1) !- Requests that the statistics not include the pwcsName member of the STATSTG structure.
STATFLAG_NOOPEN               EQUATE(2) !- Not implemented.

!!!endregion

!!!region GdiPlus initializer
!https://www.codeproject.com/Messages/2274891/Re-GDIplus-initialization
TGdiPlusInitializer           CLASS, TYPE
hDll                            HINSTANCE, PRIVATE
bInitialized                    BOOL, PRIVATE
token                           ULONG, PRIVATE
Construct                       PROCEDURE(), PRIVATE
Destruct                        PROCEDURE(), PRIVATE
Startup                         PROCEDURE(), GpStatus, PROC, PRIVATE
Shutdown                        PROCEDURE(), PRIVATE
                              END

!- static instance
gpInitializer                 TGdiPlusInitializer

!- TGdiPlusInitializer.Startup parameter
tagGdiplusStartupInput        GROUP, TYPE
GdiplusVersion                  ULONG
DebugEventCallback              LONG  !- void* 
SuppressBackgroundThread        BOOL
SuppressExternalCodecs          BOOL
                              END

TGdiPlusInitializer.Construct PROCEDURE()
GP_DLLNAME                      CSTRING('Gdiplus.dll'), STATIC
  CODE
  SELF.hDll = winapi::LoadLibrary(GP_DLLNAME)
  IF SELF.hDll
    !- get procedure addresses
    paGdiplusStartup  = winapi::GetProcAddress(SELF.hDll, szGdiplusStartup)
    paGdiplusShutdown = winapi::GetProcAddress(SELF.hDll, szGdiplusShutdown)

    IF paGdiplusStartup AND paGdiplusShutdown
      SELF.bInitialized = TRUE

      paGdipFree                          = winapi::GetProcAddress(SELF.hDll, szGdipFree)
      
      paGdipLoadImageFromFile             = winapi::GetProcAddress(SELF.hDll, szGdipLoadImageFromFile)
      paGdipLoadImageFromFileICM          = winapi::GetProcAddress(SELF.hDll, szGdipLoadImageFromFileICM)
      paGdipLoadImageFromStream           = winapi::GetProcAddress(SELF.hDll, szGdipLoadImageFromStream)
      paGdipLoadImageFromStreamICM        = winapi::GetProcAddress(SELF.hDll, szGdipLoadImageFromStreamICM)
      paGdipCloneImage                    = winapi::GetProcAddress(SELF.hDll, szGdipCloneImage)
      paGdipGetImageThumbnail             = winapi::GetProcAddress(SELF.hDll, szGdipGetImageThumbnail)
      paGdipSaveImageToFile               = winapi::GetProcAddress(SELF.hDll, szGdipSaveImageToFile)
      paGdipSaveImageToStream             = winapi::GetProcAddress(SELF.hDll, szGdipSaveImageToStream)
      paGdipDisposeImage                  = winapi::GetProcAddress(SELF.hDll, szGdipDisposeImage)
      paGdipGetImageWidth                 = winapi::GetProcAddress(SELF.hDll, szGdipGetImageWidth)
      paGdipGetImageHeight                = winapi::GetProcAddress(SELF.hDll, szGdipGetImageHeight)
      paGdipGetImageHorizontalResolution  = winapi::GetProcAddress(SELF.hDll, szGdipGetImageHorizontalResolution)
      paGdipGetImageVerticalResolution    = winapi::GetProcAddress(SELF.hDll, szGdipGetImageVerticalResolution)
      paGdipGetImageBounds                = winapi::GetProcAddress(SELF.hDll, szGdipGetImageBounds)
      paGdipGetImageDimension             = winapi::GetProcAddress(SELF.hDll, szGdipGetImageDimension)
      paGdipGetImageType                  = winapi::GetProcAddress(SELF.hDll, szGdipGetImageType)
      paGdipGetImageFlags                 = winapi::GetProcAddress(SELF.hDll, szGdipGetImageFlags)
      paGdipGetImageRawFormat             = winapi::GetProcAddress(SELF.hDll, szGdipGetImageRawFormat)
      paGdipGetImagePixelFormat           = winapi::GetProcAddress(SELF.hDll, szGdipGetImagePixelFormat)
      paGdipGetPropertyCount              = winapi::GetProcAddress(SELF.hDll, szGdipGetPropertyCount)
      paGdipGetPropertyIdList             = winapi::GetProcAddress(SELF.hDll, szGdipGetPropertyIdList)
      paGdipGetPropertyItemSize           = winapi::GetProcAddress(SELF.hDll, szGdipGetPropertyItemSize)
      paGdipGetPropertyItem               = winapi::GetProcAddress(SELF.hDll, szGdipGetPropertyItem)
      paGdipSetPropertyItem               = winapi::GetProcAddress(SELF.hDll, szGdipSetPropertyItem)
      paGdipRemovePropertyItem            = winapi::GetProcAddress(SELF.hDll, szGdipRemovePropertyItem)
      paGdipGetImageEncodersSize          = winapi::GetProcAddress(SELF.hDll, szGdipGetImageEncodersSize)
      paGdipGetImageEncoders              = winapi::GetProcAddress(SELF.hDll, szGdipGetImageEncoders)
      paGdipImageRotateFlip               = winapi::GetProcAddress(SELF.hDll, szGdipImageRotateFlip)
      paGdipGetImagePaletteSize           = winapi::GetProcAddress(SELF.hDll, szGdipGetImagePaletteSize)
      paGdipGetImagePalette               = winapi::GetProcAddress(SELF.hDll, szGdipGetImagePalette)
      paGdipSetImagePalette               = winapi::GetProcAddress(SELF.hDll, szGdipSetImagePalette)
      paGdipCreateBitmapFromFile          = winapi::GetProcAddress(SELF.hDll, szGdipCreateBitmapFromFile)
      paGdipCreateBitmapFromFileICM       = winapi::GetProcAddress(SELF.hDll, szGdipCreateBitmapFromFileICM)
      paGdipCreateBitmapFromStream        = winapi::GetProcAddress(SELF.hDll, szGdipCreateBitmapFromStream)
      paGdipCreateBitmapFromStreamICM     = winapi::GetProcAddress(SELF.hDll, szGdipCreateBitmapFromStreamICM)
      paGdipCreateBitmapFromScan0         = winapi::GetProcAddress(SELF.hDll, szGdipCreateBitmapFromScan0)
      paGdipCreateBitmapFromGraphics      = winapi::GetProcAddress(SELF.hDll, szGdipCreateBitmapFromGraphics)
      paGdipCreateBitmapFromGdiDib        = winapi::GetProcAddress(SELF.hDll, szGdipCreateBitmapFromGdiDib)
      paGdipCreateBitmapFromHBITMAP       = winapi::GetProcAddress(SELF.hDll, szGdipCreateBitmapFromHBITMAP)
      paGdipCreateHBITMAPFromBitmap       = winapi::GetProcAddress(SELF.hDll, szGdipCreateHBITMAPFromBitmap)
      paGdipCreateBitmapFromHICON         = winapi::GetProcAddress(SELF.hDll, szGdipCreateBitmapFromHICON)
      paGdipCreateHICONFromBitmap         = winapi::GetProcAddress(SELF.hDll, szGdipCreateHICONFromBitmap)
      paGdipCreateBitmapFromResource      = winapi::GetProcAddress(SELF.hDll, szGdipCreateBitmapFromResource)
      paGdipCloneBitmapArea               = winapi::GetProcAddress(SELF.hDll, szGdipCloneBitmapArea)
      paGdipCloneBitmapAreaI              = winapi::GetProcAddress(SELF.hDll, szGdipCloneBitmapAreaI)
      paGdipBitmapLockBits                = winapi::GetProcAddress(SELF.hDll, szGdipBitmapLockBits)
      paGdipBitmapUnlockBits              = winapi::GetProcAddress(SELF.hDll, szGdipBitmapUnlockBits)
      paGdipBitmapGetPixel                = winapi::GetProcAddress(SELF.hDll, szGdipBitmapGetPixel)
      paGdipBitmapSetPixel                = winapi::GetProcAddress(SELF.hDll, szGdipBitmapSetPixel)
      paGdipBitmapSetResolution           = winapi::GetProcAddress(SELF.hDll, szGdipBitmapSetResolution)
      paGdipBitmapConvertFormat           = winapi::GetProcAddress(SELF.hDll, szGdipBitmapConvertFormat)
      paGdipBitmapApplyEffect             = winapi::GetProcAddress(SELF.hDll, szGdipBitmapApplyEffect)
      paGdipBitmapCreateApplyEffect       = winapi::GetProcAddress(SELF.hDll, szGdipBitmapCreateApplyEffect)
      paGdipBitmapGetHistogramSize        = winapi::GetProcAddress(SELF.hDll, szGdipBitmapGetHistogramSize)
      paGdipBitmapGetHistogram            = winapi::GetProcAddress(SELF.hDll, szGdipBitmapGetHistogram)
      paGdipInitializePalette             = winapi::GetProcAddress(SELF.hDll, szGdipInitializePalette)
      paGdipGetImageGraphicsContext       = winapi::GetProcAddress(SELF.hDll, szGdipGetImageGraphicsContext)
      paGdipDeleteGraphics                = winapi::GetProcAddress(SELF.hDll, szGdipDeleteGraphics)
      paGdipCreateFromHDC                 = winapi::GetProcAddress(SELF.hDll, szGdipCreateFromHDC)
      paGdipCreateFromHDC2                = winapi::GetProcAddress(SELF.hDll, szGdipCreateFromHDC2)
      paGdipCreateFromHWND                = winapi::GetProcAddress(SELF.hDll, szGdipCreateFromHWND)
      paGdipCreateFromHWNDICM             = winapi::GetProcAddress(SELF.hDll, szGdipCreateFromHWNDICM)
      paGdipGetDC                         = winapi::GetProcAddress(SELF.hDll, szGdipGetDC)
      paGdipReleaseDC                     = winapi::GetProcAddress(SELF.hDll, szGdipReleaseDC)
      paGdipSetCompositingMode            = winapi::GetProcAddress(SELF.hDll, szGdipSetCompositingMode)
      paGdipGetCompositingMode            = winapi::GetProcAddress(SELF.hDll, szGdipGetCompositingMode)
      paGdipSetRenderingOrigin            = winapi::GetProcAddress(SELF.hDll, szGdipSetRenderingOrigin)
      paGdipGetRenderingOrigin            = winapi::GetProcAddress(SELF.hDll, szGdipGetRenderingOrigin)
      paGdipSetCompositingQuality         = winapi::GetProcAddress(SELF.hDll, szGdipSetCompositingQuality)
      paGdipGetCompositingQuality         = winapi::GetProcAddress(SELF.hDll, szGdipGetCompositingQuality)
      paGdipSetSmoothingMode              = winapi::GetProcAddress(SELF.hDll, szGdipSetSmoothingMode)
      paGdipGetSmoothingMode              = winapi::GetProcAddress(SELF.hDll, szGdipGetSmoothingMode)
      paGdipSetPixelOffsetMode            = winapi::GetProcAddress(SELF.hDll, szGdipSetPixelOffsetMode)
      paGdipGetPixelOffsetMode            = winapi::GetProcAddress(SELF.hDll, szGdipGetPixelOffsetMode)
      paGdipSetTextRenderingHint          = winapi::GetProcAddress(SELF.hDll, szGdipSetTextRenderingHint)
      paGdipGetTextRenderingHint          = winapi::GetProcAddress(SELF.hDll, szGdipGetTextRenderingHint)
      paGdipSetTextContrast               = winapi::GetProcAddress(SELF.hDll, szGdipSetTextContrast)
      paGdipGetTextContrast               = winapi::GetProcAddress(SELF.hDll, szGdipGetTextContrast)
      paGdipSetInterpolationMode          = winapi::GetProcAddress(SELF.hDll, szGdipSetInterpolationMode)
      paGdipGetInterpolationMode          = winapi::GetProcAddress(SELF.hDll, szGdipGetInterpolationMode)
      paGdipSetWorldTransform             = winapi::GetProcAddress(SELF.hDll, szGdipSetWorldTransform)
      paGdipResetWorldTransform           = winapi::GetProcAddress(SELF.hDll, szGdipResetWorldTransform)
      paGdipMultiplyWorldTransform        = winapi::GetProcAddress(SELF.hDll, szGdipMultiplyWorldTransform)
      paGdipTranslateWorldTransform       = winapi::GetProcAddress(SELF.hDll, szGdipTranslateWorldTransform)
      paGdipScaleWorldTransform           = winapi::GetProcAddress(SELF.hDll, szGdipScaleWorldTransform)
      paGdipRotateWorldTransform          = winapi::GetProcAddress(SELF.hDll, szGdipRotateWorldTransform)
      paGdipGetWorldTransform             = winapi::GetProcAddress(SELF.hDll, szGdipGetWorldTransform)
      paGdipResetPageTransform            = winapi::GetProcAddress(SELF.hDll, szGdipResetPageTransform)
      paGdipSetPageUnit                   = winapi::GetProcAddress(SELF.hDll, szGdipSetPageUnit)
      paGdipGetPageUnit                   = winapi::GetProcAddress(SELF.hDll, szGdipGetPageUnit)
      paGdipSetPageScale                  = winapi::GetProcAddress(SELF.hDll, szGdipSetPageScale)
      paGdipGetPageScale                  = winapi::GetProcAddress(SELF.hDll, szGdipGetPageScale)
      paGdipGetDpiX                       = winapi::GetProcAddress(SELF.hDll, szGdipGetDpiX)
      paGdipGetDpiY                       = winapi::GetProcAddress(SELF.hDll, szGdipGetDpiY)
      paGdipTransformPoints               = winapi::GetProcAddress(SELF.hDll, szGdipTransformPoints)
      paGdipTransformPointsI              = winapi::GetProcAddress(SELF.hDll, szGdipTransformPointsI)
      paGdipGetNearestColor               = winapi::GetProcAddress(SELF.hDll, szGdipGetNearestColor)
      paGdipCreateHalftonePalette         = winapi::GetProcAddress(SELF.hDll, szGdipCreateHalftonePalette)
      paGdipDrawLine                      = winapi::GetProcAddress(SELF.hDll, szGdipDrawLine)
      paGdipDrawLineI                     = winapi::GetProcAddress(SELF.hDll, szGdipDrawLineI)
      paGdipDrawLines                     = winapi::GetProcAddress(SELF.hDll, szGdipDrawLines)
      paGdipDrawLinesI                    = winapi::GetProcAddress(SELF.hDll, szGdipDrawLinesI)
      paGdipDrawArc                       = winapi::GetProcAddress(SELF.hDll, szGdipDrawArc)
      paGdipDrawArcI                      = winapi::GetProcAddress(SELF.hDll, szGdipDrawArcI)
      paGdipDrawBezier                    = winapi::GetProcAddress(SELF.hDll, szGdipDrawBezier)
      paGdipDrawBezierI                   = winapi::GetProcAddress(SELF.hDll, szGdipDrawBezierI)
      paGdipDrawBeziers                   = winapi::GetProcAddress(SELF.hDll, szGdipDrawBeziers)
      paGdipDrawBeziersI                  = winapi::GetProcAddress(SELF.hDll, szGdipDrawBeziersI)
      paGdipDrawRectangle                 = winapi::GetProcAddress(SELF.hDll, szGdipDrawRectangle)
      paGdipDrawRectangleI                = winapi::GetProcAddress(SELF.hDll, szGdipDrawRectangleI)
      paGdipDrawRectangles                = winapi::GetProcAddress(SELF.hDll, szGdipDrawRectangles)
      paGdipDrawRectanglesI               = winapi::GetProcAddress(SELF.hDll, szGdipDrawRectanglesI)
      paGdipDrawEllipse                   = winapi::GetProcAddress(SELF.hDll, szGdipDrawEllipse)
      paGdipDrawEllipseI                  = winapi::GetProcAddress(SELF.hDll, szGdipDrawEllipseI)
      paGdipDrawPie                       = winapi::GetProcAddress(SELF.hDll, szGdipDrawPie)
      paGdipDrawPieI                      = winapi::GetProcAddress(SELF.hDll, szGdipDrawPieI)
      paGdipDrawPolygon                   = winapi::GetProcAddress(SELF.hDll, szGdipDrawPolygon)
      paGdipDrawPolygonI                  = winapi::GetProcAddress(SELF.hDll, szGdipDrawPolygonI)
      paGdipDrawPath                      = winapi::GetProcAddress(SELF.hDll, szGdipDrawPath)
      paGdipDrawCurve                     = winapi::GetProcAddress(SELF.hDll, szGdipDrawCurve)
      paGdipDrawCurve2                    = winapi::GetProcAddress(SELF.hDll, szGdipDrawCurve2)
      paGdipDrawCurve3                    = winapi::GetProcAddress(SELF.hDll, szGdipDrawCurve3)
      paGdipDrawCurveI                    = winapi::GetProcAddress(SELF.hDll, szGdipDrawCurveI)
      paGdipDrawCurve2I                   = winapi::GetProcAddress(SELF.hDll, szGdipDrawCurve2I)
      paGdipDrawCurve3I                   = winapi::GetProcAddress(SELF.hDll, szGdipDrawCurve3I)
      paGdipDrawClosedCurve               = winapi::GetProcAddress(SELF.hDll, szGdipDrawClosedCurve)
      paGdipDrawClosedCurve2              = winapi::GetProcAddress(SELF.hDll, szGdipDrawClosedCurve2)
      paGdipDrawClosedCurveI              = winapi::GetProcAddress(SELF.hDll, szGdipDrawClosedCurveI)
      paGdipDrawClosedCurve2I             = winapi::GetProcAddress(SELF.hDll, szGdipDrawClosedCurve2I)
      paGdipGraphicsClear                 = winapi::GetProcAddress(SELF.hDll, szGdipGraphicsClear)
      paGdipFillRectangle                 = winapi::GetProcAddress(SELF.hDll, szGdipFillRectangle)
      paGdipFillRectangleI                = winapi::GetProcAddress(SELF.hDll, szGdipFillRectangleI)
      paGdipFillRectangles                = winapi::GetProcAddress(SELF.hDll, szGdipFillRectangles)
      paGdipFillRectanglesI               = winapi::GetProcAddress(SELF.hDll, szGdipFillRectanglesI)
      paGdipFillPolygon                   = winapi::GetProcAddress(SELF.hDll, szGdipFillPolygon)
      paGdipFillPolygonI                  = winapi::GetProcAddress(SELF.hDll, szGdipFillPolygonI)
      paGdipFillEllipse                   = winapi::GetProcAddress(SELF.hDll, szGdipFillEllipse)
      paGdipFillEllipseI                  = winapi::GetProcAddress(SELF.hDll, szGdipFillEllipseI)
      paGdipFillPie                       = winapi::GetProcAddress(SELF.hDll, szGdipFillPie)
      paGdipFillPieI                      = winapi::GetProcAddress(SELF.hDll, szGdipFillPieI)
      paGdipFillPath                      = winapi::GetProcAddress(SELF.hDll, szGdipFillPath)
      paGdipFillClosedCurve               = winapi::GetProcAddress(SELF.hDll, szGdipFillClosedCurve)
      paGdipFillClosedCurve2              = winapi::GetProcAddress(SELF.hDll, szGdipFillClosedCurve2)
      paGdipFillClosedCurveI              = winapi::GetProcAddress(SELF.hDll, szGdipFillClosedCurveI)
      paGdipFillClosedCurve2I             = winapi::GetProcAddress(SELF.hDll, szGdipFillClosedCurve2I)
      paGdipFillRegion                    = winapi::GetProcAddress(SELF.hDll, szGdipFillRegion)
      paGdipFlush                         = winapi::GetProcAddress(SELF.hDll, szGdipFlush)
      paGdipDrawString                    = winapi::GetProcAddress(SELF.hDll, szGdipDrawString)
      paGdipMeasureString                 = winapi::GetProcAddress(SELF.hDll, szGdipMeasureString)
      paGdipDrawCachedBitmap              = winapi::GetProcAddress(SELF.hDll, szGdipDrawCachedBitmap)
      paGdipDrawImage                     = winapi::GetProcAddress(SELF.hDll, szGdipDrawImage)
      paGdipDrawImageI                    = winapi::GetProcAddress(SELF.hDll, szGdipDrawImageI)
      paGdipDrawImageRect                 = winapi::GetProcAddress(SELF.hDll, szGdipDrawImageRect)
      paGdipDrawImageRectI                = winapi::GetProcAddress(SELF.hDll, szGdipDrawImageRectI)
      paGdipDrawImagePoints               = winapi::GetProcAddress(SELF.hDll, szGdipDrawImagePoints)
      paGdipDrawImagePointsI              = winapi::GetProcAddress(SELF.hDll, szGdipDrawImagePointsI)
      paGdipDrawImagePointRect            = winapi::GetProcAddress(SELF.hDll, szGdipDrawImagePointRect)
      paGdipDrawImagePointRectI           = winapi::GetProcAddress(SELF.hDll, szGdipDrawImagePointRectI)
      paGdipDrawImageRectRect             = winapi::GetProcAddress(SELF.hDll, szGdipDrawImageRectRect)
      paGdipDrawImageRectRectI            = winapi::GetProcAddress(SELF.hDll, szGdipDrawImageRectRectI)
      paGdipDrawImagePointsRect           = winapi::GetProcAddress(SELF.hDll, szGdipDrawImagePointsRect)
      paGdipDrawImagePointsRectI          = winapi::GetProcAddress(SELF.hDll, szGdipDrawImagePointsRectI)
      paGdipDrawImageFX                   = winapi::GetProcAddress(SELF.hDll, szGdipDrawImageFX)
      paGdipSetClipGraphics               = winapi::GetProcAddress(SELF.hDll, szGdipSetClipGraphics)
      paGdipSetClipRect                   = winapi::GetProcAddress(SELF.hDll, szGdipSetClipRect)
      paGdipSetClipRectI                  = winapi::GetProcAddress(SELF.hDll, szGdipSetClipRectI)
      paGdipSetClipPath                   = winapi::GetProcAddress(SELF.hDll, szGdipSetClipPath)
      paGdipSetClipRegion                 = winapi::GetProcAddress(SELF.hDll, szGdipSetClipRegion)
      paGdipSetClipHrgn                   = winapi::GetProcAddress(SELF.hDll, szGdipSetClipHrgn)
      paGdipResetClip                     = winapi::GetProcAddress(SELF.hDll, szGdipResetClip)
      paGdipTranslateClip                 = winapi::GetProcAddress(SELF.hDll, szGdipTranslateClip)
      paGdipTranslateClipI                = winapi::GetProcAddress(SELF.hDll, szGdipTranslateClipI)
      paGdipGetClip                       = winapi::GetProcAddress(SELF.hDll, szGdipGetClip)
      paGdipGetClipBounds                 = winapi::GetProcAddress(SELF.hDll, szGdipGetClipBounds)
      paGdipGetClipBoundsI                = winapi::GetProcAddress(SELF.hDll, szGdipGetClipBoundsI)
      paGdipIsClipEmpty                   = winapi::GetProcAddress(SELF.hDll, szGdipIsClipEmpty)
      paGdipGetVisibleClipBounds          = winapi::GetProcAddress(SELF.hDll, szGdipGetVisibleClipBounds)
      paGdipGetVisibleClipBoundsI         = winapi::GetProcAddress(SELF.hDll, szGdipGetVisibleClipBoundsI)
      paGdipIsVisibleClipEmpty            = winapi::GetProcAddress(SELF.hDll, szGdipIsVisibleClipEmpty)
      paGdipIsVisiblePoint                = winapi::GetProcAddress(SELF.hDll, szGdipIsVisiblePoint)
      paGdipIsVisiblePointI               = winapi::GetProcAddress(SELF.hDll, szGdipIsVisiblePointI)
      paGdipIsVisibleRect                 = winapi::GetProcAddress(SELF.hDll, szGdipIsVisibleRect)
      paGdipIsVisibleRectI                = winapi::GetProcAddress(SELF.hDll, szGdipIsVisibleRectI)
      paGdipSaveGraphics                  = winapi::GetProcAddress(SELF.hDll, szGdipSaveGraphics)
      paGdipRestoreGraphics               = winapi::GetProcAddress(SELF.hDll, szGdipRestoreGraphics)
      paGdipCreateEffect                  = winapi::GetProcAddress(SELF.hDll, szGdipCreateEffect)
      paGdipDeleteEffect                  = winapi::GetProcAddress(SELF.hDll, szGdipDeleteEffect)
      paGdipGetEffectParameterSize        = winapi::GetProcAddress(SELF.hDll, szGdipGetEffectParameterSize)
      paGdipSetEffectParameters           = winapi::GetProcAddress(SELF.hDll, szGdipSetEffectParameters)
      paGdipGetEffectParameters           = winapi::GetProcAddress(SELF.hDll, szGdipGetEffectParameters)
      paGdipCreateMatrix                  = winapi::GetProcAddress(SELF.hDll, szGdipCreateMatrix)
      paGdipCreateMatrix2                 = winapi::GetProcAddress(SELF.hDll, szGdipCreateMatrix2)
      paGdipCreateMatrix3                 = winapi::GetProcAddress(SELF.hDll, szGdipCreateMatrix3)
      paGdipCreateMatrix3I                = winapi::GetProcAddress(SELF.hDll, szGdipCreateMatrix3I)
      paGdipDeleteMatrix                  = winapi::GetProcAddress(SELF.hDll, szGdipDeleteMatrix)
      paGdipCloneMatrix                   = winapi::GetProcAddress(SELF.hDll, szGdipCloneMatrix)
      paGdipGetMatrixElements             = winapi::GetProcAddress(SELF.hDll, szGdipGetMatrixElements)
      paGdipSetMatrixElements             = winapi::GetProcAddress(SELF.hDll, szGdipSetMatrixElements)
      paGdipMultiplyMatrix                = winapi::GetProcAddress(SELF.hDll, szGdipMultiplyMatrix)
      paGdipTranslateMatrix               = winapi::GetProcAddress(SELF.hDll, szGdipTranslateMatrix)
      paGdipScaleMatrix                   = winapi::GetProcAddress(SELF.hDll, szGdipScaleMatrix)
      paGdipRotateMatrix                  = winapi::GetProcAddress(SELF.hDll, szGdipRotateMatrix)
      paGdipShearMatrix                   = winapi::GetProcAddress(SELF.hDll, szGdipShearMatrix)
      paGdipInvertMatrix                  = winapi::GetProcAddress(SELF.hDll, szGdipInvertMatrix)
      paGdipTransformMatrixPoints         = winapi::GetProcAddress(SELF.hDll, szGdipTransformMatrixPoints)
      paGdipTransformMatrixPointsI        = winapi::GetProcAddress(SELF.hDll, szGdipTransformMatrixPointsI)
      paGdipVectorTransformMatrixPoints   = winapi::GetProcAddress(SELF.hDll, szGdipVectorTransformMatrixPoints)
      paGdipVectorTransformMatrixPointsI  = winapi::GetProcAddress(SELF.hDll, szGdipVectorTransformMatrixPointsI)
      paGdipIsMatrixInvertible            = winapi::GetProcAddress(SELF.hDll, szGdipIsMatrixInvertible)
      paGdipIsMatrixIdentity              = winapi::GetProcAddress(SELF.hDll, szGdipIsMatrixIdentity)
      paGdipIsMatrixEqual                 = winapi::GetProcAddress(SELF.hDll, szGdipIsMatrixEqual)
      paGdipCreateFontFromDC              = winapi::GetProcAddress(SELF.hDll, szGdipCreateFontFromDC)
      paGdipCreateFontFromLogfontA        = winapi::GetProcAddress(SELF.hDll, szGdipCreateFontFromLogfontA)
      paGdipCreateFont                    = winapi::GetProcAddress(SELF.hDll, szGdipCreateFont)
      paGdipGetLogFontA                   = winapi::GetProcAddress(SELF.hDll, szGdipGetLogFontA)
      paGdipCloneFont                     = winapi::GetProcAddress(SELF.hDll, szGdipCloneFont)
      paGdipDeleteFont                    = winapi::GetProcAddress(SELF.hDll, szGdipDeleteFont)
      paGdipGetFamily                     = winapi::GetProcAddress(SELF.hDll, szGdipGetFamily)
      paGdipGetFontStyle                  = winapi::GetProcAddress(SELF.hDll, szGdipGetFontStyle)
      paGdipGetFontSize                   = winapi::GetProcAddress(SELF.hDll, szGdipGetFontSize)
      paGdipGetFontUnit                   = winapi::GetProcAddress(SELF.hDll, szGdipGetFontUnit)
      paGdipGetFontHeight                 = winapi::GetProcAddress(SELF.hDll, szGdipGetFontHeight)
      paGdipGetFontHeightGivenDPI         = winapi::GetProcAddress(SELF.hDll, szGdipGetFontHeightGivenDPI)
      paGdipCreateFontFamilyFromName      = winapi::GetProcAddress(SELF.hDll, szGdipCreateFontFamilyFromName)
      paGdipGetGenericFontFamilySansSerif = winapi::GetProcAddress(SELF.hDll, szGdipGetGenericFontFamilySansSerif)
      paGdipGetGenericFontFamilySerif     = winapi::GetProcAddress(SELF.hDll, szGdipGetGenericFontFamilySerif)
      paGdipGetGenericFontFamilyMonospace = winapi::GetProcAddress(SELF.hDll, szGdipGetGenericFontFamilyMonospace)
      paGdipDeleteFontFamily              = winapi::GetProcAddress(SELF.hDll, szGdipDeleteFontFamily)
      paGdipCloneFontFamily               = winapi::GetProcAddress(SELF.hDll, szGdipCloneFontFamily)
      paGdipGetFamilyName                 = winapi::GetProcAddress(SELF.hDll, szGdipGetFamilyName)
      paGdipIsStyleAvailable              = winapi::GetProcAddress(SELF.hDll, szGdipIsStyleAvailable)
      paGdipGetEmHeight                   = winapi::GetProcAddress(SELF.hDll, szGdipGetEmHeight)
      paGdipGetCellAscent                 = winapi::GetProcAddress(SELF.hDll, szGdipGetCellAscent)
      paGdipGetCellDescent                = winapi::GetProcAddress(SELF.hDll, szGdipGetCellDescent)
      paGdipGetLineSpacing                = winapi::GetProcAddress(SELF.hDll, szGdipGetLineSpacing)
      paGdipGetFontCollectionFamilyCount  = winapi::GetProcAddress(SELF.hDll, szGdipGetFontCollectionFamilyCount)
      paGdipGetFontCollectionFamilyList   = winapi::GetProcAddress(SELF.hDll, szGdipGetFontCollectionFamilyList)
      paGdipNewInstalledFontCollection    = winapi::GetProcAddress(SELF.hDll, szGdipNewInstalledFontCollection)
      paGdipNewPrivateFontCollection      = winapi::GetProcAddress(SELF.hDll, szGdipNewPrivateFontCollection)
      paGdipDeletePrivateFontCollection   = winapi::GetProcAddress(SELF.hDll, szGdipDeletePrivateFontCollection)
      paGdipPrivateAddFontFile            = winapi::GetProcAddress(SELF.hDll, szGdipPrivateAddFontFile)
      paGdipCreatePath                    = winapi::GetProcAddress(SELF.hDll, szGdipCreatePath)
      paGdipCreatePath2                   = winapi::GetProcAddress(SELF.hDll, szGdipCreatePath2)
      paGdipCreatePath2I                  = winapi::GetProcAddress(SELF.hDll, szGdipCreatePath2I)
      paGdipDeletePath                    = winapi::GetProcAddress(SELF.hDll, szGdipDeletePath)
      paGdipClonePath                     = winapi::GetProcAddress(SELF.hDll, szGdipClonePath)
      paGdipResetPath                     = winapi::GetProcAddress(SELF.hDll, szGdipResetPath)
      paGdipGetPathFillMode               = winapi::GetProcAddress(SELF.hDll, szGdipGetPathFillMode)
      paGdipSetPathFillMode               = winapi::GetProcAddress(SELF.hDll, szGdipSetPathFillMode)
      paGdipGetPathData                   = winapi::GetProcAddress(SELF.hDll, szGdipGetPathData)
      paGdipStartPathFigure               = winapi::GetProcAddress(SELF.hDll, szGdipStartPathFigure)
      paGdipClosePathFigure               = winapi::GetProcAddress(SELF.hDll, szGdipClosePathFigure)
      paGdipClosePathFigures              = winapi::GetProcAddress(SELF.hDll, szGdipClosePathFigures)
      paGdipSetPathMarker                 = winapi::GetProcAddress(SELF.hDll, szGdipSetPathMarker)
      paGdipClearPathMarkers              = winapi::GetProcAddress(SELF.hDll, szGdipClearPathMarkers)
      paGdipReversePath                   = winapi::GetProcAddress(SELF.hDll, szGdipReversePath)
      paGdipGetPathLastPoint              = winapi::GetProcAddress(SELF.hDll, szGdipGetPathLastPoint)
      paGdipAddPathLine                   = winapi::GetProcAddress(SELF.hDll, szGdipAddPathLine)
      paGdipAddPathLine2                  = winapi::GetProcAddress(SELF.hDll, szGdipAddPathLine2)
      paGdipAddPathLineI                  = winapi::GetProcAddress(SELF.hDll, szGdipAddPathLineI)
      paGdipAddPathLine2I                 = winapi::GetProcAddress(SELF.hDll, szGdipAddPathLine2I)
      paGdipAddPathArc                    = winapi::GetProcAddress(SELF.hDll, szGdipAddPathArc)
      paGdipAddPathArcI                   = winapi::GetProcAddress(SELF.hDll, szGdipAddPathArcI)
      paGdipAddPathBezier                 = winapi::GetProcAddress(SELF.hDll, szGdipAddPathBezier)
      paGdipAddPathBeziers                = winapi::GetProcAddress(SELF.hDll, szGdipAddPathBeziers)
      paGdipAddPathBezierI                = winapi::GetProcAddress(SELF.hDll, szGdipAddPathBezierI)
      paGdipAddPathBeziersI               = winapi::GetProcAddress(SELF.hDll, szGdipAddPathBeziersI)
      paGdipAddPathCurve                  = winapi::GetProcAddress(SELF.hDll, szGdipAddPathCurve)
      paGdipAddPathCurve2                 = winapi::GetProcAddress(SELF.hDll, szGdipAddPathCurve2)
      paGdipAddPathCurve3                 = winapi::GetProcAddress(SELF.hDll, szGdipAddPathCurve3)
      paGdipAddPathCurveI                 = winapi::GetProcAddress(SELF.hDll, szGdipAddPathCurveI)
      paGdipAddPathCurve2I                = winapi::GetProcAddress(SELF.hDll, szGdipAddPathCurve2I)
      paGdipAddPathCurve3I                = winapi::GetProcAddress(SELF.hDll, szGdipAddPathCurve3I)
      paGdipAddPathClosedCurve            = winapi::GetProcAddress(SELF.hDll, szGdipAddPathClosedCurve)
      paGdipAddPathClosedCurve2           = winapi::GetProcAddress(SELF.hDll, szGdipAddPathClosedCurve2)
      paGdipAddPathClosedCurveI           = winapi::GetProcAddress(SELF.hDll, szGdipAddPathClosedCurveI)
      paGdipAddPathClosedCurve2I          = winapi::GetProcAddress(SELF.hDll, szGdipAddPathClosedCurve2I)
      paGdipAddPathRectangle              = winapi::GetProcAddress(SELF.hDll, szGdipAddPathRectangle)
      paGdipAddPathRectangles             = winapi::GetProcAddress(SELF.hDll, szGdipAddPathRectangles)
      paGdipAddPathRectangleI             = winapi::GetProcAddress(SELF.hDll, szGdipAddPathRectangleI)
      paGdipAddPathRectanglesI            = winapi::GetProcAddress(SELF.hDll, szGdipAddPathRectanglesI)
      paGdipAddPathEllipse                = winapi::GetProcAddress(SELF.hDll, szGdipAddPathEllipse)
      paGdipAddPathEllipseI               = winapi::GetProcAddress(SELF.hDll, szGdipAddPathEllipseI)
      paGdipAddPathPie                    = winapi::GetProcAddress(SELF.hDll, szGdipAddPathPie)
      paGdipAddPathPieI                   = winapi::GetProcAddress(SELF.hDll, szGdipAddPathPieI)
      paGdipAddPathPolygon                = winapi::GetProcAddress(SELF.hDll, szGdipAddPathPolygon)
      paGdipAddPathPolygonI               = winapi::GetProcAddress(SELF.hDll, szGdipAddPathPolygonI)
      paGdipAddPathPath                   = winapi::GetProcAddress(SELF.hDll, szGdipAddPathPath)
      paGdipAddPathString                 = winapi::GetProcAddress(SELF.hDll, szGdipAddPathString)
      paGdipAddPathStringI                = winapi::GetProcAddress(SELF.hDll, szGdipAddPathStringI)
      paGdipTransformPath                 = winapi::GetProcAddress(SELF.hDll, szGdipTransformPath)
      paGdipFlattenPath                   = winapi::GetProcAddress(SELF.hDll, szGdipFlattenPath)
      paGdipWidenPath                     = winapi::GetProcAddress(SELF.hDll, szGdipWidenPath)
      paGdipWindingModeOutline            = winapi::GetProcAddress(SELF.hDll, szGdipWindingModeOutline)
      paGdipWarpPath                      = winapi::GetProcAddress(SELF.hDll, szGdipWarpPath)
      paGdipGetPointCount                 = winapi::GetProcAddress(SELF.hDll, szGdipGetPointCount)
      paGdipGetPathTypes                  = winapi::GetProcAddress(SELF.hDll, szGdipGetPathTypes)
      paGdipGetPathPoints                 = winapi::GetProcAddress(SELF.hDll, szGdipGetPathPoints)
      paGdipGetPathPointsI                = winapi::GetProcAddress(SELF.hDll, szGdipGetPathPointsI)
      paGdipGetPathWorldBounds            = winapi::GetProcAddress(SELF.hDll, szGdipGetPathWorldBounds)
      paGdipGetPathWorldBoundsI           = winapi::GetProcAddress(SELF.hDll, szGdipGetPathWorldBoundsI)
      paGdipIsVisiblePathPoint            = winapi::GetProcAddress(SELF.hDll, szGdipIsVisiblePathPoint)
      paGdipIsVisiblePathPointI           = winapi::GetProcAddress(SELF.hDll, szGdipIsVisiblePathPointI)
      paGdipIsOutlineVisiblePathPoint     = winapi::GetProcAddress(SELF.hDll, szGdipIsOutlineVisiblePathPoint)
      paGdipIsOutlineVisiblePathPointI    = winapi::GetProcAddress(SELF.hDll, szGdipIsOutlineVisiblePathPointI)
      paGdipCreatePen1                    = winapi::GetProcAddress(SELF.hDll, szGdipCreatePen1)
      paGdipCreatePen2                    = winapi::GetProcAddress(SELF.hDll, szGdipCreatePen2)
      paGdipDeletePen                     = winapi::GetProcAddress(SELF.hDll, szGdipDeletePen)
      paGdipClonePen                      = winapi::GetProcAddress(SELF.hDll, szGdipClonePen)
      paGdipSetPenWidth                   = winapi::GetProcAddress(SELF.hDll, szGdipSetPenWidth)
      paGdipGetPenWidth                   = winapi::GetProcAddress(SELF.hDll, szGdipGetPenWidth)
      paGdipSetPenLineCap197819           = winapi::GetProcAddress(SELF.hDll, szGdipSetPenLineCap197819)
      paGdipSetPenStartCap                = winapi::GetProcAddress(SELF.hDll, szGdipSetPenStartCap)
      paGdipSetPenEndCap                  = winapi::GetProcAddress(SELF.hDll, szGdipSetPenEndCap)
      paGdipSetPenDashCap197819           = winapi::GetProcAddress(SELF.hDll, szGdipSetPenDashCap197819)
      paGdipGetPenStartCap                = winapi::GetProcAddress(SELF.hDll, szGdipGetPenStartCap)
      paGdipGetPenEndCap                  = winapi::GetProcAddress(SELF.hDll, szGdipGetPenEndCap)
      paGdipGetPenDashCap197819           = winapi::GetProcAddress(SELF.hDll, szGdipGetPenDashCap197819)
      paGdipSetPenLineJoin                = winapi::GetProcAddress(SELF.hDll, szGdipSetPenLineJoin)
      paGdipGetPenLineJoin                = winapi::GetProcAddress(SELF.hDll, szGdipGetPenLineJoin)
      paGdipSetPenCustomStartCap          = winapi::GetProcAddress(SELF.hDll, szGdipSetPenCustomStartCap)
      paGdipGetPenCustomStartCap          = winapi::GetProcAddress(SELF.hDll, szGdipGetPenCustomStartCap)
      paGdipSetPenCustomEndCap            = winapi::GetProcAddress(SELF.hDll, szGdipSetPenCustomEndCap)
      paGdipGetPenCustomEndCap            = winapi::GetProcAddress(SELF.hDll, szGdipGetPenCustomEndCap)
      paGdipSetPenMiterLimit              = winapi::GetProcAddress(SELF.hDll, szGdipSetPenMiterLimit)
      paGdipGetPenMiterLimit              = winapi::GetProcAddress(SELF.hDll, szGdipGetPenMiterLimit)
      paGdipSetPenMode                    = winapi::GetProcAddress(SELF.hDll, szGdipSetPenMode)
      paGdipGetPenMode                    = winapi::GetProcAddress(SELF.hDll, szGdipGetPenMode)
      paGdipSetPenTransform               = winapi::GetProcAddress(SELF.hDll, szGdipSetPenTransform)
      paGdipGetPenTransform               = winapi::GetProcAddress(SELF.hDll, szGdipGetPenTransform)
      paGdipResetPenTransform             = winapi::GetProcAddress(SELF.hDll, szGdipResetPenTransform)
      paGdipMultiplyPenTransform          = winapi::GetProcAddress(SELF.hDll, szGdipMultiplyPenTransform)
      paGdipTranslatePenTransform         = winapi::GetProcAddress(SELF.hDll, szGdipTranslatePenTransform)
      paGdipScalePenTransform             = winapi::GetProcAddress(SELF.hDll, szGdipScalePenTransform)
      paGdipRotatePenTransform            = winapi::GetProcAddress(SELF.hDll, szGdipRotatePenTransform)
      paGdipGetPenFillType                = winapi::GetProcAddress(SELF.hDll, szGdipGetPenFillType)
      paGdipSetPenColor                   = winapi::GetProcAddress(SELF.hDll, szGdipSetPenColor)
      paGdipSetPenBrushFill               = winapi::GetProcAddress(SELF.hDll, szGdipSetPenBrushFill)
      paGdipGetPenColor                   = winapi::GetProcAddress(SELF.hDll, szGdipGetPenColor)
      paGdipGetPenBrushFill               = winapi::GetProcAddress(SELF.hDll, szGdipGetPenBrushFill)
      paGdipGetPenDashStyle               = winapi::GetProcAddress(SELF.hDll, szGdipGetPenDashStyle)
      paGdipSetPenDashStyle               = winapi::GetProcAddress(SELF.hDll, szGdipSetPenDashStyle)
      paGdipGetPenDashOffset              = winapi::GetProcAddress(SELF.hDll, szGdipGetPenDashOffset)
      paGdipSetPenDashOffset              = winapi::GetProcAddress(SELF.hDll, szGdipSetPenDashOffset)
      paGdipSetPenDashArray               = winapi::GetProcAddress(SELF.hDll, szGdipSetPenDashArray)
      paGdipGetPenDashCount               = winapi::GetProcAddress(SELF.hDll, szGdipGetPenDashCount)
      paGdipGetPenDashArray               = winapi::GetProcAddress(SELF.hDll, szGdipGetPenDashArray)
      paGdipSetPenCompoundArray           = winapi::GetProcAddress(SELF.hDll, szGdipSetPenCompoundArray)
      paGdipGetPenCompoundCount           = winapi::GetProcAddress(SELF.hDll, szGdipGetPenCompoundCount)
      paGdipGetPenCompoundArray           = winapi::GetProcAddress(SELF.hDll, szGdipGetPenCompoundArray)
      paGdipDeleteBrush                   = winapi::GetProcAddress(SELF.hDll, szGdipDeleteBrush)
      paGdipCloneBrush                    = winapi::GetProcAddress(SELF.hDll, szGdipCloneBrush)
      paGdipGetBrushType                  = winapi::GetProcAddress(SELF.hDll, szGdipGetBrushType)
      paGdipCreateSolidFill               = winapi::GetProcAddress(SELF.hDll, szGdipCreateSolidFill)
      paGdipGetSolidFillColor             = winapi::GetProcAddress(SELF.hDll, szGdipGetSolidFillColor)
      paGdipSetSolidFillColor             = winapi::GetProcAddress(SELF.hDll, szGdipSetSolidFillColor)
      paGdipCreateTexture                 = winapi::GetProcAddress(SELF.hDll, szGdipCreateTexture)
      paGdipCreateTexture2                = winapi::GetProcAddress(SELF.hDll, szGdipCreateTexture2)
      paGdipCreateTexture2I               = winapi::GetProcAddress(SELF.hDll, szGdipCreateTexture2I)
      paGdipCreateTextureIA               = winapi::GetProcAddress(SELF.hDll, szGdipCreateTextureIA)
      paGdipCreateTextureIAI              = winapi::GetProcAddress(SELF.hDll, szGdipCreateTextureIAI)
      paGdipSetTextureTransform           = winapi::GetProcAddress(SELF.hDll, szGdipSetTextureTransform)
      paGdipGetTextureTransform           = winapi::GetProcAddress(SELF.hDll, szGdipGetTextureTransform)
      paGdipResetTextureTransform         = winapi::GetProcAddress(SELF.hDll, szGdipResetTextureTransform)
      paGdipMultiplyTextureTransform      = winapi::GetProcAddress(SELF.hDll, szGdipMultiplyTextureTransform)
      paGdipTranslateTextureTransform     = winapi::GetProcAddress(SELF.hDll, szGdipTranslateTextureTransform)
      paGdipScaleTextureTransform         = winapi::GetProcAddress(SELF.hDll, szGdipScaleTextureTransform)
      paGdipRotateTextureTransform        = winapi::GetProcAddress(SELF.hDll, szGdipRotateTextureTransform)
      paGdipSetTextureWrapMode            = winapi::GetProcAddress(SELF.hDll, szGdipSetTextureWrapMode)
      paGdipGetTextureWrapMode            = winapi::GetProcAddress(SELF.hDll, szGdipGetTextureWrapMode)
      paGdipGetTextureImage               = winapi::GetProcAddress(SELF.hDll, szGdipGetTextureImage)
      paGdipCreateLineBrush               = winapi::GetProcAddress(SELF.hDll, szGdipCreateLineBrush)
      paGdipCreateLineBrushI              = winapi::GetProcAddress(SELF.hDll, szGdipCreateLineBrushI)
      paGdipCreateLineBrushFromRect       = winapi::GetProcAddress(SELF.hDll, szGdipCreateLineBrushFromRect)
      paGdipCreateLineBrushFromRectI      = winapi::GetProcAddress(SELF.hDll, szGdipCreateLineBrushFromRectI)
      paGdipCreateLineBrushFromRectWithAngle  = winapi::GetProcAddress(SELF.hDll, szGdipCreateLineBrushFromRectWithAngle)
      paGdipCreateLineBrushFromRectWithAngleI = winapi::GetProcAddress(SELF.hDll, szGdipCreateLineBrushFromRectWithAngleI)
      paGdipSetLineColors                 = winapi::GetProcAddress(SELF.hDll, szGdipSetLineColors)
      paGdipGetLineColors                 = winapi::GetProcAddress(SELF.hDll, szGdipGetLineColors)
      paGdipGetLineRect                   = winapi::GetProcAddress(SELF.hDll, szGdipGetLineRect)
      paGdipGetLineRectI                  = winapi::GetProcAddress(SELF.hDll, szGdipGetLineRectI)
      paGdipSetLineGammaCorrection        = winapi::GetProcAddress(SELF.hDll, szGdipSetLineGammaCorrection)
      paGdipGetLineGammaCorrection        = winapi::GetProcAddress(SELF.hDll, szGdipGetLineGammaCorrection)
      paGdipGetLineBlendCount             = winapi::GetProcAddress(SELF.hDll, szGdipGetLineBlendCount)
      paGdipSetLineBlend                  = winapi::GetProcAddress(SELF.hDll, szGdipSetLineBlend)
      paGdipGetLineBlend                  = winapi::GetProcAddress(SELF.hDll, szGdipGetLineBlend)
      paGdipGetLinePresetBlendCount       = winapi::GetProcAddress(SELF.hDll, szGdipGetLinePresetBlendCount)
      paGdipSetLinePresetBlend            = winapi::GetProcAddress(SELF.hDll, szGdipSetLinePresetBlend)
      paGdipGetLinePresetBlend            = winapi::GetProcAddress(SELF.hDll, szGdipGetLinePresetBlend)
      paGdipSetLineSigmaBlend             = winapi::GetProcAddress(SELF.hDll, szGdipSetLineSigmaBlend)
      paGdipSetLineLinearBlend            = winapi::GetProcAddress(SELF.hDll, szGdipSetLineLinearBlend)
      paGdipSetLineTransform              = winapi::GetProcAddress(SELF.hDll, szGdipSetLineTransform)
      paGdipGetLineTransform              = winapi::GetProcAddress(SELF.hDll, szGdipGetLineTransform)
      paGdipResetLineTransform            = winapi::GetProcAddress(SELF.hDll, szGdipResetLineTransform)
      paGdipMultiplyLineTransform         = winapi::GetProcAddress(SELF.hDll, szGdipMultiplyLineTransform)
      paGdipTranslateLineTransform        = winapi::GetProcAddress(SELF.hDll, szGdipTranslateLineTransform)
      paGdipScaleLineTransform            = winapi::GetProcAddress(SELF.hDll, szGdipScaleLineTransform)
      paGdipRotateLineTransform           = winapi::GetProcAddress(SELF.hDll, szGdipRotateLineTransform)
      paGdipSetLineWrapMode               = winapi::GetProcAddress(SELF.hDll, szGdipSetLineWrapMode)
      paGdipGetLineWrapMode               = winapi::GetProcAddress(SELF.hDll, szGdipGetLineWrapMode)
      paGdipCreateHatchBrush              = winapi::GetProcAddress(SELF.hDll, szGdipCreateHatchBrush)
      paGdipGetHatchStyle                 = winapi::GetProcAddress(SELF.hDll, szGdipGetHatchStyle)
      paGdipGetHatchForegroundColor       = winapi::GetProcAddress(SELF.hDll, szGdipGetHatchForegroundColor)
      paGdipGetHatchBackgroundColor       = winapi::GetProcAddress(SELF.hDll, szGdipGetHatchBackgroundColor)
      paGdipCreateRegion                  = winapi::GetProcAddress(SELF.hDll, szGdipCreateRegion)
      paGdipCreateRegionRect              = winapi::GetProcAddress(SELF.hDll, szGdipCreateRegionRect)
      paGdipCreateRegionRectI             = winapi::GetProcAddress(SELF.hDll, szGdipCreateRegionRectI)
      paGdipCreateRegionPath              = winapi::GetProcAddress(SELF.hDll, szGdipCreateRegionPath)
      paGdipCreateRegionRgnData           = winapi::GetProcAddress(SELF.hDll, szGdipCreateRegionRgnData)
      paGdipCreateRegionHrgn              = winapi::GetProcAddress(SELF.hDll, szGdipCreateRegionHrgn)
      paGdipDeleteRegion                  = winapi::GetProcAddress(SELF.hDll, szGdipDeleteRegion)
      paGdipCloneRegion                   = winapi::GetProcAddress(SELF.hDll, szGdipCloneRegion)
      paGdipSetInfinite                   = winapi::GetProcAddress(SELF.hDll, szGdipSetInfinite)
      paGdipSetEmpty                      = winapi::GetProcAddress(SELF.hDll, szGdipSetEmpty)
      paGdipCombineRegionRect             = winapi::GetProcAddress(SELF.hDll, szGdipCombineRegionRect)
      paGdipCombineRegionRectI            = winapi::GetProcAddress(SELF.hDll, szGdipCombineRegionRectI)
      paGdipCombineRegionPath             = winapi::GetProcAddress(SELF.hDll, szGdipCombineRegionPath)
      paGdipCombineRegionRegion           = winapi::GetProcAddress(SELF.hDll, szGdipCombineRegionRegion)
      paGdipTranslateRegion               = winapi::GetProcAddress(SELF.hDll, szGdipTranslateRegion)
      paGdipTranslateRegionI              = winapi::GetProcAddress(SELF.hDll, szGdipTranslateRegionI)
      paGdipTransformRegion               = winapi::GetProcAddress(SELF.hDll, szGdipTransformRegion)
      paGdipGetRegionBounds               = winapi::GetProcAddress(SELF.hDll, szGdipGetRegionBounds)
      paGdipGetRegionBoundsI              = winapi::GetProcAddress(SELF.hDll, szGdipGetRegionBoundsI)
      paGdipGetRegionHRgn                 = winapi::GetProcAddress(SELF.hDll, szGdipGetRegionHRgn)
      paGdipIsEmptyRegion                 = winapi::GetProcAddress(SELF.hDll, szGdipIsEmptyRegion)
      paGdipIsInfiniteRegion              = winapi::GetProcAddress(SELF.hDll, szGdipIsInfiniteRegion)
      paGdipIsEqualRegion                 = winapi::GetProcAddress(SELF.hDll, szGdipIsEqualRegion)
      paGdipGetRegionDataSize             = winapi::GetProcAddress(SELF.hDll, szGdipGetRegionDataSize)
      paGdipGetRegionData                 = winapi::GetProcAddress(SELF.hDll, szGdipGetRegionData)
      paGdipIsVisibleRegionPoint          = winapi::GetProcAddress(SELF.hDll, szGdipIsVisibleRegionPoint)
      paGdipIsVisibleRegionPointI         = winapi::GetProcAddress(SELF.hDll, szGdipIsVisibleRegionPointI)
      paGdipIsVisibleRegionRect           = winapi::GetProcAddress(SELF.hDll, szGdipIsVisibleRegionRect)
      paGdipIsVisibleRegionRectI          = winapi::GetProcAddress(SELF.hDll, szGdipIsVisibleRegionRectI)
      paGdipGetRegionScansCount           = winapi::GetProcAddress(SELF.hDll, szGdipGetRegionScansCount)
      paGdipGetRegionScans                = winapi::GetProcAddress(SELF.hDll, szGdipGetRegionScans)
      paGdipGetRegionScansI               = winapi::GetProcAddress(SELF.hDll, szGdipGetRegionScansI)
      paGdipCreateCachedBitmap            = winapi::GetProcAddress(SELF.hDll, szGdipCreateCachedBitmap)
      paGdipDeleteCachedBitmap            = winapi::GetProcAddress(SELF.hDll, szGdipDeleteCachedBitmap)
      paGdipCreateStringFormat            = winapi::GetProcAddress(SELF.hDll, szGdipCreateStringFormat)
      paGdipDeleteStringFormat            = winapi::GetProcAddress(SELF.hDll, szGdipDeleteStringFormat)
      paGdipCloneStringFormat             = winapi::GetProcAddress(SELF.hDll, szGdipCloneStringFormat)
      paGdipSetStringFormatFlags          = winapi::GetProcAddress(SELF.hDll, szGdipSetStringFormatFlags)
      paGdipGetStringFormatFlags          = winapi::GetProcAddress(SELF.hDll, szGdipGetStringFormatFlags)
      paGdipSetStringFormatAlign          = winapi::GetProcAddress(SELF.hDll, szGdipSetStringFormatAlign)
      paGdipGetStringFormatAlign          = winapi::GetProcAddress(SELF.hDll, szGdipGetStringFormatAlign)
      paGdipSetStringFormatLineAlign      = winapi::GetProcAddress(SELF.hDll, szGdipSetStringFormatLineAlign)
      paGdipGetStringFormatLineAlign      = winapi::GetProcAddress(SELF.hDll, szGdipGetStringFormatLineAlign)
      paGdipSetStringFormatHotkeyPrefix   = winapi::GetProcAddress(SELF.hDll, szGdipSetStringFormatHotkeyPrefix)
      paGdipGetStringFormatHotkeyPrefix   = winapi::GetProcAddress(SELF.hDll, szGdipGetStringFormatHotkeyPrefix)
      paGdipSetStringFormatTabStops       = winapi::GetProcAddress(SELF.hDll, szGdipSetStringFormatTabStops)
      paGdipGetStringFormatTabStopCount   = winapi::GetProcAddress(SELF.hDll, szGdipGetStringFormatTabStopCount)
      paGdipGetStringFormatTabStops       = winapi::GetProcAddress(SELF.hDll, szGdipGetStringFormatTabStops)
      paGdipSetStringFormatDigitSubstitution    = winapi::GetProcAddress(SELF.hDll, szGdipSetStringFormatDigitSubstitution)
      paGdipGetStringFormatDigitSubstitution    = winapi::GetProcAddress(SELF.hDll, szGdipGetStringFormatDigitSubstitution)
      paGdipSetStringFormatTrimming       = winapi::GetProcAddress(SELF.hDll, szGdipSetStringFormatTrimming)
      paGdipGetStringFormatTrimming       = winapi::GetProcAddress(SELF.hDll, szGdipGetStringFormatTrimming)
      paGdipSetStringFormatMeasurableCharacterRanges    = winapi::GetProcAddress(SELF.hDll, szGdipSetStringFormatMeasurableCharacterRanges)
      paGdipGetStringFormatMeasurableCharacterRangeCount    = winapi::GetProcAddress(SELF.hDll, szGdipGetStringFormatMeasurableCharacterRangeCount)
      paGdipStringFormatGetGenericDefault   = winapi::GetProcAddress(SELF.hDll, szGdipStringFormatGetGenericDefault)
      paGdipStringFormatGetGenericTypographic   = winapi::GetProcAddress(SELF.hDll, szGdipStringFormatGetGenericTypographic)
      paGdipCreateImageAttributes         = winapi::GetProcAddress(SELF.hDll, szGdipCreateImageAttributes)
      paGdipDisposeImageAttributes        = winapi::GetProcAddress(SELF.hDll, szGdipDisposeImageAttributes)
      paGdipCloneImageAttributes          = winapi::GetProcAddress(SELF.hDll, szGdipCloneImageAttributes)
      paGdipSetImageAttributesToIdentity  = winapi::GetProcAddress(SELF.hDll, szGdipSetImageAttributesToIdentity)
      paGdipResetImageAttributes          = winapi::GetProcAddress(SELF.hDll, szGdipResetImageAttributes)
      paGdipSetImageAttributesColorMatrix = winapi::GetProcAddress(SELF.hDll, szGdipSetImageAttributesColorMatrix)
      paGdipSetImageAttributesThreshold   = winapi::GetProcAddress(SELF.hDll, szGdipSetImageAttributesThreshold)
      paGdipSetImageAttributesGamma       = winapi::GetProcAddress(SELF.hDll, szGdipSetImageAttributesGamma)
      paGdipSetImageAttributesNoOp        = winapi::GetProcAddress(SELF.hDll, szGdipSetImageAttributesNoOp)
      paGdipSetImageAttributesColorKeys   = winapi::GetProcAddress(SELF.hDll, szGdipSetImageAttributesColorKeys)
      paGdipSetImageAttributesOutputChannel = winapi::GetProcAddress(SELF.hDll, szGdipSetImageAttributesOutputChannel)
      paGdipSetImageAttributesOutputChannelColorProfile = winapi::GetProcAddress(SELF.hDll, szGdipSetImageAttributesOutputChannelColorProfile)
      paGdipSetImageAttributesRemapTable  = winapi::GetProcAddress(SELF.hDll, szGdipSetImageAttributesRemapTable)
      paGdipSetImageAttributesWrapMode    = winapi::GetProcAddress(SELF.hDll, szGdipSetImageAttributesWrapMode)
      paGdipGetImageAttributesAdjustedPalette   = winapi::GetProcAddress(SELF.hDll, szGdipGetImageAttributesAdjustedPalette)
      paGdipCreatePathIter                = winapi::GetProcAddress(SELF.hDll, szGdipCreatePathIter)
      paGdipDeletePathIter                = winapi::GetProcAddress(SELF.hDll, szGdipDeletePathIter)
      paGdipPathIterNextSubpath           = winapi::GetProcAddress(SELF.hDll, szGdipPathIterNextSubpath)
      paGdipPathIterNextSubpathPath       = winapi::GetProcAddress(SELF.hDll, szGdipPathIterNextSubpathPath)
      paGdipPathIterNextPathType          = winapi::GetProcAddress(SELF.hDll, szGdipPathIterNextPathType)
      paGdipPathIterNextMarker            = winapi::GetProcAddress(SELF.hDll, szGdipPathIterNextMarker)
      paGdipPathIterNextMarkerPath        = winapi::GetProcAddress(SELF.hDll, szGdipPathIterNextMarkerPath)
      paGdipPathIterGetCount              = winapi::GetProcAddress(SELF.hDll, szGdipPathIterGetCount)
      paGdipPathIterGetSubpathCount       = winapi::GetProcAddress(SELF.hDll, szGdipPathIterGetSubpathCount)
      paGdipPathIterHasCurve              = winapi::GetProcAddress(SELF.hDll, szGdipPathIterHasCurve)
      paGdipPathIterRewind                = winapi::GetProcAddress(SELF.hDll, szGdipPathIterRewind)
      paGdipPathIterEnumerate             = winapi::GetProcAddress(SELF.hDll, szGdipPathIterEnumerate)
      paGdipPathIterCopyData              = winapi::GetProcAddress(SELF.hDll, szGdipPathIterCopyData)
      paGdipCreatePathGradient            = winapi::GetProcAddress(SELF.hDll, szGdipCreatePathGradient)
      paGdipCreatePathGradientI           = winapi::GetProcAddress(SELF.hDll, szGdipCreatePathGradientI)
      paGdipCreatePathGradientFromPath    = winapi::GetProcAddress(SELF.hDll, szGdipCreatePathGradientFromPath)
      paGdipGetPathGradientCenterColor    = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientCenterColor)
      paGdipSetPathGradientCenterColor    = winapi::GetProcAddress(SELF.hDll, szGdipSetPathGradientCenterColor)
      paGdipGetPathGradientPointCount     = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientPointCount)
      paGdipGetPathGradientSurroundColorCount   = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientSurroundColorCount)
      paGdipGetPathGradientSurroundColorsWithCount  = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientSurroundColorsWithCount)
      paGdipSetPathGradientSurroundColorsWithCount  = winapi::GetProcAddress(SELF.hDll, szGdipSetPathGradientSurroundColorsWithCount)
      paGdipGetPathGradientPath           = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientPath)
      paGdipSetPathGradientPath           = winapi::GetProcAddress(SELF.hDll, szGdipSetPathGradientPath)
      paGdipGetPathGradientCenterPoint    = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientCenterPoint)
      paGdipGetPathGradientCenterPointI   = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientCenterPointI)
      paGdipSetPathGradientCenterPoint    = winapi::GetProcAddress(SELF.hDll, szGdipSetPathGradientCenterPoint)
      paGdipSetPathGradientCenterPointI   = winapi::GetProcAddress(SELF.hDll, szGdipSetPathGradientCenterPointI)
      paGdipGetPathGradientRect           = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientRect)
      paGdipGetPathGradientRectI          = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientRectI)
      paGdipSetPathGradientGammaCorrection  = winapi::GetProcAddress(SELF.hDll, szGdipSetPathGradientGammaCorrection)
      paGdipGetPathGradientGammaCorrection  = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientGammaCorrection)
      paGdipGetPathGradientBlendCount     = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientBlendCount)
      paGdipGetPathGradientBlend          = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientBlend)
      paGdipSetPathGradientBlend          = winapi::GetProcAddress(SELF.hDll, szGdipSetPathGradientBlend)
      paGdipGetPathGradientPresetBlendCount = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientPresetBlendCount)
      paGdipSetPathGradientPresetBlend    = winapi::GetProcAddress(SELF.hDll, szGdipSetPathGradientPresetBlend)
      paGdipGetPathGradientPresetBlend    = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientPresetBlend)
      paGdipSetPathGradientSigmaBlend     = winapi::GetProcAddress(SELF.hDll, szGdipSetPathGradientSigmaBlend)
      paGdipSetPathGradientLinearBlend    = winapi::GetProcAddress(SELF.hDll, szGdipSetPathGradientLinearBlend)
      paGdipGetPathGradientTransform      = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientTransform)
      paGdipSetPathGradientTransform      = winapi::GetProcAddress(SELF.hDll, szGdipSetPathGradientTransform)
      paGdipResetPathGradientTransform    = winapi::GetProcAddress(SELF.hDll, szGdipResetPathGradientTransform)
      paGdipMultiplyPathGradientTransform = winapi::GetProcAddress(SELF.hDll, szGdipMultiplyPathGradientTransform)
      paGdipTranslatePathGradientTransform  = winapi::GetProcAddress(SELF.hDll, szGdipTranslatePathGradientTransform)
      paGdipScalePathGradientTransform    = winapi::GetProcAddress(SELF.hDll, szGdipScalePathGradientTransform)
      paGdipRotatePathGradientTransform   = winapi::GetProcAddress(SELF.hDll, szGdipRotatePathGradientTransform)
      paGdipGetPathGradientFocusScales    = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientFocusScales)
      paGdipSetPathGradientFocusScales    = winapi::GetProcAddress(SELF.hDll, szGdipSetPathGradientFocusScales)
      paGdipGetPathGradientWrapMode       = winapi::GetProcAddress(SELF.hDll, szGdipGetPathGradientWrapMode)
      paGdipSetPathGradientWrapMode       = winapi::GetProcAddress(SELF.hDll, szGdipSetPathGradientWrapMode)
      paGdipGetEncoderParameterListSize   = winapi::GetProcAddress(SELF.hDll, szGdipGetEncoderParameterListSize)
      paGdipGetEncoderParameterList       = winapi::GetProcAddress(SELF.hDll, szGdipGetEncoderParameterList)
      paGdipSaveAdd                       = winapi::GetProcAddress(SELF.hDll, szGdipSaveAdd)
      paGdipSaveAddImage                  = winapi::GetProcAddress(SELF.hDll, szGdipSaveAddImage)
      paGdipImageGetFrameDimensionsCount  = winapi::GetProcAddress(SELF.hDll, szGdipImageGetFrameDimensionsCount)
      paGdipImageGetFrameDimensionsList   = winapi::GetProcAddress(SELF.hDll, szGdipImageGetFrameDimensionsList)
      paGdipImageGetFrameCount            = winapi::GetProcAddress(SELF.hDll, szGdipImageGetFrameCount)
      paGdipImageSelectActiveFrame        = winapi::GetProcAddress(SELF.hDll, szGdipImageSelectActiveFrame)
      paGdipGetPropertySize               = winapi::GetProcAddress(SELF.hDll, szGdipGetPropertySize)
      paGdipGetAllPropertyItems           = winapi::GetProcAddress(SELF.hDll, szGdipGetAllPropertyItems)
      paGdipFindFirstImageItem            = winapi::GetProcAddress(SELF.hDll, szGdipFindFirstImageItem)
      paGdipFindNextImageItem             = winapi::GetProcAddress(SELF.hDll, szGdipFindNextImageItem)
      paGdipGetImageItemData              = winapi::GetProcAddress(SELF.hDll, szGdipGetImageItemData)
      paGdipCreateMetafileFromWmf         = winapi::GetProcAddress(SELF.hDll, szGdipCreateMetafileFromWmf)
      paGdipCreateMetafileFromEmf         = winapi::GetProcAddress(SELF.hDll, szGdipCreateMetafileFromEmf)
      paGdipCreateMetafileFromFile        = winapi::GetProcAddress(SELF.hDll, szGdipCreateMetafileFromFile)
      paGdipCreateMetafileFromWmfFile     = winapi::GetProcAddress(SELF.hDll, szGdipCreateMetafileFromWmfFile)
      paGdipCreateMetafileFromStream      = winapi::GetProcAddress(SELF.hDll, szGdipCreateMetafileFromStream)
      paGdipRecordMetafile                = winapi::GetProcAddress(SELF.hDll, szGdipRecordMetafile)
      paGdipRecordMetafileI               = winapi::GetProcAddress(SELF.hDll, szGdipRecordMetafileI)
      paGdipRecordMetafileFileName        = winapi::GetProcAddress(SELF.hDll, szGdipRecordMetafileFileName)
      paGdipRecordMetafileFileNameI       = winapi::GetProcAddress(SELF.hDll, szGdipRecordMetafileFileNameI)
      paGdipGetMetafileHeaderFromWmf      = winapi::GetProcAddress(SELF.hDll, szGdipGetMetafileHeaderFromWmf)
      paGdipGetMetafileHeaderFromEmf      = winapi::GetProcAddress(SELF.hDll, szGdipGetMetafileHeaderFromEmf)
      paGdipGetMetafileHeaderFromFile     = winapi::GetProcAddress(SELF.hDll, szGdipGetMetafileHeaderFromFile)
      paGdipGetMetafileHeaderFromStream   = winapi::GetProcAddress(SELF.hDll, szGdipGetMetafileHeaderFromStream)
      paGdipGetMetafileHeaderFromMetafile = winapi::GetProcAddress(SELF.hDll, szGdipGetMetafileHeaderFromMetafile)
      paGdipGetHemfFromMetafile           = winapi::GetProcAddress(SELF.hDll, szGdipGetHemfFromMetafile)
      paGdipPlayMetafileRecord            = winapi::GetProcAddress(SELF.hDll, szGdipPlayMetafileRecord)
      paGdipSetMetafileDownLevelRasterizationLimit  = winapi::GetProcAddress(SELF.hDll, szGdipSetMetafileDownLevelRasterizationLimit)
      paGdipGetMetafileDownLevelRasterizationLimit  = winapi::GetProcAddress(SELF.hDll, szGdipGetMetafileDownLevelRasterizationLimit)
      paGdipEmfToWmfBits                  = winapi::GetProcAddress(SELF.hDll, szGdipEmfToWmfBits)
      paGdipConvertToEmfPlus              = winapi::GetProcAddress(SELF.hDll, szGdipConvertToEmfPlus)
      paGdipConvertToEmfPlusToFile        = winapi::GetProcAddress(SELF.hDll, szGdipConvertToEmfPlusToFile)
      paGdipEnumerateMetafileDestPoint    = winapi::GetProcAddress(SELF.hDll, szGdipEnumerateMetafileDestPoint)
      paGdipEnumerateMetafileDestPointI   = winapi::GetProcAddress(SELF.hDll, szGdipEnumerateMetafileDestPointI)
      paGdipEnumerateMetafileDestRect     = winapi::GetProcAddress(SELF.hDll, szGdipEnumerateMetafileDestRect)
      paGdipEnumerateMetafileDestRectI    = winapi::GetProcAddress(SELF.hDll, szGdipEnumerateMetafileDestRectI)
      paGdipEnumerateMetafileDestPoints   = winapi::GetProcAddress(SELF.hDll, szGdipEnumerateMetafileDestPoints)
      paGdipEnumerateMetafileDestPointsI  = winapi::GetProcAddress(SELF.hDll, szGdipEnumerateMetafileDestPointsI)
      paGdipEnumerateMetafileSrcRectDestPoint   = winapi::GetProcAddress(SELF.hDll, szGdipEnumerateMetafileSrcRectDestPoint)
      paGdipEnumerateMetafileSrcRectDestPointI  = winapi::GetProcAddress(SELF.hDll, szGdipEnumerateMetafileSrcRectDestPointI)
      paGdipEnumerateMetafileSrcRectDestRect    = winapi::GetProcAddress(SELF.hDll, szGdipEnumerateMetafileSrcRectDestRect)
      paGdipEnumerateMetafileSrcRectDestRectI   = winapi::GetProcAddress(SELF.hDll, szGdipEnumerateMetafileSrcRectDestRectI)
      paGdipEnumerateMetafileSrcRectDestPoints  = winapi::GetProcAddress(SELF.hDll, szGdipEnumerateMetafileSrcRectDestPoints)
      paGdipEnumerateMetafileSrcRectDestPointsI = winapi::GetProcAddress(SELF.hDll, szGdipEnumerateMetafileSrcRectDestPointsI)
      paGdipComment                       = winapi::GetProcAddress(SELF.hDll, szGdipComment)
      paGdipBeginContainer                = winapi::GetProcAddress(SELF.hDll, szGdipBeginContainer)
      paGdipBeginContainerI               = winapi::GetProcAddress(SELF.hDll, szGdipBeginContainerI)
      paGdipBeginContainer2               = winapi::GetProcAddress(SELF.hDll, szGdipBeginContainer2)
      paGdipEndContainer                  = winapi::GetProcAddress(SELF.hDll, szGdipEndContainer)
      paGdipCreateCustomLineCap           = winapi::GetProcAddress(SELF.hDll, szGdipCreateCustomLineCap)
      paGdipDeleteCustomLineCap           = winapi::GetProcAddress(SELF.hDll, szGdipDeleteCustomLineCap)
      paGdipSetCustomLineCapStrokeCaps    = winapi::GetProcAddress(SELF.hDll, szGdipSetCustomLineCapStrokeCaps)
      paGdipGetCustomLineCapStrokeCaps    = winapi::GetProcAddress(SELF.hDll, szGdipGetCustomLineCapStrokeCaps)
      paGdipSetCustomLineCapStrokeJoin    = winapi::GetProcAddress(SELF.hDll, szGdipSetCustomLineCapStrokeJoin)
      paGdipGetCustomLineCapStrokeJoin    = winapi::GetProcAddress(SELF.hDll, szGdipGetCustomLineCapStrokeJoin)
      paGdipSetCustomLineCapBaseCap       = winapi::GetProcAddress(SELF.hDll, szGdipSetCustomLineCapBaseCap)
      paGdipGetCustomLineCapBaseCap       = winapi::GetProcAddress(SELF.hDll, szGdipGetCustomLineCapBaseCap)
      paGdipSetCustomLineCapBaseInset     = winapi::GetProcAddress(SELF.hDll, szGdipSetCustomLineCapBaseInset)
      paGdipGetCustomLineCapBaseInset     = winapi::GetProcAddress(SELF.hDll, szGdipGetCustomLineCapBaseInset)
      paGdipSetCustomLineCapWidthScale    = winapi::GetProcAddress(SELF.hDll, szGdipSetCustomLineCapWidthScale)
      paGdipGetCustomLineCapWidthScale    = winapi::GetProcAddress(SELF.hDll, szGdipGetCustomLineCapWidthScale)
      paGdipCloneCustomLineCap            = winapi::GetProcAddress(SELF.hDll, szGdipCloneCustomLineCap)
      paGdipCreateAdjustableArrowCap      = winapi::GetProcAddress(SELF.hDll, szGdipCreateAdjustableArrowCap)
      paGdipSetAdjustableArrowCapHeight   = winapi::GetProcAddress(SELF.hDll, szGdipSetAdjustableArrowCapHeight)
      paGdipGetAdjustableArrowCapHeight   = winapi::GetProcAddress(SELF.hDll, szGdipGetAdjustableArrowCapHeight)
      paGdipSetAdjustableArrowCapWidth    = winapi::GetProcAddress(SELF.hDll, szGdipSetAdjustableArrowCapWidth)
      paGdipGetAdjustableArrowCapWidth    = winapi::GetProcAddress(SELF.hDll, szGdipGetAdjustableArrowCapWidth)
      paGdipSetAdjustableArrowCapMiddleInset    = winapi::GetProcAddress(SELF.hDll, szGdipSetAdjustableArrowCapMiddleInset)
      paGdipGetAdjustableArrowCapMiddleInset    = winapi::GetProcAddress(SELF.hDll, szGdipGetAdjustableArrowCapMiddleInset)
      paGdipSetAdjustableArrowCapFillState  = winapi::GetProcAddress(SELF.hDll, szGdipSetAdjustableArrowCapFillState)
      paGdipGetAdjustableArrowCapFillState  = winapi::GetProcAddress(SELF.hDll, szGdipGetAdjustableArrowCapFillState)
      
      paGdipCreateStreamOnFile  = winapi::GetProcAddress(SELF.hDll, szGdipCreateStreamOnFile)

    ELSE
      printd('[GdiPlus] TGdiPlusInitializer.Construct: Cannot load GdiPlus APIs.')
    END
  ELSE
    printd('[GdiPlus] TGdiPlusInitializer.Construct: LoadLibrary(%Z) failed, error %i', GP_DLLNAME, winapi::GetLastError())
  END
  
  IF SELF.bInitialized = TRUE
    SELF.Startup()
  END

TGdiPlusInitializer.Destruct  PROCEDURE()
  CODE
  IF SELF.token
    SELF.Shutdown()
  END
  
  IF SELF.hDll
    winapi::FreeLibrary(SELF.hDll)
    SELF.hDll = 0
    SELF.bInitialized = FALSE
  END
  
TGdiPlusInitializer.Startup   PROCEDURE()
input                           LIKE(tagGdiplusStartupInput)
err                             GpStatus, AUTO
  CODE
  input.GdiplusVersion = 1
  input.DebugEventCallback = 0
  input.SuppressBackgroundThread = FALSE
  input.SuppressExternalCodecs = FALSE
  err = GdipStartup(SELF.token, ADDRESS(input), 0)
  GdipReportError('TGdiPlusInitializer.Startup', err)
  RETURN err

TGdiPlusInitializer.Shutdown  PROCEDURE()
  CODE
  GdipShutdown(SELF.token)
!!!endregion
  
!!!region Helper functions
GdipReportError               PROCEDURE(STRING pMethodName, GpStatus pErr)
  CODE
  IF pErr <> GpStatus:Ok
    IF pErr <> GpStatus:Win32Error
      printd('[TGdiPlus] %s failed, Gdi+ error code %i', pMethodName, pErr)
    ELSE
      printd('[TGdiPlus] %s failed, Gdi+ error code %i, Win error code %i', pMethodName, pErr, winapi::GetLastError())
    END
  END
  
GdipCreateEffectFromGuid      PROCEDURE(STRING pGuid, *LONG pHandle)
effId                           LIKE(_GUID)
  CODE
  IIDFromString(pGuid, effId)
  RETURN GdipCreateEffect(effId, pHandle)

ToStream                      PROCEDURE(STRING pData)
nDataLen                        LONG, AUTO
lpStream                        LONG(0)
gm                              TGlobalMemory
pvData                          LONG
hr                              HRESULT, AUTO
  CODE
  nDataLen = SIZE(pData)
  IF nDataLen=0
    RETURN 0
  END
  
  IF gm.GlobalAlloc(GMEM_MOVEABLE, nDataLen)
    pvData = gm.GlobalLock()
    IF pvData
      winapi::memcpy(pvData, ADDRESS(pData), nDataLen)
      gm.GlobalUnlock()

      hr = winapi::CreateStreamOnHGlobal(gm.GetHandle(), FALSE, ADDRESS(lpStream))
      IF hr <> S_OK
        printd('CreateStreamOnHGlobal error %x', hr)
      END
    ELSE
      printd('GlobalLock error %i', winapi::GetLastError())
    END
    
!    gm.GlobalFree()  !- don't free this global handle, call stream.Release() instead.
  ELSE
    printd('GlobalAlloc error %i', winapi::GetLastError())
  END
  
  RETURN lpStream
  
GetEncoderClsid               PROCEDURE(STRING pFormat, *_CLSID pClsId)
num                             UNSIGNED(0)
bytes                           UNSIGNED(0)
codecInfo                       LIKE(GpImageCodecInfo)
codecInfoSize                   UNSIGNED, AUTO
buf                             &STRING, AUTO
i                               LONG, AUTO
enc                             TStringEncoding
mimeTypeW                       &STRING, AUTO
mimeTypeStrLen                  LONG, AUTO
mimeTypeA                       STRING(32), AUTO
ret                             BOOL(FALSE)
  CODE
  GdipGetImageEncodersSize(num, bytes)
  IF bytes = 0
    !- Failure
    RETURN FALSE
  END
  
  !- get a list of encoders
  buf &= NEW STRING(bytes)
  GdipGetImageEncoders(num, bytes, ADDRESS(buf))
  
  !- loop thru each encoder
  codecInfoSize = SIZE(codecInfo)
  LOOP i=1 TO num
    !- read next encoder
    codecInfo = SUB(buf, (i-1)*codecInfoSize + 1, codecInfoSize)
    
    !- get mime type (WCHAR*)
    mimeTypeStrLen = lstrlenW(codecInfo.MimeType)
!    mimeTypeW &= (codecInfo.MimeType) &':'& mimeTypeStrLen
    mimeTypeW &= NEW STRING(mimeTypeStrLen*2+2)
    winapi::memcpy(ADDRESS(mimeTypeW), codecInfo.MimeType, mimeTypeStrLen*2+2)
    mimeTypeA = enc.FromUtf16(mimeTypeW)
    DISPOSE(mimeTypeW)
    
    !- compare mime type against passed format
    IF LOWER(pFormat) = mimeTypeA
      !- Success
      pClsId = codecInfo.Clsid
      ret = TRUE
      BREAK
    END
  END

  !- Failure
  DISPOSE(buf)
  RETURN ret

GetFileMimeType               PROCEDURE(STRING pFileName)
nameLen                         LONG, AUTO
dotpos                          LONG, AUTO
sExtension                      STRING(256), AUTO
  CODE
  nameLen = LEN(CLIP(pFileName))
  dotpos = INSTRING('.', pFileName, -1, nameLen)
  IF NOT dotpos
    RETURN ''
  END
  sExtension = LOWER(pFileName[dotpos+1 : nameLen])
  CASE sExtension
  OF 'bmp'
    RETURN 'image/bmp'
  OF 'jpg'
    RETURN 'image/jpeg'
  OF 'gif'
    RETURN 'image/gif'
  OF 'tif'
    RETURN 'image/tiff'
  OF 'png'
    RETURN 'image/png'
  END
  RETURN ''

IIDFromString                 PROCEDURE(STRING pStr, *_GUID pGuid)
enc                             TStringEncoding
oleStr                          STRING(LEN(pStr)*2+6)
hr                              HRESULT, AUTO
  CODE
  CLEAR(pGuid)
  IF SUB(pStr, 1, 1) = '{{'
    oleStr = enc.ToCWStr(pStr)
  ELSE
    oleStr = enc.ToCWStr(printf('{{%s}', pStr))
  END
  
  hr = winapi::IIDFromString(ADDRESS(oleStr), ADDRESS(pGuid))
  IF hr <> S_OK
    printd('IIDFromString(%s) error %x', pStr, hr)
    RETURN FALSE
  END
  RETURN TRUE
  
GdipMakeARGB                  PROCEDURE(BYTE pAlpha, BYTE pRed, BYTE pGreen, BYTE pBlue)
  CODE
  RETURN BOR(BOR(BOR(pBlue, BSHIFT(pGreen, 8)), BSHIFT(pRed, 16)), BSHIFT(pAlpha, 24))
  
GdipMakeARGB                  PROCEDURE(LONG pClarionColor, BYTE pAlpha=255)
  CODE
  RETURN GdipMakeARGB(pAlpha, BAND(pClarionColor, 0FFh), BAND(BSHIFT(pClarionColor, -8), 0FFh), BAND(BSHIFT(pClarionColor, -16), 0FFh))
!!!endregion
  
!!!region TGdiPlusImage
TGdiPlusImage.Construct       PROCEDURE()
  CODE
  
TGdiPlusImage.Destruct        PROCEDURE()
  CODE
  SELF.DisposeImage()
    
TGdiPlusImage.Initialized     PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativeImage <> 0)

TGdiPlusImage.GetLastStatus   PROCEDURE()
  CODE
  RETURN SELF.lastResult
  
TGdiPlusImage.FromFile        PROCEDURE(STRING pFileName, BOOL pUseICM=FALSE)
enc                             TStringEncoding
wstr                            STRING(FILE:MaxFilePath*2+2)
  CODE
  SELF.DisposeImage()
  wstr = enc.ToCWStr(LONGPATH(pFileName))
  IF pUseICM
    SELF.lastResult = GdipLoadImageFromFileICM(ADDRESS(wstr), SELF.nativeImage)
  ELSE
    SELF.lastResult = GdipLoadImageFromFile(ADDRESS(wstr), SELF.nativeImage)
  END
  GdipReportError(printf('TGdiPlusImage.FromFile(%S, %b)', pFileName, pUseICM), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusImage.FromString      PROCEDURE(STRING pImageData, BOOL pUseICM=FALSE)
  CODE
  RETURN SELF.FromString(pImageData, pUseICM)
  
TGdiPlusImage.FromString      PROCEDURE(*STRING pImageData, BOOL pUseICM=FALSE)
lpStream                        LONG, AUTO
stream                          &IStream, AUTO
  CODE
  SELF.DisposeImage()
  lpStream = ToStream(pImageData)
  IF lpStream
    stream &= (lpStream)
    IF pUseICM
      SELF.lastResult = GdipLoadImageFromStreamICM(lpStream, SELF.nativeImage)
    ELSE
      SELF.lastResult = GdipLoadImageFromStream(lpStream, SELF.nativeImage)
    END
    stream.Release()
    GdipReportError('TGdiPlusImage.FromString', SELF.lastResult)
  END
  RETURN SELF.lastResult
      
TGdiPlusImage.Save            PROCEDURE(STRING pFileName, <STRING pFormat>)
enc                             TStringEncoding
wstr                            STRING(FILE:MaxFilePath*2+2)
sMimeType                       STRING(20), AUTO
clsid                           LIKE(_CLSID), AUTO
  CODE
  !- convert filename to UTF-16
  wstr = enc.ToCWStr(LONGPATH(pFileName))

  !- get encoder
  IF pFormat
    sMimeType = pFormat
  ELSE
    sMimeType = GetFileMimeType(pFileName)
  END
  
  CLEAR(clsid)
  GetEncoderClsid(sMimeType, clsid)
  
  SELF.lastResult = GdipSaveImageToFile(SELF.nativeImage, ADDRESS(wstr), ADDRESS(clsid), 0)
  GdipReportError(printf('TGdiPlusImage.Save(%S, %S)', pFileName, pFormat), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusImage.ToString        PROCEDURE(STRING pFormat)
lpStream                        LONG, AUTO
stream                          &IStream, AUTO
clsid                           LIKE(_CLSID), AUTO
hr                              HRESULT, AUTO
statstg                         LIKE(tagSTATSTG), AUTO
nDataLen                        UNSIGNED, AUTO
nBytesRead                      LONG, AUTO
sImageData                      &STRING
  CODE
  !- get encoder
  CLEAR(clsid)
  GetEncoderClsid(pFormat, clsid)
  
  !- create IStream
  lpStream = ToStream(' ')
  IF lpStream
    !- save image to stream
    SELF.lastResult = GdipSaveImageToStream(SELF.nativeImage, lpStream, ADDRESS(clsid), 0)
    GdipReportError(printf('TGdiPlusImage.ToString(%S)', pFormat), SELF.lastResult)
    
    stream &= (lpStream)
    
    !- get stream size
    hr = stream.Stat(ADDRESS(statstg), STATFLAG_NONAME)
    IF hr = S_OK
      nDataLen = statstg.cbSize.LowPart   !- assume the stream is not too big and doesn't exceed ULONG size
      
      !- create data buffer
      sImageData &= NEW STRING(nDataLen)
      
      !- seek to the start of the stream
      hr = stream.Seek(0, 0, STREAM_SEEK_SET, 0)
      IF hr = S_OK
        !- read to the buffer
        hr = stream.Read(ADDRESS(sImageData), nDataLen, nBytesRead)
        IF hr = S_OK
          !nDataLen must be equal to nBytesRead
          !printd('IStream.Read requested %i bytes, read %i bytes', nDataLen, nBytesRead)
        ELSE
          printd('IStream.Read error 0x%x', hr)
        END
      ELSE
        printd('IStream.Seek error 0x%x', hr)
      END
    ELSE
      printd('IStream.Stat error 0x%x', hr)
    END
    
    stream.Release()
  END
  
  RETURN sImageData
  
TGdiPlusImage.Clone           PROCEDURE()
cloneImage                      &TGdiPlusImage
  CODE
  cloneImage &= NEW TGdiPlusImage
  IF SELF.Clone(cloneImage) <> GpStatus:Ok
    DISPOSE(cloneImage)
    cloneImage &= NULL
  END
  RETURN cloneImage

TGdiPlusImage.Clone           PROCEDURE(*TGdiPlusImage pCloneImage)
  CODE
  pCloneImage.DisposeImage()
  SELF.lastResult = GdipCloneImage(SELF.nativeImage, pCloneImage.nativeImage)
  GdipReportError('TGdiPlusImage.Clone', SELF.lastResult)
  pCloneImage.lastResult = SELF.lastResult
  RETURN SELF.lastResult

TGdiPlusImage.GetThumbnailImage   PROCEDURE(UNSIGNED pThumbWidth, UNSIGNED pThumbHeight)
thumbImage                          &TGdiPlusImage
  CODE
  thumbImage &= NEW TGdiPlusImage
  SELF.GetThumbnailImage(pThumbWidth, pThumbHeight, thumbImage)
  RETURN thumbImage
  
TGdiPlusImage.GetThumbnailImage   PROCEDURE(UNSIGNED pThumbWidth, UNSIGNED pThumbHeight, *TGdiPlusImage pThumbImage)
  CODE
  SELF.lastResult = GdipGetImageThumbnail(SELF.nativeImage, pThumbWidth, pThumbHeight, pThumbImage.nativeImage, 0, 0)
  GdipReportError('TGdiPlusImage.GetThumbnailImage', SELF.lastResult)
  pThumbImage.lastResult = SELF.lastResult
  RETURN SELF.lastResult

TGdiPlusImage.DisposeImage    PROCEDURE()
  CODE
  IF SELF.nativeImage
    SELF.lastResult = GdipDisposeImage(SELF.nativeImage)
    SELF.nativeImage = 0
    GdipReportError('TGdiPlusImage.DisposeImage', SELF.lastResult)
  END
  RETURN SELF.lastResult
 
TGdiPlusImage.GetWidth        PROCEDURE()
w                               UNSIGNED(0)
  CODE
  SELF.lastResult = GdipGetImageWidth(SELF.nativeImage, w)
  GdipReportError('TGdiPlusImage.GetWidth', SELF.lastResult)
  RETURN w

TGdiPlusImage.GetHeight       PROCEDURE()
h                               UNSIGNED(0)
  CODE
  SELF.lastResult = GdipGetImageHeight(SELF.nativeImage, h)
  GdipReportError('TGdiPlusImage.GetHeight', SELF.lastResult)
  RETURN h

TGdiPlusImage.GetHorizontalResolution PROCEDURE()
resolution                              SREAL(0.0)
  CODE
  SELF.lastResult = GdipGetImageHorizontalResolution(SELF.nativeImage, resolution)
  GdipReportError('TGdiPlusImage.GetHorizontalResolution', SELF.lastResult)
  RETURN resolution
  
TGdiPlusImage.GetVerticalResolution   PROCEDURE()
resolution                              SREAL(0.0)
  CODE
  SELF.lastResult = GdipGetImageVerticalResolution(SELF.nativeImage, resolution)
  GdipReportError('TGdiPlusImage.GetVerticalResolution', SELF.lastResult)
  RETURN resolution

TGdiPlusImage.GetBounds       PROCEDURE(*GpRectF pRect, *GpUnit pUnit)
  CODE
  SELF.lastResult = GdipGetImageBounds(SELF.nativeImage, ADDRESS(pRect), ADDRESS(pUnit))
  GdipReportError('TGdiPlusImage.GetBounds', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusImage.GetPhysicalDimension    PROCEDURE(*GpSizeF pSize)
w                                       SREAL, AUTO
h                                       SREAL, AUTO
  CODE
  SELF.lastResult = GdipGetImageDimension(SELF.nativeImage, w, h)
  GdipReportError('TGdiPlusImage.GetPhysicalDimension', SELF.lastResult)
  pSize.cx = w
  pSize.cy = h
  RETURN SELF.lastResult
  
TGdiPlusImage.GetType         PROCEDURE()
imgType                         GpImageType(ImageTypeUnknown)
  CODE
  SELF.lastResult = GdipGetImageType(SELF.nativeImage, imgType)
  GdipReportError('TGdiPlusImage.GetType', SELF.lastResult)
  RETURN imgType
  
TGdiPlusImage.GetFlags        PROCEDURE()
flags                           ULONG(0)
  CODE
  SELF.lastResult = GdipGetImageFlags(SELF.nativeImage, flags)
  GdipReportError('TGdiPlusImage.GetFlags', SELF.lastResult)
  RETURN flags
  
TGdiPlusImage.GetRawFormat    PROCEDURE(*GUID pGuid)
  CODE
  CLEAR(pGuid, -1)
  SELF.lastResult = GdipGetImageRawFormat(SELF.nativeImage, ADDRESS(pGuid))
  GdipReportError('TGdiPlusImage.GetRawFormat', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusImage.GetMimeType     PROCEDURE()
fmt                             LIKE(GUID), AUTO
  CODE
  IF SELF.GetRawFormat(fmt) = GpStatus:Ok
    IF fmt = ImageFormatMemoryBMP
      RETURN 'image/bmp'
    ELSIF fmt = ImageFormatBMP
      RETURN 'image/bmp'
    ELSIF fmt = ImageFormatEMF
      RETURN 'image/emf'
    ELSIF fmt = ImageFormatWMF
      RETURN 'image/wmf'
    ELSIF fmt = ImageFormatJPEG
      RETURN 'image/jpeg'
    ELSIF fmt = ImageFormatPNG
      RETURN 'image/png'
    ELSIF fmt = ImageFormatGIF
      RETURN 'image/gif'
    ELSIF fmt = ImageFormatEXIF
      RETURN 'image/jpeg'
    ELSIF fmt = ImageFormatTIFF
      RETURN 'image/tiff'
    ELSIF fmt = ImageFormatIcon
      RETURN 'image/vnd.microsoft.icon'
    ELSIF fmt = ImageFormatHEIF
      RETURN 'image/heif'
    ELSIF fmt = ImageFormatWEBP
      RETURN 'image/webp'
    END
  END
  
  RETURN ''
  
TGdiPlusImage.GetPixelFormat  PROCEDURE()
fmt                             GpPixelFormat(0)
  CODE
  SELF.lastResult = GdipGetImagePixelFormat(SELF.nativeImage, fmt)
  GdipReportError('TGdiPlusImage.GetPixelFormat', SELF.lastResult)
  RETURN fmt
  
TGdiPlusImage.GetPropertyCount    PROCEDURE()
nCount                              UNSIGNED(0)
  CODE
  SELF.lastResult = GdipGetPropertyCount(SELF.nativeImage, nCount)
  GdipReportError('TGdiPlusImage.GetPropertyCount', SELF.lastResult)
  RETURN nCOunt

TGdiPlusImage.GetPropertyIdList   PROCEDURE(UNSIGNED pNumOfProperty, *ULONG[] pList)
  CODE
  CLEAR(pList)
  SELF.lastResult = GdipGetPropertyIdList(SELF.nativeImage, pNumOfProperty, ADDRESS(pList))
  GdipReportError(printf('TGdiPlusImage.GetPropertyIdList(%i)', pNumOfProperty), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImage.GetPropertyItem PROCEDURE(ULONG pPropId, *TGdiPlusPropertyItem pItem)
propSize                        UNSIGNED, AUTO
buf                             &STRING, AUTO
itm                             LIKE(GpPropertyItem)
  CODE
  SELF.lastResult = GdipGetPropertyItemSize(SELF.nativeImage, pPropId, propSize)
  GdipReportError(printf('TGdiPlusImage.GetPropertyItemSize(%x)', pPropId), SELF.lastResult)
  IF SELF.lastResult = GpStatus:Ok
    buf &= NEW STRING(propSize)
    SELF.lastResult = GdipGetPropertyItem(SELF.nativeImage, pPropId, propSize, ADDRESS(buf))
    GdipReportError(printf('TGdiPlusImage.GetPropertyItem(%x)', pPropId), SELF.lastResult)
    IF SELF.lastResult = GpStatus:Ok
      itm = buf
      pItem.Assign(itm)
    END
    DISPOSE(buf)
  END
  RETURN SELF.lastResult

TGdiPlusImage.SetPropertyItem PROCEDURE(GpPropertyItem pItem)
  CODE
  SELF.lastResult = GdipSetPropertyItem(SELF.nativeImage, ADDRESS(pItem))
  GdipReportError(printf('TGdiPlusImage.SetPropertyItem(%i)', pItem.id), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusImage.SetPropertyItem PROCEDURE(TGdiPlusPropertyItem pItem)
itm                             LIKE(GpPropertyItem)
  CODE
  itm.id = pItem.GetId()
  itm.type = pItem.GetType()
  itm.length = pItem.GetLength()
  itm.refValue = pItem.GetValueAddress()
  RETURN SELF.SetPropertyItem(itm)
  
TGdiPlusImage.RemovePropertyItem  PROCEDURE(ULONG pPropId)
  CODE
  SELF.lastResult = GdipRemovePropertyItem(SELF.nativeImage, pPropId)
  GdipReportError(printf('TGdiPlusImage.RemovePropertyItem(%i)', pPropId), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusImage.RotateFlip      PROCEDURE(GpRotateFlipType pRfType)
  CODE
  SELF.lastResult = GdipImageRotateFlip(SELF.nativeImage, pRfType)
  GdipReportError(printf('TGdiPlusImage.RotateFlip(%i)', pRfType), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusImage.GetPaletteSize  PROCEDURE()
paletteSize                     UNSIGNED(0)
  CODE
  SELF.lastResult = GdipGetImagePaletteSize(SELF.nativeImage, paletteSize)
  GdipReportError(printf('TGdiPlusImage.GetPaletteSize'), SELF.lastResult)
  RETURN paletteSize
  
TGdiPlusImage.GetPalette      PROCEDURE(CONST *STRING pPalette, UNSIGNED pSize)
  CODE
  SELF.lastResult = GdipGetImagePalette(SELF.nativeImage, ADDRESS(pPalette), pSize)
  GdipReportError(printf('TGdiPlusImage.GetPalette'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusImage.SetPalette      PROCEDURE(CONST *STRING pPalette)
  CODE
  SELF.lastResult = GdipSetImagePalette(SELF.nativeImage, ADDRESS(pPalette))
  GdipReportError(printf('TGdiPlusImage.SetPalette'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImage.GetEncoderParameterListSize PROCEDURE(_CLSID pEncoder)
encSize                                     UNSIGNED
  CODE
  SELF.lastResult = GdipGetEncoderParameterListSize(SELF.nativeImage, ADDRESS(pEncoder), encSize)
  GdipReportError(printf('TGdiPlusImage.GetEncoderParameterListSize'), SELF.lastResult)
  RETURN encSize
    
TGdiPlusImage.GetEncoderParameterList PROCEDURE(_CLSID pEncoder, UNSIGNED pSize, CONST *STRING pEncoderParams)
  CODE
  SELF.lastResult = GdipGetEncoderParameterList(SELF.nativeImage, ADDRESS(pEncoder), pSize, ADDRESS(pEncoderParams))
  GdipReportError(printf('TGdiPlusImage.GetEncoderParameterList'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImage.SaveAdd         PROCEDURE(CONST *STRING pEncoderParams)
  CODE
  SELF.lastResult = GdipSaveAdd(SELF.nativeImage, ADDRESS(pEncoderParams))
  GdipReportError(printf('TGdiPlusImage.SaveAdd'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImage.SaveAdd         PROCEDURE(TGdiPlusImage pNewImage, CONST *STRING pEncoderParams)
  CODE
  SELF.lastResult = GdipSaveAddImage(SELF.nativeImage, pNewImage.nativeImage, ADDRESS(pEncoderParams))
  GdipReportError(printf('TGdiPlusImage.SaveAdd'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImage.GetFrameDimensionsCount PROCEDURE()
count                                   UNSIGNED
  CODE
  SELF.lastResult = GdipImageGetFrameDimensionsCount(SELF.nativeImage, count)
  GdipReportError(printf('TGdiPlusImage.GetFrameDimensionsCount'), SELF.lastResult)
  RETURN count
    
TGdiPlusImage.GetFrameDimensionsList  PROCEDURE(LONG pDimensionIDs, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipImageGetFrameDimensionsList(SELF.nativeImage, ADDRESS(pDimensionIDs), pCount)
  GdipReportError(printf('TGdiPlusImage.GetFrameDimensionsList'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImage.GetFrameCount   PROCEDURE(GUID pDimensionID)
count                           UNSIGNED
  CODE
  SELF.lastResult = GdipImageGetFrameCount(SELF.nativeImage, ADDRESS(pDimensionID), count)
  GdipReportError(printf('TGdiPlusImage.GetFrameCount'), SELF.lastResult)
  RETURN count
    
TGdiPlusImage.SelectActiveFrame   PROCEDURE(GUID pDimensionID, UNSIGNED pFrameIndex)
  CODE
  SELF.lastResult = GdipImageSelectActiveFrame(SELF.nativeImage, ADDRESS(pDimensionID), pFrameIndex)
  GdipReportError(printf('TGdiPlusImage.SelectActiveFrame'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImage.GetPropertySize PROCEDURE(*UNSIGNED pTotalBufferSize, *UNSIGNED pNumProperties)
  CODE
  SELF.lastResult = GdipGetPropertySize(SELF.nativeImage, pTotalBufferSize, pNumProperties)
  GdipReportError(printf('TGdiPlusImage.GetPropertySize'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImage.GetAllPropertyItems PROCEDURE(UNSIGNED pTotalBufferSize, UNSIGNED pNumProperties, LONG pAllItems)
  CODE
  SELF.lastResult = GdipGetAllPropertyItems(SELF.nativeImage, pTotalBufferSize, pNumProperties, pAllItems)
  GdipReportError(printf('TGdiPlusImage.GetAllPropertyItems'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImage.FindFirstItem   PROCEDURE(*GpImageItemData pItem)
  CODE
  SELF.lastResult = GdipFindFirstImageItem(SELF.nativeImage, ADDRESS(pItem))
  GdipReportError(printf('TGdiPlusImage.FindFirstItem'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImage.FindNextImageItem   PROCEDURE(*GpImageItemData pItem)
  CODE
  SELF.lastResult = GdipFindNextImageItem(SELF.nativeImage, ADDRESS(pItem))
  GdipReportError(printf('TGdiPlusImage.FindNextImageItem'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImage.GetImageItemData    PROCEDURE(*GpImageItemData pItem)
  CODE
  SELF.lastResult = GdipGetImageItemData(SELF.nativeImage, ADDRESS(pItem))
  GdipReportError(printf('TGdiPlusImage.GetImageItemData'), SELF.lastResult)
  RETURN SELF.lastResult
!!!endregion
  
!!!region TGdiPlusPropertyItem
TGdiPlusPropertyItem.Destruct PROCEDURE()
  CODE
  SELF.Free()
  
TGdiPlusPropertyItem.Assign   PROCEDURE(GpPropertyItem pItem)
  CODE
  SELF.id = pItem.id
  SELF.length = pItem.length
  SELF.type = pItem.type
  SELF.value &= NEW CSTRING(pItem.length)
  winapi::memcpy(ADDRESS(SELF.value), pItem.refvalue, pItem.length)

TGdiPlusPropertyItem.Free     PROCEDURE()
  CODE
  IF NOT SELF.value &= NULL
    DISPOSE(SELF.value)
    SELF.value &= NULL
  END
  
TGdiPlusPropertyItem.GetId    PROCEDURE()
  CODE
  RETURN SELF.id
  
TGdiPlusPropertyItem.GetLength    PROCEDURE()
  CODE
  RETURN SELF.length
  
TGdiPlusPropertyItem.GetType  PROCEDURE()
  CODE
  RETURN SELF.type
  
TGdiPlusPropertyItem.GetArraySize PROCEDURE()
elSize                              UNSIGNED, AUTO
  CODE
  CASE SELF.type
  OF GpPropertyTagType:ASCII
    elSize = 1
  OF GpPropertyTagType:Byte
    elSize = 1
  OF GpPropertyTagType:Short
    elSize = 2
  OF GpPropertyTagType:Long OROF GpPropertyTagType:SLONG
    elSize = 4
  OF GpPropertyTagType:Rational OROF GpPropertyTagType:SRational
    elSize = 8
  ELSE
    elSize = 1
  END
  
  RETURN SELF.length / elSize

TGdiPlusPropertyItem.GetValueAddress  PROCEDURE()
  CODE
  RETURN ADDRESS(SELF.value)
  
TGdiPlusPropertyItem.GetStringValue   PROCEDURE()
  CODE
  RETURN SELF.value
  
TGdiPlusPropertyItem.GetByteValue PROCEDURE()
v                                   BYTE, AUTO
  CODE
  winapi::memcpy(ADDRESS(v), ADDRESS(SELF.value), 1)
  RETURN v
    
TGdiPlusPropertyItem.GetShortValue    PROCEDURE()
v                                       SHORT, AUTO
  CODE
  winapi::memcpy(ADDRESS(v), ADDRESS(SELF.value), 2)
  RETURN v
    
TGdiPlusPropertyItem.GetLongValue PROCEDURE()
v                                   LONG, AUTO
  CODE
  winapi::memcpy(ADDRESS(v), ADDRESS(SELF.value), 4)
  RETURN v

TGdiPlusPropertyItem.GetRealValue PROCEDURE()
v                                   SREAL, AUTO
  CODE
  winapi::memcpy(ADDRESS(v), ADDRESS(SELF.value), 4)
  RETURN v
!!!endregion
  
!!!region TGdiPlusBitmap
TGdiPlusBitmap.FromFile       PROCEDURE(STRING pFileName, BOOL pUseICM=FALSE)
enc                             TStringEncoding
wstr                            STRING(FILE:MaxFilePath*2+2)
  CODE
  SELF.DisposeImage()
  wstr = enc.ToCWStr(LONGPATH(pFileName))
  IF pUseICM
    SELF.lastResult = GdipCreateBitmapFromFileICM(ADDRESS(wstr), SELF.nativeImage)
  ELSE
    SELF.lastResult = GdipCreateBitmapFromFile(ADDRESS(wstr), SELF.nativeImage)
  END
  GdipReportError(printf('TGdiPlusBitmap.FromFile(%S, %b)', pFileName, pUseICM), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusBitmap.FromFileStream PROCEDURE(STRING pFileName)
enc                             TStringEncoding
wstr                            STRING(FILE:MaxFilePath*2+2)
lpStream                        LONG(0)
stream                          &IStream
  CODE
  SELF.DisposeImage()
  wstr = enc.ToCWStr(LONGPATH(pFileName))
  SELF.lastResult = GdipCreateStreamOnFile(ADDRESS(wstr), 0, lpStream)  !- 0 is FileMode.Open
  GdipReportError(printf('TGdiPlusBitmap.FromFileStream(%S) [GdipCreateStreamOnFile]', pFileName), SELF.lastResult)
  IF SELF.lastResult = GpStatus:Ok
    stream &= (lpStream)
    SELF.lastResult = GdipCreateBitmapFromStream(lpStream, SELF.nativeImage)
    stream.Release()
    GdipReportError('TGdiPlusBitmap.FromFileStream(%S) [GdipCreateBitmapFromStream]', SELF.lastResult)
  END
  
  RETURN SELF.lastResult
  
TGdiPlusBitmap.FromString     PROCEDURE(STRING pImageData, BOOL pUseICM=FALSE)
  CODE
  RETURN SELF.FromString(pImageData, pUseICM)
  
TGdiPlusBitmap.FromString     PROCEDURE(*STRING pImageData, BOOL pUseICM=FALSE)
lpStream                        LONG, AUTO
stream                          &IStream, AUTO
  CODE
  SELF.DisposeImage()
  lpStream = ToStream(pImageData)
  IF lpStream
    stream &= (lpStream)
    IF pUseICM
      SELF.lastResult = GdipCreateBitmapFromStreamICM(lpStream, SELF.nativeImage)
    ELSE
      SELF.lastResult = GdipCreateBitmapFromStream(lpStream, SELF.nativeImage)
    END
    stream.Release()
    GdipReportError('TGdiPlusBitmap.FromString', SELF.lastResult)
  END
  RETURN SELF.lastResult

TGdiPlusBitmap.FromScan0      PROCEDURE(LONG pWidth, LONG pHeight, LONG pStride, GpPixelFormat pFormat, LONG pScan0)
  CODE
  SELF.DisposeImage()
  SELF.lastResult = GdipCreateBitmapFromScan0(pWidth, pHeight, pStride, pFormat, pScan0, SELF.nativeImage)
  GdipReportError(printf('TGdiPlusBitmap.FromScan0'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusBitmap.FromScan0      PROCEDURE(LONG pWidth, LONG pHeight, LONG pStride, GpPixelFormat pFormat, BYTE[] pScan0)
  CODE
  RETURN SELF.FromScan0(pWidth, pHeight, pStride, pFormat, ADDRESS(pScan0))

TGdiPlusBitmap.CreateBitmap   PROCEDURE(LONG pWidth, LONG pHeight, GpPixelFormat pFormat)
  CODE
  SELF.DisposeImage()
  SELF.lastResult = GdipCreateBitmapFromScan0(pWidth, pHeight, 0, pFormat, 0, SELF.nativeImage)
  GdipReportError(printf('TGdiPlusBitmap.FromScan0'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusBitmap.FromGraphics   PROCEDURE(LONG pWidth, LONG pHeight, TGdiPlusGraphics pTarget)
  CODE
  SELF.DisposeImage()
  SELF.lastResult = GdipCreateBitmapFromGraphics(pWidth, pHeight, pTarget.nativeGraphics, SELF.nativeImage)
  GdipReportError(printf('TGdiPlusBitmap.FromGraphics'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusBitmap.FromBITMAPINFO PROCEDURE(LONG pBitmapInfo, LONG pBitmapData)
  CODE
  SELF.DisposeImage()
  SELF.lastResult = GdipCreateBitmapFromGdiDib(pBitmapInfo, pBitmapData, SELF.nativeImage)
  GdipReportError(printf('TGdiPlusBitmap.FromBITMAPINFO'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusBitmap.FromBITMAPINFO PROCEDURE(CONST *STRING pBitmapInfo, BYTE[] pBitmapData)
  CODE
  RETURN SELF.FromBITMAPINFO(ADDRESS(pBitmapInfo), ADDRESS(pBitmapData))

TGdiPlusBitmap.FromHBITMAP    PROCEDURE(HBITMAP pHbm, HANDLE pHpal)
  CODE
  SELF.DisposeImage()
  SELF.lastResult = GdipCreateBitmapFromHBITMAP(pHbm, pHpal, SELF.nativeImage)
  GdipReportError(printf('TGdiPlusBitmap.FromHBITMAP'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusBitmap.GetHBITMAP     PROCEDURE(ULONG pBackground)
hbmReturn                       HBITMAP(0)
  CODE
  SELF.lastResult = GdipCreateHBITMAPFromBitmap(SELF.nativeImage, hbmReturn, pBackground)
  GdipReportError(printf('TGdiPlusBitmap.GetHBITMAP(%x)', pBackground), SELF.lastResult)
  RETURN hbmReturn

TGdiPlusBitmap.FromHICON      PROCEDURE(HICON pHicon)
  CODE
  SELF.DisposeImage()
  SELF.lastResult = GdipCreateBitmapFromHICON(pHicon, SELF.nativeImage)
  GdipReportError(printf('TGdiPlusBitmap.FromHICON'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusBitmap.GetHICON       PROCEDURE()
hiconReturn                     HICON(0)
  CODE
  SELF.lastResult = GdipCreateHICONFromBitmap(SELF.nativeImage, hiconReturn)
  GdipReportError(printf('TGdiPlusBitmap.GetHICON'), SELF.lastResult)
  RETURN hiconReturn
  
TGdiPlusBitmap.FromResource   PROCEDURE(HINSTANCE pHInstance, STRING pBitmapName)
enc                             TStringEncoding
wstr                            STRING(FILE:MaxFilePath*2+2)
  CODE
  SELF.DisposeImage()
  wstr = enc.ToCWStr(CLIP(pBitmapName))
  SELF.lastResult = GdipCreateBitmapFromResource(pHInstance, ADDRESS(wstr), SELF.nativeImage)
  GdipReportError(printf('TGdiPlusBitmap.FromResource(%x, %S)', pHInstance, pBitmapName), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusBitmap.Clone          PROCEDURE(LONG pX, LONG pY, LONG pWidth, LONG pHeight, GpPixelFormat pFormat, *TGdiPlusBitmap pDstBitmap)
rect                            LIKE(GpRectF), AUTO
un                              GpUnit, AUTO
  CODE
  pDstBitmap.DisposeImage()
  SELF.lastResult = GdipCloneBitmapAreaI(pX, pY, pWidth, pHeight, pFormat, SELF.nativeImage, pDstBitmap.nativeImage)
  GdipReportError(printf('TGdiPlusBitmap.Clone(%i, %i, %i, %i)', pX, pY, pWidth, pHeight), SELF.lastResult)
  
!  IF SELF.lastResult = GpStatus:OutOfMemory
!    SELF.GetBounds(rect, un)
!    printd('TGdiPlusBitmap.Clone(): image bounds (%i, %i, %i, %i)', rect.x, rect.y, rect.width, rect.height)
!  END
  
  RETURN SELF.lastResult

TGdiPlusBitmap.Clone          PROCEDURE(GpRect pRect, GpPixelFormat pFormat, *TGdiPlusBitmap pDstBitmap)
  CODE
  RETURN SELF.Clone(pRect.x, pRect.y, pRect.width, pRect.height, pFormat, pDstBitmap)
  
TGdiPlusBitmap.Clone          PROCEDURE(TRect pRect, GpPixelFormat pFormat, *TGdiPlusBitmap pDstBitmap)
  CODE
  RETURN SELF.Clone(pRect.left, pRect.top, pRect.Width(), pRect.Height(), pFormat, pDstBitmap)

TGdiPlusBitmap.Clone          PROCEDURE(LONG pX, LONG pY, LONG pWidth, LONG pHeight, GpPixelFormat pFormat)
dstBitmap                       &TGdiPlusBitmap
  CODE
  dstBitmap &= NEW TGdiPlusBitmap
  IF SELF.Clone(pX, pY, pWidth, pHeight, pFormat, dstBitmap) <> GpStatus:Ok
    DISPOSE(dstBitmap)
    dstBitmap &= NULL
  END
  RETURN dstBitmap
  
TGdiPlusBitmap.LockBits       PROCEDURE(GpRect pRect, GpImageLockMode pFlags, GpPixelFormat pFormat, *GpBitmapData pLockedBitmapData)
  CODE
  SELF.lastResult = GdipBitmapLockBits(SELF.nativeImage, ADDRESS(pRect), pFlags, pFormat, ADDRESS(pLockedBitmapData))
  GdipReportError(printf('TGdiPlusBitmap.LockBits'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusBitmap.UnlockBits     PROCEDURE(GpBitmapData pLockedBitmapData)
  CODE
  SELF.lastResult = GdipBitmapUnlockBits(SELF.nativeImage, ADDRESS(pLockedBitmapData))
  GdipReportError(printf('TGdiPlusBitmap.UnlockBits'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusBitmap.GetPixel       PROCEDURE(LONG pX, LONG pY)
clr                             GpARGB(COLOR:NONE)
  CODE
  SELF.lastResult = GdipBitmapGetPixel(SELF.nativeImage, pX, pY, clr)
  GdipReportError(printf('TGdiPlusBitmap.GetPixel(%i, %i)', pX, pY), SELF.lastResult)
  RETURN clr

TGdiPlusBitmap.SetPixel       PROCEDURE(LONG pX, LONG pY, GpARGB pColor)
  CODE
  SELF.lastResult = GdipBitmapSetPixel(SELF.nativeImage, pX, pY, pColor)
  GdipReportError(printf('TGdiPlusBitmap.SetPixel(%i, %i)', pX, pY), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusBitmap.SetResolution  PROCEDURE(SREAL pXDpi, SREAL pYDpi)
  CODE
  SELF.lastResult = GdipBitmapSetResolution(SELF.nativeImage, pXDpi, pYDpi)
  GdipReportError(printf('TGdiPlusBitmap.SetResolution(%f, %f)', pXDpi, pYDpi), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusBitmap.ConvertFormat  PROCEDURE(GpPixelFormat pFormat, GpDitherType pDithertype, GpPaletteType pPalettetype, CONST *STRING pPalette, SREAL pAlphaThresholdPercent)
  CODE
  SELF.lastResult = GdipBitmapConvertFormat(SELF.nativeImage, pFormat, pDithertype, pPalettetype, ADDRESS(pPalette), pAlphaThresholdPercent)
  GdipReportError(printf('TGdiPlusBitmap.ConvertFormat'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusBitmap.InitializePalette  PROCEDURE(CONST *STRING pPalette, GpPaletteType pPaletteType, UNSIGNED pOptimalColors, BOOL pUseTransparentColor)
  CODE
  SELF.lastResult = GdipInitializePalette(ADDRESS(pPalette), pPaletteType, pOptimalColors, pUseTransparentColor, |
    CHOOSE(pPaletteType = PaletteTypeOptimal AND pOptimalColors > 0, SELF.nativeImage, 0))
  GdipReportError(printf('TGdiPlusBitmap.InitializePalette'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusBitmap.ApplyEffect    PROCEDURE(TGdiPlusEffect pEffect, <_RECT_ pRect>)
lpRect                          LONG, AUTO
lpAuxData                       LONG(0)
lpAuxDataSize                   UNSIGNED(0)
  CODE
  IF OMITTED(pRect)
    lpRect = 0
  ELSE
    lpRect = ADDRESS(pRect)
  END
  
  pEffect.FreeAuxData()
  SELF.lastResult =   GdipBitmapApplyEffect(SELF.nativeImage, pEffect.nativeEffect, lpRect, pEffect.bUseAuxData, lpAuxData, lpAuxDataSize)
  GdipReportError(printf('TGdiPlusBitmap.ApplyEffect'), SELF.lastResult)
  IF SELF.lastResult = GpStatus:OK
    pEffect.SetAuxData(lpAuxData, lpAuxDataSize)
  END

  RETURN SELF.lastResult

TGdiPlusBitmap.ApplyEffect    PROCEDURE(TGdiPlusEffect pEffect, *TRect pRect)
rc                              LIKE(_RECT_), AUTO
  CODE
  pRect.AssignTo(rc)
  RETURN SELF.ApplyEffect(pEffect, rc)

TGdiPlusBitmap.ApplyEffect    PROCEDURE(TGdiPlusEffect pEffect, <_RECT_ pRect>, <*_RECT_ pOutputRect>, *TGdiPlusBitmap pOutputBitmap)
lpRect                          LONG, AUTO
lpOutRect                       LONG, AUTO
lpAuxData                       LONG(0)
lpAuxDataSize                   UNSIGNED(0)
  CODE
  IF OMITTED(pRect)
    lpRect = 0
  ELSE
    lpRect = ADDRESS(pRect)
  END
  IF OMITTED(pOutputRect)
    lpOutRect = 0
  ELSE
    lpOutRect = ADDRESS(pOutputRect)
  END
  
  pOutputBitmap.DisposeImage()
  pEffect.FreeAuxData()
  SELF.lastResult = GdipBitmapCreateApplyEffect(ADDRESS(SELF.nativeImage), 1, pEffect.nativeEffect, lpRect, lpOutRect, pOutputBitmap.nativeImage, pEffect.bUseAuxData, lpAuxData, lpAuxDataSize)
  GdipReportError(printf('TGdiPlusBitmap.ApplyEffect'), SELF.lastResult)
  IF SELF.lastResult = GpStatus:OK
    pEffect.SetAuxData(lpAuxData, lpAuxDataSize)
  END
  
  RETURN SELF.lastResult

TGdiPlusBitmap.ApplyEffect    PROCEDURE(TGdiPlusEffect pEffect, *TRect pRect, *TGdiPlusBitmap pOutputBitmap)
rc                              LIKE(_RECT_), AUTO
  CODE
  pRect.AssignTo(rc)
  RETURN SELF.ApplyEffect(pEffect, rc,, pOutputBitmap)

TGdiPlusBitmap.GetHistogramSize   PROCEDURE(GpHistogramFormat pFormat)
numberOfEntries                     UNSIGNED(0)
  CODE
  SELF.lastResult = GdipBitmapGetHistogramSize(pFormat, numberOfEntries)
  GdipReportError(printf('TGdiPlusBitmap.GetHistogramSize'), SELF.lastResult)
  RETURN numberOfEntries

TGdiPlusBitmap.GetHistogram   PROCEDURE(GpHistogramFormat pFormat, UNSIGNED pNumberOfEntries, *ULONG[] pChannel0, <*ULONG[] pChannel1>, <*ULONG[] pChannel2>, <*ULONG[] pChannel3>)
ch0Addr                         LONG, AUTO
ch1Addr                         LONG(0)
ch2Addr                         LONG(0)
ch3Addr                         LONG(0)
  CODE
  ch0Addr = ADDRESS(pChannel0)
  
  IF NOT OMITTED(pChannel1)
    ch1Addr = ADDRESS(pChannel1)
  END
  IF NOT OMITTED(pChannel2)
    ch2Addr = ADDRESS(pChannel2)
  END
  IF NOT OMITTED(pChannel3)
    ch3Addr = ADDRESS(pChannel3)
  END
  
  SELF.lastResult = GdipBitmapGetHistogram(SELF.nativeImage, pFormat, pNumberOfEntries, ch0Addr, ch1Addr, ch2Addr, ch3Addr)
  GdipReportError(printf('GetHistogram.GetHistogram'), SELF.lastResult)
  RETURN SELF.lastResult

!!!endregion

!!!region TGdiPlusGraphics
TGdiPlusGraphics.Construct    PROCEDURE()
  CODE
  
TGdiPlusGraphics.Destruct     PROCEDURE()
  CODE
  SELF.DeleteGraphics()
  
TGdiPlusGraphics.Initialized  PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativeGraphics <> 0)

TGdiPlusGraphics.FromHDC      PROCEDURE(HDC phdc, <HANDLE phdevice>)
  CODE
  SELF.DeleteGraphics()
  IF OMITTED(phdevice)
    SELF.lastResult = GdipCreateFromHDC(phdc, SELF.nativeGraphics)
  ELSE
    SELF.lastResult = GdipCreateFromHDC2(phdc, phdevice, SELF.nativeGraphics)
  END
  GdipReportError('TGdiPlusGraphics.FromHDC', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphics.FromHWND     PROCEDURE(HWND phwnd, BOOL pIcm=FALSE)
  CODE
  SELF.DeleteGraphics()
  IF NOT pIcm
    SELF.lastResult = GdipCreateFromHWND(phwnd, SELF.nativeGraphics)
  ELSE
    SELF.lastResult = GdipCreateFromHWNDICM(phwnd, SELF.nativeGraphics)
  END
  GdipReportError('TGdiPlusGraphics.FromHWND', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FromImage    PROCEDURE(TGdiPlusImage pImage)
  CODE
  SELF.DeleteGraphics()
  SELF.lastResult = GdipGetImageGraphicsContext(pImage.nativeImage, SELF.nativeGraphics)
  GdipReportError('TGdiPlusGraphics.FromImage', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphics.DeleteGraphics   PROCEDURE()
  CODE
  IF SELF.nativeGraphics
    SELF.lastResult = GdipDeleteGraphics(SELF.nativeGraphics)
    SELF.nativeGraphics = 0
    GdipReportError('TGdiPlusGraphics.DeleteGraphics', SELF.lastResult)
  END
  RETURN SELF.lastResult

TGdiPlusGraphics.Flush        PROCEDURE(GpFlushIntention pIntention=FlushIntentionFlush)
  CODE
  SELF.lastResult = GdipFlush(SELF.nativeGraphics, pIntention)
  GdipReportError('TGdiPlusGraphics.Flush', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.GetDC        PROCEDURE()
hdc                             HDC(0)
  CODE
  SELF.lastResult = GdipGetDC(SELF.nativeGraphics, hdc)
  GdipReportError('TGdiPlusGraphics.GetDC', SELF.lastResult)
  RETURN hdc

TGdiPlusGraphics.ReleaseDC    PROCEDURE(HDC phdc)
  CODE
  SELF.lastResult = GdipReleaseDC(SELF.nativeGraphics, phdc)
  GdipReportError('TGdiPlusGraphics.ReleaseDC', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.SetCompositingMode   PROCEDURE(GpCompositingMode pMode)
  CODE
  SELF.lastResult = GdipSetCompositingMode(SELF.nativeGraphics, pMode)
  GdipReportError('TGdiPlusGraphics.SetCompositingMode', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.GetCompositingMode   PROCEDURE()
mode                                    GpCompositingMode(0)
  CODE
  SELF.lastResult = GdipGetCompositingMode(SELF.nativeGraphics, mode)
  GdipReportError('TGdiPlusGraphics.GetCompositingMode', SELF.lastResult)
  RETURN mode

TGdiPlusGraphics.SetRenderingOrigin   PROCEDURE(SIGNED pX, SIGNED pY)
  CODE
  SELF.lastResult = GdipSetRenderingOrigin(SELF.nativeGraphics, pX, pY)
  GdipReportError('TGdiPlusGraphics.SetRenderingOrigin', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.GetRenderingOrigin   PROCEDURE(*SIGNED pX, *SIGNED pY)
  CODE
  SELF.lastResult = GdipGetRenderingOrigin(SELF.nativeGraphics, pX, pY)
  GdipReportError('TGdiPlusGraphics.GetRenderingOrigin', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.SetCompositingQuality    PROCEDURE(GpCompositingQuality pQuality)
  CODE
  SELF.lastResult = GdipSetCompositingQuality(SELF.nativeGraphics, pQuality)
  GdipReportError('TGdiPlusGraphics.SetCompositingQuality', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.GetCompositingQuality    PROCEDURE()
quality                                     GpCompositingQuality(0)
  CODE
  SELF.lastResult = GdipGetCompositingQuality(SELF.nativeGraphics, quality)
  GdipReportError('TGdiPlusGraphics.GetCompositingQuality', SELF.lastResult)
  RETURN quality

TGdiPlusGraphics.SetSmoothingMode PROCEDURE(GpSmoothingMode pMode)
  CODE
  SELF.lastResult = GdipSetSmoothingMode(SELF.nativeGraphics, pMode)
  GdipReportError('TGdiPlusGraphics.SetSmoothingMode', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.GetSmoothingMode PROCEDURE()
mode                                GpSmoothingMode(SmoothingModeInvalid)
  CODE
  SELF.lastResult = GdipGetSmoothingMode(SELF.nativeGraphics, mode)
  GdipReportError('TGdiPlusGraphics.GetSmoothingMode', SELF.lastResult)
  RETURN mode

TGdiPlusGraphics.SetPixelOffsetMode   PROCEDURE(GpPixelOffsetMode pMode)
  CODE
  SELF.lastResult = GdipSetPixelOffsetMode(SELF.nativeGraphics, pMode)
  GdipReportError('TGdiPlusGraphics.SetPixelOffsetMode', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.GetPixelOffsetMode   PROCEDURE()
mode                                    GpPixelOffsetMode(PixelOffsetModeInvalid)
  CODE
  SELF.lastResult = GdipGetPixelOffsetMode(SELF.nativeGraphics, mode)
  GdipReportError('TGdiPlusGraphics.GetPixelOffsetMode', SELF.lastResult)
  RETURN mode

TGdiPlusGraphics.SetTextRenderingHint PROCEDURE(GpTextRenderingHint pMode)
  CODE
  SELF.lastResult = GdipSetTextRenderingHint(SELF.nativeGraphics, pMode)
  GdipReportError('TGdiPlusGraphics.SetTextRenderingHint', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.GetTextRenderingHint PROCEDURE()
mode                                    GpTextRenderingHint(0)
  CODE
  SELF.lastResult = GdipGetTextRenderingHint(SELF.nativeGraphics, mode)
  GdipReportError('TGdiPlusGraphics.GetTextRenderingHint', SELF.lastResult)
  RETURN mode

TGdiPlusGraphics.SetTextContrast  PROCEDURE(UNSIGNED pContrast)
  CODE
  SELF.lastResult = GdipSetTextContrast(SELF.nativeGraphics, pContrast)
  GdipReportError('TGdiPlusGraphics.SetTextContrast', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.GetTextContrast  PROCEDURE()
contrast                            UNSIGNED(0)
  CODE
  SELF.lastResult = GdipGetTextContrast(SELF.nativeGraphics, contrast)
  GdipReportError('TGdiPlusGraphics.GetTextContrast', SELF.lastResult)
  RETURN contrast

TGdiPlusGraphics.SetInterpolationMode PROCEDURE(GpInterpolationMode pMode)
  CODE
  SELF.lastResult = GdipSetInterpolationMode(SELF.nativeGraphics, pMode)
  GdipReportError('TGdiPlusGraphics.SetInterpolationMode', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.GetInterpolationMode PROCEDURE()
mode                                    GpInterpolationMode(InterpolationModeInvalid)
  CODE
  SELF.lastResult = GdipGetInterpolationMode(SELF.nativeGraphics, mode)
  GdipReportError('TGdiPlusGraphics.GetInterpolationMode', SELF.lastResult)
  RETURN mode

TGdiPlusGraphics.SetTransform PROCEDURE(TGdiPlusMatrix pMatrix)
  CODE
  SELF.lastResult = GdipSetWorldTransform(SELF.nativeGraphics, pMatrix.nativeMatrix)
  GdipReportError('TGdiPlusGraphics.SetTransform', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.ResetTransform   PROCEDURE()
  CODE
  SELF.lastResult = GdipResetWorldTransform(SELF.nativeGraphics)
  GdipReportError('TGdiPlusGraphics.ResetTransform', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.MultiplyTransform    PROCEDURE(TGdiPlusMatrix pMatrix, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipMultiplyWorldTransform(SELF.nativeGraphics, pMatrix.nativeMatrix, pOrder)
  GdipReportError('TGdiPlusGraphics.MultiplyTransform', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.TranslateTransform   PROCEDURE(SREAL pdx, SREAL pdy, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipTranslateWorldTransform(SELF.nativeGraphics, pdx, pdy, pOrder)
  GdipReportError('TGdiPlusGraphics.TranslateTransform', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.ScaleTransform   PROCEDURE(SREAL psx, SREAL psy, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipScaleWorldTransform(SELF.nativeGraphics, psx, psy, pOrder)
  GdipReportError('TGdiPlusGraphics.ScaleTransform', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.RotateTransform  PROCEDURE(SREAL pAngle, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipRotateWorldTransform(SELF.nativeGraphics, pAngle, pOrder)
  GdipReportError('TGdiPlusGraphics.RotateTransform', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.GetTransform PROCEDURE(*TGdiPlusMatrix pMatrix)
  CODE
  SELF.lastResult = GdipGetWorldTransform(SELF.nativeGraphics, pMatrix.nativeMatrix)
  GdipReportError('TGdiPlusGraphics.GetTransform', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.ResetPageTransform   PROCEDURE()
  CODE
  SELF.lastResult = GdipResetPageTransform(SELF.nativeGraphics)
  GdipReportError('TGdiPlusGraphics.ResetPageTransform', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.SetPageUnit  PROCEDURE(GpUnit pUnit)
  CODE
  SELF.lastResult = GdipSetPageUnit(SELF.nativeGraphics, pUnit)
  GdipReportError('TGdiPlusGraphics.SetPageUnit', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.GetPageUnit  PROCEDURE()
pageUnit                        GpUnit
  CODE
  SELF.lastResult = GdipGetPageUnit(SELF.nativeGraphics, pageUnit)
  GdipReportError('TGdiPlusGraphics.GetPageUnit', SELF.lastResult)
  RETURN pageUnit
                               
TGdiPlusGraphics.SetPageScale PROCEDURE(SREAL pScale)
  CODE
  SELF.lastResult = GdipSetPageScale(SELF.nativeGraphics, pScale)
  GdipReportError('TGdiPlusGraphics.SetPageScale', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.GetPageScale PROCEDURE()
scale                           SREAL
  CODE
  SELF.lastResult = GdipGetPageScale(SELF.nativeGraphics, scale)
  GdipReportError('TGdiPlusGraphics.GetPageScale', SELF.lastResult)
  RETURN scale

TGdiPlusGraphics.GetDpiX      PROCEDURE()
dpi                             SREAL
  CODE
  SELF.lastResult = GdipGetDpiX(SELF.nativeGraphics, dpi)
  GdipReportError('TGdiPlusGraphics.GetDpiX', SELF.lastResult)
  RETURN dpi
  
TGdiPlusGraphics.GetDpiY      PROCEDURE()
dpi                             SREAL
  CODE
  SELF.lastResult = GdipGetDpiY(SELF.nativeGraphics, dpi)
  GdipReportError('TGdiPlusGraphics.GetDpiY', SELF.lastResult)
  RETURN dpi

TGdiPlusGraphics.TransformPoints  PROCEDURE(GpCoordinateSpace pDestSpace, GpCoordinateSpace pSrcSpace, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipTransformPoints(SELF.nativeGraphics, pDestSpace, pSrcSpace, ADDRESS(pPoints), pCount)
  GdipReportError('TGdiPlusGraphics.TransformPoints', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.TransformPointsI PROCEDURE(GpCoordinateSpace pDestSpace, GpCoordinateSpace pSrcSpace, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipTransformPointsI(SELF.nativeGraphics, pDestSpace, pSrcSpace, ADDRESS(pPoints), pCount)
  GdipReportError('TGdiPlusGraphics.TransformPointsI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.GetNearestColor  PROCEDURE(*GpARGB pColor)
  CODE
  SELF.lastResult = GdipGetNearestColor(SELF.nativeGraphics, pColor)
  GdipReportError('TGdiPlusGraphics.GetNearestColor', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.GetHalftonePalette   PROCEDURE()
  CODE
  RETURN GdipCreateHalftonePalette()

TGdiPlusGraphics.DrawLine     PROCEDURE(TGdiPlusPen pPen, SREAL pX1, SREAL pY1, SREAL pX2, SREAL pY2)
  CODE
  SELF.lastResult = GdipDrawLine(SELF.nativeGraphics, pPen.nativePen, pX1, pY1, pX2, pY2)
  GdipReportError('TGdiPlusGraphics.DrawLine', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawLine     PROCEDURE(TGdiPlusPen pPen, CONST *GpPointF pPoint1, GpPointF pPoint2)
  CODE
  RETURN SELF.DrawLine(pPen, pPoint1.x, pPoint1.y, pPoint2.x, pPoint2.y)

TGdiPlusGraphics.DrawLineI    PROCEDURE(TGdiPlusPen pPen, SIGNED pX1, SIGNED pY1, SIGNED pX2, SIGNED pY2)
  CODE
  SELF.lastResult = GdipDrawLineI(SELF.nativeGraphics, pPen.nativePen, pX1, pY1, pX2, pY2)
  GdipReportError('TGdiPlusGraphics.DrawLineI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawLine     PROCEDURE(TGdiPlusPen pPen, CONST *GpPoint pPoint1, GpPoint pPoint2)
  CODE
  RETURN SELF.DrawLineI(pPen, pPoint1.x, pPoint1.y, pPoint2.x, pPoint2.y)

TGdiPlusGraphics.DrawLines    PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipDrawLines(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.DrawLines', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawLinesI   PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipDrawLinesI(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.DrawLinesI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawArc      PROCEDURE(TGdiPlusPen pPen, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  SELF.lastResult = GdipDrawArc(SELF.nativeGraphics, pPen.nativePen, pX, pY, pWidth, pHeight, pStartAngle, pSweepAngle)
  GdipReportError('TGdiPlusGraphics.DrawArc', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawArc      PROCEDURE(TGdiPlusPen pPen, CONST *GpRectF pRect, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  RETURN SELF.DrawArc(pPen, pRect.x, pRect.y, pRect.width, pRect.height, pStartAngle, pSweepAngle)

TGdiPlusGraphics.DrawArcI     PROCEDURE(TGdiPlusPen pPen, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  SELF.lastResult = GdipDrawArcI(SELF.nativeGraphics, pPen.nativePen, pX, pY, pWidth, pHeight, pStartAngle, pSweepAngle)
  GdipReportError('TGdiPlusGraphics.DrawArcI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawArc      PROCEDURE(TGdiPlusPen pPen, CONST *GpRect pRect, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  RETURN SELF.DrawArcI(pPen, pRect.x, pRect.y, pRect.width, pRect.height, pStartAngle, pSweepAngle)

TGdiPlusGraphics.DrawArc      PROCEDURE(TGdiPlusPen pPen, TRect pRect, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  RETURN SELF.DrawArcI(pPen, pRect.left, pRect.top, pRect.Width(), pRect.Height(), pStartAngle, pSweepAngle)

TGdiPlusGraphics.DrawBezier   PROCEDURE(TGdiPlusPen pPen, SREAL pX1, SREAL pY1, SREAL pX2, SREAL pY2, SREAL pX3, SREAL pY3, SREAL pX4, SREAL pY4)
  CODE
  SELF.lastResult = GdipDrawBezier(SELF.nativeGraphics, pPen.nativePen, pX1, pY1, pX2, pY2, pX3, pY3, pX4, pY4)
  GdipReportError('TGdiPlusGraphics.DrawBezier', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawBezier   PROCEDURE(TGdiPlusPen pPen, CONST *GpPointF pPoint1, CONST *GpPointF pPoint2, CONST *GpPointF pPoint3, CONST *GpPointF pPoint4)
  CODE
  RETURN SELF.DrawBezier(pPen, pPoint1.x, pPoint1.y, pPoint2.x, pPoint2.y, pPoint3.x, pPoint3.y, pPoint4.x, pPoint4.y)

TGdiPlusGraphics.DrawBezierI  PROCEDURE(TGdiPlusPen pPen, SIGNED pX1, SIGNED pY1, SIGNED pX2, SIGNED pY2, SIGNED pX3, SIGNED pY3, SIGNED pX4, SIGNED pY4)
  CODE
  SELF.lastResult = GdipDrawBezierI(SELF.nativeGraphics, pPen.nativePen, pX1, pY1, pX2, pY2, pX3, pY3, pX4, pY4)
  GdipReportError('TGdiPlusGraphics.DrawBezierI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawBezier  PROCEDURE(TGdiPlusPen pPen, CONST *GpPoint pPoint1, CONST *GpPoint pPoint2, CONST *GpPoint pPoint3, CONST *GpPoint pPoint4)
  CODE
  RETURN SELF.DrawBezierI(pPen, pPoint1.x, pPoint1.y, pPoint2.x, pPoint2.y, pPoint3.x, pPoint3.y, pPoint4.x, pPoint4.y)

TGdiPlusGraphics.DrawBeziers  PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipDrawBeziers(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.DrawBeziers', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawBeziersI PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipDrawBeziersI(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.DrawBeziersI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawRectangle    PROCEDURE(TGdiPlusPen pPen, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight)
  CODE
  SELF.lastResult = GdipDrawRectangle(SELF.nativeGraphics, pPen.nativePen, pX, pY, pWidth, pHeight)
  GdipReportError('TGdiPlusGraphics.DrawRectangle', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawRectangle    PROCEDURE(TGdiPlusPen pPen, CONST *GpRectF pRect)
  CODE
  RETURN SELF.DrawRectangle(pPen, pRect.x, pRect.y, pRect.width, pRect.height)

TGdiPlusGraphics.DrawRectangleI   PROCEDURE(TGdiPlusPen pPen, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight)
  CODE
  SELF.lastResult = GdipDrawRectangleI(SELF.nativeGraphics, pPen.nativePen, pX, pY, pWidth, pHeight)
  GdipReportError('TGdiPlusGraphics.DrawRectangleI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawRectangle    PROCEDURE(TGdiPlusPen pPen, CONST *GpRect pRect)
  CODE
  RETURN SELF.DrawRectangleI(pPen, pRect.x, pRect.y, pRect.width, pRect.height)

TGdiPlusGraphics.DrawRectangle    PROCEDURE(TGdiPlusPen pPen, TRect pRect)
  CODE
  RETURN SELF.DrawRectangleI(pPen, pRect.left, pRect.top, pRect.Width(), pRect.Height())

TGdiPlusGraphics.DrawRectangles   PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipDrawRectangles(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.DrawRectangles', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawRectanglesI  PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipDrawRectanglesI(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.DrawRectanglesI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawEllipse  PROCEDURE(TGdiPlusPen pPen, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight)
  CODE
  SELF.lastResult = GdipDrawEllipse(SELF.nativeGraphics, pPen.nativePen, pX, pY, pWidth, pHeight)
  GdipReportError('TGdiPlusGraphics.DrawEllipse', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawEllipse  PROCEDURE(TGdiPlusPen pPen, CONST *GpRectF pRect)
  CODE
  RETURN SELF.DrawEllipse(pPen, pRect.x, pRect.y, pRect.width, pRect.height)

TGdiPlusGraphics.DrawEllipseI PROCEDURE(TGdiPlusPen pPen, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight)
  CODE
  SELF.lastResult = GdipDrawEllipseI(SELF.nativeGraphics, pPen.nativePen, pX, pY, pWidth, pHeight)
  GdipReportError('TGdiPlusGraphics.DrawEllipseI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawEllipse  PROCEDURE(TGdiPlusPen pPen, CONST *GpRect pRect)
  CODE
  RETURN SELF.DrawEllipseI(pPen, pRect.x, pRect.y, pRect.width, pRect.height)

TGdiPlusGraphics.DrawEllipse  PROCEDURE(TGdiPlusPen pPen, TRect pRect)
  CODE
  RETURN SELF.DrawEllipseI(pPen, pRect.left, pRect.top, pRect.Width(), pRect.Height())

TGdiPlusGraphics.DrawPie      PROCEDURE(TGdiPlusPen pPen, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  SELF.lastResult = GdipDrawPie(SELF.nativeGraphics, pPen.nativePen, pX, pY, pWidth, pHeight, pStartAngle, pSweepAngle)
  GdipReportError('TGdiPlusGraphics.DrawPie', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawPie      PROCEDURE(TGdiPlusPen pPen, CONST *GpRectF pRect, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  RETURN SELF.DrawPie(pPen, pRect.x, pRect.y, pRect.width, pRect.height, pStartAngle, pSweepAngle)

TGdiPlusGraphics.DrawPieI     PROCEDURE(TGdiPlusPen pPen, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  SELF.lastResult = GdipDrawPieI(SELF.nativeGraphics, pPen.nativePen, pX, pY, pWidth, pHeight, pStartAngle, pSweepAngle)
  GdipReportError('TGdiPlusGraphics.DrawPieI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawPie      PROCEDURE(TGdiPlusPen pPen, CONST *GpRect pRect, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  RETURN SELF.DrawPieI(pPen, pRect.x, pRect.y, pRect.width, pRect.height, pStartAngle, pSweepAngle)

TGdiPlusGraphics.DrawPie      PROCEDURE(TGdiPlusPen pPen, TRect pRect, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  RETURN SELF.DrawPieI(pPen, pRect.left, pRect.top, pRect.Width(), pRect.Height(), pStartAngle, pSweepAngle)

TGdiPlusGraphics.DrawPolygon  PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipDrawPolygon(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.DrawPolygon', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawPolygonI PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipDrawPolygonI(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.DrawPolygonI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawPath     PROCEDURE(TGdiPlusPen pPen, TGdiPlusGraphicsPath pPath)
  CODE
  SELF.lastResult = GdipDrawPath(SELF.nativeGraphics, pPen.nativePen, pPath.nativePath)
  GdipReportError('TGdiPlusGraphics.DrawPath', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawCurve    PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipDrawCurve(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.DrawCurve', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawCurve    PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount, SREAL pTension)
  CODE
  SELF.lastResult = GdipDrawCurve2(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount, pTension)
  GdipReportError('TGdiPlusGraphics.DrawCurve', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphics.DrawCurve    PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount, SIGNED pOffset, UNSIGNED pNumberOfSegments, SREAL pTension=0.5)
  CODE
  SELF.lastResult = GdipDrawCurve3(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount, pOffset, pNumberOfSegments, pTension)
  GdipReportError('TGdiPlusGraphics.DrawCurve', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawCurveI   PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipDrawCurveI(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.DrawCurveI', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphics.DrawCurveI   PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount, SREAL pTension)
  CODE
  SELF.lastResult = GdipDrawCurve2I(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount, pTension)
  GdipReportError('TGdiPlusGraphics.DrawCurveI', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphics.DrawCurveI   PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount, SIGNED pOffset, UNSIGNED pNumberOfSegments, SREAL pTension=0.5)
  CODE
  SELF.lastResult = GdipDrawCurve3I(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount, pOffset, pNumberOfSegments, pTension)
  GdipReportError('TGdiPlusGraphics.DrawCurveI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawClosedCurve  PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipDrawClosedCurve(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.DrawClosedCurve', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawClosedCurve  PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount, SREAL pTension)
  CODE
  SELF.lastResult = GdipDrawClosedCurve2(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount, pTension)
  GdipReportError('TGdiPlusGraphics.DrawClosedCurve', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawClosedCurveI PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipDrawClosedCurveI(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.DrawClosedCurveI', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphics.DrawClosedCurveI PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount, SREAL pTension)
  CODE
  SELF.lastResult = GdipDrawClosedCurve2I(SELF.nativeGraphics, pPen.nativePen, pPoints, pCount, pTension)
  GdipReportError('TGdiPlusGraphics.DrawClosedCurveI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.GraphicsClear    PROCEDURE(GpARGB pColor)
  CODE
  SELF.lastResult = GdipGraphicsClear(SELF.nativeGraphics, pColor)
  GdipReportError('TGdiPlusGraphics.GraphicsClear', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillRectangle    PROCEDURE(TGdiPlusBrush pBrush, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight)
  CODE
  SELF.lastResult = GdipFillRectangle(SELF.nativeGraphics, pBrush.nativeBrush, pX, pY, pWidth, pHeight)
  GdipReportError('TGdiPlusGraphics.FillRectangle', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillRectangle    PROCEDURE(TGdiPlusBrush pBrush, CONST *GpRectF pRect)
  CODE
  RETURN SELF.FillRectangle(pBrush, pRect.x, pRect.y, pRect.width, pRect.height)

TGdiPlusGraphics.FillRectangleI   PROCEDURE(TGdiPlusBrush pBrush, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight)
  CODE
  SELF.lastResult = GdipFillRectangleI(SELF.nativeGraphics, pBrush.nativeBrush, pX, pY, pWidth, pHeight)
  GdipReportError('TGdiPlusGraphics.FillRectangleI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillRectangle    PROCEDURE(TGdiPlusBrush pBrush, CONST *GpRect pRect)
  CODE
  RETURN SELF.FillRectangleI(pBrush, pRect.x, pRect.y, pRect.width, pRect.height)

TGdiPlusGraphics.FillRectangle    PROCEDURE(TGdiPlusBrush pBrush, TRect pRect)
  CODE
  RETURN SELF.FillRectangleI(pBrush, pRect.left, pRect.top, pRect.Width(), pRect.Height())

TGdiPlusGraphics.FillRectangles   PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipFillRectangles(SELF.nativeGraphics, pBrush.nativeBrush, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.FillRectangles', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillRectanglesI  PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipFillRectanglesI(SELF.nativeGraphics, pBrush.nativeBrush, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.FillRectanglesI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillPolygon  PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount, GpFillMode pMode=FillModeAlternate)
  CODE
  SELF.lastResult = GdipFillPolygon(SELF.nativeGraphics, pBrush.nativeBrush, pPoints, pCount, pMode)
  GdipReportError('TGdiPlusGraphics.FillPolygon', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillPolygonI PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount, GpFillMode pMode=FillModeAlternate)
  CODE
  SELF.lastResult = GdipFillPolygonI(SELF.nativeGraphics, pBrush.nativeBrush, pPoints, pCount, pMode)
  GdipReportError('TGdiPlusGraphics.FillPolygonI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillEllipse  PROCEDURE(TGdiPlusBrush pBrush, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight)
  CODE
  SELF.lastResult = GdipFillEllipse(SELF.nativeGraphics, pBrush.nativeBrush, pX, pY, pWidth, pHeight)
  GdipReportError('TGdiPlusGraphics.FillEllipse', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillEllipse  PROCEDURE(TGdiPlusBrush pBrush, CONST *GpRectF pRect)
  CODE
  RETURN SELF.FillEllipse(pBrush, pRect.x, pRect.y, pRect.width, pRect.height)

TGdiPlusGraphics.FillEllipseI PROCEDURE(TGdiPlusBrush pBrush, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight)
  CODE
  SELF.lastResult = GdipFillEllipseI(SELF.nativeGraphics, pBrush.nativeBrush, pX, pY, pWidth, pHeight)
  GdipReportError('TGdiPlusGraphics.FillEllipseI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillEllipse  PROCEDURE(TGdiPlusBrush pBrush, CONST *GpRect pRect)
  CODE
  RETURN SELF.FillEllipseI(pBrush, pRect.x, pRect.y, pRect.width, pRect.height)

TGdiPlusGraphics.FillEllipse  PROCEDURE(TGdiPlusBrush pBrush, TRect pRect)
  CODE
  RETURN SELF.FillEllipseI(pBrush, pRect.left, pRect.top, pRect.Width(), pRect.Height())

TGdiPlusGraphics.FillPie      PROCEDURE(TGdiPlusBrush pBrush, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  SELF.lastResult = GdipFillPie(SELF.nativeGraphics, pBrush.nativeBrush, pX, pY, pWidth, pHeight, pStartAngle, pSweepAngle)
  GdipReportError('TGdiPlusGraphics.FillPie', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillPie      PROCEDURE(TGdiPlusBrush pBrush, CONST *GpRectF pRect, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  RETURN SELF.FillPie(pBrush, pRect.x, pRect.y, pRect.width, pRect.height, pStartAngle, pSweepAngle)

TGdiPlusGraphics.FillPieI     PROCEDURE(TGdiPlusBrush pBrush, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  SELF.lastResult = GdipFillPie(SELF.nativeGraphics, pBrush.nativeBrush, pX, pY, pWidth, pHeight, pStartAngle, pSweepAngle)
  GdipReportError('TGdiPlusGraphics.FillPieI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillPie      PROCEDURE(TGdiPlusBrush pBrush, CONST *GpRect pRect, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  RETURN SELF.FillPieI(pBrush, pRect.x, pRect.y, pRect.width, pRect.height, pStartAngle, pSweepAngle)

TGdiPlusGraphics.FillPie      PROCEDURE(TGdiPlusBrush pBrush, TRect pRect, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  RETURN SELF.FillPieI(pBrush, pRect.left, pRect.top, pRect.Width(), pRect.Height(), pStartAngle, pSweepAngle)

TGdiPlusGraphics.FillPath     PROCEDURE(TGdiPlusBrush pBrush, TGdiPlusGraphicsPath pPath)
  CODE
  SELF.lastResult = GdipFillPath(SELF.nativeGraphics, pBrush.nativeBrush, pPath.nativePath)
  GdipReportError('TGdiPlusGraphics.FillPath', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillClosedCurve  PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipFillClosedCurve(SELF.nativeGraphics, pBrush.nativeBrush, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.FillClosedCurve', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillClosedCurve  PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount, GpFillMode pMode, SREAL pTension=0.5)
  CODE
  SELF.lastResult = GdipFillClosedCurve2(SELF.nativeGraphics, pBrush.nativeBrush, pPoints, pCount, pMode, pTension)
  GdipReportError('TGdiPlusGraphics.FillClosedCurve', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillClosedCurveI PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipFillClosedCurveI(SELF.nativeGraphics, pBrush.nativeBrush, pPoints, pCount)
  GdipReportError('TGdiPlusGraphics.FillClosedCurveI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillClosedCurveI PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount, GpFillMode pMode, SREAL pTension=0.5)
  CODE
  SELF.lastResult = GdipFillClosedCurve2I(SELF.nativeGraphics, pBrush.nativeBrush, pPoints, pCount, pMode, pTension)
  GdipReportError('TGdiPlusGraphics.FillClosedCurveI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.FillRegion   PROCEDURE(TGdiPlusBrush pBrush, TGdiPlusRegion pRegion)
  CODE
  SELF.lastResult = GdipFillRegion(SELF.nativeGraphics, pBrush.nativeBrush, pRegion.nativeRegion)
  GdipReportError('TGdiPlusGraphics.FillRegion', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawString   PROCEDURE(STRING pStr, CONST *GpRectF pLayoutRect, *TGdiPlusFont pFont, <*TGdiPlusBrush pBrush>, <*TGdiPlusStringFormat pFormat>)
enc                             TStringEncoding
wstr                            STRING(LEN(CLIP(pStr))*2+2)
nativeFont                      LONG, AUTO
nativeFormat                    LONG, AUTO
nativeBrush                     LONG, AUTO

  CODE
  wstr = enc.ToCWStr(CLIP(pStr))
  
  nativeFont = pFont.nativeFont
  nativeFormat = CHOOSE(NOT OMITTED(pFormat), pFormat.nativeFormat, 0)
  nativeBrush = CHOOSE(NOT OMITTED(pBrush), pBrush.nativeBrush, 0)
  
  SELF.lastResult = GdipDrawString(SELF.nativeGraphics, ADDRESS(wstr), -1, nativeFont, ADDRESS(pLayoutRect), nativeFormat, nativeBrush)
  GdipReportError('TGdiPlusGraphics.DrawString', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawString   PROCEDURE(STRING pStr, TRect pLayoutRect, *TGdiPlusFont pFont, <*TGdiPlusBrush pBrush>, <*TGdiPlusStringFormat pFormat>)
rc                              LIKE(GpRectF), AUTO
  CODE
  rc.x = pLayoutRect.left
  rc.y = pLayoutRect.top
  rc.width = pLayoutRect.Width()
  rc.height = pLayoutRect.Height()
  RETURN SELF.DrawString(pStr, rc, pFont, pBrush, pFormat)
  
TGdiPlusGraphics.DrawString   PROCEDURE(STRING pStr, CONST *GpPointF pOrigin, *TGdiPlusFont pFont, <*TGdiPlusBrush pBrush>, <*TGdiPlusStringFormat pFormat>)
rc                              LIKE(GpRectF)
  CODE
  rc.x = pOrigin.x
  rc.y = pOrigin.y
  rc.width = 0
  rc.height = 0
  RETURN SELF.DrawString(pStr, rc, pFont, pBrush, pFormat)

TGdiPlusGraphics.DrawString   PROCEDURE(STRING pStr, POINT pOrigin, *TGdiPlusFont pFont, <*TGdiPlusBrush pBrush>, <*TGdiPlusStringFormat pFormat>)
pt                              LIKE(GpPointF), AUTO
  CODE
  pt.x = pOrigin.x
  pt.y = pOrigin.y
  RETURN SELF.DrawString(pStr, pt, pFont, pBrush, pFormat)
  
TGdiPlusGraphics.MeasureString    PROCEDURE(STRING pStr, CONST *GpRectF pLayoutRect, <*TGdiPlusFont pFont>, <*TGdiPlusStringFormat pFormat>, *GpRectF pBoundingBox)
enc                                 TStringEncoding
wstr                                STRING(LEN(CLIP(pStr))*2+2)
nativeFont                          LONG, AUTO
nativeFormat                        LONG, AUTO
codepointsFitted                    UNSIGNED
linesFilled                         UNSIGNED
  CODE
  wstr = enc.ToCWStr(CLIP(pStr))
  
  nativeFont = CHOOSE(NOT OMITTED(pFont), pFont.nativeFont, 0)
  nativeFormat = CHOOSE(NOT OMITTED(pFormat), pFormat.nativeFormat, 0)
  
  SELF.lastResult = GdipMeasureString(SELF.nativeGraphics, ADDRESS(wstr), -1, nativeFont, ADDRESS(pLayoutRect), nativeFormat, ADDRESS(pBoundingBox), codepointsFitted, linesFilled)
  GdipReportError('TGdiPlusGraphics.MeasureString', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.MeasureString    PROCEDURE(STRING pStr, TRect pLayoutRect, <*TGdiPlusFont pFont>, <*TGdiPlusStringFormat pFormat>, *TRect pBoundingBox)
rcLayout                            LIKE(GpRectF), AUTO
rcBoundingBox                       LIKE(GpRectF), AUTO
ret                                 GpStatus, AUTO
  CODE
  pBoundingBox.SetRectEmpty()
  rcLayout.x = pLayoutRect.left
  rcLayout.y = pLayoutRect.top
  rcLayout.width = pLayoutRect.Width()
  rcLayout.height = pLayoutRect.Height()
  ret = SELF.MeasureString(pStr, rcLayout, pFont, pFormat, rcBoundingBox)
  IF ret = GpStatus:Ok
    pBoundingBox.left = rcBoundingBox.x
    pBoundingBox.top = rcBoundingBox.y
    pBoundingBox.Width(rcBoundingBox.width)
    pBoundingBox.Height(rcBoundingBox.height)
  END
  RETURN ret
  
TGdiPlusGraphics.MeasureString    PROCEDURE(STRING pStr, CONST *GpSizeF pLayoutRectSize, <*TGdiPlusFont pFont>, <*TGdiPlusStringFormat pFormat>, *GpSizeF pSize)
enc                                 TStringEncoding
wstr                                STRING(LEN(CLIP(pStr))*2+2)
nativeFont                          LONG, AUTO
nativeFormat                        LONG, AUTO
codepointsFitted                    UNSIGNED
linesFilled                         UNSIGNED
layoutRect                          LIKE(GpRectF)
boundingBox                         LIKE(GpRectF)
  CODE
  layoutRect.x = 0
  layoutRect.y = 0
  layoutRect.width = pLayoutRectSize.cx
  layoutRect.height = pLayoutRectSize.cy
  
  wstr = enc.ToCWStr(CLIP(pStr))
  
  nativeFont = CHOOSE(NOT OMITTED(pFont), pFont.nativeFont, 0)
  nativeFormat = CHOOSE(NOT OMITTED(pFormat), pFormat.nativeFormat, 0)
  
  SELF.lastResult = GdipMeasureString(SELF.nativeGraphics, ADDRESS(wstr), -1, nativeFont, ADDRESS(layoutRect), nativeFormat, ADDRESS(boundingBox), codepointsFitted, linesFilled)
  GdipReportError('TGdiPlusGraphics.MeasureString', SELF.lastResult)
  
  IF SELF.lastResult = GpStatus:Ok
    pSize.cx = boundingBox.width
    pSize.cy = boundingBox.height
  END
  
  RETURN SELF.lastResult

TGdiPlusGraphics.MeasureString    PROCEDURE(STRING pStr, CONST *GpPointF pOrigin, <*TGdiPlusFont pFont>, <*TGdiPlusStringFormat pFormat>, *GpRectF pBoundingBox)
enc                                 TStringEncoding
wstr                                STRING(LEN(CLIP(pStr))*2+2)
nativeFont                          LONG, AUTO
nativeFormat                        LONG, AUTO
codepointsFitted                    UNSIGNED
linesFilled                         UNSIGNED
layoutRect                          LIKE(GpRectF)
  CODE
  layoutRect.x = pOrigin.x
  layoutRect.y = pOrigin.y
  layoutRect.width = 0
  layoutRect.height = 0
  
  wstr = enc.ToCWStr(CLIP(pStr))
  
  nativeFont = CHOOSE(NOT OMITTED(pFont), pFont.nativeFont, 0)
  nativeFormat = CHOOSE(NOT OMITTED(pFormat), pFormat.nativeFormat, 0)
  
  SELF.lastResult = GdipMeasureString(SELF.nativeGraphics, ADDRESS(wstr), -1, nativeFont, ADDRESS(layoutRect), nativeFormat, ADDRESS(pBoundingBox), codepointsFitted, linesFilled)
  GdipReportError('TGdiPlusGraphics.MeasureString', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.MeasureString    PROCEDURE(STRING pStr, POINT pOrigin, <*TGdiPlusFont pFont>, <*TGdiPlusStringFormat pFormat>, *TRect pBoundingBox)
ptOrigin                            LIKE(GpPointF), AUTO
rcBoundingBox                       LIKE(GpRectF), AUTO
ret                                 GpStatus, AUTO
  CODE
  pBoundingBox.SetRectEmpty()
  ptOrigin.x = pOrigin.x
  ptOrigin.y = pOrigin.y
  ret = SELF.MeasureString(pStr, ptOrigin, pFont, pFormat, rcBoundingBox)
  IF ret = GpStatus:Ok
    pBoundingBox.left = rcBoundingBox.x
    pBoundingBox.top = rcBoundingBox.y
    pBoundingBox.Width(rcBoundingBox.width)
    pBoundingBox.Height(rcBoundingBox.height)
  END
  RETURN ret

TGdiPlusGraphics.DrawCachedBitmap PROCEDURE(TGdiPlusCachedBitmap pCBitmap, SIGNED pX, SIGNED pY)
  CODE
  SELF.lastResult = GdipDrawCachedBitmap(SELF.nativeGraphics, pCBitmap.nativeCachedBitmap, pX, pY)
  GdipReportError('TGdiPlusGraphics.DrawCachedBitmap', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpPointF pPoint)
  CODE
  RETURN SELF.DrawImage(pImage, pPoint.x, pPoint.y)

TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, SREAL pX, SREAL pY)
  CODE
  SELF.lastResult = GdipDrawImage(SELF.nativeGraphics, pImage.nativeImage, pX, pY)
  GdipReportError('TGdiPlusGraphics.DrawImage', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpPoint pPoint)
  CODE
  RETURN SELF.DrawImageI(pImage, pPoint.x, pPoint.y)

TGdiPlusGraphics.DrawImageI   PROCEDURE(TGdiPlusImage pImage, SIGNED pX, SIGNED pY)
  CODE
  SELF.lastResult = GdipDrawImageI(SELF.nativeGraphics, pImage.nativeImage, pX, pY)
  GdipReportError('TGdiPlusGraphics.DrawImageI', SELF.lastResult)
  RETURN SELF.lastResult
  
  
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpRectF pRect)
  CODE
  RETURN SELF.DrawImage(pImage, pRect.x, pRect.y, pRect.width, pRect.height)

TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight)
  CODE
  SELF.lastResult = GdipDrawImageRect(SELF.nativeGraphics, pImage.nativeImage, pX, pY, pWidth, pHeight)
  GdipReportError('TGdiPlusGraphics.DrawImage', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpRect pRect)
  CODE
  RETURN SELF.DrawImageI(pImage, pRect.x, pRect.y, pRect.width, pRect.height)
  
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, TRect pRect)
  CODE
  RETURN SELF.DrawImageI(pImage, pRect.left, pRect.top, pRect.Width(), pRect.Height())

TGdiPlusGraphics.DrawImageI   PROCEDURE(TGdiPlusImage pImage, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight)
  CODE
  SELF.lastResult = GdipDrawImageRectI(SELF.nativeGraphics, pImage.nativeImage, pX, pY, pWidth, pHeight)
  GdipReportError('TGdiPlusGraphics.DrawImageI', SELF.lastResult)
  RETURN SELF.lastResult
  
  
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpPointF pUpperLeftPoint, CONST *GpPointF pUpperRightPoint, CONST *GpPointF pLowerLeftPoint)
pts                             GROUP(GpPointF), DIM(3).
  CODE
  pts[1] = pUpperLeftPoint
  pts[2] = pUpperRightPoint
  pts[3] = pLowerLeftPoint
  SELF.lastResult = GdipDrawImagePoints(SELF.nativeGraphics, pImage.nativeImage, ADDRESS(pts), 3)
  GdipReportError('TGdiPlusGraphics.DrawImageI', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpPoint pUpperLeftPoint, CONST *GpPoint pUpperRightPoint, CONST *GpPoint pLowerLeftPoint)
pts                             GROUP(GpPoint), DIM(3).
  CODE
  pts[1] = pUpperLeftPoint
  pts[2] = pUpperRightPoint
  pts[3] = pLowerLeftPoint
  SELF.lastResult = GdipDrawImagePointsI(SELF.nativeGraphics, pImage.nativeImage, ADDRESS(pts), 3)
  GdipReportError('TGdiPlusGraphics.DrawImageI', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, SREAL pDstX, SREAL pDstY, SREAL pSrcX, SREAL pSrcY, SREAL pSrcWidth, SREAL pSrcHeight, GpUnit pSrcUnit)
  CODE
  SELF.lastResult = GdipDrawImagePointRect(SELF.nativeGraphics, pImage.nativeImage, pDstX, pDstY, pSrcX, pSrcY, pSrcWidth, pSrcHeight, pSrcUnit)
  GdipReportError('TGdiPlusGraphics.DrawImage', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphics.DrawImageI   PROCEDURE(TGdiPlusImage pImage, SIGNED pDstX, SIGNED pDstY, SIGNED pSrcX, SIGNED pSrcY, SIGNED pSrcWidth, SIGNED pSrcHeight, GpUnit pSrcUnit)
  CODE
  SELF.lastResult = GdipDrawImagePointRectI(SELF.nativeGraphics, pImage.nativeImage, pDstX, pDstY, pSrcX, pSrcY, pSrcWidth, pSrcHeight, pSrcUnit)
  GdipReportError('TGdiPlusGraphics.DrawImageI', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpPointF pPoint, CONST *GpRectF pSrcRect, GpUnit pSrcUnit)
  CODE
  RETURN SELF.DrawImage(pImage, pPoint.x, pPoint.y, pSrcRect.x, pSrcRect.y, pSrcRect.width, pSrcRect.height, pSrcUnit)
   
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpPoint pPoint, CONST *GpRect pSrcRect, GpUnit pSrcUnit)
  CODE
  RETURN SELF.DrawImageI(pImage, pPoint.x, pPoint.y, pSrcRect.x, pSrcRect.y, pSrcRect.width, pSrcRect.height, pSrcUnit)
     
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpPoint pPoint, TRect pSrcRect, GpUnit pSrcUnit)
  CODE
  RETURN SELF.DrawImageI(pImage, pPoint.x, pPoint.y, pSrcRect.left, pSrcRect.top, pSrcRect.Width(), pSrcRect.Height(), pSrcUnit)

TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, SREAL pDstX, SREAL pDstY, SREAL pDstWidth, SREAL pDstHeight, SREAL pSrcX, SREAL pSrcY, SREAL pSrcWidth, SREAL pSrcHeight, GpUnit pSrcUnit)
  CODE
  SELF.lastResult = GdipDrawImageRectRect(SELF.nativeGraphics, pImage.nativeImage, pDstX, pDstY, pDstWidth, pDstHeight, pSrcX, pSrcY, pSrcWidth, pSrcHeight, pSrcUnit, 0, 0, 0)
  GdipReportError('TGdiPlusGraphics.DrawImage', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, SREAL pDstX, SREAL pDstY, SREAL pDstWidth, SREAL pDstHeight, SREAL pSrcX, SREAL pSrcY, SREAL pSrcWidth, SREAL pSrcHeight, GpUnit pSrcUnit, TGdiPlusImageAttributes pImageAttr)
  CODE
  SELF.lastResult = GdipDrawImageRectRect(SELF.nativeGraphics, pImage.nativeImage, pDstX, pDstY, pDstWidth, pDstHeight, pSrcX, pSrcY, pSrcWidth, pSrcHeight, pSrcUnit, pImageAttr.nativeImageAttr, 0, 0)
  GdipReportError('TGdiPlusGraphics.DrawImage', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpRectF pDestRect, CONST *GpRectF pSrcRect, GpUnit pSrcUnit)
  CODE
  RETURN SELF.DrawImage(pImage, pDestRect.x, pDestRect.y, pDestRect.width, pDestRect.height, | 
    pSrcRect.x, pSrcRect.y, pSrcRect.width, pSrcRect.height, pSrcUnit)
       
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpRectF pDestRect, CONST *GpRectF pSrcRect, GpUnit pSrcUnit, TGdiPlusImageAttributes pImageAttr)
  CODE
  RETURN SELF.DrawImage(pImage, pDestRect.x, pDestRect.y, pDestRect.width, pDestRect.height, | 
    pSrcRect.x, pSrcRect.y, pSrcRect.width, pSrcRect.height, pSrcUnit, pImageAttr)

TGdiPlusGraphics.DrawImageI   PROCEDURE(TGdiPlusImage pImage, SIGNED pDstX, SIGNED pDstY, SIGNED pDstWidth, SIGNED pDstHeight, SIGNED pSrcX, SIGNED pSrcY, SIGNED pSrcWidth, SIGNED pSrcHeight, GpUnit pSrcUnit)
  CODE
  SELF.lastResult = GdipDrawImageRectRectI(SELF.nativeGraphics, pImage.nativeImage, pDstX, pDstY, pDstWidth, pDstHeight, pSrcX, pSrcY, pSrcWidth, pSrcHeight, pSrcUnit, 0, 0, 0)
  GdipReportError('TGdiPlusGraphics.DrawImageI', SELF.lastResult)
  RETURN SELF.lastResult
 
TGdiPlusGraphics.DrawImageI   PROCEDURE(TGdiPlusImage pImage, SIGNED pDstX, SIGNED pDstY, SIGNED pDstWidth, SIGNED pDstHeight, SIGNED pSrcX, SIGNED pSrcY, SIGNED pSrcWidth, SIGNED pSrcHeight, GpUnit pSrcUnit, TGdiPlusImageAttributes pImageAttr)
  CODE
  SELF.lastResult = GdipDrawImageRectRectI(SELF.nativeGraphics, pImage.nativeImage, pDstX, pDstY, pDstWidth, pDstHeight, pSrcX, pSrcY, pSrcWidth, pSrcHeight, pSrcUnit, pImageAttr.nativeImageAttr, 0, 0)
  GdipReportError('TGdiPlusGraphics.DrawImageI', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpRect pDestRect, CONST *GpRect pSrcRect, GpUnit pSrcUnit)
  CODE
  RETURN SELF.DrawImageI(pImage, pDestRect.x, pDestRect.y, pDestRect.width, pDestRect.height, | 
    pSrcRect.x, pSrcRect.y, pSrcRect.width, pSrcRect.height, pSrcUnit)
         
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, TRect pDestRect, TRect pSrcRect, GpUnit pSrcUnit)
  CODE
  RETURN SELF.DrawImageI(pImage, pDestRect.left, pDestRect.top, pDestRect.Width(), pDestRect.Height(), | 
    pSrcRect.left, pSrcRect.top, pSrcRect.Width(), pSrcRect.Height(), pSrcUnit)

TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpRect pDestRect, CONST *GpRect pSrcRect, GpUnit pSrcUnit, TGdiPlusImageAttributes pImageAttr)
  CODE
  RETURN SELF.DrawImageI(pImage, pDestRect.x, pDestRect.y, pDestRect.width, pDestRect.height, | 
    pSrcRect.x, pSrcRect.y, pSrcRect.width, pSrcRect.height, pSrcUnit, pImageAttr)

TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, TRect pDestRect, TRect pSrcRect, GpUnit pSrcUnit, TGdiPlusImageAttributes pImageAttr)
  CODE
  RETURN SELF.DrawImageI(pImage, pDestRect.left, pDestRect.top, pDestRect.Width(), pDestRect.Height(), | 
    pSrcRect.left, pSrcRect.top, pSrcRect.Width(), pSrcRect.Height(), pSrcUnit, pImageAttr)

TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpPointF pUpperLeftPoint, CONST *GpPointF pUpperRightPoint, CONST *GpPointF pLowerLeftPoint, |
                                CONST *GpRectF pSrcRect, GpUnit pSrcUnit)
pts                             GROUP(GpPointF), DIM(3).
  CODE
  pts[1] = pUpperLeftPoint
  pts[2] = pUpperRightPoint
  pts[3] = pLowerLeftPoint
  SELF.lastResult = GdipDrawImagePointsRect(SELF.nativeGraphics, pImage.nativeImage, ADDRESS(pts), 3, pSrcRect.x, pSrcRect.y, pSrcRect.width, pSrcRect.height, pSrcUnit, 0, 0, 0)
  GdipReportError('TGdiPlusGraphics.DrawImage', SELF.lastResult)
  RETURN SELF.lastResult
         
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpPointF pUpperLeftPoint, CONST *GpPointF pUpperRightPoint, CONST *GpPointF pLowerLeftPoint, |
                                CONST *GpRectF pSrcRect, GpUnit pSrcUnit, TGdiPlusImageAttributes pImageAttr)
pts                             GROUP(GpPointF), DIM(3).
  CODE
  pts[1] = pUpperLeftPoint
  pts[2] = pUpperRightPoint
  pts[3] = pLowerLeftPoint
  SELF.lastResult = GdipDrawImagePointsRect(SELF.nativeGraphics, pImage.nativeImage, ADDRESS(pts), 3, pSrcRect.x, pSrcRect.y, pSrcRect.width, pSrcRect.height, pSrcUnit, pImageAttr.nativeImageAttr, 0, 0)
  GdipReportError('TGdiPlusGraphics.DrawImage', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpPoint pUpperLeftPoint, CONST *GpPoint pUpperRightPoint, CONST *GpPoint pLowerLeftPoint, |
                                CONST *GpRect pSrcRect, GpUnit pSrcUnit)
pts                             GROUP(GpPoint), DIM(3).
  CODE
  pts[1] = pUpperLeftPoint
  pts[2] = pUpperRightPoint
  pts[3] = pLowerLeftPoint
  SELF.lastResult = GdipDrawImagePointsRectI(SELF.nativeGraphics, pImage.nativeImage, ADDRESS(pts), 3, pSrcRect.x, pSrcRect.y, pSrcRect.width, pSrcRect.height, pSrcUnit, 0, 0, 0)
  GdipReportError('TGdiPlusGraphics.DrawImage', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpPoint pUpperLeftPoint, CONST *GpPoint pUpperRightPoint, CONST *GpPoint pLowerLeftPoint, |
                                TRect pSrcRect, GpUnit pSrcUnit)
rc                              LIKE(GpRect), AUTO
  CODE
  rc.x = pSrcRect.left
  rc.y = pSrcRect.top
  rc.width = pSrcRect.Width()
  rc.height = pSrcRect.Height()
  RETURN SELF.DrawImage(pImage, pUpperLeftPoint, pUpperRightPoint, pLowerLeftPoint, rc, pSrcUnit)

TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpPoint pUpperLeftPoint, CONST *GpPoint pUpperRightPoint, CONST *GpPoint pLowerLeftPoint, |
                                CONST *GpRect pSrcRect, GpUnit pSrcUnit, TGdiPlusImageAttributes pImageAttr)
pts                             GROUP(GpPoint), DIM(3).
  CODE
  pts[1] = pUpperLeftPoint
  pts[2] = pUpperRightPoint
  pts[3] = pLowerLeftPoint
  SELF.lastResult = GdipDrawImagePointsRectI(SELF.nativeGraphics, pImage.nativeImage, ADDRESS(pts), 3, pSrcRect.x, pSrcRect.y, pSrcRect.width, pSrcRect.height, pSrcUnit, pImageAttr.nativeImageAttr, 0, 0)
  GdipReportError('TGdiPlusGraphics.DrawImage', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpPoint pUpperLeftPoint, CONST *GpPoint pUpperRightPoint, CONST *GpPoint pLowerLeftPoint, |
                                TRect pSrcRect, GpUnit pSrcUnit, TGdiPlusImageAttributes pImageAttr)
rc                              LIKE(GpRect), AUTO
  CODE
  rc.x = pSrcRect.left
  rc.y = pSrcRect.top
  rc.width = pSrcRect.Width()
  rc.height = pSrcRect.Height()
  RETURN SELF.DrawImage(pImage, pUpperLeftPoint, pUpperRightPoint, pLowerLeftPoint, rc, pSrcUnit, pImageAttr)

TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpRectF pSrcRect, TGdiPlusMatrix pXform, TGdiPlusEffect pEffect, GpUnit pSrcUnit)
  CODE
  SELF.lastResult = GdipDrawImageFX(SELF.nativeGraphics, pImage.nativeImage, ADDRESS(pSrcRect), pXform.nativeMatrix, pEffect.nativeEffect, 0, pSrcUnit)
  GdipReportError('TGdiPlusGraphics.DrawImage', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphics.DrawImage    PROCEDURE(TGdiPlusImage pImage, CONST *GpRectF pSrcRect, TGdiPlusMatrix pXform, TGdiPlusEffect pEffect, GpUnit pSrcUnit, TGdiPlusImageAttributes pImageAttr)
  CODE
  SELF.lastResult = GdipDrawImageFX(SELF.nativeGraphics, pImage.nativeImage, ADDRESS(pSrcRect), pXform.nativeMatrix, pEffect.nativeEffect, pImageAttr.nativeImageAttr, pSrcUnit)
  GdipReportError('TGdiPlusGraphics.DrawImage', SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphics.SetClip      PROCEDURE(TGdiPlusGraphics pSrcGraphics, GpCombineMode pCombineMode=CombineModeReplace)
  CODE
  SELF.lastResult = GdipSetClipGraphics(SELF.nativeGraphics, pSrcGraphics.nativeGraphics, pCombineMode)
  GdipReportError('TGdiPlusGraphics.SetClip', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphics.SetClip      PROCEDURE(CONST *GpRectF pRect, GpCombineMode pCombineMode=CombineModeReplace)
  CODE
  SELF.lastResult = GdipSetClipRect(SELF.nativeGraphics, pRect.x, pRect.y, pRect.width, pRect.height, pCombineMode)
  GdipReportError('TGdiPlusGraphics.SetClip', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphics.SetClip      PROCEDURE(CONST *GpRect pRect, GpCombineMode pCombineMode=CombineModeReplace)
  CODE
  SELF.lastResult = GdipSetClipRectI(SELF.nativeGraphics, pRect.x, pRect.y, pRect.width, pRect.height, pCombineMode)
  GdipReportError('TGdiPlusGraphics.SetClip', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphics.SetClip      PROCEDURE(TGdiPlusGraphicsPath pPath, GpCombineMode pCombineMode=CombineModeReplace)
  CODE
  SELF.lastResult = GdipSetClipPath(SELF.nativeGraphics, pPath.nativePath, pCombineMode)
  GdipReportError('TGdiPlusGraphics.SetClip', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphics.SetClip      PROCEDURE(TGdiPlusRegion pRegion, GpCombineMode pCombineMode=CombineModeReplace)
  CODE
  SELF.lastResult = GdipSetClipRegion(SELF.nativeGraphics, pRegion.nativeRegion, pCombineMode)
  GdipReportError('TGdiPlusGraphics.SetClip', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphics.SetClip      PROCEDURE(HRGN pHrgn, GpCombineMode pCombineMode=CombineModeReplace)
  CODE
  SELF.lastResult = GdipSetClipHrgn(SELF.nativeGraphics, pHrgn, pCombineMode)
  GdipReportError('TGdiPlusGraphics.SetClip', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphics.IntersectClip    PROCEDURE(CONST *GpRectF pRect)
  CODE
  RETURN SELF.SetClip(pRect, CombineModeIntersect)
    
TGdiPlusGraphics.IntersectClip    PROCEDURE(CONST *GpRect pRect)
  CODE
  RETURN SELF.SetClip(pRect, CombineModeIntersect)
        
TGdiPlusGraphics.IntersectClip    PROCEDURE(TRect pRect)
rc                                  LIKE(GpRect), AUTO
  CODE
  rc.x = pRect.left
  rc.y = pRect.top
  rc.width = pRect.Width()
  rc.height = pRect.Height()
  RETURN SELF.IntersectClip(rc)

TGdiPlusGraphics.IntersectClip    PROCEDURE(TGdiPlusRegion pRegion)
  CODE
  RETURN SELF.SetClip(pRegion, CombineModeIntersect)
      
TGdiPlusGraphics.ExcludeClip  PROCEDURE(CONST *GpRectF pRect)
  CODE
  RETURN SELF.SetClip(pRect, CombineModeExclude)
    
TGdiPlusGraphics.ExcludeClip  PROCEDURE(CONST *GpRect pRect)
  CODE
  RETURN SELF.SetClip(pRect, CombineModeExclude)
        
TGdiPlusGraphics.ExcludeClip  PROCEDURE(TRect pRect)
rc                              LIKE(GpRect), AUTO
  CODE
  rc.x = pRect.left
  rc.y = pRect.top
  rc.width = pRect.Width()
  rc.height = pRect.Height()
  RETURN SELF.ExcludeClip(rc)

TGdiPlusGraphics.ExcludeClip  PROCEDURE(TGdiPlusRegion pRegion)
  CODE
  RETURN SELF.SetClip(pRegion, CombineModeExclude)
    
TGdiPlusGraphics.ResetClip    PROCEDURE()
  CODE
  SELF.lastResult = GdipResetClip(SELF.nativeGraphics)
  GdipReportError('TGdiPlusGraphics.ResetClip', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphics.TranslateClip    PROCEDURE(SREAL pDx, SREAL pDy)
  CODE
  SELF.lastResult = GdipTranslateClip(SELF.nativeGraphics, pDx, pDy)
  GdipReportError('TGdiPlusGraphics.TranslateClip', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphics.TranslateClipI   PROCEDURE(SIGNED pDx, SIGNED pDy)
  CODE
  SELF.lastResult = GdipTranslateClipI(SELF.nativeGraphics, pDx, pDy)
  GdipReportError('TGdiPlusGraphics.TranslateClipI', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphics.GetClip      PROCEDURE(*TGdiPlusRegion pRegion)
  CODE
  SELF.lastResult = GdipGetClip(SELF.nativeGraphics, pRegion.nativeRegion)
  GdipReportError('TGdiPlusGraphics.GetClip', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphics.GetClipBounds    PROCEDURE(*GpRectF pRect)
  CODE
  SELF.lastResult = GdipGetClipBounds(SELF.nativeGraphics, ADDRESS(pRect))
  GdipReportError('TGdiPlusGraphics.GetClipBounds', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphics.GetClipBounds    PROCEDURE(*GpRect pRect)
  CODE
  SELF.lastResult = GdipGetClipBoundsI(SELF.nativeGraphics, ADDRESS(pRect))
  GdipReportError('TGdiPlusGraphics.GetClipBounds', SELF.lastResult)
  RETURN SELF.lastResult
        
TGdiPlusGraphics.GetClipBounds    PROCEDURE(*TRect pRect)
rc                                  LIKE(GpRect), AUTO
  CODE
  SELF.lastResult = SELF.GetClipBounds(rc)
  pRect.left = rc.x
  pRect.top = rc.y
  pRect.Width(rc.width)
  pRect.Height(rc.height)
  RETURN SELF.lastResult

TGdiPlusGraphics.IsClipEmpty  PROCEDURE()
res                             BOOL
  CODE
  SELF.lastResult = GdipIsClipEmpty(SELF.nativeGraphics, res)
  GdipReportError('TGdiPlusGraphics.IsClipEmpty', SELF.lastResult)
  RETURN res
    
TGdiPlusGraphics.GetVisibleClipBounds PROCEDURE(*GpRectF pRect)
  CODE
  SELF.lastResult = GdipGetVisibleClipBounds(SELF.nativeGraphics, ADDRESS(pRect))
  GdipReportError('TGdiPlusGraphics.GetVisibleClipBounds', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphics.GetVisibleClipBounds PROCEDURE(*GpRect pRect)
  CODE
  SELF.lastResult = GdipGetVisibleClipBoundsI(SELF.nativeGraphics, ADDRESS(pRect))
  GdipReportError('TGdiPlusGraphics.GetVisibleClipBounds', SELF.lastResult)
  RETURN SELF.lastResult
        
TGdiPlusGraphics.GetVisibleClipBounds PROCEDURE(*TRect pRect)
rc                                      LIKE(GpRect), AUTO
  CODE
  SELF.lastResult = SELF.GetVisibleClipBounds(rc)
  pRect.left = rc.x
  pRect.top = rc.y
  pRect.Width(rc.width)
  pRect.Height(rc.height)
  RETURN SELF.lastResult

TGdiPlusGraphics.IsVisibleClipEmpty   PROCEDURE()
res                                     BOOL
  CODE
  SELF.lastResult = GdipIsVisibleClipEmpty(SELF.nativeGraphics, res)
  GdipReportError('TGdiPlusGraphics.IsVisibleClipEmpty', SELF.lastResult)
  RETURN res
    
TGdiPlusGraphics.IsVisible    PROCEDURE(CONST *GpPointF pPoint)
  CODE
  RETURN SELF.IsVisible(pPoint.x, pPoint.y)
  
TGdiPlusGraphics.IsVisible    PROCEDURE(SREAL pX, SREAL pY)
res                             BOOL
  CODE
  SELF.lastResult = GdipIsVisiblePoint(SELF.nativeGraphics, pX, pY, res)
  GdipReportError('TGdiPlusGraphics.IsVisible', SELF.lastResult)
  RETURN res
    
TGdiPlusGraphics.IsVisible    PROCEDURE(CONST *GpPoint pPoint)
  CODE
  RETURN SELF.IsVisibleI(pPoint.x, pPoint.y)
  
TGdiPlusGraphics.IsVisibleI   PROCEDURE(SIGNED pX, SIGNED pY)
res                             BOOL
  CODE
  SELF.lastResult = GdipIsVisiblePointI(SELF.nativeGraphics, pX, pY, res)
  GdipReportError('TGdiPlusGraphics.IsVisible', SELF.lastResult)
  RETURN res
      
TGdiPlusGraphics.IsVisible    PROCEDURE(CONST *GpRectF pRect)
  CODE
  RETURN SELF.IsVisible(pRect.x, pRect.y, pRect.width, pRect.height)
  
TGdiPlusGraphics.IsVisible    PROCEDURE(SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight)
res                             BOOL
  CODE
  SELF.lastResult = GdipIsVisibleRect(SELF.nativeGraphics, pX, pY, pWidth, pHeight, res)
  GdipReportError('TGdiPlusGraphics.IsVisible', SELF.lastResult)
  RETURN res
      
TGdiPlusGraphics.IsVisible    PROCEDURE(CONST *GpRect pRect)
  CODE
  RETURN SELF.IsVisibleI(pRect.x, pRect.y, pRect.width, pRect.height)
        
TGdiPlusGraphics.IsVisible    PROCEDURE(TRect pRect)
  CODE
  RETURN SELF.IsVisibleI(pRect.left, pRect.top, pRect.Width(), pRect.Height())

TGdiPlusGraphics.IsVisibleI   PROCEDURE(SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight)
res                             BOOL
  CODE
  SELF.lastResult = GdipIsVisibleRectI(SELF.nativeGraphics, pX, pY, pWidth, pHeight, res)
  GdipReportError('TGdiPlusGraphics.IsVisible', SELF.lastResult)
  RETURN res
  
TGdiPlusGraphics.Save         PROCEDURE()
state                           GpGraphicsState
  CODE
  SELF.lastResult = GdipSaveGraphics(SELF.nativeGraphics, state)
  GdipReportError('TGdiPlusGraphics.Save', SELF.lastResult)
  RETURN state
    
TGdiPlusGraphics.Restore      PROCEDURE(GpGraphicsState pState)
  CODE
  SELF.lastResult = GdipRestoreGraphics(SELF.nativeGraphics, pState)
  GdipReportError('TGdiPlusGraphics.Restore', SELF.lastResult)
  RETURN SELF.lastResult
  
      
TGdiPlusGraphics.EnumerateMetafile    PROCEDURE(TGdiPlusMetafile pMetafile, CONST *GpPointF pDestPoint, LONG pCallback, LONG pCallbackData=0, <TGdiPlusImageAttributes pImageAttrs>)
nativeImageAttr                         LONG, AUTO
  CODE
  nativeImageAttr = CHOOSE(NOT OMITTED(pImageAttrs), pImageAttrs.nativeImageAttr, 0)
  SELF.lastResult = GdipEnumerateMetafileDestPoint(SELF.nativeGraphics, pMetafile.nativeImage, ADDRESS(pDestPoint), pCallback, pCallbackData, nativeImageAttr)
  GdipReportError('TGdiPlusGraphics.EnumerateMetafile', SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphics.EnumerateMetafile    PROCEDURE(TGdiPlusMetafile pMetafile, CONST *GpPoint pDestPoint, LONG pCallback, LONG pCallbackData=0, <TGdiPlusImageAttributes pImageAttrs>)
nativeImageAttr                         LONG, AUTO
  CODE
  nativeImageAttr = CHOOSE(NOT OMITTED(pImageAttrs), pImageAttrs.nativeImageAttr, 0)
  SELF.lastResult = GdipEnumerateMetafileDestPointI(SELF.nativeGraphics, pMetafile.nativeImage, ADDRESS(pDestPoint), pCallback, pCallbackData, nativeImageAttr)
  GdipReportError('TGdiPlusGraphics.EnumerateMetafile', SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphics.EnumerateMetafile    PROCEDURE(TGdiPlusMetafile pMetafile, CONST *GpRectF pDestRect, LONG pCallback, LONG pCallbackData=0, <TGdiPlusImageAttributes pImageAttrs>)
nativeImageAttr                         LONG, AUTO
  CODE
  nativeImageAttr = CHOOSE(NOT OMITTED(pImageAttrs), pImageAttrs.nativeImageAttr, 0)
  SELF.lastResult = GdipEnumerateMetafileDestRect(SELF.nativeGraphics, pMetafile.nativeImage, ADDRESS(pDestRect), pCallback, pCallbackData, nativeImageAttr)
  GdipReportError('TGdiPlusGraphics.EnumerateMetafile', SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphics.EnumerateMetafile    PROCEDURE(TGdiPlusMetafile pMetafile, CONST *GpRect pDestRect, LONG pCallback, LONG pCallbackData=0, <TGdiPlusImageAttributes pImageAttrs>)
nativeImageAttr                         LONG, AUTO
  CODE
  nativeImageAttr = CHOOSE(NOT OMITTED(pImageAttrs), pImageAttrs.nativeImageAttr, 0)
  SELF.lastResult = GdipEnumerateMetafileDestRectI(SELF.nativeGraphics, pMetafile.nativeImage, ADDRESS(pDestRect), pCallback, pCallbackData, nativeImageAttr)
  GdipReportError('TGdiPlusGraphics.EnumerateMetafile', SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphics.EnumerateMetafile    PROCEDURE(TGdiPlusMetafile pMetafile, LONG pDestPoints, UNSIGNED pCount, LONG pCallback, LONG pCallbackData=0, <TGdiPlusImageAttributes pImageAttrs>)
nativeImageAttr                         LONG, AUTO
  CODE
  nativeImageAttr = CHOOSE(NOT OMITTED(pImageAttrs), pImageAttrs.nativeImageAttr, 0)
  SELF.lastResult = GdipEnumerateMetafileDestPoints(SELF.nativeGraphics, pMetafile.nativeImage, pDestPoints, pCount, pCallback, pCallbackData, nativeImageAttr)
  GdipReportError('TGdiPlusGraphics.EnumerateMetafile', SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphics.EnumerateMetafileI   PROCEDURE(TGdiPlusMetafile pMetafile, LONG pDestPoints, UNSIGNED pCount, LONG pCallback, LONG pCallbackData=0, <TGdiPlusImageAttributes pImageAttrs>)
nativeImageAttr                         LONG, AUTO
  CODE
  nativeImageAttr = CHOOSE(NOT OMITTED(pImageAttrs), pImageAttrs.nativeImageAttr, 0)
  SELF.lastResult = GdipEnumerateMetafileDestPoints(SELF.nativeGraphics, pMetafile.nativeImage, pDestPoints, pCount, pCallback, pCallbackData, nativeImageAttr)
  GdipReportError('TGdiPlusGraphics.EnumerateMetafileI', SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphics.EnumerateMetafile    PROCEDURE(TGdiPlusMetafile pMetafile, CONST *GpPointF pDestPoint, CONST *GpRectF pSrcRect, GpUnit pScrUnit, LONG pCallback, LONG pCallbackData=0, <TGdiPlusImageAttributes pImageAttrs>)
nativeImageAttr                         LONG, AUTO
  CODE
  nativeImageAttr = CHOOSE(NOT OMITTED(pImageAttrs), pImageAttrs.nativeImageAttr, 0)
  SELF.lastResult = GdipEnumerateMetafileSrcRectDestPoint(SELF.nativeGraphics, pMetafile.nativeImage, ADDRESS(pDestPoint), ADDRESS(pSrcRect), pScrUnit, pCallback, pCallbackData, nativeImageAttr)
  GdipReportError('TGdiPlusGraphics.EnumerateMetafile', SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphics.EnumerateMetafile    PROCEDURE(TGdiPlusMetafile pMetafile, CONST *GpPoint pDestPoint, CONST *GpRect pSrcRect, GpUnit pScrUnit, LONG pCallback, LONG pCallbackData=0, <TGdiPlusImageAttributes pImageAttrs>)
nativeImageAttr                         LONG, AUTO
  CODE
  nativeImageAttr = CHOOSE(NOT OMITTED(pImageAttrs), pImageAttrs.nativeImageAttr, 0)
  SELF.lastResult = GdipEnumerateMetafileSrcRectDestPointI(SELF.nativeGraphics, pMetafile.nativeImage, ADDRESS(pDestPoint), ADDRESS(pSrcRect), pScrUnit, pCallback, pCallbackData, nativeImageAttr)
  GdipReportError('TGdiPlusGraphics.EnumerateMetafile', SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphics.EnumerateMetafile    PROCEDURE(TGdiPlusMetafile pMetafile, CONST *GpRectF pDestRect, CONST *GpRectF pSrcRect, GpUnit pScrUnit, LONG pCallback, LONG pCallbackData=0, <TGdiPlusImageAttributes pImageAttrs>)
nativeImageAttr                         LONG, AUTO
  CODE
  nativeImageAttr = CHOOSE(NOT OMITTED(pImageAttrs), pImageAttrs.nativeImageAttr, 0)
  SELF.lastResult = GdipEnumerateMetafileSrcRectDestRect(SELF.nativeGraphics, pMetafile.nativeImage, ADDRESS(pDestRect), ADDRESS(pSrcRect), pScrUnit, pCallback, pCallbackData, nativeImageAttr)
  GdipReportError('TGdiPlusGraphics.EnumerateMetafile', SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphics.EnumerateMetafile    PROCEDURE(TGdiPlusMetafile pMetafile, CONST *GpRect pDestRect, CONST *GpRect pSrcRect, GpUnit pScrUnit, LONG pCallback, LONG pCallbackData=0, <TGdiPlusImageAttributes pImageAttrs>)
nativeImageAttr                         LONG, AUTO
  CODE
  nativeImageAttr = CHOOSE(NOT OMITTED(pImageAttrs), pImageAttrs.nativeImageAttr, 0)
  SELF.lastResult = GdipEnumerateMetafileSrcRectDestRectI(SELF.nativeGraphics, pMetafile.nativeImage, ADDRESS(pDestRect), ADDRESS(pSrcRect), pScrUnit, pCallback, pCallbackData, nativeImageAttr)
  GdipReportError('TGdiPlusGraphics.EnumerateMetafile', SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphics.EnumerateMetafile    PROCEDURE(TGdiPlusMetafile pMetafile, LONG pDestPoints, UNSIGNED pCount, CONST *GpRectF pSrcRect, GpUnit pScrUnit, LONG pCallback, LONG pCallbackData=0, <TGdiPlusImageAttributes pImageAttrs>)
nativeImageAttr                         LONG, AUTO
  CODE
  nativeImageAttr = CHOOSE(NOT OMITTED(pImageAttrs), pImageAttrs.nativeImageAttr, 0)
  SELF.lastResult = GdipEnumerateMetafileSrcRectDestPoints(SELF.nativeGraphics, pMetafile.nativeImage, pDestPoints, pCount, ADDRESS(pSrcRect), pScrUnit, pCallback, pCallbackData, nativeImageAttr)
  GdipReportError('TGdiPlusGraphics.EnumerateMetafile', SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphics.EnumerateMetafile    PROCEDURE(TGdiPlusMetafile pMetafile, LONG pDestPoints, UNSIGNED pCount, CONST *GpRect pSrcRect, GpUnit pScrUnit, LONG pCallback, LONG pCallbackData=0, <TGdiPlusImageAttributes pImageAttrs>)
nativeImageAttr                         LONG, AUTO
  CODE
  nativeImageAttr = CHOOSE(NOT OMITTED(pImageAttrs), pImageAttrs.nativeImageAttr, 0)
  SELF.lastResult = GdipEnumerateMetafileSrcRectDestPointsI(SELF.nativeGraphics, pMetafile.nativeImage, pDestPoints, pCount, ADDRESS(pSrcRect), pScrUnit, pCallback, pCallbackData, nativeImageAttr)
  GdipReportError('TGdiPlusGraphics.EnumerateMetafile', SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphics.AddMetafileComment   PROCEDURE(STRING pComment)
  CODE
  SELF.lastResult = GdipComment(SELF.nativeGraphics, SIZE(pComment), ADDRESS(pComment))
  GdipReportError('TGdiPlusGraphics.AddMetafileComment', SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphics.BeginContainer   PROCEDURE(CONST *GpRectF pDstRect,CONST *GpRectF pSrcRect, GpUnit pSrcUnit)
state                               GpGraphicsContainer
  CODE
  SELF.lastResult = GdipBeginContainer(SELF.nativeGraphics, ADDRESS(pDstRect), ADDRESS(pSrcRect), pSrcUnit, state)
  GdipReportError('TGdiPlusGraphics.BeginContainer', SELF.lastResult)
  RETURN state
      
TGdiPlusGraphics.BeginContainer   PROCEDURE(CONST *GpRect pDstRect,CONST *GpRect pSrcRect, GpUnit pSrcUnit)
state                               GpGraphicsContainer
  CODE
  SELF.lastResult = GdipBeginContainerI(SELF.nativeGraphics, ADDRESS(pDstRect), ADDRESS(pSrcRect), pSrcUnit, state)
  GdipReportError('TGdiPlusGraphics.BeginContainer', SELF.lastResult)
  RETURN state
      
TGdiPlusGraphics.BeginContainer   PROCEDURE()
state                               GpGraphicsContainer
  CODE
  SELF.lastResult = GdipBeginContainer2(SELF.nativeGraphics, state)
  GdipReportError('TGdiPlusGraphics.BeginContainer', SELF.lastResult)
  RETURN state
      
TGdiPlusGraphics.EndContainer PROCEDURE(GpGraphicsContainer pState)
  CODE
  SELF.lastResult = GdipEndContainer(SELF.nativeGraphics, pState)
  GdipReportError('TGdiPlusGraphics.EndContainer', SELF.lastResult)
  RETURN SELF.lastResult
!!!endregion
  
!!!region TGdiPlusPixelFormat
TGdiPlusPixelFormat.PixelFormat   PROCEDURE(<GpPixelFormat pPixfmt>)
  CODE
  IF NOT OMITTED(pPixfmt)
    SELF.pixfmt = pPixfmt
  END
  RETURN SELF.pixfmt
  
TGdiPlusPixelFormat.GetSize   PROCEDURE()
  CODE
  RETURN BAND(BSHIFT(SELF.pixfmt, -8), 0ffh)
  
TGdiPlusPixelFormat.IsIndexed PROCEDURE()
  CODE
  RETURN CHOOSE(BAND(SELF.pixfmt, PixelFormatIndexed) <> 0)
  
TGdiPlusPixelFormat.IsAlpha   PROCEDURE()
  CODE
  RETURN CHOOSE(BAND(SELF.pixfmt, PixelFormatAlpha) <> 0)
  
TGdiPlusPixelFormat.IsExtended    PROCEDURE()
  CODE
  RETURN CHOOSE(BAND(SELF.pixfmt, PixelFormatExtended) <> 0)

TGdiPlusPixelFormat.IsCanonical   PROCEDURE()
  CODE
  RETURN CHOOSE(BAND(SELF.pixfmt, PixelFormatCanonical) <> 0)
!!!endregion

!!!region TGdiPlusEffect
TGdiPlusEffect.Destruct       PROCEDURE()
  CODE
  SELF.FreeAuxData()
  SELF.lastResult = GdipDeleteEffect(SELF.nativeEffect)
  GdipReportError(printf('TGdiPlusEffect.Destruct'), SELF.lastResult)
  SELF.nativeEffect = 0

TGdiPlusEffect.Initialized    PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativeEffect <> 0)

TGdiPlusEffect.GetAuxDataSize PROCEDURE()
  CODE
  RETURN SELF.auxDataSize
  
TGdiPlusEffect.GetAuxData     PROCEDURE()
  CODE
  RETURN SELF.auxData
  
TGdiPlusEffect.UseAuxData     PROCEDURE(<BOOL pUseAuxData>)
  CODE
  IF NOT OMITTED(pUseAuxData)
    SELF.bUseAuxData = pUseAuxData
  END
  RETURN SELF.bUseAuxData
  
TGdiPlusEffect.SetAuxData     PROCEDURE(LONG pDataPtr, UNSIGNED pDataSize)
  CODE
  IF pDataPtr AND pDataSize
    SELF.auxData &= (pDataPtr) &':'& pDataSize
    SELF.auxDataSize = pDataSize
  END
  
TGdiPlusEffect.FreeAuxData    PROCEDURE()
  CODE
  IF NOT SELF.auxData &= NULL
    GdipFree(ADDRESS(SELF.auxData))
    SELF.auxData &= NULL
    SELF.auxDataSize = 0
  END

TGdiPlusEffect.GetParameterSize   PROCEDURE()
paramSize                           UNSIGNED(0)
  CODE
  SELF.lastResult = GdipGetEffectParameterSize(SELF.nativeEffect, paramSize)
  GdipReportError(printf('TGdiPlusEffect.GetParameterSize'), SELF.lastResult)
  RETURN paramSize
  
TGdiPlusEffect.SetParameters  PROCEDURE(*GROUP pParams)
  CODE
  SELF.lastResult = GdipSetEffectParameters(SELF.nativeEffect, ADDRESS(pParams), SIZE(pParams))
  GdipReportError(printf('TGdiPlusEffect.SetParameters'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusEffect.GetParameters  PROCEDURE(*GROUP pParams)
pSize                           UNSIGNED, AUTO
  CODE
  SELF.lastResult = GdipGetEffectParameters(SELF.nativeEffect, pSize, ADDRESS(pParams))
  GdipReportError(printf('TGdiPlusEffect.GetParameters'), SELF.lastResult)
  RETURN SELF.lastResult
!!!endregion

!!!region TGdiPlusBlurEffect
TGdiPlusBlurEffect.Construct  PROCEDURE()
  CODE
  SELF.lastResult = GdipCreateEffectFromGuid(BlurEffectGuidString, SELF.nativeEffect)
  GdipReportError(printf('TGdiPlusBlurEffect.Construct'), SELF.lastResult)
  
TGdiPlusBlurEffect.SetParameters  PROCEDURE(typBlurParams pParams)
  CODE
  RETURN PARENT.SetParameters(pParams)
  
TGdiPlusBlurEffect.GetParameters  PROCEDURE(*typBlurParams pParams)
  CODE
  RETURN PARENT.GetParameters(pParams)
!!!endregion
  
!!!region TGdiPlusSharpenEffect
TGdiPlusSharpenEffect.Construct   PROCEDURE()
  CODE
  SELF.lastResult = GdipCreateEffectFromGuid(SharpenEffectGuidString, SELF.nativeEffect)
  GdipReportError(printf('TGdiPlusSharpenEffect.Construct'), SELF.lastResult)
  
TGdiPlusSharpenEffect.SetParameters   PROCEDURE(typSharpenParams pParams)
  CODE
  RETURN PARENT.SetParameters(pParams)
  
TGdiPlusSharpenEffect.GetParameters   PROCEDURE(*typSharpenParams pParams)
  CODE
  RETURN PARENT.GetParameters(pParams)
!!!endregion
    
!!!region TGdiPlusRedEyeCorrectionEffect
TGdiPlusRedEyeCorrectionEffect.Construct  PROCEDURE()
  CODE
  SELF.lastResult = GdipCreateEffectFromGuid(RedEyeCorrectionEffectGuidString, SELF.nativeEffect)
  GdipReportError(printf('TGdiPlusRedEyeCorrectionEffect.Construct'), SELF.lastResult)
  
TGdiPlusRedEyeCorrectionEffect.SetParameters  PROCEDURE(typRedEyeCorrectionParams pParams)
  CODE
  RETURN PARENT.SetParameters(pParams)
  
TGdiPlusRedEyeCorrectionEffect.GetParameters  PROCEDURE(*typRedEyeCorrectionParams pParams)
  CODE
  RETURN PARENT.GetParameters(pParams)
!!!endregion
  
!!!region TGdiPlusBrightnessContrastEffect
TGdiPlusBrightnessContrastEffect.Construct    PROCEDURE()
  CODE
  SELF.lastResult = GdipCreateEffectFromGuid(BrightnessContrastEffectGuidString, SELF.nativeEffect)
  GdipReportError(printf('TGdiPlusBrightnessContrastEffect.Construct'), SELF.lastResult)
  
TGdiPlusBrightnessContrastEffect.SetParameters    PROCEDURE(typBrightnessContrastParams pParams)
  CODE
  RETURN PARENT.SetParameters(pParams)
  
TGdiPlusBrightnessContrastEffect.GetParameters    PROCEDURE(*typBrightnessContrastParams pParams)
  CODE
  RETURN PARENT.GetParameters(pParams)
!!!endregion

!!!region TGdiPlusHueSaturationLightnessEffect
TGdiPlusHueSaturationLightnessEffect.Construct    PROCEDURE()
  CODE
  SELF.lastResult = GdipCreateEffectFromGuid(HueSaturationLightnessEffectGuidString, SELF.nativeEffect)
  GdipReportError(printf('TGdiPlusHueSaturationLightnessEffect.Construct'), SELF.lastResult)
  
TGdiPlusHueSaturationLightnessEffect.SetParameters    PROCEDURE(typHueSaturationLightnessParams pParams)
  CODE
  RETURN PARENT.SetParameters(pParams)
  
TGdiPlusHueSaturationLightnessEffect.GetParameters    PROCEDURE(*typHueSaturationLightnessParams pParams)
  CODE
  RETURN PARENT.GetParameters(pParams)
!!!endregion

!!!region TGdiPlusLevelsEffect
TGdiPlusLevelsEffect.Construct    PROCEDURE()
  CODE
  SELF.lastResult = GdipCreateEffectFromGuid(LevelsEffectGuidString, SELF.nativeEffect)
  GdipReportError(printf('TGdiPlusLevelsEffect.Construct'), SELF.lastResult)
  
TGdiPlusLevelsEffect.SetParameters    PROCEDURE(typLevelsParams pParams)
  CODE
  RETURN PARENT.SetParameters(pParams)
  
TGdiPlusLevelsEffect.GetParameters    PROCEDURE(*typLevelsParams pParams)
  CODE
  RETURN PARENT.GetParameters(pParams)
!!!endregion

!!!region TGdiPlusTintEffect
TGdiPlusTintEffect.Construct  PROCEDURE()
  CODE
  SELF.lastResult = GdipCreateEffectFromGuid(TintEffectGuidString, SELF.nativeEffect)
  GdipReportError(printf('TGdiPlusTintEffect.Construct'), SELF.lastResult)
  
TGdiPlusTintEffect.SetParameters  PROCEDURE(typTintParams pParams)
  CODE
  RETURN PARENT.SetParameters(pParams)
  
TGdiPlusTintEffect.GetParameters  PROCEDURE(*typTintParams pParams)
  CODE
  RETURN PARENT.GetParameters(pParams)
!!!endregion

!!!region TGdiPlusColorBalanceEffect
TGdiPlusColorBalanceEffect.Construct  PROCEDURE()
  CODE
  SELF.lastResult = GdipCreateEffectFromGuid(ColorBalanceEffectGuidString, SELF.nativeEffect)
  GdipReportError(printf('TGdiPlusColorBalanceEffect.Construct'), SELF.lastResult)
  
TGdiPlusColorBalanceEffect.SetParameters  PROCEDURE(typColorBalanceParams pParams)
  CODE
  RETURN PARENT.SetParameters(pParams)
  
TGdiPlusColorBalanceEffect.GetParameters  PROCEDURE(*typColorBalanceParams pParams)
  CODE
  RETURN PARENT.GetParameters(pParams)
!!!endregion

!!!region TGdiPlusColorMatrixEffect
TGdiPlusColorMatrixEffect.Construct   PROCEDURE()
  CODE
  SELF.lastResult = GdipCreateEffectFromGuid(ColorMatrixEffectGuidString, SELF.nativeEffect)
  GdipReportError(printf('TGdiPlusColorMatrixEffect.Construct'), SELF.lastResult)
  
TGdiPlusColorMatrixEffect.SetParameters   PROCEDURE(typColorMatrix pMatrix)
  CODE
  RETURN PARENT.SetParameters(pMatrix)
  
TGdiPlusColorMatrixEffect.GetParameters   PROCEDURE(*typColorMatrix pMatrix)
  CODE
  RETURN PARENT.GetParameters(pMatrix)
!!!endregion

!!!region TGdiPlusColorLUTEffect
TGdiPlusColorLUTEffect.Construct  PROCEDURE()
  CODE
  SELF.lastResult = GdipCreateEffectFromGuid(ColorLUTEffectGuidString, SELF.nativeEffect)
  GdipReportError(printf('TGdiPlusColorLUTEffect.Construct'), SELF.lastResult)
  
TGdiPlusColorLUTEffect.SetParameters  PROCEDURE(typColorLUTParams pParams)
  CODE
  RETURN PARENT.SetParameters(pParams)
  
TGdiPlusColorLUTEffect.GetParameters  PROCEDURE(*typColorLUTParams pParams)
  CODE
  RETURN PARENT.GetParameters(pParams)
!!!endregion

!!!region TGdiPlusColorCurveEffect
TGdiPlusColorCurveEffect.Construct    PROCEDURE()
  CODE
  SELF.lastResult = GdipCreateEffectFromGuid(ColorCurveEffectGuidString, SELF.nativeEffect)
  GdipReportError(printf('TGdiPlusColorCurveEffect.Construct'), SELF.lastResult)
  
TGdiPlusColorCurveEffect.SetParameters    PROCEDURE(typColorCurveParams pParams)
  CODE
  RETURN PARENT.SetParameters(pParams)
  
TGdiPlusColorCurveEffect.GetParameters    PROCEDURE(*typColorCurveParams pParams)
  CODE
  RETURN PARENT.GetParameters(pParams)
!!!endregion

!!!region TGdiPlusMatrix
TGdiPlusMatrix.Destruct       PROCEDURE()
  CODE
  SELF.DeleteMatrix()
  
TGdiPlusMatrix.Initialized    PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativeMatrix <> 0)

TGdiPlusMatrix.CreateMatrix   PROCEDURE()
  CODE
  SELF.DeleteMatrix()
  SELF.lastResult = GdipCreateMatrix(SELF.nativeMatrix)
  GdipReportError(printf('TGdiPlusMatrix.CreateMatrix'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusMatrix.CreateMatrix   PROCEDURE(SREAL pM11, SREAL pM12, SREAL pM21, SREAL pM22, SREAL pDx, SREAL pDy)
  CODE
  SELF.DeleteMatrix()
  SELF.lastResult = GdipCreateMatrix2(pM11, pM12, pM21, pM22, pDx, pDy, SELF.nativeMatrix)
  GdipReportError(printf('TGdiPlusMatrix.CreateMatrix'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusMatrix.CreateMatrix   PROCEDURE(CONST *GprectF pRect, CONST *GpPointF pDstplg)
  CODE
  SELF.DeleteMatrix()
  SELF.lastResult = GdipCreateMatrix3(ADDRESS(pRect), ADDRESS(pDstplg), SELF.nativeMatrix)
  GdipReportError(printf('TGdiPlusMatrix.CreateMatrix'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusMatrix.CreateMatrix   PROCEDURE(CONST *GpRect pRect, CONST *GpPoint pDstplg)
  CODE
  SELF.DeleteMatrix()
  SELF.lastResult = GdipCreateMatrix3I(ADDRESS(pRect), ADDRESS(pDstplg), SELF.nativeMatrix)
  GdipReportError(printf('TGdiPlusMatrix.CreateMatrixI'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusMatrix.DeleteMatrix   PROCEDURE()
  CODE
  IF SELF.nativeMatrix
    SELF.lastResult = GdipDeleteMatrix(SELF.nativeMatrix)
    GdipReportError(printf('TGdiPlusMatrix.DeleteMatrix'), SELF.lastResult)
    SELF.nativeMatrix = 0
  END
  RETURN SELF.lastResult
  
TGdiPlusMatrix.Clone          PROCEDURE()
mx                              &TGdiPlusMatrix
  CODE
  mx &= NEW TGdiPlusMatrix
  SELF.Clone(mx)
  IF SELF.lastResult <> GpStatus:Ok
    DISPOSE(mx)
    mx &= NULL
  END
  RETURN mx
  
TGdiPlusMatrix.Clone          PROCEDURE(*TGdiPlusMatrix pClonedMatrix)
  CODE
  pClonedMatrix.DeleteMatrix()
  SELF.lastResult = GdipCloneMatrix(SELF.nativeMatrix, pClonedMatrix.nativeMatrix)
  GdipReportError(printf('TGdiPlusMatrix.Clone'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusMatrix.GetElements    PROCEDURE(*SREAL[] pMatrixOut)
  CODE
  SELF.lastResult = GdipGetMatrixElements(SELF.nativeMatrix, ADDRESS(pMatrixOut))
  GdipReportError(printf('TGdiPlusMatrix.GetElements'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusMatrix.GetElements    PROCEDURE(*SREAL pM11, *SREAL pM12, *SREAL pM21, *SREAL pM22, *SREAL pDx, *SREAL pDy)
mx                              SREAL, DIM(6)
  CODE
  IF SELF.GetElements(mx) = GpStatus:Ok
    pM11 = mx[1]
    pM12 = mx[1]
    pM21 = mx[1]
    pM22 = mx[1]
    pDx = mx[1]
    pDy = mx[1]
  END
  RETURN SELF.lastResult
  
TGdiPlusMatrix.SetElements    PROCEDURE(SREAL pM11, SREAL pM12, SREAL pM21, SREAL pM22, SREAL pDx, SREAL pDy)
  CODE
  SELF.lastResult = GdipSetMatrixElements(SELF.nativeMatrix, pM11, pM12, pM21, pM22, pDx, pDy)
  GdipReportError(printf('TGdiPlusMatrix.SetElements'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusMatrix.SetElements    PROCEDURE(*SREAL[] pMatrixIn)
  CODE
  RETURN SELF.SetElements(pMatrixIn[1], pMatrixIn[2], pMatrixIn[3], pMatrixIn[4], pMatrixIn[5], pMatrixIn[6])
  
TGdiPlusMatrix.OffsetX        PROCEDURE()
elements                        SREAL, DIM(6)
  CODE
  IF SELF.GetElements(elements) = GpStatus:Ok
    RETURN elements[5]
  ELSE
    RETURN 0.0
  END
  
TGdiPlusMatrix.OffsetY        PROCEDURE()
elements                        SREAL, DIM(6)
  CODE
  IF SELF.GetElements(elements) = GpStatus:Ok
    RETURN elements[6]
  ELSE
    RETURN 0.0
  END

TGdiPlusMatrix.ResetMatrixElements    PROCEDURE()
  CODE
  RETURN SELF.SetElements(1.0, 0.0, 0.0, 1.0, 0.0, 0.0)
  
TGdiPlusMatrix.Multiply       PROCEDURE(TGdiPlusMatrix pMatrix, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipMultiplyMatrix(SELF.nativeMatrix, pMatrix.nativeMatrix, pOrder)
  GdipReportError(printf('TGdiPlusMatrix.Multiply'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusMatrix.Translate      PROCEDURE(SREAL pOffsetX, SREAL pOffsetY, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipTranslateMatrix(SELF.nativeMatrix, pOffsetX, pOffsetY, pOrder)
  GdipReportError(printf('TGdiPlusMatrix.Translate'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusMatrix.Scale          PROCEDURE(SREAL pScaleX, SREAL pScaleY, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipScaleMatrix(SELF.nativeMatrix, pScaleX, pScaleY, pOrder)
  GdipReportError(printf('TGdiPlusMatrix.Scale'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusMatrix.Rotate         PROCEDURE(SREAL pAngle, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipRotateMatrix(SELF.nativeMatrix, pAngle, pOrder)
  GdipReportError(printf('TGdiPlusMatrix.Rotate'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusMatrix.RotateAt       PROCEDURE(SREAL pAngle, CONST *GpPointF pCenter, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  IF pOrder = MatrixOrderPrepend
    SELF.Translate(pCenter.x, pCenter.y, pOrder)
    SELF.Rotate(pAngle, pOrder)
    SELF.Translate(-pCenter.x, -pCenter.y, pOrder)
  ELSE
    SELF.Translate(-pCenter.x, -pCenter.y, pOrder)
    SELF.Rotate(pAngle, pOrder)
    SELF.Translate(pCenter.x, pCenter.y, pOrder)
  END
  RETURN SELF.lastResult

TGdiPlusMatrix.Shear          PROCEDURE(SREAL pShearX, SREAL pShearY, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipShearMatrix(SELF.nativeMatrix, pShearX, pShearY, pOrder)
  GdipReportError(printf('TGdiPlusMatrix.Shear'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusMatrix.Invert         PROCEDURE()
  CODE
  SELF.lastResult = GdipInvertMatrix(SELF.nativeMatrix)
  GdipReportError(printf('TGdiPlusMatrix.Invert'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusMatrix.TransformPoints    PROCEDURE(LONG pPoints, UNSIGNED pCount=1)
  CODE
  SELF.lastResult = GdipTransformMatrixPoints(SELF.nativeMatrix, pPoints, pCount)
  GdipReportError(printf('TGdiPlusMatrix.TransformPoints'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusMatrix.TransformPointsI   PROCEDURE(LONG pPoints, UNSIGNED pCount=1)
  CODE
  SELF.lastResult = GdipTransformMatrixPointsI(SELF.nativeMatrix, pPoints, pCount)
  GdipReportError(printf('TGdiPlusMatrix.TransformPointsI'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusMatrix.TransformVectors   PROCEDURE(LONG pPoints, UNSIGNED pCount=1)
  CODE
  SELF.lastResult = GdipVectorTransformMatrixPoints(SELF.nativeMatrix, pPoints, pCount)
  GdipReportError(printf('TGdiPlusMatrix.TransformVectors'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMatrix.TransformVectorsI  PROCEDURE(LONG pPoints, UNSIGNED pCount=1)
  CODE
  SELF.lastResult = GdipVectorTransformMatrixPointsI(SELF.nativeMatrix, pPoints, pCount)
  GdipReportError(printf('TGdiPlusMatrix.TransformVectorsI'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusMatrix.IsInvertible   PROCEDURE()
res                             BOOL(FALSE)
  CODE
  SELF.lastResult = GdipIsMatrixInvertible(SELF.nativeMatrix, res)
  GdipReportError(printf('TGdiPlusMatrix.IsInvertible'), SELF.lastResult)
  RETURN res

TGdiPlusMatrix.IsIdentity     PROCEDURE()
res                             BOOL(FALSE)
  CODE
  SELF.lastResult = GdipIsMatrixIdentity(SELF.nativeMatrix, res)
  GdipReportError(printf('TGdiPlusMatrix.IsIdentity'), SELF.lastResult)
  RETURN res

TGdiPlusMatrix.Equals         PROCEDURE(TGdiPlusMatrix pMatrix)
res                             BOOL(FALSE)
  CODE
  SELF.lastResult = GdipIsMatrixEqual(SELF.nativeMatrix, pMatrix.nativeMatrix, res)
  GdipReportError(printf('TGdiPlusMatrix.Equals'), SELF.lastResult)
  RETURN res
!!!endregion

!!!region TGdiPlusFont
TGdiPlusFont.Destruct         PROCEDURE()
  CODE
  SELF.DeleteFont()
  
TGdiPlusFont.Initialized      PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativeFont <> 0)

TGdiPlusFont.FromDC           PROCEDURE(HDC phdc)
  CODE
  SELF.DeleteFont()
  SELF.lastResult = GdipCreateFontFromDC(phdc, SELF.nativeFont)
  GdipReportError(printf('TGdiPlusFont.FromDC'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusFont.FromHFONT        PROCEDURE(HDC phdc, HFONT phfont)
olf                             TLogicalFont
lf                              LIKE(GpLOGFONTA)
  CODE
  IF phfont
    olf.SetHandle(phfont)
    IF olf.GetProperties(lf)
      RETURN SELF.FromLogfontA(phdc, lf)
    END
  END
  RETURN SELF.FromDC(phdc)

TGdiPlusFont.FromLogfontA     PROCEDURE(HDC phdc, GpLOGFONTA pLogFont)
  CODE
  SELF.DeleteFont()
  SELF.lastResult = GdipCreateFontFromLogfontA(phdc, ADDRESS(pLogFont), SELF.nativeFont)
  GdipReportError(printf('TGdiPlusFont.FromLogfontA'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusFont.CreateFont       PROCEDURE(TGdiPlusFontFamily pFamily, SREAL pEmSize, GpFontStyle pStyle, GpUnit pUnit)
  CODE
  SELF.DeleteFont()
  SELF.lastResult = GdipCreateFont(pFamily.nativeFamily, pEmSize, pStyle, pUnit, SELF.nativeFont)
  GdipReportError(printf('TGdiPlusFont.CreateFont'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusFont.CreateFont       PROCEDURE(STRING pFamilyName, SREAL pEmSize, GpFontStyle pStyle, GpUnit pUnit, <TGdiPlusFontCollection pFontCollection>)
family                          TGdiPlusFontFamily
  CODE
  IF family.FromName(pFamilyName, pFontCollection) <> GpStatus:Ok
    !- Bad family name? try generic Sans Serif
    
    family.GenericSansSerif()
    IF family.lastResult <> GpStatus:Ok
      !- No luck
      RETURN family.lastResult
    END
  END
  
  IF SELF.CreateFont(family, pEmSize, pStyle, pUnit) = GpStatus:Ok
    RETURN GpStatus:Ok
  ELSE
    !- Try generic Sans Serif
    family.GenericSansSerif()
    RETURN SELF.CreateFont(family, pEmSize, pStyle, pUnit)
  END
  
TGdiPlusFont.GetLogFontA      PROCEDURE(*GpLOGFONTA pLogFont)
  CODE
  SELF.lastResult = GdipGetLogFontA(SELF.nativeFont, 0, ADDRESS(pLogFont))
  GdipReportError(printf('TGdiPlusFont.GetLogFontA'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusFont.GetLogFontA      PROCEDURE(TGdiPlusGraphics pGraphics, *GpLOGFONTA pLogFont)
  CODE
  SELF.lastResult = GdipGetLogFontA(SELF.nativeFont, pGraphics.nativeGraphics, ADDRESS(pLogFont))
  GdipReportError(printf('TGdiPlusFont.GetLogFontA'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusFont.Clone            PROCEDURE(*TGdiPlusFont cloneFont)
  CODE
  cloneFont.DeleteFont()
  SELF.lastResult = GdipCloneFont(SELF.nativeFont, cloneFont.nativeFont)
  GdipReportError(printf('TGdiPlusFont.Clone'), SELF.lastResult)
  cloneFont.lastResult = SELF.lastResult
  RETURN SELF.lastResult

TGdiPlusFont.Clone            PROCEDURE()
cloneFont                       &TGdiPlusFont
  CODE
  cloneFont &= NEW TGdiPlusFont
  IF SELF.Clone(cloneFont) <> GpStatus:Ok
    DISPOSE(cloneFont)
    cloneFont &= NULL
  END
  RETURN cloneFont
  
TGdiPlusFont.DeleteFont       PROCEDURE()
  CODE
  IF SELF.nativeFont
    SELF.lastResult = GdipDeleteFont(SELF.nativeFont)
    SELF.nativeFont = 0
    GdipReportError(printf('TGdiPlusFont.DeleteFont'), SELF.lastResult)
  END
  RETURN SELF.lastResult

TGdiPlusFont.IsAvailable      PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativeFont <> 0)
  
TGdiPlusFont.GetFamily        PROCEDURE(*TGdiPlusFontFamily pFamily)
  CODE
  SELF.lastResult = GdipGetFamily(SELF.nativeFont, pFamily.nativeFamily)
  GdipReportError(printf('TGdiPlusFont.GetFamily'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusFont.GetStyle         PROCEDURE()
style                           UNSIGNED(0)
  CODE
  SELF.lastResult = GdipGetFontStyle(SELF.nativeFont, style)
  GdipReportError(printf('TGdiPlusFont.GetStyle'), SELF.lastResult)
  RETURN style
  
TGdiPlusFont.GetSize          PROCEDURE()
fSize                           SREAL(0)
  CODE
  SELF.lastResult = GdipGetFontSize(SELF.nativeFont, fSize)
  GdipReportError(printf('TGdiPlusFont.GetSize'), SELF.lastResult)
  RETURN fSize

TGdiPlusFont.GetUnit          PROCEDURE()
fUnit                           GpUnit
  CODE
  SELF.lastResult = GdipGetFontUnit(SELF.nativeFont, fUnit)
  GdipReportError(printf('TGdiPlusFont.GetUnit'), SELF.lastResult)
  RETURN fUnit

TGdiPlusFont.GetHeight        PROCEDURE(TGdiPlusGraphics pGraphics)
height                          SREAL
  CODE
  SELF.lastResult = GdipGetFontHeight(SELF.nativeFont, pGraphics.nativeGraphics, height)
  GdipReportError(printf('TGdiPlusFont.GetHeight'), SELF.lastResult)
  RETURN height
  
TGdiPlusFont.GetHeight        PROCEDURE(SREAL pDpi)
height                          SREAL
  CODE
  SELF.lastResult = GdipGetFontHeightGivenDPI(SELF.nativeFont, pDpi, height)
  GdipReportError(printf('TGdiPlusFont.GetHeight'), SELF.lastResult)
  RETURN height
!!!endregion

!!!region TGdiPlusFontFamily
TGdiPlusFontFamily.Destruct   PROCEDURE()
  CODE
  SELF.DeleteFontFamily()
  
TGdiPlusFontFamily.Initialized    PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativeFamily <> 0)

TGdiPlusFontFamily.CreateFontFamily   PROCEDURE(STRING pName)
  CODE
  RETURN SELF.FromName(pName)
  
TGdiPlusFontFamily.FromName   PROCEDURE(STRING pName, <TGdiPlusFontCollection pFontCollection>)
enc                             TStringEncoding
wstr                            STRING(64)
nativeFontCollection            LONG, AUTO
  CODE
  SELF.DeleteFontFamily()
  wstr = enc.ToCWStr(CLIP(pName))
  nativeFontCollection = CHOOSE(NOT OMITTED(pFontCollection), pFontCollection.nativeFontCollection, 0)
  SELF.lastResult = GdipCreateFontFamilyFromName(ADDRESS(wstr), nativeFontCollection, SELF.nativeFamily)
  GdipReportError(printf('TGdiPlusFontFamily.FromName'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusFontFamily.GenericSansSerif   PROCEDURE()
  CODE
  SELF.DeleteFontFamily()
  SELF.lastResult = GdipGetGenericFontFamilySansSerif(SELF.nativeFamily)
  GdipReportError(printf('TGdiPlusFontFamily.GenericSansSerif'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusFontFamily.GenericSerif   PROCEDURE()
  CODE
  SELF.DeleteFontFamily()
  SELF.lastResult = GdipGetGenericFontFamilySerif(SELF.nativeFamily)
  GdipReportError(printf('TGdiPlusFontFamily.GenericSerif'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusFontFamily.GenericMonospace   PROCEDURE()
  CODE
  SELF.DeleteFontFamily()
  SELF.lastResult = GdipGetGenericFontFamilyMonospace(SELF.nativeFamily)
  GdipReportError(printf('TGdiPlusFontFamily.GenericMonospace'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusFontFamily.DeleteFontFamily   PROCEDURE()
  CODE
  IF SELF.nativeFamily
    SELF.lastResult = GdipDeleteFontFamily(SELF.nativeFamily)
    SELF.nativeFamily = 0
    GdipReportError(printf('TGdiPlusFontFamily.DeleteFontFamily'), SELF.lastResult)
  END
  RETURN SELF.lastResult

TGdiPlusFontFamily.Clone      PROCEDURE(*TGdiPlusFontFamily pCloneFamily)
  CODE
  pCloneFamily.DeleteFontFamily()
  SELF.lastResult = GdipCloneFontFamily(SELF.nativeFamily, pCloneFamily.nativeFamily)
  GdipReportError(printf('TGdiPlusFontFamily.Clone'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusFontFamily.Clone      PROCEDURE()
cloneFamily                     &TGdiPlusFontFamily
  CODE
  cloneFamily &= NEW TGdiPlusFontFamily
  IF SELF.Clone(cloneFamily) <> GpStatus:Ok
    DISPOSE(cloneFamily)
    cloneFamily &= NULL
  END
  RETURN cloneFamily
  
TGdiPlusFontFamily.GetFamilyName  PROCEDURE(*STRING pName, *USHORT pLanguage)
enc                                 TStringEncoding
wstr                                STRING(64)
  CODE
  SELF.lastResult = GdipGetFamilyName(SELF.nativeFamily, ADDRESS(wstr), pLanguage)
  GdipReportError(printf('TGdiPlusFontFamily.GetFamilyName'), SELF.lastResult)
  IF SELF.lastResult = GpStatus:Ok
    pName = enc.FromUtf16(wstr)
  END
  RETURN SELF.lastResult

TGdiPlusFontFamily.GetFamilyName  PROCEDURE()
familyName                          STRING(32)
lang                                USHORT
  CODE
  SELF.GetFamilyName(familyName, lang)
  RETURN CLIP(familyName)
  
TGdiPlusFontFamily.IsStyleAvailable   PROCEDURE(UNSIGNED pStyle)
res                                     BOOL
  CODE
  SELF.lastResult = GdipIsStyleAvailable(SELF.nativeFamily, pStyle, res)
  GdipReportError(printf('TGdiPlusFontFamily.IsStyleAvailable'), SELF.lastResult)
  IF SELF.lastResult <> GpStatus:Ok
    res = FALSE
  END
  RETURN res

TGdiPlusFontFamily.GetEmHeight    PROCEDURE(UNSIGNED pStyle)
EmHeight                            USHORT
  CODE
  SELF.lastResult = GdipGetEmHeight(SELF.nativeFamily, pStyle, EmHeight)
  GdipReportError(printf('TGdiPlusFontFamily.GetEmHeight'), SELF.lastResult)
  RETURN EmHeight

TGdiPlusFontFamily.GetCellAscent  PROCEDURE(UNSIGNED pStyle)
CellAscent                          USHORT
  CODE
  SELF.lastResult = GdipGetCellAscent(SELF.nativeFamily, pStyle, CellAscent)
  GdipReportError(printf('TGdiPlusFontFamily.GetCellAscent'), SELF.lastResult)
  RETURN CellAscent

TGdiPlusFontFamily.GetCellDescent PROCEDURE(UNSIGNED pStyle)
CellDescent                         USHORT
  CODE
  SELF.lastResult = GdipGetCellDescent(SELF.nativeFamily, pStyle, CellDescent)
  GdipReportError(printf('TGdiPlusFontFamily.GetCellDescent'), SELF.lastResult)
  RETURN CellDescent

TGdiPlusFontFamily.GetLineSpacing PROCEDURE(UNSIGNED pStyle)
LineSpacing                         USHORT
  CODE
  SELF.lastResult = GdipGetLineSpacing(SELF.nativeFamily, pStyle, LineSpacing)
  GdipReportError(printf('TGdiPlusFontFamily.GetLineSpacing'), SELF.lastResult)
  RETURN LineSpacing
!!!endregion

!!!region TGdiPlusFontCollection
TGdiPlusFontCollection.Construct  PROCEDURE()
  CODE
  
TGdiPlusFontCollection.Destruct   PROCEDURE()
  CODE
  
TGdiPlusFontCollection.Initialized    PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativeFontCollection <> 0)

TGdiPlusFontCollection.GetFamilyCount PROCEDURE()
numFound                                UNSIGNED(0)
  CODE
  SELF.lastResult = GdipGetFontCollectionFamilyCount(SELF.nativeFontCollection, numFound)
  GdipReportError(printf('TGdiPlusFontCollection.GetFamilyCount'), SELF.lastResult)
  RETURN numFound

TGdiPlusFontCollection.GetFamily  PROCEDURE(UNSIGNED pCount, UNSIGNED pIndex, *TGdiPlusFontFamily pFamily)
nativeFamilyList                    LONG, DIM(pCount)
numFound                            UNSIGNED(0)
  CODE
  SELF.lastResult = GdipGetFontCollectionFamilyList(SELF.nativeFontCollection, pCount, ADDRESS(nativeFamilyList), numFound)
  GdipReportError(printf('TGdiPlusFontCollection.GetFamily'), SELF.lastResult)
  IF SELF.lastResult = GpStatus:Ok
    IF pIndex <= numFound
!      pFamily.nativeFamily = nativeFamilyList[pIndex]
      SELF.lastResult = GdipCloneFontFamily(nativeFamilyList[pIndex], pFamily.nativeFamily)
    ELSE
      SELF.lastResult = GpStatus:InvalidParameter
    END
  END
  RETURN SELF.lastResult
!!!endregion

!!!region TGdiPlusInstalledFontCollection
TGdiPlusInstalledFontCollection.Construct PROCEDURE()
  CODE
  SELF.lastResult = GdipNewInstalledFontCollection(SELF.nativeFontCollection)
  GdipReportError(printf('TGdiPlusInstalledFontCollection.Construct'), SELF.lastResult)

TGdiPlusInstalledFontCollection.Destruct  PROCEDURE()
  CODE

!!!endregion

!!!region TGdiPlusPrivateFontCollection
TGdiPlusPrivateFontCollection.Construct   PROCEDURE()
  CODE
  SELF.lastResult = GdipNewPrivateFontCollection(SELF.nativeFontCollection)
  GdipReportError(printf('TGdiPlusPrivateFontCollection.Construct'), SELF.lastResult)

TGdiPlusPrivateFontCollection.Destruct    PROCEDURE()
  CODE
  IF SELF.nativeFontCollection
    SELF.lastResult = GdipDeletePrivateFontCollection(SELF.nativeFontCollection)
    SELF.nativeFontCollection = 0
    GdipReportError(printf('TGdiPlusPrivateFontCollection.Destruct'), SELF.lastResult)
  END
  
TGdiPlusPrivateFontCollection.AddFontFile PROCEDURE(STRING pFileName)
enc                                         TStringEncoding
wstr                                        STRING(FILE:MaxFilePath*2+2)
  CODE
  wstr = enc.ToCWStr(LONGPATH(pFileName))
  SELF.lastResult = GdipPrivateAddFontFile(SELF.nativeFontCollection, ADDRESS(wstr))
  GdipReportError(printf('TGdiPlusPrivateFontCollection.AddFontFile'), SELF.lastResult)
  RETURN SELF.lastResult
!!!endregion
  
!!!region TGdiPlusGraphicsPath
TGdiPlusGraphicsPath.Destruct PROCEDURE()
  CODE
  SELF.DeletePath()
  
TGdiPlusGraphicsPath.Initialized  PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativePath <> 0)

TGdiPlusGraphicsPath.CreatePath   PROCEDURE(GpFillMode pFillMode=FillModeAlternate)
  CODE
  SELF.DeletePath()
  SELF.lastResult = GdipCreatePath(pFillMode, SELF.nativePath)
  GdipReportError(printf('TGdiPlusGraphicsPath.CreatePath'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.CreatePath   PROCEDURE(LONG pPoints, LONG pTypes, UNSIGNED pCount, GpFillMode pFillMode=FillModeAlternate)
  CODE
  SELF.DeletePath()
  SELF.lastResult = GdipCreatePath2(pPoints, pTypes, pCount, pFillMode, SELF.nativePath)
  GdipReportError(printf('TGdiPlusGraphicsPath.CreatePath'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.CreatePathI  PROCEDURE(LONG pPoints, LONG pTypes, UNSIGNED pCount, GpFillMode pFillMode=FillModeAlternate)
  CODE
  SELF.DeletePath()
  SELF.lastResult = GdipCreatePath2I(pPoints, pTypes, pCount, pFillMode, SELF.nativePath)
  GdipReportError(printf('TGdiPlusGraphicsPath.CreatePathI'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.DeletePath   PROCEDURE()
  CODE
  IF SELF.nativePath
    SELF.lastResult = GdipDeletePath(SELF.nativePath)
    SELF.nativePath = 0
    GdipReportError(printf('TGdiPlusGraphicsPath.DeletePath'), SELF.lastResult)
  END
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.Clone    PROCEDURE(*TGdiPlusGraphicsPath pClonePath)
  CODE
  pClonePath.DeletePath()
  SELF.lastResult = GdipClonePath(SELF.nativePath, pClonePath.nativePath)
  GdipReportError(printf('TGdiPlusGraphicsPath.Clone'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.ResetPath    PROCEDURE()
  CODE
  SELF.lastResult = GdipResetPath(SELF.nativePath)
  GdipReportError(printf('TGdiPlusGraphicsPath.ResetPath'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.GetFillMode  PROCEDURE()
fillMode                            GpFillMode(FillModeAlternate)
  CODE
  SELF.lastResult = GdipGetPathFillMode(SELF.nativePath, fillMode)
  GdipReportError(printf('TGdiPlusGraphicsPath.GetFillMode'), SELF.lastResult)
  RETURN fillMode

TGdiPlusGraphicsPath.SetFillMode  PROCEDURE(GpFillMode pFillMode)
  CODE
  SELF.lastResult = GdipSetPathFillMode(SELF.nativePath, pFillMode)
  GdipReportError(printf('TGdiPlusGraphicsPath.SetFillMode'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.GetPathData  PROCEDURE(*GpPathData pPathData)
  CODE
  SELF.lastResult = GdipSetPathFillMode(SELF.nativePath, pPathData)
  GdipReportError(printf('TGdiPlusGraphicsPath.GetPathData'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.StartFigure  PROCEDURE()
  CODE
  SELF.lastResult = GdipStartPathFigure(SELF.nativePath)
  GdipReportError(printf('TGdiPlusGraphicsPath.StartFigure'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.CloseFigure  PROCEDURE()
  CODE
  SELF.lastResult = GdipClosePathFigure(SELF.nativePath)
  GdipReportError(printf('TGdiPlusGraphicsPath.CloseFigure'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.CloseAllFigures  PROCEDURE()
  CODE
  SELF.lastResult = GdipClosePathFigures(SELF.nativePath)
  GdipReportError(printf('TGdiPlusGraphicsPath.CloseAllFigures'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.SetMarker    PROCEDURE()
  CODE
  SELF.lastResult = GdipSetPathMarker(SELF.nativePath)
  GdipReportError(printf('TGdiPlusGraphicsPath.SetMarker'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.ClearMarkers PROCEDURE()
  CODE
  SELF.lastResult = GdipClearPathMarkers(SELF.nativePath)
  GdipReportError(printf('TGdiPlusGraphicsPath.ClearMarkers'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.Reverse  PROCEDURE()
  CODE
  SELF.lastResult = GdipReversePath(SELF.nativePath)
  GdipReportError(printf('TGdiPlusGraphicsPath.Reverse'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.GetLastPoint PROCEDURE(*GpPointF pLastPoint)
  CODE
  SELF.lastResult = GdipGetPathLastPoint(SELF.nativePath, ADDRESS(pLastPoint))
  GdipReportError(printf('TGdiPlusGraphicsPath.GetLastPoint'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.AddLine  PROCEDURE(CONST *GpPointF pPoint1, CONST *GpPointF pPoint2)
  CODE
  RETURN SELF.AddLine(pPoint1.x, pPoint1.y, pPoint2.x, pPoint2.y)
  
TGdiPlusGraphicsPath.AddLine  PROCEDURE(SREAL pX1, SREAL pY1, SREAL pX2, SREAL pY2)
  CODE
  SELF.lastResult = GdipAddPathLine(SELF.nativePath, pX1, pY1, pX2, pY2)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddLine'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.AddLine  PROCEDURE(CONST *GpPoint pPoint1, CONST *GpPoint pPoint2)
  CODE
  RETURN SELF.AddLineI(pPoint1.x, pPoint1.y, pPoint2.x, pPoint2.y)
  
TGdiPlusGraphicsPath.AddLineI PROCEDURE(SIGNED pX1, SIGNED pY1, SIGNED pX2, SIGNED pY2)
  CODE
  SELF.lastResult = GdipAddPathLineI(SELF.nativePath, pX1, pY1, pX2, pY2)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddLineI'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddLines PROCEDURE(LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipAddPathLine2(SELF.nativePath, pPoints, pCount)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddLines'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddLinesI    PROCEDURE(LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipAddPathLine2I(SELF.nativePath, pPoints, pCount)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddLines'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.AddArc   PROCEDURE(CONST *GpRectF pRect, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  RETURN SELF.AddArc(pRect.x, pRect.y, pRect.width, pRect.height, pStartAngle, pSweepAngle)
  
TGdiPlusGraphicsPath.AddArc   PROCEDURE(SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  SELF.lastResult = GdipAddPathArc(SELF.nativePath, pX, pY, pWidth, pHeight, pStartAngle, pSweepAngle)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddArc'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.AddArc   PROCEDURE(CONST *GpRect pRect, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  RETURN SELF.AddArcI(pRect.x, pRect.y, pRect.width, pRect.height, pStartAngle, pSweepAngle)
  
TGdiPlusGraphicsPath.AddArcI  PROCEDURE(SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  SELF.lastResult = GdipAddPathArcI(SELF.nativePath, pX, pY, pWidth, pHeight, pStartAngle, pSweepAngle)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddArcI'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddBezier    PROCEDURE(CONST *GpPointF pPt1, CONST *GpPointF pPt2, CONST *GpPointF pPt3, CONST *GpPointF pPt4)
  CODE
  RETURN SELF.AddBezier(pPt1.x, pPt1.y, pPt2.x, pPt2.y, pPt3.x, pPt3.y, pPt4.x, pPt4.y)
  
TGdiPlusGraphicsPath.AddBezier    PROCEDURE(SREAL pX1, SREAL pY1, SREAL pX2, SREAL pY2, SREAL pX3, SREAL pY3, SREAL pX4, SREAL pY4)
  CODE
  SELF.lastResult = GdipAddPathBezier(SELF.nativePath, pX1, pY1, pX2, pY2, pX3, pY3, pX4, pY4)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddBezier'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.AddBezier    PROCEDURE(CONST *GpPoint pPt1, CONST *GpPoint pPt2, CONST *GpPoint pPt3, CONST *GpPoint pPt4)
  CODE
  RETURN SELF.AddBezierI(pPt1.x, pPt1.y, pPt2.x, pPt2.y, pPt3.x, pPt3.y, pPt4.x, pPt4.y)
  
TGdiPlusGraphicsPath.AddBezierI   PROCEDURE(SIGNED pX1, SIGNED pY1, SIGNED pX2, SIGNED pY2, SIGNED pX3, SIGNED pY3, SIGNED pX4, SIGNED pY4)
  CODE
  SELF.lastResult = GdipAddPathBezierI(SELF.nativePath, pX1, pY1, pX2, pY2, pX3, pY3, pX4, pY4)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddBezierI'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphicsPath.AddBeziers   PROCEDURE(LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipAddPathBeziers(SELF.nativePath, pPoints, pCount)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddBeziers'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddBeziersI  PROCEDURE(LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipAddPathBeziersI(SELF.nativePath, pPoints, pCount)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddBeziersI'), SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphicsPath.AddCurve PROCEDURE(LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipAddPathCurve(SELF.nativePath, pPoints, pCount)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddCurve'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddCurveI    PROCEDURE(LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipAddPathCurveI(SELF.nativePath, pPoints, pCount)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddCurveI'), SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphicsPath.AddCurve PROCEDURE(LONG pPoints, UNSIGNED pCount, SREAL pTension)
  CODE
  SELF.lastResult = GdipAddPathCurve2(SELF.nativePath, pPoints, pCount, pTension)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddCurve'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddCurveI    PROCEDURE(LONG pPoints, UNSIGNED pCount, SREAL pTension)
  CODE
  SELF.lastResult = GdipAddPathCurve2I(SELF.nativePath, pPoints, pCount, pTension)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddCurveI'), SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphicsPath.AddCurve PROCEDURE(LONG pPoints, UNSIGNED pCount, SIGNED pOffset, UNSIGNED pNumberOfSegments, SREAL pTension)
  CODE
  SELF.lastResult = GdipAddPathCurve3(SELF.nativePath, pPoints, pCount, pOffset, pNumberOfSegments, pTension)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddCurve'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddCurveI    PROCEDURE(LONG pPoints, UNSIGNED pCount, SIGNED pOffset, UNSIGNED pNumberOfSegments, SREAL pTension)
  CODE
  SELF.lastResult = GdipAddPathCurve3I(SELF.nativePath, pPoints, pCount, pOffset, pNumberOfSegments, pTension)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddCurveI'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.AddClosedCurve   PROCEDURE(LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipAddPathClosedCurve(SELF.nativePath, pPoints, pCount)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddClosedCurve'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddClosedCurveI  PROCEDURE(LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipAddPathClosedCurveI(SELF.nativePath, pPoints, pCount)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddClosedCurveI'), SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphicsPath.AddClosedCurve   PROCEDURE(LONG pPoints, UNSIGNED pCount, SREAL pTension)
  CODE
  SELF.lastResult = GdipAddPathClosedCurve2(SELF.nativePath, pPoints, pCount, pTension)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddClosedCurve'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddClosedCurveI  PROCEDURE(LONG pPoints, UNSIGNED pCount, SREAL pTension)
  CODE
  SELF.lastResult = GdipAddPathClosedCurve2I(SELF.nativePath, pPoints, pCount, pTension)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddClosedCurve'), SELF.lastResult)
  RETURN SELF.lastResult
        
TGdiPlusGraphicsPath.AddRectangle PROCEDURE(CONST *GpRectF pRect)
  CODE
  SELF.lastResult = GdipAddPathRectangle(SELF.nativePath, pRect.x, pRect.y, pRect.width, pRect.height)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddRectangle'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddRectangle PROCEDURE(CONST *GpRect pRect)
  CODE
  SELF.lastResult = GdipAddPathRectangleI(SELF.nativePath, pRect.x, pRect.y, pRect.width, pRect.height)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddRectangleI'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddRectangles    PROCEDURE(LONG pRects, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipAddPathRectangles(SELF.nativePath, pRects, pCount)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddRectangles'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddRectanglesI   PROCEDURE(LONG pRects, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipAddPathRectanglesI(SELF.nativePath, pRects, pCount)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddRectanglesI'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphicsPath.AddEllipse   PROCEDURE(CONST *GpRectF pRect)
  CODE
  RETURN SELF.AddEllipse(pRect.x, pRect.y, pRect.width, pRect.height)
  
TGdiPlusGraphicsPath.AddEllipse   PROCEDURE(SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight)
  CODE
  SELF.lastResult = GdipAddPathEllipse(SELF.nativePath, pX, pY, pWidth, pHeight)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddEllipse'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusGraphicsPath.AddEllipse   PROCEDURE(CONST *GpRect pRect)
  CODE
  RETURN SELF.AddEllipseI(pRect.x, pRect.y, pRect.width, pRect.height)
  
TGdiPlusGraphicsPath.AddEllipseI  PROCEDURE(SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight)
  CODE
  SELF.lastResult = GdipAddPathEllipseI(SELF.nativePath, pX, pY, pWidth, pHeight)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddEllipseI'), SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphicsPath.AddPie   PROCEDURE(CONST *GpRectF pRect, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  RETURN SELF.AddPie(pRect.x, pRect.y, pRect.width, pRect.height, pStartAngle, pSweepAngle)
  
TGdiPlusGraphicsPath.AddPie   PROCEDURE(SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  SELF.lastResult = GdipAddPathPie(SELF.nativePath, pX, pY, pWidth, pHeight, pStartAngle, pSweepAngle)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddPie'), SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusGraphicsPath.AddPie   PROCEDURE(CONST *GpRect pRect, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  RETURN SELF.AddPieI(pRect.x, pRect.y, pRect.width, pRect.height, pStartAngle, pSweepAngle)
  
TGdiPlusGraphicsPath.AddPieI  PROCEDURE(SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight, SREAL pStartAngle, SREAL pSweepAngle)
  CODE
  SELF.lastResult = GdipAddPathPieI(SELF.nativePath, pX, pY, pWidth, pHeight, pStartAngle, pSweepAngle)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddPieI'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddPolygon   PROCEDURE(LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipAddPathPolygon(SELF.nativePath, pPoints, pCount)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddPolygon'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddPolygonI  PROCEDURE(LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipAddPathPolygonI(SELF.nativePath, pPoints, pCount)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddPolygonI'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddPath  PROCEDURE(TGdiPlusGraphicsPath pAddingPath, BOOL pConnect)
  CODE
  SELF.lastResult = GdipAddPathPath(SELF.nativePath, pAddingPath.nativePath, pConnect)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddPath'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddString    PROCEDURE(STRING pStr, TGdiPlusFontFamily pFamily, UNSIGNED pStyle, SREAL pEmSize, CONST *GpPointF pOrigin)
rc                                  LIKE(GpRectF)
  CODE
  rc.x = pOrigin.x
  rc.y = pOrigin.y
  rc.width = 0
  rc.height = 0
  RETURN SELF.AddString(pStr, pFamily, pStyle, pEmSize, rc)
  
TGdiPlusGraphicsPath.AddString    PROCEDURE(STRING pStr, TGdiPlusFontFamily pFamily, UNSIGNED pStyle, SREAL pEmSize, CONST *GpRectF pLayoutRect)
enc                                 TStringEncoding
wstr                                STRING(LEN(pStr)*2+2)
  CODE
  wstr = enc.ToCWStr(pStr)
  SELF.lastResult = GdipAddPathString(SELF.nativePath, ADDRESS(wstr), LEN(wstr), pFamily.nativeFamily, pStyle, pEmSize, ADDRESS(pLayoutRect), 0)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddString'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.AddString    PROCEDURE(STRING pStr, TGdiPlusFontFamily pFamily, UNSIGNED pStyle, SREAL pEmSize, CONST *GpPoint pOrigin)
rc                                  LIKE(GpRect)
  CODE
  rc.x = pOrigin.x
  rc.y = pOrigin.y
  rc.width = 0
  rc.height = 0
  RETURN SELF.AddString(pStr, pFamily, pStyle, pEmSize, rc)
  
TGdiPlusGraphicsPath.AddString    PROCEDURE(STRING pStr, TGdiPlusFontFamily pFamily, UNSIGNED pStyle, SREAL pEmSize, CONST *GpRect pLayoutRect)
enc                                 TStringEncoding
wstr                                STRING(LEN(pStr)*2+2)
  CODE
  wstr = enc.ToCWStr(pStr)
  SELF.lastResult = GdipAddPathStringI(SELF.nativePath, ADDRESS(wstr), LEN(wstr), pFamily.nativeFamily, pStyle, pEmSize, ADDRESS(pLayoutRect), 0)
  GdipReportError(printf('TGdiPlusGraphicsPath.AddStringI'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.Transform    PROCEDURE(TGdiPlusMatrix pMatrix)
  CODE
  SELF.lastResult = GdipTransformPath(SELF.nativePath, pMatrix.nativeMatrix)
  GdipReportError(printf('TGdiPlusGraphicsPath.Transform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.GetBounds    PROCEDURE(*GpRectF pBounds)
  CODE
  SELF.lastResult = GdipGetPathWorldBounds(SELF.nativePath, ADDRESS(pBounds), 0, 0)
  GdipReportError(printf('TGdiPlusGraphicsPath.GetBounds'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.GetBounds    PROCEDURE(*GpRect pBounds)
  CODE
  SELF.lastResult = GdipGetPathWorldBoundsI(SELF.nativePath, ADDRESS(pBounds), 0, 0)
  GdipReportError(printf('TGdiPlusGraphicsPath.GetBoundsI'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.Flatten  PROCEDURE(SREAL pFlatness=FlatnessDefault)
  CODE
  SELF.lastResult = GdipFlattenPath(SELF.nativePath, 0, pFlatness)
  GdipReportError(printf('TGdiPlusGraphicsPath.Flatten'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.Widen    PROCEDURE(TGdiPlusPen pPen, SREAL pFlatness=FlatnessDefault)
  CODE
  SELF.lastResult = GdipWidenPath(SELF.nativePath, pPen.nativePen, 0, pFlatness)
  GdipReportError(printf('TGdiPlusGraphicsPath.Widen'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.Outline  PROCEDURE(SREAL pFlatness=FlatnessDefault)
  CODE
  SELF.lastResult = GdipWindingModeOutline(SELF.nativePath, 0, pFlatness)
  GdipReportError(printf('TGdiPlusGraphicsPath.Outline'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.Warp     PROCEDURE(LONG pDestPonts, UNSIGNED pCount, CONST *GpRectF pSrcRect, GpWarpMode pWarpMode=WarpModePerspective, SREAL pFlatness=FlatnessDefault)
  CODE
  SELF.lastResult = GdipWarpPath(SELF.nativePath, 0, ADDRESS(pDestPonts), pCount, pSrcRect.x, pSrcRect.y, pSrcRect.width, pSrcRect.height, | 
    pWarpMode, pFlatness)
  GdipReportError(printf('TGdiPlusGraphicsPath.Warp'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.GetPointCount    PROCEDURE()
count                                   UNSIGNED
  CODE
  SELF.lastResult = GdipGetPointCount(SELF.nativePath, count)
  GdipReportError(printf('TGdiPlusGraphicsPath.GetPointCount'), SELF.lastResult)
  RETURN count

TGdiPlusGraphicsPath.GetPathTypes PROCEDURE(*BYTE[] pTypes)
  CODE
  SELF.lastResult = GdipGetPathTypes(SELF.nativePath, ADDRESS(pTypes), MAXIMUM(pTypes, 1))
  GdipReportError(printf('TGdiPlusGraphicsPath.GetPathTypes'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.GetPathPoints    PROCEDURE(LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipGetPathPoints(SELF.nativePath, pPoints, pCount)
  GdipReportError(printf('TGdiPlusGraphicsPath.GetPathPoints'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusGraphicsPath.GetPathPointsI   PROCEDURE(LONG pPoints, UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipGetPathPointsI(SELF.nativePath, pPoints, pCount)
  GdipReportError(printf('TGdiPlusGraphicsPath.GetPathPointsI'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphicsPath.IsVisible    PROCEDURE(CONST *GpPointF pPoint, <TGdiPlusGraphics pGraphics>)
  CODE
  IF OMITTED(pGraphics)
    RETURN SELF.IsVisible(pPoint.x, pPoint.y)
  ELSE
    RETURN SELF.IsVisible(pPoint.x, pPoint.y, pGraphics)
  END
  
TGdiPlusGraphicsPath.IsVisible    PROCEDURE(SREAL pX, SREAL pY, <TGdiPlusGraphics pGraphics>)
nativeGraphics                      LONG(0)
res                                 BOOL(FALSE)
  CODE
  IF NOT OMITTED(pGraphics)
    nativeGraphics = pGraphics.nativeGraphics
  END
  
  SELF.lastResult = GdipIsVisiblePathPoint(SELF.nativePath, pX, pY, nativeGraphics, res)
  GdipReportError(printf('TGdiPlusGraphicsPath.IsVisible'), SELF.lastResult)
  RETURN res
  
TGdiPlusGraphicsPath.IsVisible    PROCEDURE(CONST *GpPoint pPoint, <TGdiPlusGraphics pGraphics>)
  CODE
  IF OMITTED(pGraphics)
    RETURN SELF.IsVisibleI(pPoint.x, pPoint.y)
  ELSE
    RETURN SELF.IsVisibleI(pPoint.x, pPoint.y, pGraphics)
  END
  
TGdiPlusGraphicsPath.IsVisibleI   PROCEDURE(SIGNED pX, SIGNED pY, <TGdiPlusGraphics pGraphics>)
nativeGraphics                      LONG(0)
res                                 BOOL(FALSE)
  CODE
  IF NOT OMITTED(pGraphics)
    nativeGraphics = pGraphics.nativeGraphics
  END
  SELF.lastResult = GdipIsVisiblePathPointI(SELF.nativePath, pX, pY, nativeGraphics, res)
  GdipReportError(printf('TGdiPlusGraphicsPath.IsVisibleI'), SELF.lastResult)
  RETURN res

TGdiPlusGraphicsPath.IsOutlineVisible PROCEDURE(CONST *GpPointF pPoint, TGdiPlusPen pPen, <TGdiPlusGraphics pGraphics>)
  CODE
  IF OMITTED(pGraphics)
    RETURN SELF.IsOutlineVisible(pPoint.x, pPoint.y, pPen)
  ELSE
    RETURN SELF.IsOutlineVisible(pPoint.x, pPoint.y, pPen, pGraphics)
  END
  
TGdiPlusGraphicsPath.IsOutlineVisible PROCEDURE(SREAL pX, SREAL pY, TGdiPlusPen pPen, <TGdiPlusGraphics pGraphics>)
nativeGraphics                          LONG(0)
res                                     BOOL(FALSE)
  CODE
  IF NOT OMITTED(pGraphics)
    nativeGraphics = pGraphics.nativeGraphics
  END
  
  SELF.lastResult = GdipIsOutlineVisiblePathPoint(SELF.nativePath, pX, pY, pPen.nativePen, nativeGraphics, res)
  GdipReportError(printf('TGdiPlusGraphicsPath.IsOutlineVisible'), SELF.lastResult)
  RETURN res
    
TGdiPlusGraphicsPath.IsOutlineVisible PROCEDURE(CONST *GpPoint pPoint, TGdiPlusPen pPen, <TGdiPlusGraphics pGraphics>)
  CODE
  IF OMITTED(pGraphics)
    RETURN SELF.IsOutlineVisibleI(pPoint.x, pPoint.y, pPen)
  ELSE
    RETURN SELF.IsOutlineVisibleI(pPoint.x, pPoint.y, pPen, pGraphics)
  END
  
TGdiPlusGraphicsPath.IsOutlineVisibleI    PROCEDURE(SIGNED pX, SIGNED pY, TGdiPlusPen pPen, <TGdiPlusGraphics pGraphics>)
nativeGraphics                              LONG(0)
res                                         BOOL(FALSE)
  CODE
  IF NOT OMITTED(pGraphics)
    nativeGraphics = pGraphics.nativeGraphics
  END
  SELF.lastResult = GdipIsOutlineVisiblePathPointI(SELF.nativePath, pX, pY, pPen.nativePen, nativeGraphics, res)
  GdipReportError(printf('TGdiPlusGraphicsPath.IsOutlineVisibleI'), SELF.lastResult)
  RETURN res
!!!endregion

!!!region TGdiPlusPen
TGdiPlusPen.Destruct          PROCEDURE()
  CODE
  SELF.DeletePen()
  
TGdiPlusPen.Initialized       PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativePen <> 0)

TGdiPlusPen.CreatePen         PROCEDURE(GpARGB pColor, SREAL pWidth=1.0, GpUnit pUnit=UnitWorld)
  CODE
  SELF.DeletePen()
  SELF.lastResult = GdipCreatePen1(pColor, pWidth, pUnit, SELF.nativePen)
  GdipReportError(printf('TGdiPlusPen.CreatePen'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusPen.CreatePen         PROCEDURE(TGdiPlusBrush pBrush, SREAL pWidth=1.0, GpUnit pUnit=UnitWorld)
  CODE
  SELF.DeletePen()
  SELF.lastResult = GdipCreatePen2(pBrush.nativeBrush, pWidth, pUnit, SELF.nativePen)
  GdipReportError(printf('TGdiPlusPen.CreatePen'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusPen.DeletePen         PROCEDURE()
  CODE
  IF SELF.nativePen
    SELF.lastResult = GdipDeletePen(SELF.nativePen)
    GdipReportError(printf('TGdiPlusPen.DeletePen'), SELF.lastResult)
    SELF.nativePen = 0
  END
  RETURN SELF.lastResult
  
TGdiPlusPen.Clone             PROCEDURE(*TGdiPlusPen pClonePen)
  CODE
  pClonePen.DeletePen()
  SELF.lastResult = GdipClonePen(SELF.nativePen, pClonePen.nativePen)
  GdipReportError(printf('TGdiPlusPen.Clone'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusPen.SetWidth          PROCEDURE(SREAL pWidth)
  CODE
  SELF.lastResult = GdipSetPenWidth(SELF.nativePen, pWidth)
  GdipReportError(printf('TGdiPlusPen.SetWidth'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusPen.GetWidth          PROCEDURE()
w                               SREAL
  CODE
  SELF.lastResult = GdipGetPenWidth(SELF.nativePen, w)
  GdipReportError(printf('TGdiPlusPen.GetWidth'), SELF.lastResult)
  RETURN w
  
TGdiPlusPen.SetLineCap        PROCEDURE(GpLineCap pStartCap, GpLineCap pEndCap, GpDashCap pDashCap)
  CODE
  SELF.lastResult = GdipSetPenLineCap197819(SELF.nativePen, pStartCap, pEndCap, pDashCap)
  GdipReportError(printf('TGdiPlusPen.SetLineCap'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusPen.SetStartCap       PROCEDURE(GpLineCap pStartCap)
  CODE
  SELF.lastResult = GdipSetPenStartCap(SELF.nativePen, pStartCap)
  GdipReportError(printf('TGdiPlusPen.SetStartCap'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPen.GetStartCap       PROCEDURE()
lineCap                             GpLineCap
  CODE
  SELF.lastResult = GdipGetPenStartCap(SELF.nativePen, lineCap)
  GdipReportError(printf('TGdiPlusPen.GetStartCap'), SELF.lastResult)
  RETURN lineCap

TGdiPlusPen.SetEndCap         PROCEDURE(GpLineCap pEndCap)
  CODE
  SELF.lastResult = GdipSetPenEndCap(SELF.nativePen, pEndCap)
  GdipReportError(printf('TGdiPlusPen.SetEndCap'), SELF.lastResult)
  RETURN SELF.lastResult
      
TGdiPlusPen.GetEndCap         PROCEDURE()
lineCap                         GpLineCap
  CODE
  SELF.lastResult = GdipGetPenEndCap(SELF.nativePen, lineCap)
  GdipReportError(printf('TGdiPlusPen.GetEndCap'), SELF.lastResult)
  RETURN lineCap

TGdiPlusPen.SetDashCap        PROCEDURE(GpDashCap pDashCap)
  CODE
  SELF.lastResult = GdipSetPenDashCap197819(SELF.nativePen, pDashCap)
  GdipReportError(printf('TGdiPlusPen.SetDashCap'), SELF.lastResult)
  RETURN SELF.lastResult
        
TGdiPlusPen.GetDashCap        PROCEDURE()
dashCap                         GpDashCap
  CODE
  SELF.lastResult = GdipGetPenDashCap197819(SELF.nativePen, dashCap)
  GdipReportError(printf('TGdiPlusPen.GetDashCap'), SELF.lastResult)
  RETURN dashCap

TGdiPlusPen.SetLineJoin       PROCEDURE(GpLineJoin pLineJoin)
  CODE
  SELF.lastResult = GdipSetPenLineJoin(SELF.nativePen, pLineJoin)
  GdipReportError(printf('TGdiPlusPen.SetLineJoin'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.GetLineJoin       PROCEDURE()
lineJoin                        GpLineJoin
  CODE
  SELF.lastResult = GdipGetPenLineJoin(SELF.nativePen, lineJoin)
  GdipReportError(printf('TGdiPlusPen.GetLineJoin'), SELF.lastResult)
  RETURN lineJoin

TGdiPlusPen.SetCustomStartCap PROCEDURE(TGdiPlusCustomLineCap pCustomCap)
  CODE
  SELF.lastResult = GdipSetPenCustomStartCap(SELF.nativePen, pCustomCap.nativeCap)
  GdipReportError(printf('TGdiPlusPen.SetCustomStartCap'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.GetCustomStartCap PROCEDURE(*TGdiPlusCustomLineCap pCustomCap)
  CODE
  SELF.lastResult = GdipGetPenCustomStartCap(SELF.nativePen, pCustomCap.nativeCap)
  GdipReportError(printf('TGdiPlusPen.GetCustomStartCap'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.SetCustomEndCap   PROCEDURE(TGdiPlusCustomLineCap pCustomCap)
  CODE
  SELF.lastResult = GdipSetPenCustomEndCap(SELF.nativePen, pCustomCap.nativeCap)
  GdipReportError(printf('TGdiPlusPen.SetCustomEndCap'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.GetCustomEndCap   PROCEDURE(*TGdiPlusCustomLineCap pCustomCap)
  CODE
  SELF.lastResult = GdipGetPenCustomEndCap(SELF.nativePen, pCustomCap.nativeCap)
  GdipReportError(printf('TGdiPlusPen.GetCustomEndCap'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.SetMiterLimit     PROCEDURE(SREAL pMiterLimit)
  CODE
  SELF.lastResult = GdipSetPenMiterLimit(SELF.nativePen, pMiterLimit)
  GdipReportError(printf('TGdiPlusPen.SetMiterLimit'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.GetMiterLimit     PROCEDURE()
miterLimit                      SREAL
  CODE
  SELF.lastResult = GdipSetPenMiterLimit(SELF.nativePen, miterLimit)
  GdipReportError(printf('TGdiPlusPen.SetMiterLimit'), SELF.lastResult)
  RETURN miterLimit

TGdiPlusPen.SetAlignment      PROCEDURE(GpPenAlignment pPenAlignment)
  CODE
  SELF.lastResult = GdipSetPenMode(SELF.nativePen, pPenAlignment)
  GdipReportError(printf('TGdiPlusPen.SetAlignment'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.GetAlignment      PROCEDURE()
penAlignment                    GpPenAlignment
  CODE
  SELF.lastResult = GdipGetPenMode(SELF.nativePen, penAlignment)
  GdipReportError(printf('TGdiPlusPen.GetAlignment'), SELF.lastResult)
  RETURN penAlignment

TGdiPlusPen.SetTransform      PROCEDURE(TGdiPlusMatrix pMatrix)
  CODE
  SELF.lastResult = GdipSetPenTransform(SELF.nativePen, pMatrix.nativeMatrix)
  GdipReportError(printf('TGdiPlusPen.SetTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.GetTransform      PROCEDURE(*TGdiPlusMatrix pMatrix)
  CODE
  SELF.lastResult = GdipGetPenTransform(SELF.nativePen, pMatrix.nativeMatrix)
  GdipReportError(printf('TGdiPlusPen.GetTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.ResetTransform    PROCEDURE()
  CODE
  SELF.lastResult = GdipResetPenTransform(SELF.nativePen)
  GdipReportError(printf('TGdiPlusPen.ResetTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.MultiplyTransform PROCEDURE(TGdiPlusMatrix pMatrix, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipMultiplyPenTransform(SELF.nativePen, pMatrix.nativeMatrix, pOrder)
  GdipReportError(printf('TGdiPlusPen.MultiplyTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.TranslateTransform    PROCEDURE(SREAL pDx, SREAL pDy, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipTranslatePenTransform(SELF.nativePen, pDx, pDy, pOrder)
  GdipReportError(printf('TGdiPlusPen.TranslateTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.ScaleTransform    PROCEDURE(SREAL pSx, SREAL pSy, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipScalePenTransform(SELF.nativePen, pSx, pSy, pOrder)
  GdipReportError(printf('TGdiPlusPen.ScaleTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.RotateTransform   PROCEDURE(SREAL pAngle, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipRotatePenTransform(SELF.nativePen, pAngle, pOrder)
  GdipReportError(printf('TGdiPlusPen.RotateTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.GetPenType        PROCEDURE()
penType                         GpPenType
  CODE
  SELF.lastResult = GdipGetPenFillType(SELF.nativePen, penType)
  GdipReportError(printf('TGdiPlusPen.GetPenType'), SELF.lastResult)
  RETURN penType

TGdiPlusPen.SetColor          PROCEDURE(GpARGB pColor)
  CODE
  SELF.lastResult = GdipSetPenColor(SELF.nativePen, pColor)
  GdipReportError(printf('TGdiPlusPen.SetColor'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.GetColor          PROCEDURE()
penColor                        GpARGB(COLOR:NONE)
  CODE
  IF SELF.GetPenType() = PenTypeSolidColor
    SELF.lastResult = GdipGetPenColor(SELF.nativePen, penColor)
  ELSE
    SELF.lastResult = GpStatus:WrongState
  END
  GdipReportError(printf('TGdiPlusPen.GetColor'), SELF.lastResult)
  RETURN penColor

TGdiPlusPen.SetBrush          PROCEDURE(TGdiPlusBrush pBrush)
  CODE
  SELF.lastResult = GdipSetPenBrushFill(SELF.nativePen, pBrush.nativeBrush)
  GdipReportError(printf('TGdiPlusPen.SetBrush'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.GetBrush          PROCEDURE(*TGdiPlusBrush pBrush)
penType                         GpPenType, AUTO
  CODE
!  penType = SELF.GetPenType()
!  CASE penType
!  OF PenTypeSolidColor
!  OF PenTypeHatchFill
!  OF PenTypeTextureFill
!  OF PenTypePathGradient
!  OF PenTypeLinearGradient
!  ELSE
!  END
!  
  SELF.lastResult = GdipGetPenBrushFill(SELF.nativePen, pBrush.nativeBrush)
  GdipReportError(printf('TGdiPlusPen.GetBrush'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.SetDashStyle      PROCEDURE(GpDashStyle pStyle)
  CODE
  SELF.lastResult = GdipSetPenDashStyle(SELF.nativePen, pStyle)
  GdipReportError(printf('TGdiPlusPen.SetDashStyle'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.GetDashStyle      PROCEDURE()
style                           GpDashStyle
  CODE
  SELF.lastResult = GdipGetPenDashStyle(SELF.nativePen, style)
  GdipReportError(printf('TGdiPlusPen.GetDashStyle'), SELF.lastResult)
  RETURN style

TGdiPlusPen.SetDashOffset     PROCEDURE(SREAL pOffset)
  CODE
  SELF.lastResult = GdipSetPenDashOffset(SELF.nativePen, pOffset)
  GdipReportError(printf('TGdiPlusPen.SetDashOffset'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.GetDashOffset     PROCEDURE()
offset                          SREAL
  CODE
  SELF.lastResult = GdipGetPenDashOffset(SELF.nativePen, offset)
  GdipReportError(printf('TGdiPlusPen.GetDashOffset'), SELF.lastResult)
  RETURN offset

TGdiPlusPen.GetDashPatternCount   PROCEDURE()
count                               UNSIGNED
  CODE
  SELF.lastResult = GdipGetPenDashCount(SELF.nativePen, count)
  GdipReportError(printf('TGdiPlusPen.GetDashPatternCount'), SELF.lastResult)
  RETURN count

TGdiPlusPen.SetDashPattern    PROCEDURE(*SREAL[] pArray)
  CODE
  SELF.lastResult = GdipSetPenDashArray(SELF.nativePen, ADDRESS(pArray), MAXIMUM(pArray, 1))
  GdipReportError(printf('TGdiPlusPen.SetDashPattern'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.GetDashPattern    PROCEDURE(*SREAL[] pArray)
  CODE
  SELF.lastResult = GdipGetPenDashArray(SELF.nativePen, ADDRESS(pArray), MAXIMUM(pArray, 1))
  GdipReportError(printf('TGdiPlusPen.GetDashPattern'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.GetCompoundArrayCount PROCEDURE()
count                               UNSIGNED
  CODE
  SELF.lastResult = GdipGetPenCompoundCount(SELF.nativePen, count)
  GdipReportError(printf('TGdiPlusPen.GetCompoundArrayCount'), SELF.lastResult)
  RETURN count

TGdiPlusPen.SetCompoundArray  PROCEDURE(*SREAL[] pArray)
  CODE
  SELF.lastResult = GdipSetPenCompoundArray(SELF.nativePen, ADDRESS(pArray), MAXIMUM(pArray, 1))
  GdipReportError(printf('TGdiPlusPen.SetCompoundArray'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusPen.GetCompoundArray  PROCEDURE(*SREAL[] pArray)
  CODE
  SELF.lastResult = GdipGetPenCompoundArray(SELF.nativePen, ADDRESS(pArray), MAXIMUM(pArray, 1))
  GdipReportError(printf('TGdiPlusPen.GetCompoundArray'), SELF.lastResult)
  RETURN SELF.lastResult
!!!endregion

!!!region TGdiPlusBrush
TGdiPlusBrush.Destruct        PROCEDURE()
  CODE
  SELF.DeleteBrush()
  
TGdiPlusBrush.Initialized     PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativeBrush <> 0)

TGdiPlusBrush.DeleteBrush     PROCEDURE()
  CODE
  IF SELF.nativeBrush
    SELF.lastResult = GdipDeleteBrush(SELF.nativeBrush)
    SELF.nativeBrush = 0
    GdipReportError(printf('TGdiPlusBrush.DeleteBrush'), SELF.lastResult)
  END
  RETURN SELF.lastResult

TGdiPlusBrush.Clone           PROCEDURE(*TGdiPlusBrush pCloneBrush)
  CODE
  pCloneBrush.DeleteBrush()
  SELF.lastResult = GdipCloneBrush(SELF.nativeBrush, pCloneBrush.nativeBrush)
  GdipReportError(printf('TGdiPlusBrush.Clone'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusBrush.GetType         PROCEDURE()
brushType                       GpBrushType
  CODE
  SELF.lastResult = GdipGetBrushType(SELF.nativeBrush, brushType)
  GdipReportError(printf('TGdiPlusBrush.GetType'), SELF.lastResult)
  RETURN brushType
!!!endregion

!!!region TGdiPlusSolidBrush
TGdiPlusSolidBrush.CreateSolidBrush   PROCEDURE(GpARGB pColor)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreateSolidFill(pColor, SELF.nativeBrush)
  GdipReportError(printf('TGdiPlusSolidBrush.CreateSolidBrush'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusSolidBrush.SetColor   PROCEDURE(GpARGB pColor)
  CODE
  SELF.lastResult = GdipSetSolidFillColor(SELF.nativeBrush, pColor)
  GdipReportError(printf('TGdiPlusSolidBrush.SetColor'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusSolidBrush.GetColor   PROCEDURE()
fillColor                       GpARGB
  CODE
  SELF.lastResult = GdipGetSolidFillColor(SELF.nativeBrush, fillColor)
  GdipReportError(printf('TGdiPlusSolidBrush.GetColor'), SELF.lastResult)
  RETURN fillColor
!!!endregion

!!!region TGdiPlusTextureBrush
TGdiPlusTextureBrush.CreateTextureBrush   PROCEDURE(TGdiPlusImage pImage, GpWrapMode pWrapMode=WrapModeTile)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreateTexture(pImage.nativeImage, pWrapMode, SELF.nativeBrush)
  GdipReportError(printf('TGdiPlusTextureBrush.CreateTextureBrush'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusTextureBrush.CreateTextureBrush   PROCEDURE(TGdiPlusImage pImage, GpWrapMode pWrapMode, CONST *GpRectF pDstRect)
  CODE
  RETURN SELF.CreateTextureBrush(pImage, pWrapMode, pDstRect.x, pDstRect.y, pDstRect.width, pDstRect.height)
  
TGdiPlusTextureBrush.CreateTextureBrush  PROCEDURE(TGdiPlusImage pImage, GpWrapMode pWrapMode, CONST *GpRect pDstRect)
  CODE
  RETURN SELF.CreateTextureBrushI(pImage, pWrapMode, pDstRect.x, pDstRect.y, pDstRect.width, pDstRect.height)

TGdiPlusTextureBrush.CreateTextureBrush   PROCEDURE(TGdiPlusImage pImage, GpWrapMode pWrapMode, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreateTexture2(pImage.nativeImage, pWrapMode, pX, pY, pWrapMode, pHeight, SELF.nativeBrush)
  GdipReportError(printf('TGdiPlusTextureBrush.CreateTextureBrush'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusTextureBrush.CreateTextureBrushI  PROCEDURE(TGdiPlusImage pImage, GpWrapMode pWrapMode, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreateTexture2I(pImage.nativeImage, pWrapMode, pX, pY, pWrapMode, pHeight, SELF.nativeBrush)
  GdipReportError(printf('TGdiPlusTextureBrush.CreateTextureBrushI'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusTextureBrush.CreateTextureBrush   PROCEDURE(TGdiPlusImage pImage, TGdiPlusImageAttributes pImageAttrs, CONST *GpRectF pDstRect)
  CODE
  RETURN SELF.CreateTextureBrush(pImage, pImageAttrs, pDstRect.x, pDstRect.y, pDstRect.width, pDstRect.height)

TGdiPlusTextureBrush.CreateTextureBrush   PROCEDURE(TGdiPlusImage pImage, TGdiPlusImageAttributes pImageAttrs, CONST *GpRect pDstRect)
  CODE
  RETURN SELF.CreateTextureBrushI(pImage, pImageAttrs, pDstRect.x, pDstRect.y, pDstRect.width, pDstRect.height)

TGdiPlusTextureBrush.CreateTextureBrush   PROCEDURE(TGdiPlusImage pImage, TGdiPlusImageAttributes pImageAttrs, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreateTextureIA(pImage.nativeImage, pImageAttrs.nativeImageAttr, pX, pY, pWidth, pHeight, SELF.nativeBrush)
  GdipReportError(printf('TGdiPlusTextureBrush.CreateTextureBrush'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusTextureBrush.CreateTextureBrushI  PROCEDURE(TGdiPlusImage pImage, TGdiPlusImageAttributes pImageAttrs, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreateTextureIAI(pImage.nativeImage, pImageAttrs.nativeImageAttr, pX, pY, pWidth, pHeight, SELF.nativeBrush)
  GdipReportError(printf('TGdiPlusTextureBrush.CreateTextureBrushI'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusTextureBrush.SetTransform PROCEDURE(TGdiPlusMatrix pMatrix)
  CODE
  SELF.lastResult = GdipSetTextureTransform(SELF.nativeBrush, pMatrix.nativeMatrix)
  GdipReportError(printf('TGdiPlusTextureBrush.SetTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusTextureBrush.GetTransform PROCEDURE(*TGdiPlusMatrix pMatrix)
  CODE
  SELF.lastResult = GdipGetTextureTransform(SELF.nativeBrush, pMatrix.nativeMatrix)
  GdipReportError(printf('TGdiPlusTextureBrush.GetTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusTextureBrush.ResetTransform   PROCEDURE()
  CODE
  SELF.lastResult = GdipResetTextureTransform(SELF.nativeBrush)
  GdipReportError(printf('TGdiPlusTextureBrush.ResetTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusTextureBrush.MultiplyTransform    PROCEDURE(TGdiPlusMatrix pMatrix, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipMultiplyTextureTransform(SELF.nativeBrush, pMatrix.nativeMatrix, pOrder)
  GdipReportError(printf('TGdiPlusTextureBrush.MultiplyTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusTextureBrush.TranslateTransform   PROCEDURE(SREAL pDx, SREAL pDy, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipTranslateTextureTransform(SELF.nativeBrush, pDx, pDy, pOrder)
  GdipReportError(printf('TGdiPlusTextureBrush.TranslateTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusTextureBrush.ScaleTransform   PROCEDURE(SREAL pSx, SREAL pSy, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipScaleTextureTransform(SELF.nativeBrush, pSx, pSy, pOrder)
  GdipReportError(printf('TGdiPlusTextureBrush.ScaleTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusTextureBrush.RotateTransform  PROCEDURE(SREAL pAngle, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipRotateTextureTransform(SELF.nativeBrush, pAngle, pOrder)
  GdipReportError(printf('TGdiPlusTextureBrush.RotateTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusTextureBrush.SetWrapMode  PROCEDURE(GpWrapMode pMode)
  CODE
  SELF.lastResult = GdipSetTextureWrapMode(SELF.nativeBrush, pMode)
  GdipReportError(printf('TGdiPlusTextureBrush.SetWrapMode'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusTextureBrush.GetWrapMode  PROCEDURE()
mode                                GpWrapMode
  CODE
  SELF.lastResult = GdipGetTextureWrapMode(SELF.nativeBrush, mode)
  GdipReportError(printf('TGdiPlusTextureBrush.GetWrapMode'), SELF.lastResult)
  RETURN mode

TGdiPlusTextureBrush.GetImage PROCEDURE(*TGdiPlusImage pImage)
  CODE
  SELF.lastResult = GdipSetTextureWrapMode(SELF.nativeBrush, pImage.nativeImage)
  GdipReportError(printf('TGdiPlusTextureBrush.GetImage'), SELF.lastResult)
  RETURN SELF.lastResult
!!!endregion
  
!!!region TGdiPlusLinearGradientBrush
TGdiPlusLinearGradientBrush.CreateLineBrush   PROCEDURE(CONST *GpPointF pPt1, CONST *GpPointF pPt2, GpARGB pColor1, GpARGB pColor2)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreateLineBrush(ADDRESS(pPt1), ADDRESS(pPt2), pColor1, pColor2, WrapModeTile, SELF.nativeBrush)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.CreateLineBrush'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.CreateLineBrush  PROCEDURE(CONST *GpPoint pPt1, CONST *GpPoint pPt2, GpARGB pColor1, GpARGB pColor2)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreateLineBrushI(ADDRESS(pPt1), ADDRESS(pPt2), pColor1, pColor2, WrapModeTile, SELF.nativeBrush)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.CreateLineBrushI'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.CreateLineBrush   PROCEDURE(CONST *GpRectF pRect, GpARGB pColor1, GpARGB pColor2, GpLinearGradientMode pMode)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreateLineBrushFromRect(ADDRESS(pRect), pColor1, pColor2, pMode, WrapModeTile, SELF.nativeBrush)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.CreateLineBrush'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.CreateLineBrush   PROCEDURE(CONST *GpRect pRect, GpARGB pColor1, GpARGB pColor2, GpLinearGradientMode pMode)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreateLineBrushFromRectI(ADDRESS(pRect), pColor1, pColor2, pMode, WrapModeTile, SELF.nativeBrush)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.CreateLineBrushI'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.CreateLineBrush   PROCEDURE(CONST *GpRectF pRect, GpARGB pColor1, GpARGB pColor2, SREAL pAngle, BOOL pIsAngleScalable)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreateLineBrushFromRectWithAngle(ADDRESS(pRect), pColor1, pColor2, pAngle, pIsAngleScalable, WrapModeTile, SELF.nativeBrush)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.CreateLineBrush'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.CreateLineBrush  PROCEDURE(CONST *GpRect pRect, GpARGB pColor1, GpARGB pColor2, SREAL pAngle, BOOL pIsAngleScalable)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreateLineBrushFromRectWithAngleI(ADDRESS(pRect), pColor1, pColor2, pAngle, pIsAngleScalable, WrapModeTile, SELF.nativeBrush)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.CreateLineBrushI'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.SetLinearColors   PROCEDURE(GpARGB pColor1, GpARGB pColor2)
  CODE
  SELF.lastResult = GdipSetLineColors(SELF.nativeBrush, pColor1, pColor2)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.SetLinearColors'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.GetLinearColors   PROCEDURE(*GpARGB pColor1, *GpARGB pColor2)
argb                                            GpARGB,DIM(2)
  CODE
  argb[1] = pColor1
  argb[2] = pColor2
  SELF.lastResult = GdipGetLineColors(SELF.nativeBrush, ADDRESS(argb))
  GdipReportError(printf('TGdiPlusLinearGradientBrush.GetLinearColors'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.GetRectangle  PROCEDURE(*GpRectF pRect)
  CODE
  SELF.lastResult = GdipGetLineRect(SELF.nativeBrush, ADDRESS(pRect))
  GdipReportError(printf('TGdiPlusLinearGradientBrush.GetRectangle'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.GetRectangle  PROCEDURE(*GpRect pRect)
  CODE
  SELF.lastResult = GdipGetLineRectI(SELF.nativeBrush, ADDRESS(pRect))
  GdipReportError(printf('TGdiPlusLinearGradientBrush.GetRectangle'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.SetGammaCorrection    PROCEDURE(BOOL pUseGammaCorrection)
  CODE
  SELF.lastResult = GdipSetLineGammaCorrection(SELF.nativeBrush, pUseGammaCorrection)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.SetGammaCorrection'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.GetGammaCorrection    PROCEDURE()
useGammaCorrection                                  BOOL
  CODE
  SELF.lastResult = GdipGetLineGammaCorrection(SELF.nativeBrush, useGammaCorrection)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.GetGammaCorrection'), SELF.lastResult)
  RETURN useGammaCorrection

TGdiPlusLinearGradientBrush.GetBlendCount PROCEDURE()
count                                       UNSIGNED
  CODE
  SELF.lastResult = GdipGetLineBlendCount(SELF.nativeBrush, count)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.GetBlendCount'), SELF.lastResult)
  RETURN count

TGdiPlusLinearGradientBrush.SetBlend  PROCEDURE(*SREAL[] pBlendFactors, *SREAL[] pBlendPositions)
  CODE
  SELF.lastResult = GdipSetLineBlend(SELF.nativeBrush, ADDRESS(pBlendFactors), ADDRESS(pBlendPositions), MAXIMUM(pBlendFactors, 1))
  GdipReportError(printf('TGdiPlusLinearGradientBrush.SetBlend'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.GetBlend  PROCEDURE(*SREAL[] pBlendFactors, *SREAL[] pBlendPositions)
  CODE
  SELF.lastResult = GdipGetLineBlend(SELF.nativeBrush, ADDRESS(pBlendFactors), ADDRESS(pBlendPositions), MAXIMUM(pBlendFactors, 1))
  GdipReportError(printf('TGdiPlusLinearGradientBrush.GetBlend'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.GetInterpolationColorCount    PROCEDURE()
count                                                       UNSIGNED
  CODE
  SELF.lastResult = GdipGetLinePresetBlendCount(SELF.nativeBrush, count)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.GetInterpolationColorCount'), SELF.lastResult)
  RETURN count

TGdiPlusLinearGradientBrush.SetInterpolationColors    PROCEDURE(*GpARGB[] pPresetColors, *SREAL[] pBlendPositions)
  CODE
  SELF.lastResult = GdipSetLinePresetBlend(SELF.nativeBrush, ADDRESS(pPresetColors), ADDRESS(pBlendPositions), MAXIMUM(pPresetColors, 1))
  GdipReportError(printf('TGdiPlusLinearGradientBrush.SetInterpolationColors'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.GetInterpolationColors    PROCEDURE(*GpARGB[] pPresetColors, *SREAL[] pBlendPositions)
  CODE
  SELF.lastResult = GdipGetLinePresetBlend(SELF.nativeBrush, ADDRESS(pPresetColors), ADDRESS(pBlendPositions), MAXIMUM(pPresetColors, 1))
  GdipReportError(printf('TGdiPlusLinearGradientBrush.GetInterpolationColors'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.SetBlendBellShape PROCEDURE(SREAL pFocus, SREAL pScale=1.0)
  CODE
  SELF.lastResult = GdipSetLineSigmaBlend(SELF.nativeBrush, pFocus, pScale)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.SetBlendBellShape'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.SetBlendTriangularShape   PROCEDURE(SREAL pFocus, SREAL pScale=1.0)
  CODE
  SELF.lastResult = GdipSetLineLinearBlend(SELF.nativeBrush, pFocus, pScale)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.SetBlendTriangularShape'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.SetTransform  PROCEDURE(TGdiPlusMatrix pMatrix)
  CODE
  SELF.lastResult = GdipSetLineTransform(SELF.nativeBrush, pMatrix.nativeMatrix)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.SetTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.GetTransform  PROCEDURE(*TGdiPlusMatrix pMatrix)
  CODE
  SELF.lastResult = GdipGetLineTransform(SELF.nativeBrush, pMatrix.nativeMatrix)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.GetTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.ResetTransform    PROCEDURE()
  CODE
  SELF.lastResult = GdipResetLineTransform(SELF.nativeBrush)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.ResetTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.MultiplyTransform PROCEDURE(TGdiPlusMatrix pMatrix, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipMultiplyLineTransform(SELF.nativeBrush, pMatrix.nativeMatrix, pOrder)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.MultiplyTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.TranslateTransform    PROCEDURE(SREAL pDx, SREAL pDy, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipTranslateLineTransform(SELF.nativeBrush, pDx, pDy, pOrder)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.TranslateTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.ScaleTransform    PROCEDURE(SREAL pSx, SREAL pSy, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipScaleLineTransform(SELF.nativeBrush, pSx, pSy, pOrder)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.ScaleTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.RotateTransform   PROCEDURE(SREAL pAngle, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipRotateLineTransform(SELF.nativeBrush, pAngle, pOrder)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.RotateTransform'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.SetWrapMode   PROCEDURE(GpWrapMode pMode)
  CODE
  SELF.lastResult = GdipSetLineWrapMode(SELF.nativeBrush, pMode)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.SetWrapMode'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusLinearGradientBrush.GetWrapMode   PROCEDURE()
mode                                        GpWrapMode
  CODE
  SELF.lastResult = GdipGetLineWrapMode(SELF.nativeBrush, mode)
  GdipReportError(printf('TGdiPlusLinearGradientBrush.GetWrapMode'), SELF.lastResult)
  RETURN mode
!!!endregion

!!!region TGdiPlusHatchBrush
TGdiPlusHatchBrush.CreateHatchBrush   PROCEDURE(GpHatchStyle pHatchStyle, GpARGB pForeColor, GpARGB pBackColor=COLOR:Black)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreateHatchBrush(pHatchStyle, pForeColor, pBackColor, SELF.nativeBrush)
  GdipReportError(printf('TGdiPlusHatchBrush.CreateHatchBrush'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusHatchBrush.GetHatchStyle  PROCEDURE()
style                               GpHatchStyle
  CODE
  SELF.lastResult = GdipGetHatchStyle(SELF.nativeBrush, style)
  GdipReportError(printf('TGdiPlusHatchBrush.GetHatchStyle'), SELF.lastResult)
  RETURN style
  
TGdiPlusHatchBrush.GetForegroundColor PROCEDURE()
argb                                    GpARGB
  CODE
  SELF.lastResult = GdipGetHatchForegroundColor(SELF.nativeBrush, argb)
  GdipReportError(printf('TGdiPlusHatchBrush.GetForegroundColor'), SELF.lastResult)
  RETURN argb
  
TGdiPlusHatchBrush.GetBackgroundColor PROCEDURE()
argb                                    GpARGB
  CODE
  SELF.lastResult = GdipGetHatchBackgroundColor(SELF.nativeBrush, argb)
  GdipReportError(printf('TGdiPlusHatchBrush.GetBackgroundColor'), SELF.lastResult)
  RETURN argb
!!!endregion
  
!!!region TGdiPlusRegion
TGdiPlusRegion.Destruct       PROCEDURE()
  CODE
  SELF.DeleteRegion()
  
TGdiPlusRegion.Initialized    PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativeRegion <> 0)

TGdiPlusRegion.CreateRegion   PROCEDURE()
  CODE
  SELF.DeleteRegion()
  SELF.lastResult = GdipCreateRegion(SELF.nativeRegion)
  GdipReportError(printf('TGdiPlusRegion.CreateRegion'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.FromRect       PROCEDURE(CONST *GpRectF pRect)
  CODE
  SELF.DeleteRegion()
  SELF.lastResult = GdipCreateRegionRect(ADDRESS(pRect), SELF.nativeRegion)
  GdipReportError(printf('TGdiPlusRegion.FromRect'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.FromRect       PROCEDURE(CONST *GpRect pRect)
  CODE
  SELF.DeleteRegion()
  SELF.lastResult = GdipCreateRegionRectI(ADDRESS(pRect), SELF.nativeRegion)
  GdipReportError(printf('TGdiPlusRegion.FromRect'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.FromGraphicsPath   PROCEDURE(TGdiPlusGraphicsPath pPath)
  CODE
  SELF.DeleteRegion()
  SELF.lastResult = GdipCreateRegionPath(pPath.nativePath, SELF.nativeRegion)
  GdipReportError(printf('TGdiPlusRegion.FromGraphicsPath'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.FromRegionData PROCEDURE(*BYTE[] pData)
  CODE
  SELF.DeleteRegion()
  SELF.lastResult = GdipCreateRegionRgnData(ADDRESS(pData), MAXIMUM(pData, 1), SELF.nativeRegion)
  GdipReportError(printf('TGdiPlusRegion.FromRegionData'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.FromHRGN       PROCEDURE(HRGN phRgn)
  CODE
  SELF.DeleteRegion()
  SELF.lastResult = GdipCreateRegionHrgn(phRgn, SELF.nativeRegion)
  GdipReportError(printf('TGdiPlusRegion.FromHRGN'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.DeleteRegion   PROCEDURE()
  CODE
  IF SELF.nativeRegion
    SELF.lastResult = GdipDeleteRegion(SELF.nativeRegion)
    GdipReportError(printf('TGdiPlusRegion.DeleteRegion'), SELF.lastResult)
    SELF.nativeRegion = 0
  END
  RETURN SELF.lastResult
  
TGdiPlusRegion.Clone          PROCEDURE(*TGdiPlusRegion cloneRegion)
  CODE
  cloneRegion.DeleteRegion()
  SELF.lastResult = GdipCloneRegion(SELF.nativeRegion, cloneRegion.nativeRegion)
  GdipReportError(printf('TGdiPlusRegion.Clone'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.MakeInfinite   PROCEDURE()
  CODE
  SELF.lastResult = GdipSetInfinite(SELF.nativeRegion)
  GdipReportError(printf('TGdiPlusRegion.MakeInfinite'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.MakeEmpty      PROCEDURE()
  CODE
  SELF.lastResult = GdipSetEmpty(SELF.nativeRegion)
  GdipReportError(printf('TGdiPlusRegion.MakeEmpty'), SELF.lastResult)
  RETURN SELF.lastResult
        
TGdiPlusRegion.CombineRegion  PROCEDURE(CONST *GpRectF pRect, GpCombineMode pMode)
  CODE
  SELF.lastResult = GdipCombineRegionRect(SELF.nativeRegion, ADDRESS(pRect), pMode)
  GdipReportError(printf('TGdiPlusRegion.CombineRegion'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.CombineRegion  PROCEDURE(CONST *GpRect pRect, GpCombineMode pMode)
  CODE
  SELF.lastResult = GdipCombineRegionRectI(SELF.nativeRegion, ADDRESS(pRect), pMode)
  GdipReportError(printf('TGdiPlusRegion.CombineRegion'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.CombineRegion  PROCEDURE(TGdiPlusGraphicsPath pPath, GpCombineMode pMode)
  CODE
  SELF.lastResult = GdipCombineRegionPath(SELF.nativeRegion, pPath.nativePath, pMode)
  GdipReportError(printf('TGdiPlusRegion.CombineRegion'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.CombineRegion  PROCEDURE(TGdiPlusRegion pRegion, GpCombineMode pMode)
  CODE
  SELF.lastResult = GdipCombineRegionRegion(SELF.nativeRegion, pRegion.nativeRegion, pMode)
  GdipReportError(printf('TGdiPlusRegion.CombineRegion'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusRegion.Intersect      PROCEDURE(CONST *GpRectF pRect)
  CODE
  RETURN SELF.CombineRegion(pRect, CombineModeIntersect)
  
TGdiPlusRegion.Intersect      PROCEDURE(CONST *GpRect pRect)
  CODE
  RETURN SELF.CombineRegion(pRect, CombineModeIntersect)
  
TGdiPlusRegion.Intersect      PROCEDURE(TGdiPlusGraphicsPath pPath)
  CODE
  RETURN SELF.CombineRegion(pPath, CombineModeIntersect)
  
TGdiPlusRegion.Intersect      PROCEDURE(TGdiPlusRegion pRegion)
  CODE
  RETURN SELF.CombineRegion(pRegion, CombineModeIntersect)

TGdiPlusRegion.Union          PROCEDURE(CONST *GpRectF pRect)
  CODE
  RETURN SELF.CombineRegion(pRect, CombineModeUnion)
  
TGdiPlusRegion.Union          PROCEDURE(CONST *GpRect pRect)
  CODE
  RETURN SELF.CombineRegion(pRect, CombineModeUnion)
  
TGdiPlusRegion.Union          PROCEDURE(TGdiPlusGraphicsPath pPath)
  CODE
  RETURN SELF.CombineRegion(pPath, CombineModeUnion)
  
TGdiPlusRegion.Union          PROCEDURE(TGdiPlusRegion pRegion)
  CODE
  RETURN SELF.CombineRegion(pRegion, CombineModeUnion)

TGdiPlusRegion.CombineXor     PROCEDURE(CONST *GpRectF pRect)
  CODE
  RETURN SELF.CombineRegion(pRect, CombineModeXor)
  
TGdiPlusRegion.CombineXor     PROCEDURE(CONST *GpRect pRect)
  CODE
  RETURN SELF.CombineRegion(pRect, CombineModeXor)
  
TGdiPlusRegion.CombineXor     PROCEDURE(TGdiPlusGraphicsPath pPath)
  CODE
  RETURN SELF.CombineRegion(pPath, CombineModeXor)
  
TGdiPlusRegion.CombineXor     PROCEDURE(TGdiPlusRegion pRegion)
  CODE
  RETURN SELF.CombineRegion(pRegion, CombineModeXor)

TGdiPlusRegion.Exclude        PROCEDURE(CONST *GpRectF pRect)
  CODE
  RETURN SELF.CombineRegion(pRect, CombineModeExclude)
  
TGdiPlusRegion.Exclude        PROCEDURE(CONST *GpRect pRect)
  CODE
  RETURN SELF.CombineRegion(pRect, CombineModeExclude)
  
TGdiPlusRegion.Exclude        PROCEDURE(TGdiPlusGraphicsPath pPath)
  CODE
  RETURN SELF.CombineRegion(pPath, CombineModeExclude)
  
TGdiPlusRegion.Exclude        PROCEDURE(TGdiPlusRegion pRegion)
  CODE
  RETURN SELF.CombineRegion(pRegion, CombineModeExclude)

TGdiPlusRegion.Complement     PROCEDURE(CONST *GpRectF pRect)
  CODE
  RETURN SELF.CombineRegion(pRect, CombineModeComplement)
  
TGdiPlusRegion.Complement     PROCEDURE(CONST *GpRect pRect)
  CODE
  RETURN SELF.CombineRegion(pRect, CombineModeComplement)
  
TGdiPlusRegion.Complement     PROCEDURE(TGdiPlusGraphicsPath pPath)
  CODE
  RETURN SELF.CombineRegion(pPath, CombineModeComplement)
  
TGdiPlusRegion.Complement     PROCEDURE(TGdiPlusRegion pRegion)
  CODE
  RETURN SELF.CombineRegion(pRegion, CombineModeComplement)
  
TGdiPlusRegion.Translate      PROCEDURE(SREAL pDx, SREAL pDy)
  CODE
  SELF.lastResult = GdipTranslateRegion(SELF.nativeRegion, pDx, pDy)
  GdipReportError(printf('TGdiPlusRegion.Translate'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.TranslateI     PROCEDURE(SIGNED pDx, SIGNED pDy)
  CODE
  SELF.lastResult = GdipTranslateRegionI(SELF.nativeRegion, pDx, pDy)
  GdipReportError(printf('TGdiPlusRegion.TranslateI'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.Transform      PROCEDURE(TGdiPlusMatrix pMatrix)
  CODE
  SELF.lastResult = GdipTransformRegion(SELF.nativeRegion, pMatrix.nativeMatrix)
  GdipReportError(printf('TGdiPlusRegion.Transform'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.GetBounds      PROCEDURE(TGdiPlusGraphicsPath pPath, *GpRectF pRect)
  CODE
  SELF.lastResult = GdipGetRegionBounds(SELF.nativeRegion, pPath.nativePath, ADDRESS(pRect))
  GdipReportError(printf('TGdiPlusRegion.GetBounds'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.GetBounds      PROCEDURE(TGdiPlusGraphicsPath pPath, *GpRect pRect)
  CODE
  SELF.lastResult = GdipGetRegionBoundsI(SELF.nativeRegion, pPath.nativePath, ADDRESS(pRect))
  GdipReportError(printf('TGdiPlusRegion.GetBounds'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.GetHRGN        PROCEDURE(TGdiPlusGraphicsPath pPath)
hrgn                            HRGN
  CODE
  SELF.lastResult = GdipGetRegionHRgn(SELF.nativeRegion, pPath.nativePath, hrgn)
  GdipReportError(printf('TGdiPlusRegion.GetHRGN'), SELF.lastResult)
  RETURN hrgn
  
TGdiPlusRegion.IsEmpty        PROCEDURE(TGdiPlusGraphicsPath pPath)
res                             BOOL
  CODE
  SELF.lastResult = GdipIsEmptyRegion(SELF.nativeRegion, pPath.nativePath, res)
  GdipReportError(printf('TGdiPlusRegion.IsEmpty'), SELF.lastResult)
  RETURN res
  
TGdiPlusRegion.IsInfinite     PROCEDURE(TGdiPlusGraphicsPath pPath)
res                             BOOL
  CODE
  SELF.lastResult = GdipIsInfiniteRegion(SELF.nativeRegion, pPath.nativePath, res)
  GdipReportError(printf('TGdiPlusRegion.IsInfinite'), SELF.lastResult)
  RETURN res
  
TGdiPlusRegion.Equals         PROCEDURE(TGdiPlusRegion pRegion, TGdiPlusGraphicsPath pPath)
res                             BOOL
  CODE
  SELF.lastResult = GdipIsEqualRegion(SELF.nativeRegion, pRegion.nativeRegion, pPath.nativePath, res)
  GdipReportError(printf('TGdiPlusRegion.Equals'), SELF.lastResult)
  RETURN res
  
TGdiPlusRegion.GetDataSize    PROCEDURE()
bufferSize                      UNSIGNED
  CODE
  SELF.lastResult = GdipGetRegionDataSize(SELF.nativeRegion, bufferSize)
  GdipReportError(printf('TGdiPlusRegion.GetDataSize'), SELF.lastResult)
  RETURN bufferSize
  
TGdiPlusRegion.GetData        PROCEDURE(*BYTE[] pData, <*UNSIGNED pSizeFilled>)
sizeFilled                      UNSIGNED
  CODE
  SELF.lastResult = GdipGetRegionData(SELF.nativeRegion, ADDRESS(pData), MAXIMUM(pData, 1), sizeFilled)
  GdipReportError(printf('TGdiPlusRegion.GetData'), SELF.lastResult)
  IF NOT OMITTED(pSizeFilled)
    pSizeFilled = sizeFilled
  END
  RETURN SELF.lastResult
  
TGdiPlusRegion.IsVisible      PROCEDURE(CONST *GpPointF pPoint, TGdiPlusGraphicsPath pPath)
res                             BOOL
  CODE
  SELF.lastResult = GdipIsVisibleRegionPoint(SELF.nativeRegion, pPoint.x, pPoint.y, pPath.nativePath, res)
  GdipReportError(printf('TGdiPlusRegion.IsVisible'), SELF.lastResult)
  RETURN res
  
TGdiPlusRegion.IsVisible      PROCEDURE(CONST *GpPoint pPoint, TGdiPlusGraphicsPath pPath)
res                             BOOL
  CODE
  SELF.lastResult = GdipIsVisibleRegionPointI(SELF.nativeRegion, pPoint.x, pPoint.y, pPath.nativePath, res)
  GdipReportError(printf('TGdiPlusRegion.IsVisible'), SELF.lastResult)
  RETURN res
  
TGdiPlusRegion.IsVisible      PROCEDURE(CONST *GpRectF pRect, TGdiPlusGraphicsPath pPath)
res                             BOOL
  CODE
  SELF.lastResult = GdipIsVisibleRegionRect(SELF.nativeRegion, pRect.x, pRect.y, pRect.width, pRect.height, pPath.nativePath, res)
  GdipReportError(printf('TGdiPlusRegion.IsVisible'), SELF.lastResult)
  RETURN res
  
TGdiPlusRegion.IsVisible      PROCEDURE(CONST *GpRect pRect, TGdiPlusGraphicsPath pPath)
res                             BOOL
  CODE
  SELF.lastResult = GdipIsVisibleRegionRectI(SELF.nativeRegion, pRect.x, pRect.y, pRect.width, pRect.height, pPath.nativePath, res)
  GdipReportError(printf('TGdiPlusRegion.IsVisible'), SELF.lastResult)
  RETURN res
  
TGdiPlusRegion.GetRegionScansCount    PROCEDURE(TGdiPlusMatrix pMatrix)
count                                   UNSIGNED
  CODE
  SELF.lastResult = GdipGetRegionScansCount(SELF.nativeRegion, count, pMatrix.nativeMatrix)
  GdipReportError(printf('TGdiPlusRegion.GetRegionScansCount'), SELF.lastResult)
  RETURN count
  
TGdiPlusRegion.GetRegionScans PROCEDURE(TGdiPlusMatrix pMatrix, LONG pRect, *UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipGetRegionScans(SELF.nativeRegion, pRect, pCount, pMatrix.nativeMatrix)
  GdipReportError(printf('TGdiPlusRegion.GetRegionScans'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusRegion.GetRegionScansI    PROCEDURE(TGdiPlusMatrix pMatrix, LONG pRect, *UNSIGNED pCount)
  CODE
  SELF.lastResult = GdipGetRegionScansI(SELF.nativeRegion, pRect, pCount, pMatrix.nativeMatrix)
  GdipReportError(printf('TGdiPlusRegion.GetRegionScansI'), SELF.lastResult)
  RETURN SELF.lastResult
!!!endregion

!!!region TGdiPlusCachedBitmap
TGdiPlusCachedBitmap.Destruct PROCEDURE()
  CODE
  SELF.DeleteCachedBitmap()
  
TGdiPlusCachedBitmap.Initialized  PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativeCachedBitmap <> 0)

TGdiPlusCachedBitmap.CrewateCachedBitmap  PROCEDURE(TGdiPlusBitmap pBitmap, TGdiPlusGraphics pGraphics)
  CODE
  SELF.DeleteCachedBitmap()
  SELF.lastResult = GdipCreateCachedBitmap(pBitmap.nativeImage, pGraphics.nativeGraphics, SELF.nativeCachedBitmap)
  GdipReportError(printf('TGdiPlusCachedBitmap.CrewateCachedBitmap'), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusCachedBitmap.DeleteCachedBitmap   PROCEDURE()
  CODE
  IF SELF.nativeCachedBitmap
    SELF.lastResult = GdipDeleteCachedBitmap(SELF.nativeCachedBitmap)
    GdipReportError(printf('TGdiPlusCachedBitmap.DeleteCachedBitmap'), SELF.lastResult)
    SELF.nativeCachedBitmap = 0
  END
  RETURN SELF.lastResult
!!!endregion
  
!!!region TGdiPlusStringFormat
TGdiPlusStringFormat.Destruct PROCEDURE()
  CODE
  SELF.DeleteStringFormat()
  
TGdiPlusStringFormat.Initialized  PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativeFormat <> 0)

TGdiPlusStringFormat.CreateStringFormat   PROCEDURE(GpStringFormatFlags pFormatFlags=0, USHORT pLanguage=0)
  CODE
  SELF.DeleteStringFormat()
  SELF.lastResult = GdipCreateStringFormat(pFormatFlags, pLanguage, SELF.nativeFormat)
  GdipReportError(printf('TGdiPlusStringFormat.CreateStringFormat'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusStringFormat.CreateGenericDefault PROCEDURE()
  CODE
  SELF.DeleteStringFormat()
  SELF.lastResult = GdipStringFormatGetGenericDefault(SELF.nativeFormat)
  GdipReportError(printf('TGdiPlusStringFormat.CreateGenericDefault'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusStringFormat.CreateGenericTypographic PROCEDURE()
  CODE
  SELF.DeleteStringFormat()
  SELF.lastResult = GdipStringFormatGetGenericTypographic(SELF.nativeFormat)
  GdipReportError(printf('TGdiPlusStringFormat.CreateGenericTypographic'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusStringFormat.Clone    PROCEDURE(TGdiPlusStringFormat pClonedStringFormat)
  CODE
  pClonedStringFormat.DeleteStringFormat()
  SELF.lastResult = GdipCloneStringFormat(SELF.nativeFormat, pClonedStringFormat.nativeFormat)
  GdipReportError(printf('TGdiPlusStringFormat.Clone'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusStringFormat.DeleteStringFormat   PROCEDURE()
  CODE
  IF SELF.nativeFormat
    SELF.lastResult = GdipDeleteStringFormat(SELF.nativeFormat)
    GdipReportError(printf('TGdiPlusStringFormat.DeleteStringFormat'), SELF.lastResult)
    SELF.nativeFormat = 0
  END
  RETURN SELF.lastResult
  
TGdiPlusStringFormat.SetFormatFlags   PROCEDURE(GpStringFormatFlags pFlags)
  CODE
  SELF.lastResult = GdipSetStringFormatFlags(SELF.nativeFormat, pFlags)
  GdipReportError(printf('TGdiPlusStringFormat.SetFormatFlags'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusStringFormat.GetFormatFlags   PROCEDURE()
flags                                   GpStringFormatFlags, AUTO
  CODE
  SELF.lastResult = GdipSetStringFormatFlags(SELF.nativeFormat, flags)
  GdipReportError(printf('TGdiPlusStringFormat.GetFormatFlags'), SELF.lastResult)
  RETURN flags
  
TGdiPlusStringFormat.SetAlignment PROCEDURE(GpStringAlignment pAlign)
  CODE
  SELF.lastResult = GdipSetStringFormatAlign(SELF.nativeFormat, pAlign)
  GdipReportError(printf('TGdiPlusStringFormat.SetAlignment'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusStringFormat.GetAlignment PROCEDURE()
align                               GpStringAlignment, AUTO
  CODE
  SELF.lastResult = GdipGetStringFormatAlign(SELF.nativeFormat, align)
  GdipReportError(printf('TGdiPlusStringFormat.GetAlignment'), SELF.lastResult)
  RETURN align
  
TGdiPlusStringFormat.SetLineAlignment PROCEDURE(GpStringAlignment pAlign)
  CODE
  SELF.lastResult = GdipSetStringFormatLineAlign(SELF.nativeFormat, pAlign)
  GdipReportError(printf('TGdiPlusStringFormat.SetLineAlignment'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusStringFormat.GetLineAlignment PROCEDURE()
align                                   GpStringAlignment, AUTO
  CODE
  SELF.lastResult = GdipGetStringFormatLineAlign(SELF.nativeFormat, align)
  GdipReportError(printf('TGdiPlusStringFormat.GetLineAlignment'), SELF.lastResult)
  RETURN align
  
TGdiPlusStringFormat.SetHotkeyPrefix  PROCEDURE(GpHotkeyPrefix pHotkeyPrefix)
  CODE
  SELF.lastResult = GdipSetStringFormatHotkeyPrefix(SELF.nativeFormat, pHotkeyPrefix)
  GdipReportError(printf('TGdiPlusStringFormat.SetHotkeyPrefix'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusStringFormat.GetHotkeyPrefix  PROCEDURE()
prefix                                  GpHotkeyPrefix, AUTO
  CODE
  SELF.lastResult = GdipGetStringFormatHotkeyPrefix(SELF.nativeFormat, prefix)
  GdipReportError(printf('TGdiPlusStringFormat.GetHotkeyPrefix'), SELF.lastResult)
  RETURN prefix
  
TGdiPlusStringFormat.SetTabStops  PROCEDURE(SREAL pFirstTabOffset, *SREAL[] pTabStops)
  CODE
  SELF.lastResult = GdipSetStringFormatTabStops(SELF.nativeFormat, pFirstTabOffset, MAXIMUM(pTabStops, 1), ADDRESS(pTabStops))
  GdipReportError(printf('TGdiPlusStringFormat.SetTabStops'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusStringFormat.GetTabStopCount  PROCEDURE()
count                                   UNSIGNED, AUTO
  CODE
  SELF.lastResult = GdipGetStringFormatTabStopCount(SELF.nativeFormat, count)
  GdipReportError(printf('TGdiPlusStringFormat.GetTabStopCount'), SELF.lastResult)
  RETURN count
  
TGdiPlusStringFormat.GetTabStops  PROCEDURE(UNSIGNED pCount, *SREAL pFirstTabOffset, *SREAL[] pTabStops)
  CODE
  SELF.lastResult = GdipGetStringFormatTabStops(SELF.nativeFormat, pCount, pFirstTabOffset, ADDRESS(pTabStops))
  GdipReportError(printf('TGdiPlusStringFormat.GetTabStops'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusStringFormat.SetDigitSubstitution PROCEDURE(USHORT pLanguage, GpStringDigitSubstitute pSubstitute)
  CODE
  SELF.lastResult = GdipSetStringFormatDigitSubstitution(SELF.nativeFormat, pLanguage, pSubstitute)
  GdipReportError(printf('TGdiPlusStringFormat.SetDigitSubstitution'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusStringFormat.GetDigitSubstitutionLanguage PROCEDURE()
lang                                                USHORT, AUTO
method                                              GpStringDigitSubstitute, AUTO
  CODE
  SELF.lastResult = GdipGetStringFormatDigitSubstitution(SELF.nativeFormat, lang, method)
  GdipReportError(printf('TGdiPlusStringFormat.GetDigitSubstitutionLanguage'), SELF.lastResult)
  RETURN lang
  
TGdiPlusStringFormat.GetDigitSubstitutionMethod   PROCEDURE()
lang                                                USHORT, AUTO
method                                              GpStringDigitSubstitute, AUTO
  CODE
  SELF.lastResult = GdipGetStringFormatDigitSubstitution(SELF.nativeFormat, lang, method)
  GdipReportError(printf('TGdiPlusStringFormat.GetDigitSubstitutionMethod'), SELF.lastResult)
  RETURN method
  
TGdiPlusStringFormat.SetTrimming  PROCEDURE(GpStringTrimming pTrimming)
  CODE
  SELF.lastResult = GdipSetStringFormatTrimming(SELF.nativeFormat, pTrimming)
  GdipReportError(printf('TGdiPlusStringFormat.SetTrimming'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusStringFormat.GetTrimming  PROCEDURE()
trimming                            GpStringTrimming, AUTO
  CODE
  SELF.lastResult = GdipGetStringFormatTrimming(SELF.nativeFormat, trimming)
  GdipReportError(printf('TGdiPlusStringFormat.GetTrimming'), SELF.lastResult)
  RETURN trimming
  
TGdiPlusStringFormat.SetMeasurableCharacterRanges PROCEDURE(UNSIGNED pRangeCount, LONG pRanges)
  CODE
  SELF.lastResult = GdipSetStringFormatMeasurableCharacterRanges(SELF.nativeFormat, pRangeCount, pRanges)
  GdipReportError(printf('TGdiPlusStringFormat.SetMeasurableCharacterRanges'), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusStringFormat.GetMeasurableCharacterRangeCount PROCEDURE()
count                                                   UNSIGNED, AUTO
  CODE
  SELF.lastResult = GdipGetStringFormatMeasurableCharacterRangeCount(SELF.nativeFormat, count)
  GdipReportError(printf('TGdiPlusStringFormat.GetMeasurableCharacterRangeCount'), SELF.lastResult)
  RETURN count
!!!endregion

!!!region TGdiPlusImageAttributes
TGdiPlusImageAttributes.Destruct  PROCEDURE()
  CODE
  SELF.DeleteImageAttributes()
  
TGdiPlusImageAttributes.Initialized   PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativeImageAttr <> 0)

TGdiPlusImageAttributes.CreateImageAttributes PROCEDURE()
  CODE
  SELF.DeleteImageAttributes()
  SELF.lastResult = GdipCreateImageAttributes(SELF.nativeImageAttr)
  GdipReportError(printf('TGdiPlusImageAttributes.CreateImageAttributes'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.DeleteImageAttributes PROCEDURE()
  CODE
  IF SELF.nativeImageAttr
    SELF.lastResult = GdipDisposeImageAttributes(SELF.nativeImageAttr)
    SELF.nativeImageAttr = 0
    GdipReportError(printf('TGdiPlusImageAttributes.DeleteImageAttributes'), SELF.lastResult)
  END
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.Clone PROCEDURE(*TGdiPlusImageAttributes pCloneImageAttr)
  CODE
  pCloneImageAttr.DeleteImageAttributes()
  SELF.lastResult = GdipCloneImageAttributes(SELF.nativeImageAttr, pCloneImageAttr.nativeImageAttr)
  GdipReportError(printf('TGdiPlusImageAttributes.Clone'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.SetToIdentity PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesToIdentity(SELF.nativeImageAttr, pType)
  GdipReportError(printf('TGdiPlusImageAttributes.SetToIdentity'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.Reset PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipResetImageAttributes(SELF.nativeImageAttr, pType)
  GdipReportError(printf('TGdiPlusImageAttributes.Reset'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.SetColorMatrix    PROCEDURE(typColorMatrix pColorMatrix, GpColorMatrixFlags pMode=ColorMatrixFlagsDefault, GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesColorMatrix(SELF.nativeImageAttr, pType, TRUE, ADDRESS(pColorMatrix), 0, pMode)
  GdipReportError(printf('TGdiPlusImageAttributes.SetColorMatrix'), SELF.lastResult)
  RETURN SELF.lastResult
!TGdiPlusImageAttributes.SetColorMatrix    PROCEDURE(typColorMatrix pColorMatrix, GpColorMatrixFlags pMode=ColorMatrixFlagsDefault, GpColorAdjustType pType=ColorAdjustTypeDefault)
!  CODE
!  SELF.lastResult = GdipSetImageAttributesColorMatrix(SELF.nativeImageAttr, pType, TRUE, ADDRESS(pColorMatrix.m), 0, pMode)
!  GdipReportError(printf('TGdiPlusImageAttributes.SetColorMatrix'), SELF.lastResult)
!  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.ClearColorMatrix  PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesColorMatrix(SELF.nativeImageAttr, pType, FALSE, 0, 0, ColorMatrixFlagsDefault)
  GdipReportError(printf('TGdiPlusImageAttributes.ClearColorMatrix'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.SetColorMatrices  PROCEDURE(typColorMatrix pColorMatrix, typColorMatrix pGrayMatrix, GpColorMatrixFlags pMode=ColorMatrixFlagsDefault, GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesColorMatrix(SELF.nativeImageAttr, pType, TRUE, ADDRESS(pColorMatrix), ADDRESS(pGrayMatrix), pMode)
  GdipReportError(printf('TGdiPlusImageAttributes.SetColorMatrices'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.ClearColorMatrices    PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesColorMatrix(SELF.nativeImageAttr, pType, FALSE, 0, 0, ColorMatrixFlagsDefault)
  GdipReportError(printf('TGdiPlusImageAttributes.ClearColorMatrices'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.SetThreshold  PROCEDURE(SREAL pThreshold, GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesThreshold(SELF.nativeImageAttr, pType, TRUE, pThreshold)
  GdipReportError(printf('TGdiPlusImageAttributes.SetThreshold'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.ClearThreshold    PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesThreshold(SELF.nativeImageAttr, pType, FALSE, 0.0)
  GdipReportError(printf('TGdiPlusImageAttributes.ClearThreshold'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.SetGamma  PROCEDURE(SREAL pGamma, GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesGamma(SELF.nativeImageAttr, pType, TRUE, pGamma)
  GdipReportError(printf('TGdiPlusImageAttributes.SetGamma'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.ClearGamma    PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesGamma(SELF.nativeImageAttr, pType, FALSE, 0.0)
  GdipReportError(printf('TGdiPlusImageAttributes.ClearGamma'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.SetNoOp   PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesNoOp(SELF.nativeImageAttr, pType, TRUE)
  GdipReportError(printf('TGdiPlusImageAttributes.SetNoOp'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.ClearNoOp PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesNoOp(SELF.nativeImageAttr, pType, FALSE)
  GdipReportError(printf('TGdiPlusImageAttributes.ClearNoOp'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.SetColorKey   PROCEDURE(GpARGB pColorLow, GpARGB pColorHigh, GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesColorKeys(SELF.nativeImageAttr, pType, TRUE, pColorLow, pColorHigh)
  GdipReportError(printf('TGdiPlusImageAttributes.SetColorKey'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.ClearColorKey PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesColorKeys(SELF.nativeImageAttr, pType, FALSE, 0, 0)
  GdipReportError(printf('TGdiPlusImageAttributes.ClearColorKey'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.SetOutputChannel  PROCEDURE(GpColorChannelFlags pChannelFlags, GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesOutputChannel(SELF.nativeImageAttr, pType, TRUE, pChannelFlags)
  GdipReportError(printf('TGdiPlusImageAttributes.SetOutputChannel'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.ClearOutputChannel    PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesOutputChannel(SELF.nativeImageAttr, pType, FALSE, ColorChannelFlagsLast)
  GdipReportError(printf('TGdiPlusImageAttributes.ClearOutputChannel'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.SetOutputChannelColorProfile  PROCEDURE(STRING pColorProfileFilename, GpColorAdjustType pType=ColorAdjustTypeDefault)
enc                                                     TStringEncoding
wstr                                                    STRING(FILE:MaxFilePath*2+2)
  CODE
  wstr = enc.ToCWStr(CLIP(pColorProfileFilename))
  SELF.lastResult = GdipSetImageAttributesOutputChannelColorProfile(SELF.nativeImageAttr, pType, TRUE, ADDRESS(wstr))
  GdipReportError(printf('TGdiPlusImageAttributes.SetOutputChannelColorProfile'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.ClearOutputChannelColorProfile    PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesOutputChannelColorProfile(SELF.nativeImageAttr, pType, FALSE, 0)
  GdipReportError(printf('TGdiPlusImageAttributes.ClearOutputChannelColorProfile'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.SetRemapTable PROCEDURE(UNSIGNED pMapSize, LONG pMap, GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesRemapTable(SELF.nativeImageAttr, pType, TRUE, pMapSize, pMap)
  GdipReportError(printf('TGdiPlusImageAttributes.SetRemapTable'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.ClearRemapTable   PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault)
  CODE
  SELF.lastResult = GdipSetImageAttributesRemapTable(SELF.nativeImageAttr, pType, FALSE, 0, 0)
  GdipReportError(printf('TGdiPlusImageAttributes.ClearRemapTable'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.SetBrushRemapTable    PROCEDURE(UNSIGNED pMapSize, LONG pMap)
  CODE
  RETURN SELF.SetRemapTable(pMapSize, pMap, ColorAdjustTypeBrush)
    
TGdiPlusImageAttributes.ClearBrushRemapTable  PROCEDURE()
  CODE
  RETURN SELF.ClearRemapTable(ColorAdjustTypeBrush)
    
TGdiPlusImageAttributes.SetWrapMode   PROCEDURE(GpWrapMode pWrap, GpARGB pColor=0FF000000h, BOOL pClamp=FALSE)
  CODE
  SELF.lastResult = GdipSetImageAttributesWrapMode(SELF.nativeImageAttr, pWrap, pColor, pClamp)
  GdipReportError(printf('TGdiPlusImageAttributes.SetWrapMode'), SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusImageAttributes.GetAdjustedPalette    PROCEDURE(*typColorPalette pColorPalette, GpColorAdjustType pType)
  CODE
  SELF.lastResult = GdipGetImageAttributesAdjustedPalette(SELF.nativeImageAttr, ADDRESS(pColorPalette), pType)
  GdipReportError(printf('TGdiPlusImageAttributes.GetAdjustedPalette'), SELF.lastResult)
  RETURN SELF.lastResult
!!!endregion

!!!region TGdiPlusGraphisPathIterator
TGdiPlusGraphisPathIterator.Destruct  PROCEDURE()
  CODE
  SELF.DeletePathIter()
  
TGdiPlusGraphisPathIterator.Initialized   PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativeIterator <> 0)

TGdiPlusGraphisPathIterator.CreatePathIter    PROCEDURE(TGdiPlusGraphicsPath pPath)
  CODE
  SELF.DeletePathIter()
  SELF.lastResult = GdipCreatePathIter(SELF.nativeIterator, pPath.nativePath)
  GdipReportError('TGdiPlusGraphisPathIterator.CreatePathIter', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphisPathIterator.DeletePathIter                  PROCEDURE()
  CODE
  IF SELF.nativeIterator
    SELF.lastResult = GdipDeletePathIter(SELF.nativeIterator)
    SELF.nativeIterator = 0
    GdipReportError('TGdiPlusGraphisPathIterator.DeletePathIter', SELF.lastResult)
  END
  RETURN SELF.lastResult
  
TGdiPlusGraphisPathIterator.NextSubpath   PROCEDURE(*UNSIGNED pStartIndex, *UNSIGNED pEndIndex, *BOOL pIsClosed)
resultCount                                 UNSIGNED
  CODE
  SELF.lastResult = GdipPathIterNextSubpath(SELF.nativeIterator, resultCount, pStartIndex, pEndIndex, pIsClosed)
  GdipReportError('TGdiPlusGraphisPathIterator.NextSubpath', SELF.lastResult)
  RETURN resultCount
  
TGdiPlusGraphisPathIterator.NextSubpath   PROCEDURE(*TGdiPlusGraphicsPath pPath, *BOOL pIsClosed)
resultCount                                 UNSIGNED
  CODE
  SELF.lastResult = GdipPathIterNextSubpathPath(SELF.nativeIterator, resultCount, pPath.nativePath, pIsClosed)
  GdipReportError('TGdiPlusGraphisPathIterator.NextSubpath', SELF.lastResult)
  RETURN resultCount
  
TGdiPlusGraphisPathIterator.NextPathType  PROCEDURE(*BYTE pPathType, *UNSIGNED pStartIndex, *UNSIGNED pEndIndex)
resultCount                                 UNSIGNED
  CODE
  SELF.lastResult = GdipPathIterNextPathType(SELF.nativeIterator, resultCount, pPathType, pStartIndex, pEndIndex)
  GdipReportError('TGdiPlusGraphisPathIterator.NextPathType', SELF.lastResult)
  RETURN resultCount
  
TGdiPlusGraphisPathIterator.NextMarker    PROCEDURE(*UNSIGNED pStartIndex, *UNSIGNED pEndIndex)
resultCount                                 UNSIGNED
  CODE
  SELF.lastResult = GdipPathIterNextMarker(SELF.nativeIterator, resultCount, pStartIndex, pEndIndex)
  GdipReportError('TGdiPlusGraphisPathIterator.NextMarker', SELF.lastResult)
  RETURN resultCount
  
TGdiPlusGraphisPathIterator.NextMarker    PROCEDURE(*TGdiPlusGraphicsPath pPath)
resultCount                                 UNSIGNED
  CODE
  SELF.lastResult = GdipPathIterNextMarkerPath(SELF.nativeIterator, resultCount, pPath.nativePath)
  GdipReportError('TGdiPlusGraphisPathIterator.NextMarker', SELF.lastResult)
  RETURN resultCount
  
TGdiPlusGraphisPathIterator.GetCount  PROCEDURE()
resultCount                             UNSIGNED
  CODE
  SELF.lastResult = GdipPathIterGetCount(SELF.nativeIterator, resultCount)
  GdipReportError('TGdiPlusGraphisPathIterator.GetCount', SELF.lastResult)
  RETURN resultCount
  
TGdiPlusGraphisPathIterator.GetSubpathCount   PROCEDURE()
resultCount                                     UNSIGNED
  CODE
  SELF.lastResult = GdipPathIterGetSubpathCount(SELF.nativeIterator, resultCount)
  GdipReportError('TGdiPlusGraphisPathIterator.GetSubpathCount', SELF.lastResult)
  RETURN resultCount
  
TGdiPlusGraphisPathIterator.HasCurve  PROCEDURE()
bHasCurve                               BOOL
  CODE
  SELF.lastResult = GdipPathIterHasCurve(SELF.nativeIterator, bHasCurve)
  GdipReportError('TGdiPlusGraphisPathIterator.HasCurve', SELF.lastResult)
  RETURN bHasCurve
  
TGdiPlusGraphisPathIterator.Rewind    PROCEDURE()
  CODE
  SELF.lastResult = GdipPathIterRewind(SELF.nativeIterator)
  GdipReportError('TGdiPlusGraphisPathIterator.Rewind', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusGraphisPathIterator.Enumerate PROCEDURE(LONG pPoints, *BYTE[] pTypes)
resultCount                             UNSIGNED
  CODE
  SELF.lastResult = GdipPathIterEnumerate(SELF.nativeIterator, resultCount, pPoints, ADDRESS(pTypes), MAXIMUM(pTypes, 1))
  GdipReportError('TGdiPlusGraphisPathIterator.Enumerate', SELF.lastResult)
  RETURN resultCount
  
TGdiPlusGraphisPathIterator.CopyData  PROCEDURE(UNSIGNED pStartIndex, UNSIGNED pEndIndex, LONG pPoints, *BYTE[] pTypes)
resultCount                             UNSIGNED
  CODE
  SELF.lastResult = GdipPathIterCopyData(SELF.nativeIterator, resultCount, pPoints, ADDRESS(pTypes), pStartIndex, pEndIndex)
  GdipReportError('TGdiPlusGraphisPathIterator.CopyData', SELF.lastResult)
  RETURN resultCount
!!!endregion
  
!!!region TGdiPlusPathGradientBrush
TGdiPlusPathGradientBrush.CreatePathGradient  PROCEDURE(LONG pPoints, UNSIGNED pCount, GpWrapMode pWrapMode=WrapModeClamp)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreatePathGradient(pPoints, pCount, pWrapMode, SELF.nativeBrush)
  GdipReportError('TGdiPlusPathGradientBrush.CreatePathGradient', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusPathGradientBrush.CreatePathGradientI PROCEDURE(LONG pPoints, UNSIGNED pCount, GpWrapMode pWrapMode=WrapModeClamp)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreatePathGradientI(pPoints, pCount, pWrapMode, SELF.nativeBrush)
  GdipReportError('TGdiPlusPathGradientBrush.CreatePathGradientI', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.CreatePathGradient  PROCEDURE(TGdiPlusGraphicsPath pPath)
  CODE
  SELF.DeleteBrush()
  SELF.lastResult = GdipCreatePathGradientFromPath(pPath.nativePath, SELF.nativeBrush)
  GdipReportError('TGdiPlusPathGradientBrush.CreatePathGradient', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.GetCenterColor  PROCEDURE()
clr                                         GpARGB
  CODE
  SELF.lastResult = GdipGetPathGradientCenterColor(SELF.nativeBrush, clr)
  GdipReportError('TGdiPlusPathGradientBrush.GetCenterColor', SELF.lastResult)
  RETURN clr
    
TGdiPlusPathGradientBrush.SetCenterColor  PROCEDURE(GpARGB pColor)
  CODE
  SELF.lastResult = GdipSetPathGradientCenterColor(SELF.nativeBrush, pColor)
  GdipReportError('TGdiPlusPathGradientBrush.SetCenterColor', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.GetPointCount   PROCEDURE()
count                                       UNSIGNED
  CODE
  SELF.lastResult = GdipGetPathGradientPointCount(SELF.nativeBrush, count)
  GdipReportError('TGdiPlusPathGradientBrush.GetPointCount', SELF.lastResult)
  RETURN count
    
TGdiPlusPathGradientBrush.GetSurroundColorCount   PROCEDURE()
count                                               UNSIGNED
  CODE
  SELF.lastResult = GdipGetPathGradientSurroundColorCount(SELF.nativeBrush, count)
  GdipReportError('TGdiPlusPathGradientBrush.GetSurroundColorCount', SELF.lastResult)
  RETURN count
    
TGdiPlusPathGradientBrush.GetSurroundColors   PROCEDURE(*GpARGB[] pColors, *UNSIGNED pCount)
  CODE
  pCount = MAXIMUM(pColors, 1)
  SELF.lastResult = GdipGetPathGradientSurroundColorsWithCount(SELF.nativeBrush, ADDRESS(pColors), pCount)
  GdipReportError('TGdiPlusPathGradientBrush.GetSurroundColors', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.SetSurroundColors   PROCEDURE(*GpARGB[] pColors, UNSIGNED pCount)
  CODE
  RETURN SELF.SetSurroundColors(pColors, pCount)

TGdiPlusPathGradientBrush.SetSurroundColors   PROCEDURE(*GpARGB[] pColors, *UNSIGNED pCount)
  CODE
  pCount = MAXIMUM(pColors, 1)
  SELF.lastResult = GdipSetPathGradientSurroundColorsWithCount(SELF.nativeBrush, ADDRESS(pColors), pCount)
  GdipReportError('TGdiPlusPathGradientBrush.SetSurroundColors', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.SetSurroundColor    PROCEDURE(GpARGB pColor)
clrs                                            GpARGB, DIM(1)
  CODE
  clrs[1] = pColor
  RETURN SELF.SetSurroundColors(clrs, 1)

TGdiPlusPathGradientBrush.GetGraphicsPath PROCEDURE(*TGdiPlusGraphicsPath pPath)
  CODE
  SELF.lastResult = GdipGetPathGradientPath(SELF.nativeBrush, pPath.nativePath)
  GdipReportError('TGdiPlusPathGradientBrush.GetGraphicsPath', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.SetGraphicsPath PROCEDURE(TGdiPlusGraphicsPath pPath)
  CODE
  SELF.lastResult = GdipSetPathGradientPath(SELF.nativeBrush, pPath.nativePath)
  GdipReportError('TGdiPlusPathGradientBrush.SetGraphicsPath', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.GetCenterPoint  PROCEDURE(*GpPointF pPoint)
  CODE
  SELF.lastResult = GdipGetPathGradientCenterPoint(SELF.nativeBrush, ADDRESS(pPoint))
  GdipReportError('TGdiPlusPathGradientBrush.GetCenterPoint', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.GetCenterPoint  PROCEDURE(*GpPoint pPoint)
  CODE
  SELF.lastResult = GdipGetPathGradientCenterPointI(SELF.nativeBrush, ADDRESS(pPoint))
  GdipReportError('TGdiPlusPathGradientBrush.GetCenterPoint', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.SetCenterPoint  PROCEDURE(CONST *GpPointF pPoint)
  CODE
  SELF.lastResult = GdipSetPathGradientCenterPoint(SELF.nativeBrush, ADDRESS(pPoint))
  GdipReportError('TGdiPlusPathGradientBrush.SetCenterPoint', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.SetCenterPoint  PROCEDURE(CONST *GpPoint pPoint)
  CODE
  SELF.lastResult = GdipSetPathGradientCenterPointI(SELF.nativeBrush, ADDRESS(pPoint))
  GdipReportError('TGdiPlusPathGradientBrush.SetCenterPoint', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.GetRectangle    PROCEDURE(*GpRectF pRect)
  CODE
  SELF.lastResult = GdipGetPathGradientRect(SELF.nativeBrush, ADDRESS(pRect))
  GdipReportError('TGdiPlusPathGradientBrush.GetRectangle', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.GetRectangle    PROCEDURE(*GpRect pRect)
  CODE
  SELF.lastResult = GdipGetPathGradientRectI(SELF.nativeBrush, ADDRESS(pRect))
  GdipReportError('TGdiPlusPathGradientBrush.GetRectangle', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.SetGammaCorrection  PROCEDURE(BOOL pUseGammaCorrection)
  CODE
  SELF.lastResult = GdipSetPathGradientGammaCorrection(SELF.nativeBrush, pUseGammaCorrection)
  GdipReportError('TGdiPlusPathGradientBrush.SetGammaCorrection', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.GetGammaCorrection  PROCEDURE()
bUseGammaCorrection                             BOOL
  CODE
  SELF.lastResult = GdipGetPathGradientGammaCorrection(SELF.nativeBrush, bUseGammaCorrection)
  GdipReportError('TGdiPlusPathGradientBrush.GetGammaCorrection', SELF.lastResult)
  RETURN bUseGammaCorrection
    
TGdiPlusPathGradientBrush.GetBlendCount   PROCEDURE()
count                                       UNSIGNED
  CODE
  SELF.lastResult = GdipGetPathGradientBlendCount(SELF.nativeBrush, count)
  GdipReportError('TGdiPlusPathGradientBrush.GetBlendCount', SELF.lastResult)
  RETURN count
    
TGdiPlusPathGradientBrush.GetBlend    PROCEDURE(*SREAL[] pBlendFactors, *SREAL[] pBlendPositions)
  CODE
  SELF.lastResult = GdipGetPathGradientBlend(SELF.nativeBrush, ADDRESS(pBlendFactors), ADDRESS(pBlendPositions), MAXIMUM(pBlendPositions, 1))
  GdipReportError('TGdiPlusPathGradientBrush.GetBlend', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.SetBlend    PROCEDURE(*SREAL[] pBlendFactors, *SREAL[] pBlendPositions)
  CODE
  SELF.lastResult = GdipSetPathGradientBlend(SELF.nativeBrush, ADDRESS(pBlendFactors), ADDRESS(pBlendPositions), MAXIMUM(pBlendPositions, 1))
  GdipReportError('TGdiPlusPathGradientBrush.SetBlend', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.GetInterpolationColorCount  PROCEDURE()
count                                                   UNSIGNED
  CODE
  SELF.lastResult = GdipGetPathGradientPresetBlendCount(SELF.nativeBrush, count)
  GdipReportError('TGdiPlusPathGradientBrush.GetInterpolationColorCount', SELF.lastResult)
  RETURN count
    
TGdiPlusPathGradientBrush.SetInterpolationColors  PROCEDURE(*GpARGB[] pPresetColors, *SREAL[] pBlendPositions)
  CODE
  SELF.lastResult = GdipSetPathGradientPresetBlend(SELF.nativeBrush, ADDRESS(pPresetColors), ADDRESS(pBlendPositions), MAXIMUM(pBlendPositions, 1))
  GdipReportError('TGdiPlusPathGradientBrush.SetInterpolationColors', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.GetInterpolationColors  PROCEDURE(*GpARGB[] pPresetColors, *SREAL[] pBlendPositions)
  CODE
  SELF.lastResult = GdipGetPathGradientPresetBlend(SELF.nativeBrush, ADDRESS(pPresetColors), ADDRESS(pBlendPositions), MAXIMUM(pBlendPositions, 1))
  GdipReportError('TGdiPlusPathGradientBrush.GetInterpolationColors', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.SetBlendBellShape   PROCEDURE(SREAL pFocus, SREAL pScale=1.0)
  CODE
  SELF.lastResult = GdipSetPathGradientSigmaBlend(SELF.nativeBrush, pFocus, pScale)
  GdipReportError('TGdiPlusPathGradientBrush.SetBlendBellShape', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.SetBlendTriangularShape PROCEDURE(SREAL pFocus, SREAL pScale=1.0)
  CODE
  SELF.lastResult = GdipSetPathGradientLinearBlend(SELF.nativeBrush, pFocus, pScale)
  GdipReportError('TGdiPlusPathGradientBrush.SetBlendTriangularShape', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.GetTransform    PROCEDURE(*TGdiplusMatrix pMatrix)
  CODE
  SELF.lastResult = GdipGetPathGradientTransform(SELF.nativeBrush, pMatrix.nativeMatrix)
  GdipReportError('TGdiPlusPathGradientBrush.GetTransform', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.SetTransform    PROCEDURE(TGdiplusMatrix pMatrix)
  CODE
  SELF.lastResult = GdipSetPathGradientTransform(SELF.nativeBrush, pMatrix.nativeMatrix)
  GdipReportError('TGdiPlusPathGradientBrush.SetTransform', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.ResetTransform  PROCEDURE()
  CODE
  SELF.lastResult = GdipResetPathGradientTransform(SELF.nativeBrush)
  GdipReportError('TGdiPlusPathGradientBrush.ResetTransform', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.MultiplyTransform   PROCEDURE(TGdiplusMatrix pMatrix, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipMultiplyPathGradientTransform(SELF.nativeBrush, pMatrix.nativeMatrix, pOrder)
  GdipReportError('TGdiPlusPathGradientBrush.MultiplyTransform', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.TranslateTransform  PROCEDURE(SREAL pDx, SREAL pDy, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipTranslatePathGradientTransform(SELF.nativeBrush, pDx, pDy, pOrder)
  GdipReportError('TGdiPlusPathGradientBrush.TranslateTransform', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.ScaleTransform  PROCEDURE(SREAL pSx, SREAL pSy, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipScalePathGradientTransform(SELF.nativeBrush, pSx, pSy, pOrder)
  GdipReportError('TGdiPlusPathGradientBrush.ScaleTransform', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.RotateTransform PROCEDURE(SREAL pAngle, GpMatrixOrder pOrder=MatrixOrderPrepend)
  CODE
  SELF.lastResult = GdipRotatePathGradientTransform(SELF.nativeBrush, pAngle, pOrder)
  GdipReportError('TGdiPlusPathGradientBrush.RotateTransform', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.GetFocusScales  PROCEDURE(*SREAL pXScale, *SREAL pYScale)
  CODE
  SELF.lastResult = GdipGetPathGradientFocusScales(SELF.nativeBrush, pXScale, pYScale)
  GdipReportError('TGdiPlusPathGradientBrush.GetFocusScales', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.SetFocusScales  PROCEDURE(SREAL pXScale, SREAL pYScale)
  CODE
  SELF.lastResult = GdipSetPathGradientFocusScales(SELF.nativeBrush, pXScale, pYScale)
  GdipReportError('TGdiPlusPathGradientBrush.SetFocusScales', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusPathGradientBrush.GetWrapMode PROCEDURE()
mode                                    GpWrapMode
  CODE
  SELF.lastResult = GdipGetPathGradientWrapMode(SELF.nativeBrush, mode)
  GdipReportError('TGdiPlusPathGradientBrush.GetWrapMode', SELF.lastResult)
  RETURN mode
    
TGdiPlusPathGradientBrush.SetWrapMode PROCEDURE(GpWrapMode pWrapMode)
  CODE
  SELF.lastResult = GdipSetPathGradientWrapMode(SELF.nativeBrush, pWrapMode)
  GdipReportError('TGdiPlusPathGradientBrush.SetWrapMode', SELF.lastResult)
  RETURN SELF.lastResult
!!!endregion

!!!region TGdiPlusMetafile
TGdiPlusMetafile.CreateFromWmf    PROCEDURE(HMETAFILE phWmf, typWmfPlaceableFileHeader pFileHeader, BOOL pDeleteWmf=FALSE)
  CODE
  SELF.DisposeImage()
  SELF.lastResult = GdipCreateMetafileFromWmf(phWmf, pDeleteWmf, ADDRESS(pFileHeader), SELF.nativeImage)
  GdipReportError('TGdiPlusMetafile.CreateFromWmf', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.CreateFromEmf    PROCEDURE(HENHMETAFILE phEmf, BOOL pDeleteEmf=FALSE)
  CODE
  SELF.DisposeImage()
  SELF.lastResult = GdipCreateMetafileFromEmf(phEmf, pDeleteEmf, SELF.nativeImage)
  GdipReportError('TGdiPlusMetafile.CreateFromEmf', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.CreateFromFile   PROCEDURE(STRING pFileName)
enc                                 TStringEncoding
wstr                                STRING(FILE:MaxFilePath*2+2)
  CODE
  SELF.DisposeImage()
  wstr = enc.ToCWStr(LONGPATH(pFileName))
  SELF.lastResult = GdipCreateMetafileFromFile(ADDRESS(wstr), SELF.nativeImage)
  GdipReportError('TGdiPlusMetafile.CreateFromFile', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.CreateFromFile   PROCEDURE(STRING pFileName, typWmfPlaceableFileHeader pFileHeader)
enc                                 TStringEncoding
wstr                                STRING(FILE:MaxFilePath*2+2)
  CODE
  SELF.DisposeImage()
  wstr = enc.ToCWStr(LONGPATH(pFileName))
  SELF.lastResult = GdipCreateMetafileFromWmfFile(ADDRESS(wstr), ADDRESS(pFileHeader), SELF.nativeImage)
  GdipReportError('TGdiPlusMetafile.CreateFromFile', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.CreateFromString PROCEDURE(STRING pData)
lpStream                            LONG, AUTO
stream                              &IStream, AUTO
  CODE
  SELF.DisposeImage()
  lpStream = ToStream(pData)
  SELF.lastResult = GdipCreateMetafileFromStream(lpStream, SELF.nativeImage)
  GdipReportError('TGdiPlusMetafile.CreateFromString', SELF.lastResult)
  IF lpStream
    stream &= (lpStream)
    stream.Release()
  END
  RETURN SELF.lastResult
  
TGdiPlusMetafile.RecordMetafile   PROCEDURE(HDC pReferenceHdc, GpEmfType pType=EmfTypeEmfPlusDual, <STRING pDescription>)
enc                                 TStringEncoding
wstr                                STRING(LEN(CLIP(pDescription))*2+2)
  CODE
  SELF.DisposeImage()
  wstr = enc.ToCWStr(CLIP(pDescription))
  SELF.lastResult = GdipRecordMetafile(pReferenceHdc, pType, 0, MetafileFrameUnitGdi, ADDRESS(wstr), SELF.nativeImage)
  GdipReportError('TGdiPlusMetafile.RecordMetafile', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.RecordMetafile   PROCEDURE(HDC pReferenceHdc, CONST *GpRectF pFrameRect, GpMetafileFrameUnit pFrameUnit=MetafileFrameUnitGdi, GpEmfType pType=EmfTypeEmfPlusDual, <STRING pDescription>)
enc                                 TStringEncoding
wstr                                STRING(LEN(CLIP(pDescription))*2+2)
  CODE
  SELF.DisposeImage()
  wstr = enc.ToCWStr(CLIP(pDescription))
  SELF.lastResult = GdipRecordMetafile(pReferenceHdc, pType, ADDRESS(pFrameRect), pFrameUnit, ADDRESS(wstr), SELF.nativeImage)
  GdipReportError('TGdiPlusMetafile.RecordMetafile', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.RecordMetafile   PROCEDURE(HDC pReferenceHdc, CONST *GpRect pFrameRect, GpMetafileFrameUnit pFrameUnit=MetafileFrameUnitGdi, GpEmfType pType=EmfTypeEmfPlusDual, <STRING pDescription>)
enc                                 TStringEncoding
wstr                                STRING(LEN(CLIP(pDescription))*2+2)
  CODE
  SELF.DisposeImage()
  wstr = enc.ToCWStr(CLIP(pDescription))
  SELF.lastResult = GdipRecordMetafileI(pReferenceHdc, pType, ADDRESS(pFrameRect), pFrameUnit, ADDRESS(wstr), SELF.nativeImage)
  GdipReportError('TGdiPlusMetafile.RecordMetafile', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.RecordFileName   PROCEDURE(STRING pFileName, HDC pReferenceHdc, GpEmfType pType=EmfTypeEmfPlusDual, <STRING pDescription>)
enc                                 TStringEncoding
wstrFile                            STRING(FILE:MaxFilePath*2+2)
wstrDescr                           STRING(LEN(CLIP(pDescription))*2+2)
  CODE
  SELF.DisposeImage()
  wstrFile = enc.ToCWStr(LONGPATH(pFileName))
  wstrDescr = enc.ToCWStr(CLIP(pDescription))
  SELF.lastResult = GdipRecordMetafileFileName(ADDRESS(wstrFile), pReferenceHdc, pType, 0, MetafileFrameUnitGdi, ADDRESS(wstrDescr), SELF.nativeImage)
  GdipReportError('TGdiPlusMetafile.RecordFileName', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.RecordFileName   PROCEDURE(STRING pFileName, HDC pReferenceHdc, CONST *GpRectF pFrameRect, GpMetafileFrameUnit pFrameUnit=MetafileFrameUnitGdi, GpEmfType pType=EmfTypeEmfPlusDual, <STRING pDescription>)
enc                                 TStringEncoding
wstrFile                            STRING(FILE:MaxFilePath*2+2)
wstrDescr                           STRING(LEN(CLIP(pDescription))*2+2)
  CODE
  SELF.DisposeImage()
  wstrFile = enc.ToCWStr(LONGPATH(pFileName))
  wstrDescr = enc.ToCWStr(CLIP(pDescription))
  SELF.lastResult = GdipRecordMetafileFileName(ADDRESS(wstrFile), pReferenceHdc, pType, ADDRESS(pFrameRect), pFrameUnit, ADDRESS(wstrDescr), SELF.nativeImage)
  GdipReportError('TGdiPlusMetafile.RecordFileName', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.RecordFileName   PROCEDURE(STRING pFileName, HDC pReferenceHdc, CONST *GpRect pFrameRect, GpMetafileFrameUnit pFrameUnit=MetafileFrameUnitGdi, GpEmfType pType=EmfTypeEmfPlusDual, <STRING pDescription>)
enc                                 TStringEncoding
wstrFile                            STRING(FILE:MaxFilePath*2+2)
wstrDescr                           STRING(LEN(CLIP(pDescription))*2+2)
  CODE
  SELF.DisposeImage()
  wstrFile = enc.ToCWStr(LONGPATH(pFileName))
  wstrDescr = enc.ToCWStr(CLIP(pDescription))
  SELF.lastResult = GdipRecordMetafileFileNameI(ADDRESS(wstrFile), pReferenceHdc, pType, ADDRESS(pFrameRect), pFrameUnit, ADDRESS(wstrDescr), SELF.nativeImage)
  GdipReportError('TGdiPlusMetafile.RecordFileName', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.GetHeaderFromWmf PROCEDURE(HMETAFILE phWmf, typWmfPlaceableFileHeader pFileHeader, *typMetafileHeader pHeader)
  CODE
  SELF.lastResult = GdipGetMetafileHeaderFromWmf(phWmf, ADDRESS(pFileHeader), ADDRESS(pHeader))
  GdipReportError('TGdiPlusMetafile.GetHeaderFromWmf', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.GetHeaderFromEmf PROCEDURE(HENHMETAFILE phEmf, *typMetafileHeader pHeader)
  CODE
  SELF.lastResult = GdipGetMetafileHeaderFromEmf(phEmf, ADDRESS(pHeader))
  GdipReportError('TGdiPlusMetafile.GetHeaderFromEmf', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.GetHeaderFromFile    PROCEDURE(STRING pFileName, *typMetafileHeader pHeader)
enc                                     TStringEncoding
wstr                                    STRING(FILE:MaxFilePath*2+2)
  CODE
  wstr = enc.ToCWStr(LONGPATH(pFileName))
  SELF.lastResult = GdipGetMetafileHeaderFromFile(ADDRESS(wstr), ADDRESS(pHeader))
  GdipReportError('TGdiPlusMetafile.GetHeaderFromFile', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.GetHeaderFromString  PROCEDURE(STRING pData, *typMetafileHeader pHeader)
lpStream                                LONG, AUTO
stream                                  &IStream, AUTO
  CODE
  lpStream = ToStream(pData)
  SELF.lastResult = GdipGetMetafileHeaderFromStream(lpStream, ADDRESS(pHeader))
  GdipReportError('TGdiPlusMetafile.GetHeaderFromString', SELF.lastResult)
  IF lpStream
    stream &= (lpStream)
    stream.Release()
  END
  RETURN SELF.lastResult
  
TGdiPlusMetafile.GetHeader    PROCEDURE(*typMetafileHeader pHeader)
  CODE
  SELF.lastResult = GdipGetMetafileHeaderFromMetafile(SELF.nativeImage, ADDRESS(pHeader))
  GdipReportError('TGdiPlusMetafile.GetHeader', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.GetHENHMETAFILE  PROCEDURE()
hemf                                HENHMETAFILE
  CODE
  SELF.lastResult = GdipGetHemfFromMetafile(SELF.nativeImage, hemf)
  GdipReportError('TGdiPlusMetafile.GetHENHMETAFILE', SELF.lastResult)
  RETURN hemf
  
TGdiPlusMetafile.PlayRecord   PROCEDURE(GpEmfPlusRecordType pRecordType, ULONG pFlags, ULONG pDataSize, LONG pData)
  CODE
  SELF.lastResult = GdipPlayMetafileRecord(SELF.nativeImage, pRecordType, pFlags, pDataSize, pData)
  GdipReportError('TGdiPlusMetafile.PlayRecord', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.SetDownLevelRasterizationLimit   PROCEDURE(ULONG pMetafileRasterizationLimitDpi)
  CODE
  SELF.lastResult = GdipSetMetafileDownLevelRasterizationLimit(SELF.nativeImage, pMetafileRasterizationLimitDpi)
  GdipReportError('TGdiPlusMetafile.SetDownLevelRasterizationLimit', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusMetafile.GetDownLevelRasterizationLimit   PROCEDURE()
dpi                                                 ULONG
  CODE
  SELF.lastResult = GdipGetMetafileDownLevelRasterizationLimit(SELF.nativeImage, dpi)
  GdipReportError('TGdiPlusMetafile.GetDownLevelRasterizationLimit', SELF.lastResult)
  RETURN dpi
  
TGdiPlusMetafile.EmfToWmfBits PROCEDURE(HENHMETAFILE phemf, ULONG pDataSize, LONG pData, LONG pMapMode=MM_ANISOTROPIC, LONG pFlags=EmfToWmfBitsFlagsDefault)
  CODE
  RETURN GdipEmfToWmfBits(phemf, pDataSize, pData, pMapMode, pFlags)
  
TGdiPlusMetafile.ConvertToEmfPlus PROCEDURE(TGdiPlusGraphics pGraphics, GpEmfType pEmfType=EmfTypeEmfPlusOnly, <STRING pDescription>)
nativeMetafile                      LONG
enc                                 TStringEncoding
wstr                                STRING(LEN(CLIP(pDescription))*2+2)
bConversionFailureFlag              BOOL
  CODE
  wstr = enc.ToCWStr(CLIP(pDescription))
  SELF.lastResult = GdipConvertToEmfPlus(pGraphics.nativeGraphics, SELF.nativeImage, bConversionFailureFlag, pEmfType, ADDRESS(wstr), nativeMetafile)
  GdipReportError('TGdiPlusMetafile.ConvertToEmfPlus', SELF.lastResult)
  
  IF nativeMetafile <> 0
    IF SELF.lastResult = GpStatus:Ok
      GdipDisposeImage(SELF.nativeImage)
      SELF.nativeImage = nativeMetafile
    ELSE
      GdipDisposeImage(nativeMetafile)
    END
  END
  
  RETURN bConversionFailureFlag
  
TGdiPlusMetafile.ConvertToEmfPlusFile PROCEDURE(TGdiPlusGraphics pGraphics, STRING pFileName, GpEmfType pEmfType=EmfTypeEmfPlusOnly, <STRING pDescription>)
nativeMetafile                          LONG
enc                                     TStringEncoding
wstrFile                                STRING(FILE:MaxFilePath*2+2)
wstrDescr                               STRING(LEN(CLIP(pDescription))*2+2)
bConversionFailureFlag                  BOOL
  CODE
  wstrFile = enc.ToCWStr(LONGPATH(pFileName))
  wstrDescr = enc.ToCWStr(CLIP(pDescription))
  SELF.lastResult = GdipConvertToEmfPlusToFile(pGraphics.nativeGraphics, SELF.nativeImage, bConversionFailureFlag, ADDRESS(wstrFile), pEmfType, ADDRESS(wstrDescr), nativeMetafile)
  GdipReportError('TGdiPlusMetafile.ConvertToEmfPlusFile', SELF.lastResult)
  
  IF nativeMetafile <> 0
    IF SELF.lastResult = GpStatus:Ok
      GdipDisposeImage(SELF.nativeImage)
      SELF.nativeImage = nativeMetafile
    ELSE
      GdipDisposeImage(nativeMetafile)
    END
  END
  
  RETURN bConversionFailureFlag
!!!endregion

!!!region TGdiPlusCustomLineCap
TGdiPlusCustomLineCap.Destruct    PROCEDURE()
  CODE
  SELF.DeleteCustomLineCap()
  
TGdiPlusCustomLineCap.Initialized PROCEDURE()
  CODE
  RETURN CHOOSE(SELF.nativeCap <> 0)

TGdiPlusCustomLineCap.CreateCustomLineCap PROCEDURE(TGdiPlusGraphicsPath pFillPath, TGdiPlusGraphicsPath pStrokePath, GpLineCap pBaseCap=LineCapFlat, SREAL pBaseInset=0)
  CODE
  SELF.DeleteCustomLineCap()
  SELF.lastResult = GdipCreateCustomLineCap(pFillPath.nativePath, pStrokePath.nativePath, pBaseCap, pBaseInset, SELF.nativeCap)
  GdipReportError('TGdiPlusCustomLineCap.CreateCustomLineCap', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusCustomLineCap.DeleteCustomLineCap PROCEDURE()
  CODE
  IF SELF.nativeCap
    SELF.lastResult = GdipDeleteCustomLineCap(SELF.nativeCap)
    SELF.nativeCap = 0
    GdipReportError('TGdiPlusCustomLineCap.DeleteCustomLineCap', SELF.lastResult)
  END
  RETURN SELF.lastResult
  
TGdiPlusCustomLineCap.Clone   PROCEDURE(*TGdiPlusCustomLineCap pCloneCap)
  CODE
  pCloneCap.DeleteCustomLineCap()
  SELF.lastResult = GdipCloneCustomLineCap(SELF.nativeCap, pCloneCap.nativeCap)
  GdipReportError('TGdiPlusCustomLineCap.Clone', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusCustomLineCap.SetStrokeCap    PROCEDURE(GpLineCap pStrokeCap)
  CODE
  RETURN SELF.SetStrokeCaps(pStrokeCap, pStrokeCap)
  
TGdiPlusCustomLineCap.SetStrokeCaps   PROCEDURE(GpLineCap pStartCap, GpLineCap pEndCap)
  CODE
  SELF.lastResult = GdipSetCustomLineCapStrokeCaps(SELF.nativeCap, pStartCap, pEndCap)
  GdipReportError('TGdiPlusCustomLineCap.SetStrokeCaps', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusCustomLineCap.GetStrokeCaps   PROCEDURE(*GpLineCap pStartCap, *GpLineCap pEndCap)
  CODE
  SELF.lastResult = GdipGetCustomLineCapStrokeCaps(SELF.nativeCap, pStartCap, pEndCap)
  GdipReportError('TGdiPlusCustomLineCap.GetStrokeCaps', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusCustomLineCap.SetStrokeJoin   PROCEDURE(GpLineJoin pLineJoin)
  CODE
  SELF.lastResult = GdipSetCustomLineCapStrokeJoin(SELF.nativeCap, pLineJoin)
  GdipReportError('TGdiPlusCustomLineCap.SetStrokeJoin', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusCustomLineCap.GetStrokeJoin   PROCEDURE()
lineJoin                                GpLineJoin
  CODE
  SELF.lastResult = GdipGetCustomLineCapStrokeJoin(SELF.nativeCap, lineJoin)
  GdipReportError('TGdiPlusCustomLineCap.GetStrokeJoin', SELF.lastResult)
  RETURN lineJoin
  
TGdiPlusCustomLineCap.SetBaseCap  PROCEDURE(GpLineCap pBaseCap)
  CODE
  SELF.lastResult = GdipSetCustomLineCapBaseCap(SELF.nativeCap, pBaseCap)
  GdipReportError('TGdiPlusCustomLineCap.SetBaseCap', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusCustomLineCap.GetBaseCap  PROCEDURE()
baseCap                             GpLineCap
  CODE
  SELF.lastResult = GdipGetCustomLineCapBaseCap(SELF.nativeCap, baseCap)
  GdipReportError('TGdiPlusCustomLineCap.GetBaseCap', SELF.lastResult)
  RETURN baseCap
  
TGdiPlusCustomLineCap.SetBaseInset    PROCEDURE(SREAL pInset)
  CODE
  SELF.lastResult = GdipSetCustomLineCapBaseInset(SELF.nativeCap, pInset)
  GdipReportError('TGdiPlusCustomLineCap.SetBaseInset', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusCustomLineCap.GetBaseInset    PROCEDURE()
inset                                   SREAL
  CODE
  SELF.lastResult = GdipGetCustomLineCapBaseInset(SELF.nativeCap, inset)
  GdipReportError('TGdiPlusCustomLineCap.GetBaseInset', SELF.lastResult)
  RETURN inset
  
TGdiPlusCustomLineCap.SetWidthScale   PROCEDURE(SREAL pWidthScale)
  CODE
  SELF.lastResult = GdipSetCustomLineCapWidthScale(SELF.nativeCap, pWidthScale)
  GdipReportError('TGdiPlusCustomLineCap.SetWidthScale', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusCustomLineCap.GetWidthScale   PROCEDURE()
scale                                   SREAL
  CODE
  SELF.lastResult = GdipGetCustomLineCapWidthScale(SELF.nativeCap, scale)
  GdipReportError('TGdiPlusCustomLineCap.GetWidthScale', SELF.lastResult)
  RETURN scale
!!!endregion
  
!!!region TGdiPlusAdjustableArrowCap
TGdiPlusAdjustableArrowCap.CreateAdjustableArrowCap   PROCEDURE(SREAL pHeight, SREAL pWidth, BOOL pIsFilled=TRUE)
  CODE
  SELF.DeleteCustomLineCap()
  SELF.lastResult = GdipCreateAdjustableArrowCap(pHeight, pWidth, pIsFilled, SELF.nativeCap)
  GdipReportError('TGdiPlusAdjustableArrowCap.CreateAdjustableArrowCap', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusAdjustableArrowCap.SetHeight  PROCEDURE(SREAL pHeight)
  CODE
  SELF.lastResult = GdipSetAdjustableArrowCapHeight(SELF.nativeCap, pHeight)
  GdipReportError('TGdiPlusAdjustableArrowCap.SetHeight', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusAdjustableArrowCap.GetHeight  PROCEDURE()
h                                       SREAL
  CODE
  SELF.lastResult = GdipGetAdjustableArrowCapHeight(SELF.nativeCap, h)
  GdipReportError('TGdiPlusAdjustableArrowCap.GetHeight', SELF.lastResult)
  RETURN h
  
TGdiPlusAdjustableArrowCap.SetWidth   PROCEDURE(SREAL pWidth)
  CODE
  SELF.lastResult = GdipSetAdjustableArrowCapWidth(SELF.nativeCap, pWidth)
  GdipReportError('TGdiPlusAdjustableArrowCap.SetWidth', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusAdjustableArrowCap.GetWidth   PROCEDURE()
w                                       SREAL
  CODE
  SELF.lastResult = GdipGetAdjustableArrowCapWidth(SELF.nativeCap, w)
  GdipReportError('TGdiPlusAdjustableArrowCap.GetWidth', SELF.lastResult)
  RETURN w
  
TGdiPlusAdjustableArrowCap.SetMiddleInset PROCEDURE(SREAL pMiddleInset)
  CODE
  SELF.lastResult = GdipSetAdjustableArrowCapMiddleInset(SELF.nativeCap, pMiddleInset)
  GdipReportError('TGdiPlusAdjustableArrowCap.SetMiddleInset', SELF.lastResult)
  RETURN SELF.lastResult
    
TGdiPlusAdjustableArrowCap.GetMiddleInset PROCEDURE()
inset                                       SREAL
  CODE
  SELF.lastResult = GdipGetAdjustableArrowCapMiddleInset(SELF.nativeCap, inset)
  GdipReportError('TGdiPlusAdjustableArrowCap.GetMiddleInset', SELF.lastResult)
  RETURN inset
  
TGdiPlusAdjustableArrowCap.SetFillState   PROCEDURE(BOOL pIsFilled)
  CODE
  SELF.lastResult = GdipSetAdjustableArrowCapFillState(SELF.nativeCap, pIsFilled)
  GdipReportError('TGdiPlusAdjustableArrowCap.SetFillState', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusAdjustableArrowCap.IsFilled   PROCEDURE()
isFilled                                BOOL
  CODE
  SELF.lastResult = GdipGetAdjustableArrowCapFillState(SELF.nativeCap, isFilled)
  GdipReportError('TGdiPlusAdjustableArrowCap.IsFilled', SELF.lastResult)
  RETURN isFilled
!!!endregion