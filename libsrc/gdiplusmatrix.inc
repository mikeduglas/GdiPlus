!* GDI+ support
!* GDI+ Matrix class
!* mikeduglas 2022
!* mikeduglas@yandex.ru


!--------------------------------------------------------------------------
! GDI+ Matrix class
!--------------------------------------------------------------------------
TGdiPlusMatrix                CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeMatrix                    LONG, PROTECTED
lastResult                      GpStatus, PROTECTED

Destruct                        PROCEDURE(), VIRTUAL
!!!<summary>Creates and initializes a Matrix object that represents the identity matrix.</summary>
CreateMatrix                    PROCEDURE(), GpStatus, PROC
!!!<summary>Creates and initializes a Matrix object based on six numbers that define an affine transformation.</summary>
CreateMatrix                    PROCEDURE(SREAL pM11, SREAL pM12, SREAL pM21, SREAL pM22, SREAL pDx, SREAL pDy), GpStatus, PROC
!!!<summary>Creates a Matrix object based on a rectangle and a point.</summary>
CreateMatrix                    PROCEDURE(CONST *GpRectF pRect, CONST *GpPointF pDstplg), GpStatus, PROC
!!!<summary>Creates a Matrix object based on a rectangle and a point.</summary>
CreateMatrix                    PROCEDURE(CONST *GpRect pRect, CONST *GpPoint pDstplg), GpStatus, PROC
!!!<summary>Cleans up resources used by a Matrix object.</summary>
DeleteMatrix                    PROCEDURE(), GpStatus, PROC
!!!<summary>Creates a new Matrix object that is a copy of this Matrix object.</summary>
Clone                           PROCEDURE(), *TGdiPlusMatrix
!!!<summary>Creates a new Matrix object that is a copy of this Matrix object.</summary>
Clone                           PROCEDURE(*TGdiPlusMatrix pClonedMatrix), GpStatus, PROC
!!!<summary>Gets the elements of this matrix. The elements are placed in an array in the order m11, m12, m21, m22, m31, m32, where mij denotes the element in row i, column j.</summary>
GetElements                     PROCEDURE(*SREAL[] pMatrixOut), GpStatus, PROC
!!!<summary>Gets the elements of this matrix.</summary>
GetElements                     PROCEDURE(*SREAL pM11, *SREAL pM12, *SREAL pM21, *SREAL pM22, *SREAL pDx, *SREAL pDy), GpStatus, PROC
!!!<summary>Sets the elements of this matrix.</summary>
SetElements                     PROCEDURE(SREAL pM11, SREAL pM12, SREAL pM21, SREAL pM22, SREAL pDx, SREAL pDy), GpStatus, PROC
!!!<summary>Sets the elements of this matrix.</summary>
SetElements                     PROCEDURE(*SREAL[] pMatrixIn), GpStatus, PROC
!!!<summary>Returns m31.</summary>
OffsetX                         PROCEDURE(), SREAL
!!!<summary>Returns m32.</summary>
OffsetY                         PROCEDURE(), SREAL
!!!<summary>Set elements to {1.0, 0.0, 0.0, 1.0, 0.0, 0.0}.</summary>
ResetMatrixElements             PROCEDURE(), GpStatus, PROC
!!!<summary>Updates this matrix with the product of itself and another matrix.</summary>
Multiply                        PROCEDURE(TGdiPlusMatrix pMatrix, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this matrix with the product of itself and a translation matrix.</summary>
Translate                       PROCEDURE(SREAL pOffsetX, SREAL pOffsetY, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this matrix with the product of itself and a scaling matrix.</summary>
Scale                           PROCEDURE(SREAL pScaleX, SREAL pScaleY, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this matrix with the product of itself and a rotation matrix.</summary>
Rotate                          PROCEDURE(SREAL pAngle, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this matrix with the product of itself and a rotation matrix.</summary>
RotateAt                        PROCEDURE(SREAL pAngle, CONST *GpPointF pCenter, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this matrix with the product of itself and a shearing matrix.</summary>
Shear                           PROCEDURE(SREAL pShearX, SREAL pShearY, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>If this matrix is invertible, the Invert method replaces the elements of this matrix with the elements of its inverse.</summary>
Invert                          PROCEDURE(), GpStatus, PROC
!!!<summary>Multiplies each point in an array by this matrix. Each point is treated as a row matrix. The multiplication is performed with the row matrix on the left and this matrix on the right.</summary>
TransformPoints                 PROCEDURE(LONG pPoints, UNSIGNED pCount=1), GpStatus, PROC
!!!<summary>Multiplies each point in an array by this matrix. Each point is treated as a row matrix. The multiplication is performed with the row matrix on the left and this matrix on the right.</summary>
TransformPointsI                PROCEDURE(LONG pPoints, UNSIGNED pCount=1), GpStatus, PROC
!!!<summary>Multiplies each vector in an array by this matrix. The translation elements of this matrix (third row) are ignored. Each vector is treated as a row matrix. The multiplication is performed with the row matrix on the left and this matrix on the right.</summary>
TransformVectors                PROCEDURE(LONG pPoints, UNSIGNED pCount=1), GpStatus, PROC
!!!<summary>Multiplies each vector in an array by this matrix. The translation elements of this matrix (third row) are ignored. Each vector is treated as a row matrix. The multiplication is performed with the row matrix on the left and this matrix on the right.</summary>
TransformVectorsI               PROCEDURE(LONG pPoints, UNSIGNED pCount=1), GpStatus, PROC
!!!<summary>Determines whether this matrix is invertible.</summary>
IsInvertible                    PROCEDURE(), BOOL
!!!<summary>Determines whether this matrix is the identity matrix.</summary>
IsIdentity                      PROCEDURE(), BOOL
!!!<summary>Determines whether the elements of this matrix are equal to the elements of another matrix.</summary>
Equals                          PROCEDURE(TGdiPlusMatrix pMatrix), BOOL
                              END
