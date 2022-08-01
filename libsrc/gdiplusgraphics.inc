!* GDI+ support
!* GDI+ Graphics class
!* mikeduglas 2022
!* mikeduglas@yandex.ru


!--------------------------------------------------------------------------
! GDI+ Graphics class
!--------------------------------------------------------------------------
TGdiPlusGraphics              CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeGraphics                  LONG, PROTECTED
lastResult                      GpStatus, PROTECTED

Construct                       PROCEDURE()
Destruct                        PROCEDURE(), VIRTUAL

!!!<summary>Creates a Graphics object that is associated with a specified device context.</summary>
FromHDC                         PROCEDURE(HDC phdc, <HANDLE phdevice>), GpStatus, PROC
!!!<summary>Creates a Graphics object that is associated with a specified window.</summary>
FromHWND                        PROCEDURE(HWND phwnd, BOOL pIcm=FALSE), GpStatus, PROC
!!!<summary>Creates a Graphics object that is associated with an Image object.</summary>
FromImage                       PROCEDURE(TGdiPlusImage pImage), GpStatus, PROC
!!!<summary>Releases resources used by the Graphics object.</summary>
DeleteGraphics                  PROCEDURE(), GpStatus, PROC
!!!<summary>Flushes all pending graphics operations.</summary>
Flush                           PROCEDURE(GpFlushIntention pIntention=FlushIntentionFlush), GpStatus, PROC
!!!<summary>Gets a handle to the device context associated with this Graphics object.</summary>
GetDC                           PROCEDURE(), HDC
!!!<summary>Releases a device context handle obtained by a previous call to the GetHDC method of this Graphics object.</summary>
ReleaseDC                       PROCEDURE(HDC phdc), GpStatus, PROC
!!!<summary>Sets the compositing mode of this Graphics object.</summary>
SetCompositingMode              PROCEDURE(GpCompositingMode pMode), GpStatus, PROC
!!!<summary>Gets the compositing mode currently set for this Graphics object.</summary>
GetCompositingMode              PROCEDURE(), GpCompositingMode
!!!<summary>Sets the rendering origin of this Graphics object. The rendering origin is used to set the dither origin for 8-bits-per-pixel and 16-bits-per-pixel dithering and is also used to set the origin for hatch brushes.</summary>
SetRenderingOrigin              PROCEDURE(SIGNED pX, SIGNED pY), GpStatus, PROC
!!!<summary>Gets the rendering origin currently set for this Graphics object. The rendering origin is used to set the dither origin for 8-bits per pixel and 16-bits per pixel dithering and is also used to set the origin for hatch brushes.</summary>
GetRenderingOrigin              PROCEDURE(*SIGNED pX, *SIGNED pY), GpStatus, PROC
!!!<summary>Sets the compositing quality of this Graphics object.</summary>
SetCompositingQuality           PROCEDURE(GpCompositingQuality pQuality), GpStatus, PROC
!!!<summary>Gets the compositing quality currently set for this Graphics object.</summary>
GetCompositingQuality           PROCEDURE(), GpCompositingQuality
!!!<summary>Sets the rendering quality of the Graphics object.</summary>
SetSmoothingMode                PROCEDURE(GpSmoothingMode pMode), GpStatus, PROC
!!!<summary>Determines whether smoothing (antialiasing) is applied to the Graphics object.</summary>
GetSmoothingMode                PROCEDURE(), GpSmoothingMode
!!!<summary>Sets the pixel offset mode of this Graphics object.</summary>
SetPixelOffsetMode              PROCEDURE(GpPixelOffsetMode pMode), GpStatus, PROC
!!!<summary>Gets the pixel offset mode currently set for this Graphics object.</summary>
GetPixelOffsetMode              PROCEDURE(), GpPixelOffsetMode
!!!<summary>Sets the text rendering mode of this Graphics object.</summary>
SetTextRenderingHint            PROCEDURE(GpTextRenderingHint pMode), GpStatus, PROC
!!!<summary>Gets the text rendering mode currently set for this Graphics object.</summary>
GetTextRenderingHint            PROCEDURE(), GpTextRenderingHint
!!!<summary>Sets the contrast value of this Graphics object. The contrast value is used for antialiasing text.</summary>
SetTextContrast                 PROCEDURE(UNSIGNED pContrast), GpStatus, PROC
!!!<summary>Gets the contrast value currently set for this Graphics object. The contrast value is used for antialiasing text.</summary>
GetTextContrast                 PROCEDURE(), UNSIGNED
!!!<summary>Sets the interpolation mode of this Graphics object. The interpolation mode determines the algorithm that is used when images are scaled or rotated.</summary>
SetInterpolationMode            PROCEDURE(GpInterpolationMode pMode), GpStatus, PROC
!!!<summary>Gets the interpolation mode currently set for this Graphics object. The interpolation mode determines the algorithm that is used when images are scaled or rotated.</summary>
GetInterpolationMode            PROCEDURE(), GpInterpolationMode
!!!<summary>Sets the world transformation of this Graphics object.</summary>
SetTransform                    PROCEDURE(TGdiPlusMatrix pMatrix), GpStatus, PROC
!!!<summary>Sets the world transformation matrix of this Graphics object to the identity matrix.</summary>
ResetTransform                  PROCEDURE(), GpStatus, PROC
!!!<summary>Updates this Graphics object's world transformation matrix with the product of itself and another matrix.</summary>
MultiplyTransform               PROCEDURE(TGdiPlusMatrix pMatrix, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this Graphics object's world transformation matrix with the product of itself and a translation matrix.</summary>
TranslateTransform              PROCEDURE(SREAL pdx, SREAL pdy, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this Graphics object's world transformation matrix with the product of itself and a scaling matrix.</summary>
ScaleTransform                  PROCEDURE(SREAL psx, SREAL psy, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates the world transformation matrix of this Graphics object with the product of itself and a rotation matrix.</summary>
RotateTransform                 PROCEDURE(SREAL pAngle, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Gets the world transformation matrix of this Graphics object.</summary>
GetTransform                    PROCEDURE(*TGdiPlusMatrix pMatrix), GpStatus, PROC
!!!<summary>Resets the page transform matrix to identity.</summary>
ResetPageTransform              PROCEDURE(), GpStatus, PROC
!!!<summary>Sets the unit of measure for this Graphics object. The page unit belongs to the page transformation, which converts page coordinates to device coordinates.</summary>
SetPageUnit                     PROCEDURE(GpUnit pUnit), GpStatus, PROC
!!!<summary>Gets the unit of measure currently set for this Graphics object.</summary>
GetPageUnit                     PROCEDURE(), GpUnit
!!!<summary>Sets the scaling factor for the page transformation of this Graphics object. The page transformation converts page coordinates to device coordinates.</summary>
SetPageScale                    PROCEDURE(SREAL pScale), GpStatus, PROC
!!!<summary>Gets the scaling factor currently set for the page transformation of this Graphics object. The page transformation converts page coordinates to device coordinates.</summary>
GetPageScale                    PROCEDURE(), SREAL
!!!<summary>Gets the horizontal resolution, in dots per inch, of the display device associated with this Graphics object.</summary>
GetDpiX                         PROCEDURE(), SREAL
!!!<summary>Gets the vertical  resolution, in dots per inch, of the display device associated with this Graphics object.</summary>
GetDpiY                         PROCEDURE(), SREAL
!!!<summary>Converts an array of points from one coordinate space to another. The conversion is based on the current world and page transformations of this Graphics object.</summary>
TransformPoints                 PROCEDURE(GpCoordinateSpace pDestSpace, GpCoordinateSpace pSrcSpace, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Converts an array of points from one coordinate space to another. The conversion is based on the current world and page transformations of this Graphics object.</summary>
TransformPointsI                PROCEDURE(GpCoordinateSpace pDestSpace, GpCoordinateSpace pSrcSpace, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Gets the nearest color to the color that is passed in. This method works on 8-bits per pixel or lower display devices for which there is an 8-bit color palette.</summary>
GetNearestColor                 PROCEDURE(*GpARGB pColor), GpStatus, PROC
!!!<summary>Gets a Windows halftone palette.</summary>
GetHalftonePalette              PROCEDURE(), HPALETTE
!!!<summary>Draws a line that connects two points.</summary>
DrawLine                        PROCEDURE(TGdiPlusPen pPen, SREAL pX1, SREAL pY1, SREAL pX2, SREAL pY2), GpStatus, PROC
!!!<summary>Draws a line that connects two points.</summary>
DrawLine                        PROCEDURE(TGdiPlusPen pPen, GpPointF pPoint1, GpPointF pPoint2), GpStatus, PROC
!!!<summary>Draws a line that connects two points.</summary>
DrawLineI                       PROCEDURE(TGdiPlusPen pPen, SIGNED pX1, SIGNED pY1, SIGNED pX2, SIGNED pY2), GpStatus, PROC
!!!<summary>Draws a line that connects two points.</summary>
DrawLineI                       PROCEDURE(TGdiPlusPen pPen, GpPoint pPoint1, GpPoint pPoint2), GpStatus, PROC
!!!<summary>Draws a sequence of connected lines.</summary>
DrawLines                       PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Draws a sequence of connected lines.</summary>
DrawLinesI                      PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Draws an arc. The arc is part of an ellipse.</summary>
DrawArc                         PROCEDURE(TGdiPlusPen pPen, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Draws an arc. The arc is part of an ellipse.</summary>
DrawArc                         PROCEDURE(TGdiPlusPen pPen, GpRectF pRect, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Draws an arc. The arc is part of an ellipse.</summary>
DrawArcI                        PROCEDURE(TGdiPlusPen pPen, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Draws an arc. The arc is part of an ellipse.</summary>
DrawArcI                        PROCEDURE(TGdiPlusPen pPen, GpRect pRect, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Draws a Bezier spline.</summary>
DrawBezier                      PROCEDURE(TGdiPlusPen pPen, SREAL pX1, SREAL pY1, SREAL pX2, SREAL pY2, SREAL pX3, SREAL pY3, SREAL pX4, SREAL pY4), GpStatus, PROC
!!!<summary>Draws a Bezier spline.</summary>
DrawBezier                      PROCEDURE(TGdiPlusPen pPen, GpPointF pPoint1, GpPointF pPoint2, GpPointF pPoint3, GpPointF pPoint4), GpStatus, PROC
!!!<summary>Draws a Bezier spline.</summary>
DrawBezierI                     PROCEDURE(TGdiPlusPen pPen, SIGNED pX1, SIGNED pY1, SIGNED pX2, SIGNED pY2, SIGNED pX3, SIGNED pY3, SIGNED pX4, SIGNED pY4), GpStatus, PROC
!!!<summary>Draws a Bezier spline.</summary>
DrawBezierI                     PROCEDURE(TGdiPlusPen pPen, GpPoint pPoint1, GpPoint pPoint2, GpPoint pPoint3, GpPoint pPoint4), GpStatus, PROC
!!!<summary>Draws a sequence of connected Bezier splines.</summary>
DrawBeziers                     PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Draws a sequence of connected Bezier splines.</summary>
DrawBeziersI                    PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Draws a rectangle.</summary>
DrawRectangle                   PROCEDURE(TGdiPlusPen pPen, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight), GpStatus, PROC
!!!<summary>Draws a rectangle.</summary>
DrawRectangle                   PROCEDURE(TGdiPlusPen pPen, GpRectF pRect), GpStatus, PROC
!!!<summary>Draws a rectangle.</summary>
DrawRectangleI                  PROCEDURE(TGdiPlusPen pPen, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight), GpStatus, PROC
!!!<summary>Draws a rectangle.</summary>
DrawRectangleI                  PROCEDURE(TGdiPlusPen pPen, GpRect pRect), GpStatus, PROC
!!!<summary>Draws a sequence of rectangles.</summary>
DrawRectangles                  PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Draws a sequence of rectangles.</summary>
DrawRectanglesI                 PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Draws an ellipse.</summary>
DrawEllipse                     PROCEDURE(TGdiPlusPen pPen, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight), GpStatus, PROC
!!!<summary>Draws an ellipse.</summary>
DrawEllipse                     PROCEDURE(TGdiPlusPen pPen, GpRectF pRect), GpStatus, PROC
!!!<summary>Draws an ellipse.</summary>
DrawEllipseI                    PROCEDURE(TGdiPlusPen pPen, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight), GpStatus, PROC
!!!<summary>Draws an ellipse.</summary>
DrawEllipseI                    PROCEDURE(TGdiPlusPen pPen, GpRect pRect), GpStatus, PROC
!!!<summary>Draws an pie.</summary>
DrawPie                         PROCEDURE(TGdiPlusPen pPen, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Draws an pie.</summary>
DrawPie                         PROCEDURE(TGdiPlusPen pPen, GpRectF pRect, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Draws an pie.</summary>
DrawPieI                        PROCEDURE(TGdiPlusPen pPen, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Draws an pie.</summary>
DrawPieI                        PROCEDURE(TGdiPlusPen pPen, GpRect pRect, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Draws a polygon.</summary>
DrawPolygon                     PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Draws a polygon.</summary>
DrawPolygonI                    PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Draws a sequence of lines and curves defined by a GraphicsPath object.</summary>
DrawPath                        PROCEDURE(TGdiPlusPen pPen, TGdiPlusGraphicsPath pPath), GpStatus, PROC
!!!<summary>Draws a cardinal spline.</summary>
DrawCurve                       PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Draws a cardinal spline.</summary>
DrawCurve                       PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount, SREAL pTension), GpStatus, PROC
!!!<summary>Draws a cardinal spline.</summary>
DrawCurve                       PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount, SIGNED pOffset, UNSIGNED pNumberOfSegments, SREAL pTension=0.5), GpStatus, PROC
!!!<summary>Draws a cardinal spline.</summary>
DrawCurveI                      PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Draws a cardinal spline.</summary>
DrawCurveI                      PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount, SREAL pTension), GpStatus, PROC
!!!<summary>Draws a cardinal spline.</summary>
DrawCurveI                      PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount, SIGNED pOffset, UNSIGNED pNumberOfSegments, SREAL pTension=0.5), GpStatus, PROC
!!!<summary>Draws a closed cardinal spline.</summary>
DrawClosedCurve                 PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Draws a cardinal spline.</summary>
DrawClosedCurve                 PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount, SREAL pTension), GpStatus, PROC
!!!<summary>Draws a closed cardinal spline.</summary>
DrawClosedCurveI                PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Draws a cardinal spline.</summary>
DrawClosedCurveI                PROCEDURE(TGdiPlusPen pPen, LONG pPoints, UNSIGNED pCount, SREAL pTension), GpStatus, PROC
!!!<summary>Clears a Graphics object to a specified color.</summary>
GraphicsClear                   PROCEDURE(GpARGB pColor), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of a rectangle.</summary>
FillRectangle                   PROCEDURE(TGdiPlusBrush pBrush, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of a rectangle.</summary>
FillRectangle                   PROCEDURE(TGdiPlusBrush pBrush, GpRectF pRect), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of a rectangle.</summary>
FillRectangles                  PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of a rectangle.</summary>
FillRectangleI                  PROCEDURE(TGdiPlusBrush pBrush, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of a rectangle.</summary>
FillRectangleI                  PROCEDURE(TGdiPlusBrush pBrush, GpRect pRect), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of a rectangle.</summary>
FillRectanglesI                 PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of a polygon.</summary>
FillPolygon                     PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount, GpFillMode pMode=FillModeAlternate), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of a polygon.</summary>
FillPolygonI                    PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount, GpFillMode pMode=FillModeAlternate), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of an ellipse that is specified by coordinates and dimensions.</summary>
FillEllipse                     PROCEDURE(TGdiPlusBrush pBrush, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of an ellipse that is specified by coordinates and dimensions.</summary>
FillEllipse                     PROCEDURE(TGdiPlusBrush pBrush, GpRectF pRect), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of an ellipse that is specified by coordinates and dimensions.</summary>
FillEllipseI                    PROCEDURE(TGdiPlusBrush pBrush, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of an ellipse that is specified by coordinates and dimensions.</summary>
FillEllipseI                    PROCEDURE(TGdiPlusBrush pBrush, GpRect pRect), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of a pie.</summary>
FillPie                         PROCEDURE(TGdiPlusBrush pBrush, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of a pie.</summary>
FillPie                         PROCEDURE(TGdiPlusBrush pBrush, GpRectF pRect, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of a pie.</summary>
FillPieI                        PROCEDURE(TGdiPlusBrush pBrush, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of a pie.</summary>
FillPieI                        PROCEDURE(TGdiPlusBrush pBrush, GpRect pRect, SREAL pStartAngle, SREAL pSweepAngle), GpStatus, PROC
!!!<summary>Uses a brush to fill the interior of a path. If a figure in the path is not closed, this method treats the nonclosed figure as if it were closed by a straight line that connects the figure's starting and ending points.</summary>
FillPath                        PROCEDURE(TGdiPlusBrush pBrush, TGdiPlusGraphicsPath pPath), GpStatus, PROC
!!!<summary>Creates a closed cardinal spline from an array of points and uses a brush to fill the interior of the spline.</summary>
FillClosedCurve                 PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Creates a closed cardinal spline from an array of points and uses a brush to fill the interior of the spline.</summary>
FillClosedCurve                 PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount, GpFillMode pMode, SREAL pTension=0.5), GpStatus, PROC
!!!<summary>Creates a closed cardinal spline from an array of points and uses a brush to fill the interior of the spline.</summary>
FillClosedCurveI                PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Creates a closed cardinal spline from an array of points and uses a brush to fill the interior of the spline.</summary>
FillClosedCurveI                PROCEDURE(TGdiPlusBrush pBrush, LONG pPoints, UNSIGNED pCount, GpFillMode pMode, SREAL pTension=0.5), GpStatus, PROC
!!!<summary>Uses a brush to fill a specified region.</summary>
FillRegion                      PROCEDURE(TGdiPlusBrush pBrush, TGdiPlusRegion pRegion), GpStatus, PROC

!!!<summary>Draws a string based on a font, a layout rectangle, and a format.</summary>
DrawString                      PROCEDURE(STRING pStr, CONST *GpRectF pLayoutRect, <TGdiPlusFont pFont>, <TGdiPlusBrush pBrush>, <TGdiPlusStringFormat pFormat>), GpStatus, PROC
!!!<summary>Draws a string based on a font, and an origin.</summary>
DrawString                      PROCEDURE(STRING pStr, CONST *GpPointF pOrigin, <TGdiPlusFont pFont>, <TGdiPlusBrush pBrush>, <TGdiPlusStringFormat pFormat>), GpStatus, PROC

!!!<summary>Measures the extent of the string in the specified font, format, and layout rectangle.</summary>
MeasureString                   PROCEDURE(STRING pStr, CONST *GpRectF pLayoutRect, <TGdiPlusFont pFont>, <TGdiPlusStringFormat pFormat>, *GpRectF pBoundingBox), GpStatus, PROC
!!!<summary>Measures the extent of the string in the specified font.</summary>
MeasureString                   PROCEDURE(STRING pStr, CONST *GpSizeF pLayoutRectSize, <TGdiPlusFont pFont>, <TGdiPlusStringFormat pFormat>, *GpSizeF pSize), GpStatus, PROC
!!!<summary>Measures the extent of the string in the specified font.</summary>
MeasureString                   PROCEDURE(STRING pStr, CONST *GpPointF pOrigin, <TGdiPlusFont pFont>, <TGdiPlusStringFormat pFormat>, *GpRectF pBoundingBox), GpStatus, PROC

!!!<summary>Draws the image stored in a CachedBitmap object.</summary>
DrawCachedBitmap                PROCEDURE(TGdiPlusCachedBitmap pCBitmap, SIGNED pX, SIGNED pY), GpStatus, PROC

!!!<summary>Draws an image at a specified location.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, CONST *GpPointF pPoint), GpStatus, PROC
!!!<summary>Draws an image at a specified location.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, SREAL pX, SREAL pY), GpStatus, PROC
!!!<summary>Draws an image at a specified location.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, CONST *GpPoint pPoint), GpStatus, PROC
!!!<summary>Draws an image at a specified location.</summary>
DrawImageI                      PROCEDURE(TGdiPlusImage pImage, SIGNED pX, SIGNED pY), GpStatus, PROC
!!!<summary>Draws an image.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, CONST *GpRectF pRect), GpStatus, PROC
!!!<summary>Draws an image.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight), GpStatus, PROC
!!!<summary>Draws an image.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, CONST *GpRect pRect), GpStatus, PROC
!!!<summary>Draws an image.</summary>
DrawImageI                      PROCEDURE(TGdiPlusImage pImage, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight), GpStatus, PROC
!!!<summary>Draws an image in a parallelogram.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, CONST *GpPointF pUpperLeftPoint, CONST *GpPointF pUpperRightPoint, CONST *GpPointF pLowerLeftPoint), GpStatus, PROC
!!!<summary>Draws an image in a parallelogram.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, CONST *GpPoint pUpperLeftPoint, CONST *GpPoint pUpperRightPoint, CONST *GpPoint pLowerLeftPoint), GpStatus, PROC
!!!<summary>Draws an image.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, SREAL pDstX, SREAL pDstY, SREAL pSrcX, SREAL pSrcY, SREAL pSrcWidth, SREAL pSrcHeight, GpUnit pSrcUnit), GpStatus, PROC
!!!<summary>Draws an image.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, CONST *GpPointF pPoint, CONST *GpRectF pRect, GpUnit pSrcUnit), GpStatus, PROC
!!!<summary>Draws an image.</summary>
DrawImageI                      PROCEDURE(TGdiPlusImage pImage, SIGNED pDstX, SIGNED pDstY, SIGNED pSrcX, SIGNED pSrcY, SIGNED pSrcWidth, SIGNED pSrcHeight, GpUnit pSrcUnit), GpStatus, PROC
!!!<summary>Draws an image.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, CONST *GpPoint pPoint, CONST *GpRect pRect, GpUnit pSrcUnit), GpStatus, PROC
!!!<summary>Draws an image.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, SREAL pDstX, SREAL pDstY, SREAL pDstWidth, SREAL pDstHeight, SREAL pSrcX, SREAL pSrcY, SREAL pSrcWidth, SREAL pSrcHeight, GpUnit pSrcUnit), GpStatus, PROC
!!!<summary>Draws an image.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, CONST *GpRectF pDestRect, CONST *GpRectF pSrcRect, GpUnit pSrcUnit), GpStatus, PROC
!!!<summary>Draws an image.</summary>
DrawImageI                      PROCEDURE(TGdiPlusImage pImage, SIGNED pDstX, SIGNED pDstY, SIGNED pDstWidth, SIGNED pDstHeight, SIGNED pSrcX, SIGNED pSrcY, SIGNED pSrcWidth, SIGNED pSrcHeight, GpUnit pSrcUnit), GpStatus, PROC
!!!<summary>Draws an image.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, CONST *GpRect pDestRect, CONST *GpRect pSrcRect, GpUnit pSrcUnit), GpStatus, PROC
!!!<summary>Draws an image.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, CONST *GpPointF pUpperLeftPoint, CONST *GpPointF pUpperRightPoint, CONST *GpPointF pLowerLeftPoint, |
                                  CONST *GpRectF pSrcRect, GpUnit pSrcUnit), GpStatus, PROC
