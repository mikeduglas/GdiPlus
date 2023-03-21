!* GDI+ support
!* GDI+ Pen class
!* mikeduglas 2023
!* mikeduglas@yandex.ru


!--------------------------------------------------------------------------
! GDI+ Pen class
!--------------------------------------------------------------------------
TGdiPlusPen                   CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativePen                       LONG, PROTECTED
lastResult                      GpStatus, PROTECTED

Destruct                        PROCEDURE(), VIRTUAL
Initialized                     PROCEDURE(), BOOL

!!!<summary>Creates a Pen object that uses a specified color and width.</summary>
CreatePen                       PROCEDURE(GpARGB pColor, SREAL pWidth=1.0, GpUnit pUnit=UnitWorld), GpStatus, PROC
!!!<summary>Creates a Pen object that uses the attributes of a brush and a real number to set the width of this Pen object.</summary>
CreatePen                       PROCEDURE(TGdiPlusBrush pBrush, SREAL pWidth=1.0, GpUnit pUnit=UnitWorld), GpStatus, PROC
!!!<summary>Releases resources used by the Pen object.</summary>
DeletePen                       PROCEDURE(), GpStatus, PROC
!!!<summary>Copies a Pen object.</summary>
Clone                           PROCEDURE(*TGdiPlusPen pClonePen), GpStatus, PROC
!!!<summary>Sets the width for this Pen object.</summary>
SetWidth                        PROCEDURE(SREAL pWidth), GpStatus, PROC
!!!<summary>Gets the width currently set for this Pen object.</summary>
GetWidth                        PROCEDURE(), SREAL
!!!<summary>Sets the cap styles for the start, end, and dashes in a line drawn with this pen.</summary>
SetLineCap                      PROCEDURE(GpLineCap pStartCap, GpLineCap pEndCap, GpDashCap pDashCap), GpStatus, PROC
!!!<summary>Sets the start cap for this Pen object.</summary>
SetStartCap                     PROCEDURE(GpLineCap pStartCap), GpStatus, PROC
!!!<summary>Gets the start cap currently set for this Pen object.</summary>
GetStartCap                     PROCEDURE(), GpLineCap
!!!<summary>Sets the end cap for this Pen object.</summary>
SetEndCap                       PROCEDURE(GpLineCap pEndCap), GpStatus, PROC
!!!<summary>Gets the end cap currently set for this Pen object.</summary>
GetEndCap                       PROCEDURE(), GpLineCap
!!!<summary>Sets the dash cap style for this Pen object.</summary>
SetDashCap                      PROCEDURE(GpDashCap pDashCap), GpStatus, PROC
!!!<summary>Gets the dash cap style currently set for this Pen object.</summary>
GetDashCap                      PROCEDURE(), GpDashCap
!!!<summary>Sets the line join for this Pen object.</summary>
SetLineJoin                     PROCEDURE(GpLineJoin pLineJoin), GpStatus, PROC
!!!<summary>Gets the line join for this Pen object.</summary>
GetLineJoin                     PROCEDURE(), GpLineJoin
!!!<summary>Sets the custom start cap for this Pen object.</summary>
SetCustomStartCap               PROCEDURE(TGdiPlusCustomLineCap pCustomCap), GpStatus, PROC
!!!<summary>Gets the custom start cap for this Pen object.</summary>
GetCustomStartCap               PROCEDURE(*TGdiPlusCustomLineCap pCustomCap), GpStatus, PROC
!!!<summary>Sets the custom end cap for this Pen object.</summary>
SetCustomEndCap                 PROCEDURE(TGdiPlusCustomLineCap pCustomCap), GpStatus, PROC
!!!<summary>Gets the custom end cap for this Pen object.</summary>
GetCustomEndCap                 PROCEDURE(*TGdiPlusCustomLineCap pCustomCap), GpStatus, PROC
!!!<summary>Sets the miter length for this Pen object.</summary>
SetMiterLimit                   PROCEDURE(SREAL pMiterLimit), GpStatus, PROC
!!!<summary>Gets the miter length currently set for this Pen object.</summary>
GetMiterLimit                   PROCEDURE(), SREAL
!!!<summary>Sets the alignment for this Pen object.</summary>
SetAlignment                    PROCEDURE(GpPenAlignment pPenAlignment), GpStatus, PROC
!!!<summary>Gets the alignment currently set for this Pen object.</summary>
GetAlignment                    PROCEDURE(), GpPenAlignment
!!!<summary>Sets the world transformation matrix for this Pen object.</summary>
SetTransform                    PROCEDURE(TGdiPlusMatrix pMatrix), GpStatus, PROC
!!!<summary>Gets the world transformation matrix currently set for this Pen object.</summary>
GetTransform                    PROCEDURE(*TGdiPlusMatrix pMatrix), GpStatus, PROC
!!!<summary>Sets the world transformation matrix of this Pen object to the identity matrix.</summary>
ResetTransform                  PROCEDURE(), GpStatus, PROC
!!!<summary>Updates the world transformation matrix of this Pen object with the product of itself and another matrix.</summary>
MultiplyTransform               PROCEDURE(TGdiPlusMatrix pMatrix, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>No summary</summary>
TranslateTransform              PROCEDURE(SREAL pDx, SREAL pDy, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Sets the Pen object's world transformation matrix equal to the product of itself and a scaling matrix.</summary>
ScaleTransform                  PROCEDURE(SREAL pSx, SREAL pSy, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates the world transformation matrix of this Pen object with the product of itself and a rotation matrix.</summary>
RotateTransform                 PROCEDURE(SREAL pAngle, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Gets the type currently set for this Pen object.</summary>
GetPenType                      PROCEDURE(), GpPenType
!!!<summary>Sets the color for this Pen object.</summary>
SetColor                        PROCEDURE(GpARGB pColor), GpStatus, PROC
!!!<summary>Gets the color for this Pen object.</summary>
GetColor                        PROCEDURE(), GpARGB
!!!<summary>Sets the Brush object that a pen uses to fill a line.</summary>
SetBrush                        PROCEDURE(TGdiPlusBrush pBrush), GpStatus, PROC
!!!<summary>Gets the Brush object that a pen uses to fill a line.</summary>
GetBrush                        PROCEDURE(*TGdiPlusBrush pBrush), GpStatus, PROC
!!!<summary>Sets the dash style for this Pen object.</summary>
SetDashStyle                    PROCEDURE(GpDashStyle pStyle), GpStatus, PROC
!!!<summary>Gets the dash style currently set for this Pen object.</summary>
GetDashStyle                    PROCEDURE(), GpDashStyle
!!!<summary>Sets the distance from the start of the line to the start of the first space in a dashed line.</summary>
SetDashOffset                   PROCEDURE(SREAL pOffset), GpStatus, PROC
!!!<summary>Gets the distance from the start of the line to the start of the first space in a dashed line.</summary>
GetDashOffset                   PROCEDURE(), SREAL
!!!<summary>Gets the number of elements in a dash pattern array.</summary>
GetDashPatternCount             PROCEDURE(), UNSIGNED
!!!<summary>Sets an array of custom dashes and spaces for this Pen object.</summary>
SetDashPattern                  PROCEDURE(*SREAL[] pArray), GpStatus, PROC
!!!<summary>Gets an array of custom dashes and spaces currently set for this Pen object.</summary>
GetDashPattern                  PROCEDURE(*SREAL[] pArray), GpStatus, PROC
!!!<summary>Gets the number of elements in a compound array.</summary>
GetCompoundArrayCount           PROCEDURE(), UNSIGNED
!!!<summary>Sets the compound array for this Pen object.</summary>
SetCompoundArray                PROCEDURE(*SREAL[] pArray), GpStatus, PROC
!!!<summary>Gets the compound array currently set for this Pen object.</summary>
GetCompoundArray                PROCEDURE(*SREAL[] pArray), GpStatus, PROC
                              END


!--------------------------------------------------------------------------
! CustomLineCap class
!--------------------------------------------------------------------------
TGdiPlusCustomLineCap         CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeCap                       LONG, PROTECTED
lastResult                      GpStatus, PROTECTED

Destruct                        PROCEDURE(), VIRTUAL
Initialized                     PROCEDURE(), BOOL

!!!<summary>Creates a CustomLineCap object.</summary>
CreateCustomLineCap             PROCEDURE(TGdiPlusGraphicsPath pFillPath, TGdiPlusGraphicsPath pStrokePath, GpLineCap pBaseCap=LineCapFlat, SREAL pBaseInset=0), GpStatus, PROC
!!!<summary>Cleans up resources used by a CustomLineCap object.</summary>
DeleteCustomLineCap             PROCEDURE(), GpStatus, PROC
!!!<summary>Copies the contents of the existing object into a new CustomLineCap object.</summary>
Clone                           PROCEDURE(*TGdiPlusCustomLineCap pCloneCap), GpStatus, PROC
!!!<summary>Sets the LineCap object used to start and end lines within the GraphicsPath object that defines this CustomLineCap object.</summary>
SetStrokeCap                    PROCEDURE(GpLineCap pStrokeCap), GpStatus, PROC
!!!<summary>Sets the end cap styles for both the start line cap and the end line cap.</summary>
SetStrokeCaps                   PROCEDURE(GpLineCap pStartCap, GpLineCap pEndCap), GpStatus, PROC
!!!<summary>Gets the end cap styles for both the start line cap and the end line cap.</summary>
GetStrokeCaps                   PROCEDURE(*GpLineCap pStartCap, *GpLineCap pEndCap), GpStatus, PROC
!!!<summary>Sets the style of line join for the stroke. The line join specifies how two lines that intersect within the GraphicsPath object that makes up the custom line cap are joined.</summary>
SetStrokeJoin                   PROCEDURE(GpLineJoin pLineJoin), GpStatus, PROC
!!!<summary>Returns the style of LineJoin used to join multiple lines in the same GraphicsPath object.</summary>
GetStrokeJoin                   PROCEDURE(), GpLineJoin
!!!<summary>Sets the LineCap that appears as part of this CustomLineCap at the end of a line.</summary>
SetBaseCap                      PROCEDURE(GpLineCap pBaseCap), GpStatus, PROC
!!!<summary>Gets the style of the base cap. The base cap is a LineCap object used as a cap at the end of a line along with this CustomLineCap object.</summary>
GetBaseCap                      PROCEDURE(), GpLineCap
!!!<summary>Sets the base inset value of this custom line cap. This is the distance between the end of a line and the base cap.</summary>
SetBaseInset                    PROCEDURE(SREAL pInset), GpStatus, PROC
!!!<summary>Gets the distance between the base cap to the start of the line.</summary>
GetBaseInset                    PROCEDURE(), SREAL
!!!<summary>Sets the value of the scale width. This is the amount to scale the custom line cap relative to the width of the Pen used to draw lines. The default value of 1.0 does not scale the line cap.</summary>
SetWidthScale                   PROCEDURE(SREAL pWidthScale), GpStatus, PROC
!!!<summary>Gets the value of the scale width.</summary>
GetWidthScale                   PROCEDURE(), SREAL
                              END

!--------------------------------------------------------------------------
! AdjustableArrowCap class
!--------------------------------------------------------------------------
TGdiPlusAdjustableArrowCap    CLASS(TGdiPlusCustomLineCap), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
!!!<summary>Creates an adjustable arrow line cap with the specified height and width. The arrow line cap can be filled or nonfilled. The middle inset defaults to zero.</summary>
CreateAdjustableArrowCap        PROCEDURE(SREAL pHeight, SREAL pWidth, BOOL pIsFilled=TRUE), GpStatus, PROC
!!!<summary>Sets the height of the arrow cap. This is the distance from the base of the arrow to its vertex.</summary>
SetHeight                       PROCEDURE(SREAL pHeight), GpStatus, PROC
!!!<summary>Gets the height of the arrow cap. This is the distance from the base of the arrow to its vertex.</summary>
GetHeight                       PROCEDURE(), SREAL
!!!<summary>Sets the width of the arrow cap. The width is the distance between the endpoints of the base of the arrow.</summary>
SetWidth                        PROCEDURE(SREAL pWidth), GpStatus, PROC
!!!<summary>Gets the width of the arrow cap. The width is the distance between the endpoints of the base of the arrow.</summary>
GetWidth                        PROCEDURE(), SREAL
!!!<summary>Sets the number of units that the midpoint of the base shifts towards the vertex.</summary>
SetMiddleInset                  PROCEDURE(SREAL pMiddleInset), GpStatus, PROC
!!!<summary>Gets the value of the inset. The middle inset is the number of units that the midpoint of the base shifts towards the vertex.</summary>
GetMiddleInset                  PROCEDURE(), SREAL
!!!<summary>Sets the fill state of the arrow cap. If the arrow cap is not filled, only the outline is drawn.</summary>
SetFillState                    PROCEDURE(BOOL pIsFilled), GpStatus, PROC
!!!<summary>Determines whether the arrow cap is filled.</summary>
IsFilled                        PROCEDURE(), BOOL
                              END