!* GDI+ support
!* GDI+ Graphics Path class
!* mikeduglas 2023
!* mikeduglas@yandex.ru


!--------------------------------------------------------------------------
! GDI+ Graphics Path class
!--------------------------------------------------------------------------
TGdiPlusGraphicsPath          CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativePath                      LONG, PROTECTED
lastResult                      GpStatus, PROTECTED

Destruct                        PROCEDURE(), VIRTUAL
Initialized                     PROCEDURE(), BOOL

!!!<summary>Creates a GraphicsPath object and initializes the fill mode.</summary>
CreatePath                      PROCEDURE(GpFillMode pFillMode=FillModeAlternate), GpStatus, PROC
!!!<summary>Creates a GraphicsPath object based on an array of points, an array of types, and a fill mode.</summary>
CreatePath                      PROCEDURE(LONG pPoints, LONG pTypes, UNSIGNED pCount, GpFillMode pFillMode=FillModeAlternate), GpStatus, PROC
!!!<summary>Creates a GraphicsPath object based on an array of points, an array of types, and a fill mode.</summary>
CreatePathI                     PROCEDURE(LONG pPoints, LONG pTypes, UNSIGNED pCount, GpFillMode pFillMode=FillModeAlternate), GpStatus, PROC
!!!<summary>Releases resources used by the GraphicsPath object.</summary>
DeletePath                      PROCEDURE(), GpStatus, PROC
!!!<summary>Creates a new GraphicsPath object, and initializes it with the contents of this GraphicsPath object.</summary>
Clone                           PROCEDURE(*TGdiPlusGraphicsPath pClonePath), GpStatus, PROC
!!!<summary>Empties the path and sets the fill mode to FillModeAlternate.</summary>
ResetPath                       PROCEDURE(), GpStatus, PROC
!!!<summary>Gets the fill mode of this path.</summary>
GetFillMode                     PROCEDURE(), GpFillMode
!!!<summary>Sets the fill mode of this path.</summary>
SetFillMode                     PROCEDURE(GpFillMode pFillMode), GpStatus, PROC
!!!<summary>Gets an array of points and an array of point types from this path. Together, these two arrays define the lines, curves, figures, and markers of this path.</summary>
GetPathData                     PROCEDURE(*GpPathData pPathData), GpStatus, PROC
!!!<summary>Starts a new figure without closing the current figure. Subsequent points added to this path are added to the new figure.</summary>
StartFigure                     PROCEDURE(), GpStatus, PROC
!!!<summary>Closes the current figure of this path.</summary>
CloseFigure                     PROCEDURE(), GpStatus, PROC
!!!<summary>Closes all open figures in this path.</summary>
CloseAllFigures                 PROCEDURE(), GpStatus, PROC
!!!<summary>Designates the last point in this path as a marker point.</summary>
SetMarker                       PROCEDURE(), GpStatus, PROC
!!!<summary>Clears the markers from this path.</summary>
ClearMarkers                    PROCEDURE(), GpStatus, PROC
!!!<summary>Reverses the order of the points that define this path's lines and curves.</summary>
Reverse                         PROCEDURE(), GpStatus, PROC
!!!<summary>Gets the ending point of the last figure in this path.</summary>
GetLastPoint                    PROCEDURE(*GpPointF pLastPoint), GpStatus, PROC
!!!<summary>Adds a line to the current figure of this path.</summary>
AddLine                         PROCEDURE(CONST *GpPointF pPoint1, CONST *GpPointF pPoint2), GpStatus, PROC
!!!<summary>Adds a line to the current figure of this path.</summary>
AddLine                         PROCEDURE(SREAL pX1, SREAL pY1, SREAL pX2, SREAL pY2), GpStatus, PROC
!!!<summary>Adds a line to the current figure of this path.</summary>
AddLine                         PROCEDURE(CONST *GpPoint pPoint1, CONST *GpPoint pPoint2), GpStatus, PROC
!!!<summary>Adds a line to the current figure of this path.</summary>
AddLineI                        PROCEDURE(SIGNED pX1, SIGNED pY1, SIGNED pX2, SIGNED pY2), GpStatus, PROC
!!!<summary>Adds a sequence of connected lines to the current figure of this path.</summary>
AddLines                        PROCEDURE(LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Adds a sequence of connected lines to the current figure of this path.</summary>
AddLinesI                       PROCEDURE(LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Adds an elliptical arc to the current figure of this path.</summary>
AddArc                          PROCEDURE(CONST *GpRectF pRect, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Adds an elliptical arc to the current figure of this path.</summary>
AddArc                          PROCEDURE(SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Adds an elliptical arc to the current figure of this path.</summary>
AddArc                          PROCEDURE(CONST *GpRect pRect, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Adds an elliptical arc to the current figure of this path.</summary>
AddArcI                         PROCEDURE(SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Adds a Bezier spline to the current figure of this path.</summary>
AddBezier                       PROCEDURE(CONST *GpPointF pPt1, CONST *GpPointF pPt2, CONST *GpPointF pPt3, CONST *GpPointF pPt4), GpStatus, PROC
!!!<summary>Adds a Bezier spline to the current figure of this path.</summary>
AddBezier                       PROCEDURE(SREAL pX1, SREAL pY1, SREAL pX2, SREAL pY2, SREAL pX3, SREAL pY3, SREAL pX4, SREAL pY4), GpStatus, PROC
!!!<summary>Adds a Bezier spline to the current figure of this path.</summary>
AddBezier                       PROCEDURE(CONST *GpPoint pPt1, CONST *GpPoint pPt2, CONST *GpPoint pPt3, CONST *GpPoint pPt4), GpStatus, PROC
!!!<summary>Adds a Bezier spline to the current figure of this path.</summary>
AddBezierI                      PROCEDURE(SIGNED pX1, SIGNED pY1, SIGNED pX2, SIGNED pY2, SIGNED pX3, SIGNED pY3, SIGNED pX4, SIGNED pY4), GpStatus, PROC
!!!<summary>Adds a sequence of connected Bezier splines to the current figure of this path.</summary>
AddBeziers                      PROCEDURE(LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Adds a sequence of connected Bezier splines to the current figure of this path.</summary>
AddBeziersI                     PROCEDURE(LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Adds a cardinal spline to the current figure of this path.</summary>
AddCurve                        PROCEDURE(LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Adds a cardinal spline to the current figure of this path.</summary>
AddCurveI                       PROCEDURE(LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Adds a cardinal spline to the current figure of this path.</summary>
AddCurve                        PROCEDURE(LONG pPoints, UNSIGNED pCount, SREAL pTension), GpStatus, PROC
!!!<summary>Adds a cardinal spline to the current figure of this path.</summary>
AddCurveI                       PROCEDURE(LONG pPoints, UNSIGNED pCount, SREAL pTension), GpStatus, PROC
!!!<summary>Adds a cardinal spline to the current figure of this path.</summary>
AddCurve                        PROCEDURE(LONG pPoints, UNSIGNED pCount, SIGNED pOffset, UNSIGNED pNumberOfSegments, SREAL pTension), GpStatus, PROC
!!!<summary>Adds a cardinal spline to the current figure of this path.</summary>
AddCurveI                       PROCEDURE(LONG pPoints, UNSIGNED pCount, SIGNED pOffset, UNSIGNED pNumberOfSegments, SREAL pTension), GpStatus, PROC
!!!<summary>Adds a closed cardinal spline to this path.</summary>
AddClosedCurve                  PROCEDURE(LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Adds a closed cardinal spline to this path.</summary>
AddClosedCurveI                 PROCEDURE(LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Adds a closed cardinal spline to this path.</summary>
AddClosedCurve                  PROCEDURE(LONG pPoints, UNSIGNED pCount, SREAL pTension), GpStatus, PROC
!!!<summary>Adds a closed cardinal spline to this path.</summary>
AddClosedCurveI                 PROCEDURE(LONG pPoints, UNSIGNED pCount, SREAL pTension), GpStatus, PROC
!!!<summary>Adds a rectangle to this path.</summary>
AddRectangle                    PROCEDURE(CONST *GpRectF pRect), GpStatus, PROC
!!!<summary>Adds a rectangle to this path.</summary>
AddRectangle                    PROCEDURE(CONST *GpRect pRect), GpStatus, PROC
!!!<summary>Adds a sequence of rectangles to this path.</summary>
AddRectangles                   PROCEDURE(LONG pRects, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Adds a sequence of rectangles to this path.</summary>
AddRectanglesI                  PROCEDURE(LONG pRects, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Adds an ellipse to this path.</summary>
AddEllipse                      PROCEDURE(CONST *GpRectF pRect), GpStatus, PROC
!!!<summary>Adds an ellipse to this path.</summary>
AddEllipse                      PROCEDURE(SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight), GpStatus, PROC
!!!<summary>Adds an ellipse to this path.</summary>
AddEllipse                      PROCEDURE(CONST *GpRect pRect), GpStatus, PROC
!!!<summary>Adds an ellipse to this path.</summary>
AddEllipseI                     PROCEDURE(SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight), GpStatus, PROC
!!!<summary>Adds a pie to this path.</summary>
AddPie                          PROCEDURE(CONST *GpRectF pRect, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Adds a pie to this path.</summary>
AddPie                          PROCEDURE(SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Adds a pie to this path.</summary>
AddPie                          PROCEDURE(CONST *GpRect pRect, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Adds a pie to this path.</summary>
AddPieI                         PROCEDURE(SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Adds a polygon to this path.</summary>
AddPolygon                      PROCEDURE(LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Adds a polygon to this path.</summary>
AddPolygonI                     PROCEDURE(LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Adds a path to this path.</summary>
AddPath                         PROCEDURE(TGdiPlusGraphicsPath pAddingPath, BOOL pConnect), GpStatus, PROC
!AddString                       PROCEDURE(STRING pStr, TGdiPlusFontFamily pFamily, UNSIGNED pStyle, SREAL pEmSize, GpPointF pOrigin, TGdiPlusStringFormat pFormat), GpStatus, PROC
!!!<summary>Adds the outline of a string to this path.</summary>
AddString                       PROCEDURE(STRING pStr, TGdiPlusFontFamily pFamily, UNSIGNED pStyle, SREAL pEmSize, CONST *GpPointF pOrigin), GpStatus, PROC
!!!<summary>Adds the outline of a string to this path.</summary>
AddString                       PROCEDURE(STRING pStr, TGdiPlusFontFamily pFamily, UNSIGNED pStyle, SREAL pEmSize, CONST *GpRectF pLayoutRect), GpStatus, PROC
!!!<summary>Adds the outline of a string to this path.</summary>
AddString                       PROCEDURE(STRING pStr, TGdiPlusFontFamily pFamily, UNSIGNED pStyle, SREAL pEmSize, CONST *GpPoint pOrigin), GpStatus, PROC
!!!<summary>Adds the outline of a string to this path.</summary>
AddString                       PROCEDURE(STRING pStr, TGdiPlusFontFamily pFamily, UNSIGNED pStyle, SREAL pEmSize, CONST *GpRect pLayoutRect), GpStatus, PROC
!!!<summary>Multiplies each of this path's data points by a specified matrix.</summary>
Transform                       PROCEDURE(TGdiPlusMatrix pMatrix), GpStatus, PROC
!!!<summary>Gets a bounding rectangle for this path.</summary>
GetBounds                       PROCEDURE(*GpRectF pBounds), GpStatus, PROC
!!!<summary>Gets a bounding rectangle for this path.</summary>
GetBounds                       PROCEDURE(*GpRect pBounds), GpStatus, PROC
!Flatten                         PROCEDURE(TGdiPlusMatrix pMatrix, SREAL pFlatness=FlatnessDefault), GpStatus, PROC
!!!<summary>Applies a transformation to this path and converts each curve in the path to a sequence of connected lines.</summary>
Flatten                         PROCEDURE(SREAL pFlatness=FlatnessDefault), GpStatus, PROC
!Widen                           PROCEDURE(TGdiPlusPen pPen, TGdiPlusMatrix pMatrix, SREAL pFlatness=FlatnessDefault), GpStatus, PROC
!!!<summary>Replaces this path with curves that enclose the area that is filled when this path is drawn by a specified pen. This method also flattens the path.</summary>
Widen                           PROCEDURE(TGdiPlusPen pPen, SREAL pFlatness=FlatnessDefault), GpStatus, PROC
!Outline                         PROCEDURE(TGdiPlusMatrix pMatrix, SREAL pFlatness=FlatnessDefault), GpStatus, PROC
!!!<summary>Transforms and flattens this path, and then converts this path's data points so that they represent only the outline of the path.</summary>
Outline                         PROCEDURE(SREAL pFlatness=FlatnessDefault), GpStatus, PROC
!Warp                            PROCEDURE(LONG pDestPonts, UNSIGNED pCount, GpRectF pSrcRect, TGdiPlusMatrix pMatrix, GpWarpMode pWarpMode=WarpModePerspective, SREAL pFlatness=FlatnessDefault), GpStatus, PROC
!!!<summary>Applies a warp transformation to this path. This method also flattens (converts to a sequence of straight lines) the path.</summary>
Warp                            PROCEDURE(LONG pDestPonts, UNSIGNED pCount, CONST *GpRectF pSrcRect, GpWarpMode pWarpMode=WarpModePerspective, SREAL pFlatness=FlatnessDefault), GpStatus, PROC
!!!<summary>Gets the number of points in this path's array of data points. This is the same as the number of types in the path's array of point types.</summary>
GetPointCount                   PROCEDURE(), UNSIGNED
!!!<summary>Gets this path's array of point types.</summary>
GetPathTypes                    PROCEDURE(*BYTE[] pTypes), GpStatus, PROC
!!!<summary>Gets this path's array of points. The array contains the endpoints and control points of the lines and Bezier splines that are used to draw the path.</summary>
GetPathPoints                   PROCEDURE(LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Gets this path's array of points. The array contains the endpoints and control points of the lines and Bezier splines that are used to draw the path.</summary>
GetPathPointsI                  PROCEDURE(LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Determines whether a specified point lies in the area that is filled when this path is filled by a specified Graphics object.</summary>
IsVisible                       PROCEDURE(CONST *GpPointF pPoint, <TGdiPlusGraphics pGraphics>), BOOL
!!!<summary>Determines whether a specified point lies in the area that is filled when this path is filled by a specified Graphics object.</summary>
IsVisible                       PROCEDURE(SREAL pX, SREAL pY, <TGdiPlusGraphics pGraphics>), BOOL
!!!<summary>Determines whether a specified point lies in the area that is filled when this path is filled by a specified Graphics object.</summary>
IsVisible                       PROCEDURE(CONST *GpPoint pPoint, <TGdiPlusGraphics pGraphics>), BOOL
!!!<summary>Determines whether a specified point lies in the area that is filled when this path is filled by a specified Graphics object.</summary>
IsVisibleI                      PROCEDURE(SIGNED pX, SIGNED pY, <TGdiPlusGraphics pGraphics>), BOOL
!!!<summary>Determines whether a specified point touches the outline of this path when the path is drawn by a specified Graphics object and a specified pen.</summary>
IsOutlineVisible                PROCEDURE(CONST *GpPointF pPoint, TGdiPlusPen pPen, <TGdiPlusGraphics pGraphics>), BOOL
!!!<summary>Determines whether a specified point touches the outline of this path when the path is drawn by a specified Graphics object and a specified pen.</summary>
IsOutlineVisible                PROCEDURE(SREAL pX, SREAL pY, TGdiPlusPen pPen, <TGdiPlusGraphics pGraphics>), BOOL
!!!<summary>Determines whether a specified point touches the outline of this path when the path is drawn by a specified Graphics object and a specified pen.</summary>
IsOutlineVisible                PROCEDURE(CONST *GpPoint pPoint, TGdiPlusPen pPen, <TGdiPlusGraphics pGraphics>), BOOL
!!!<summary>Determines whether a specified point touches the outline of this path when the path is drawn by a specified Graphics object and a specified pen.</summary>
IsOutlineVisibleI               PROCEDURE(SIGNED pX, SIGNED pY, TGdiPlusPen pPen, <TGdiPlusGraphics pGraphics>), BOOL
                              END

GpPathData                    GROUP, TYPE
Count                             UNSIGNED
Points                            LONG  !PointF*
Types                             LONG  !BYTE*
                              END


!--------------------------------------------------------------------------
! GDI+ GraphisPathIterator class
!--------------------------------------------------------------------------
TGdiPlusGraphisPathIterator   CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeIterator                  LONG, PROTECTED
lastResult                      GpStatus, PROTECTED

Destruct                        PROCEDURE(), VIRTUAL
Initialized                     PROCEDURE(), BOOL

!!!<summary>Creates a new GraphicsPathIterator object and associates it with a GraphicsPath object.</summary>
CreatePathIter                  PROCEDURE(TGdiPlusGraphicsPath pPath), GpStatus, PROC
!!!<summary>Releases resources used by the GraphicsPathIterator object.</summary>
DeletePathIter                  PROCEDURE(), GpStatus, PROC
!!!<summary>Gets the starting index and the ending index of the next subpath (figure) in this iterator's associated path.</summary>
NextSubpath                     PROCEDURE(*UNSIGNED pStartIndex, *UNSIGNED pEndIndex, *BOOL pIsClosed), UNSIGNED
!!!<summary>Gets the next figure (subpath) from this iterator's associated path.</summary>
NextSubpath                     PROCEDURE(*TGdiPlusGraphicsPath pPath, *BOOL pIsClosed), UNSIGNED
!!!<summary>Gets the starting index and the ending index of the next group of data points that all have the same type.</summary>
NextPathType                    PROCEDURE(*BYTE pPathType, *UNSIGNED pStartIndex, *UNSIGNED pEndIndex), UNSIGNED
!!!<summary>Gets the starting index and the ending index of the next marker-delimited section in this iterator's associated path.</summary>
NextMarker                      PROCEDURE(*UNSIGNED pStartIndex, *UNSIGNED pEndIndex), UNSIGNED
!!!<summary>Gets the next marker-delimited section of this iterator's associated path.</summary>
NextMarker                      PROCEDURE(*TGdiPlusGraphicsPath pPath), UNSIGNED
!!!<summary>Returns the number of data points in the path.</summary>
GetCount                        PROCEDURE(), UNSIGNED
!!!<summary>Returns the number of subpaths (also called figures) in the path.</summary>
GetSubpathCount                 PROCEDURE(), UNSIGNED
!!!<summary>Determines whether the path has any curves.</summary>
HasCurve                        PROCEDURE(), BOOL
!!!<summary>Rewinds this iterator to the beginning of its associated path.</summary>
Rewind                          PROCEDURE(), GpStatus, PROC
!!!<summary>Copies the path's data points to a PointF array and copies the path's point types to a BYTE array.</summary>
Enumerate                       PROCEDURE(LONG pPoints, *BYTE[] pTypes), UNSIGNED
!!!<summary>Copies a subset of the path's data points to a PointF array and copies a subset of the path's point types to a BYTE array.</summary>
CopyData                        PROCEDURE(UNSIGNED pStartIndex, UNSIGNED pEndIndex, LONG pPoints, *BYTE[] pTypes), UNSIGNED
                              END


!--------------------------------------------------------------------------
! GDI+ Path Gradient Brush
!--------------------------------------------------------------------------
TGdiPlusPathGradientBrush     CLASS(TGdiPlusBrush), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
!!!<summary>Creates a PathGradientBrush object based on an array of points. Initializes the wrap mode of the path gradient brush.</summary>
CreatePathGradient              PROCEDURE(LONG pPoints, UNSIGNED pCount, GpWrapMode pWrapMode=WrapModeClamp), GpStatus, PROC
!!!<summary>Creates a PathGradientBrush object based on an array of points. Initializes the wrap mode of the path gradient brush.</summary>
CreatePathGradientI             PROCEDURE(LONG pPoints, UNSIGNED pCount, GpWrapMode pWrapMode=WrapModeClamp), GpStatus, PROC
!!!<summary>Creates a PathGradientBrush object based on a GraphicsPath object.</summary>
CreatePathGradient              PROCEDURE(TGdiPlusGraphicsPath pPath), GpStatus, PROC
!!!<summary>Gets the color of the center point of this path gradient brush.</summary>
GetCenterColor                  PROCEDURE(), GpARGB
!!!<summary>Sets the center color of this path gradient brush. The center color is the color that appears at the brush's center point.</summary>
SetCenterColor                  PROCEDURE(GpARGB pColor), GpStatus, PROC
!!!<summary>Gets the number of points in the array of points that defines this brush's boundary path.</summary>
GetPointCount                   PROCEDURE(), UNSIGNED
!!!<summary>Gets the number of colors that have been specified for the boundary path of this path gradient brush.</summary>
GetSurroundColorCount           PROCEDURE(), UNSIGNED
!!!<summary>Gets the surround colors currently specified for this path gradient brush.</summary>
GetSurroundColors               PROCEDURE(*GpARGB[] pColors, *UNSIGNED pCount), GpStatus, PROC
!!!<summary>Sets the surround colors of this path gradient brush. The surround colors are colors specified for discrete points on the brush's boundary path.</summary>
SetSurroundColors               PROCEDURE(*GpARGB[] pColors, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Sets the surround colors of this path gradient brush. The surround colors are colors specified for discrete points on the brush's boundary path.</summary>
SetSurroundColors               PROCEDURE(*GpARGB[] pColors, *UNSIGNED pCount), GpStatus, PROC
!!!<summary>Sets the surround colors of this path gradient brush. The surround colors are colors specified for discrete points on the brush's boundary path.</summary>
SetSurroundColor                PROCEDURE(GpARGB pColor), GpStatus, PROC
!!!<summary>No summary.</summary>
GetGraphicsPath                 PROCEDURE(*TGdiPlusGraphicsPath pPath), GpStatus, PROC
!!!<summary>No summary.</summary>
SetGraphicsPath                 PROCEDURE(TGdiPlusGraphicsPath pPath), GpStatus, PROC
!!!<summary>Gets the center point of this path gradient brush.</summary>
GetCenterPoint                  PROCEDURE(*GpPointF pPoint), GpStatus, PROC
!!!<summary>Gets the center point of this path gradient brush.</summary>
GetCenterPoint                  PROCEDURE(*GpPoint pPoint), GpStatus, PROC
!!!<summary>Sets the center point of this path gradient brush. By default, the center point is at the centroid of the brush's boundary path, but you can set the center point to any location inside or outside the path.</summary>
SetCenterPoint                  PROCEDURE(CONST *GpPointF pPoint), GpStatus, PROC
!!!<summary>Sets the center point of this path gradient brush. By default, the center point is at the centroid of the brush's boundary path, but you can set the center point to any location inside or outside the path.</summary>
SetCenterPoint                  PROCEDURE(CONST *GpPoint pPoint), GpStatus, PROC
!!!<summary>Gets the smallest rectangle that encloses the boundary path of this path gradient brush.</summary>
GetRectangle                    PROCEDURE(*GpRectF pRect), GpStatus, PROC
!!!<summary>Gets the smallest rectangle that encloses the boundary path of this path gradient brush.</summary>
GetRectangle                    PROCEDURE(*GpRect pRect), GpStatus, PROC
!!!<summary>Specifies whether gamma correction is enabled for this path gradient brush.</summary>
SetGammaCorrection              PROCEDURE(BOOL pUseGammaCorrection), GpStatus, PROC
!!!<summary>Determines whether gamma correction is enabled for this path gradient brush.</summary>
GetGammaCorrection              PROCEDURE(), BOOL
!!!<summary>Gets the number of blend factors currently set for this path gradient brush.</summary>
GetBlendCount                   PROCEDURE(), UNSIGNED
!!!<summary>Gets the blend factors and the corresponding blend positions currently set for this path gradient brush.</summary>
GetBlend                        PROCEDURE(*SREAL[] pBlendFactors, *SREAL[] pBlendPositions), GpStatus, PROC
!!!<summary>Sets the blend factors and the blend positions of this path gradient brush.</summary>
SetBlend                        PROCEDURE(*SREAL[] pBlendFactors, *SREAL[] pBlendPositions), GpStatus, PROC
!!!<summary>Gets the number of preset colors currently specified for this path gradient brush.</summary>
GetInterpolationColorCount      PROCEDURE(), UNSIGNED
!!!<summary>Sets the preset colors and the blend positions of this path gradient brush.</summary>
SetInterpolationColors          PROCEDURE(*GpARGB[] pPresetColors, *SREAL[] pBlendPositions), GpStatus, PROC
!!!<summary>Gets the preset colors and blend positions currently specified for this path gradient brush.</summary>
GetInterpolationColors          PROCEDURE(*GpARGB[] pPresetColors, *SREAL[] pBlendPositions), GpStatus, PROC
!!!<summary>Sets the blend shape of this path gradient brush.</summary>
SetBlendBellShape               PROCEDURE(SREAL pFocus, SREAL pScale=1.0), GpStatus, PROC
!!!<summary>Sets the blend shape of this path gradient brush.</summary>
SetBlendTriangularShape         PROCEDURE(SREAL pFocus, SREAL pScale=1.0), GpStatus, PROC
!!!<summary>Gets transformation matrix of this path gradient brush.</summary>
GetTransform                    PROCEDURE(*TGdiplusMatrix pMatrix), GpStatus, PROC
!!!<summary>Sets the transformation matrix of this path gradient brush.</summary>
SetTransform                    PROCEDURE(TGdiplusMatrix pMatrix), GpStatus, PROC
!!!<summary>Resets the transformation matrix of this path gradient brush to the identity matrix. This means that no transformation will take place.</summary>
ResetTransform                  PROCEDURE(), GpStatus, PROC
!!!<summary>Updates the brush's transformation matrix with the product of itself and another matrix.</summary>
MultiplyTransform               PROCEDURE(TGdiplusMatrix pMatrix, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this brush's current transformation matrix with the product of itself and a translation matrix.</summary>
TranslateTransform              PROCEDURE(SREAL pDx, SREAL pDy, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this brush's current transformation matrix with the product of itself and a scaling matrix.</summary>
ScaleTransform                  PROCEDURE(SREAL pSx, SREAL pSy, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this brush's current transformation matrix with the product of itself and a rotation matrix.</summary>
RotateTransform                 PROCEDURE(SREAL pAngle, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Gets the focus scales of this path gradient brush.</summary>
GetFocusScales                  PROCEDURE(*SREAL pXScale, *SREAL pYScale), GpStatus, PROC
!!!<summary>Sets the focus scales of this path gradient brush</summary>
SetFocusScales                  PROCEDURE(SREAL pXScale, SREAL pYScale), GpStatus, PROC
!!!<summary>Gets the wrap mode currently set for this path gradient brush./summary>
GetWrapMode                     PROCEDURE(), GpWrapMode
!!!<summary>Sets the wrap mode of this path gradient brush./summary>
SetWrapMode                     PROCEDURE(GpWrapMode pWrapMode), GpStatus, PROC
                              END