!!!<summary>Draws an image.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, CONST *GpPoint pUpperLeftPoint, CONST *GpPoint pUpperRightPoint, CONST *GpPoint pLowerLeftPoint, |
                                  CONST *GpRect pSrcRect, GpUnit pSrcUnit), GpStatus, PROC
!!!<summary>Draws an image.</summary>
DrawImage                       PROCEDURE(TGdiPlusImage pImage, CONST *GpRectF pSrcRect, TGdiPlusMatrix pXform, TGdiPlusEffect pEffect, GpUnit pSrcUnit), GpStatus, PROC
!!!<summary>Updates the clipping region of this Graphics object to a region that is the combination of itself and the clipping region of another Graphics object.</summary>
SetClip                         PROCEDURE(TGdiPlusGraphics pSrcGraphics, GpCombineMode pCombineMode=CombineModeReplace), GpStatus, PROC
!!!<summary>Updates the clipping region of this Graphics object to a region that is the combination of itself and a rectangle.</summary>
SetClip                         PROCEDURE(CONST *GpRectF pRect, GpCombineMode pCombineMode=CombineModeReplace), GpStatus, PROC
!!!<summary>Updates the clipping region of this Graphics object to a region that is the combination of itself and a rectangle.</summary>
SetClip                         PROCEDURE(CONST *GpRect pRect, GpCombineMode pCombineMode=CombineModeReplace), GpStatus, PROC
!!!<summary>Updates the clipping region of this Graphics object to a region that is the combination of itself and the region specified by a graphics path. If a figure in the path is not closed, this method treats the nonclosed figure as if it were closed by a straight line that connects the figure's starting and ending points.</summary>
SetClip                         PROCEDURE(TGdiPlusGraphicsPath pPath, GpCombineMode pCombineMode=CombineModeReplace), GpStatus, PROC
!!!<summary>Updates the clipping region of this Graphics object to a region that is the combination of itself and the region specified by a Region object.</summary>
SetClip                         PROCEDURE(TGdiPlusRegion pRegion, GpCombineMode pCombineMode=CombineModeReplace), GpStatus, PROC
!!!<summary>Updates the clipping region of this Graphics object to a region that is the combination of itself and a Windows Graphics Device Interface (GDI) region.</summary>
SetClip                         PROCEDURE(HRGN pHrgn, GpCombineMode pCombineMode=CombineModeReplace), GpStatus, PROC
!!!<summary>Same as SetClip(CombineModeIntersect).</summary>
IntersectClip                   PROCEDURE(CONST *GpRectF pRect), GpStatus, PROC
!!!<summary>Same as SetClip(CombineModeIntersect).</summary>
IntersectClip                   PROCEDURE(CONST *GpRect pRect), GpStatus, PROC
!!!<summary>Same as SetClip(CombineModeIntersect).</summary>
IntersectClip                   PROCEDURE(TGdiPlusRegion pRegion), GpStatus, PROC
!!!<summary>Same as SetClip(CombineModeExclude).</summary>
ExcludeClip                     PROCEDURE(CONST *GpRectF pRect), GpStatus, PROC
!!!<summary>Same as SetClip(CombineModeExclude).</summary>
ExcludeClip                     PROCEDURE(CONST *GpRect pRect), GpStatus, PROC
!!!<summary>Same as SetClip(CombineModeExclude).</summary>
ExcludeClip                     PROCEDURE(TGdiPlusRegion pRegion), GpStatus, PROC
!!!<summary>Sets the clipping region of this Graphics object to an infinite region.</summary>
ResetClip                       PROCEDURE(), GpStatus, PROC
!!!<summary>Translates the clipping region of this Graphics object.</summary>
TranslateClip                   PROCEDURE(SREAL pDx, SREAL pDy), GpStatus, PROC
!!!<summary>Translates the clipping region of this Graphics object.</summary>
TranslateClipI                  PROCEDURE(SIGNED pDx, SIGNED pDy), GpStatus, PROC
!!!<summary>Gets the clipping region of this Graphics object.</summary>
GetClip                         PROCEDURE(*TGdiPlusRegion pRegion), GpStatus, PROC
!!!<summary>Gets a rectangle that encloses the clipping region of this Graphics object.</summary>
GetClipBounds                   PROCEDURE(*GpRectF pRect), GpStatus, PROC
!!!<summary>Gets a rectangle that encloses the clipping region of this Graphics object.</summary>
GetClipBounds                   PROCEDURE(*GpRect pRect), GpStatus, PROC
!!!<summary>Determines whether the clipping region of this Graphics object is empty.</summary>
IsClipEmpty                     PROCEDURE(), BOOL
!!!<summary>Gets a rectangle that encloses the visible clipping region of this Graphics object. The visible clipping region is the intersection of the clipping region of this Graphics object and the clipping region of the window.</summary>
GetVisibleClipBounds            PROCEDURE(*GpRectF pRect), GpStatus, PROC
!!!<summary>Gets a rectangle that encloses the visible clipping region of this Graphics object. The visible clipping region is the intersection of the clipping region of this Graphics object and the clipping region of the window.</summary>
GetVisibleClipBounds            PROCEDURE(*GpRect pRect), GpStatus, PROC
!!!<summary>Determines whether the visible clipping region of this Graphics object is empty. The visible clipping region is the intersection of the clipping region of this Graphics object and the clipping region of the window.</summary>
IsVisibleClipEmpty              PROCEDURE(), BOOL
!!!<summary>Determines whether the specified point is inside the visible clipping region of this Graphics object.</summary>
IsVisible                       PROCEDURE(CONST *GpPointF pPoint), BOOL
!!!<summary>Determines whether the specified point is inside the visible clipping region of this Graphics object.</summary>
IsVisible                       PROCEDURE(CONST *GpPoint pPoint), BOOL
!!!<summary>Determines whether the specified point is inside the visible clipping region of this Graphics object.</summary>
IsVisible                       PROCEDURE(SREAL pX, SREAL pY), BOOL
!!!<summary>Determines whether the specified point is inside the visible clipping region of this Graphics object.</summary>
IsVisibleI                      PROCEDURE(SIGNED pX, SIGNED pY), BOOL
!!!<summary>Determines whether the specified rectangle intersects the visible clipping region of this Graphics object.</summary>
IsVisible                       PROCEDURE(CONST *GpRectF pRect), BOOL
!!!<summary>Determines whether the specified rectangle intersects the visible clipping region of this Graphics object.</summary>
IsVisible                       PROCEDURE(CONST *GpRect pRect), BOOL
!!!<summary>Determines whether the specified rectangle intersects the visible clipping region of this Graphics object.</summary>
IsVisible                       PROCEDURE(SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight), BOOL
!!!<summary>Determines whether the specified rectangle intersects the visible clipping region of this Graphics object.</summary>
IsVisibleI                      PROCEDURE(SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight), BOOL
!!!<summary>Saves the current state (transformations, clipping region, and quality settings) of this Graphics object. You can restore the state later by calling the Restore method.</summary>
Save                            PROCEDURE(), GpGraphicsState
!!!<summary>Sets the state of this Graphics object to the state stored by a previous call to the Save method of this Graphics object.</summary>
Restore                         PROCEDURE(GpGraphicsState pState), GpStatus, PROC
                              END
