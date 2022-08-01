!* GDI+ support
!* GDI+ Pen class
!* mikeduglas 2022
!* mikeduglas@yandex.ru


!--------------------------------------------------------------------------
! GDI+ Pen class
!--------------------------------------------------------------------------
TGdiPlusPen                   CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativePen                       LONG, PROTECTED
lastResult                      GpStatus, PROTECTED

Destruct                        PROCEDURE(), VIRTUAL
!!!<summary>Creates a Pen object that uses a specified color and width.</summary>
CreatePen                       PROCEDURE(GpARGB pColor, SREAL pWidth=1.0), GpStatus, PROC
!!!<summary>Creates a Pen object that uses the attributes of a brush and a real number to set the width of this Pen object.</summary>
CreatePen                       PROCEDURE(TGdiPlusBrush pBrush, SREAL pWidth=1.0), GpStatus, PROC
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


TGdiPlusCustomLineCap         CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeCap                       LONG, PROTECTED
lastResult                      GpStatus, PROTECTED

                              END
