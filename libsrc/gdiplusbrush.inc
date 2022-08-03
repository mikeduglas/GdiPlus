!* GDI+ support
!* GDI+ Brush classes
!* mikeduglas 2022
!* mikeduglas@yandex.ru


!--------------------------------------------------------------------------
! Abstract base class for various brush types
!--------------------------------------------------------------------------
TGdiPlusBrush                 CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeBrush                     LONG, PROTECTED
lastResult                      GpStatus, PROTECTED

Destruct                        PROCEDURE(), VIRTUAL
!!!<summary>Cleans up resources used by a Brush object.</summary>
DeleteBrush                     PROCEDURE(), GpStatus, PROC
!!!<summary>Creates a new Brush object based on this brush.</summary>
Clone                           PROCEDURE(*TGdiPlusBrush pCloneBrush), GpStatus, PROC
!!!<summary>Gets the type of this brush.</summary>
GetType                         PROCEDURE(), GpBrushType
                              END

!--------------------------------------------------------------------------
! Solid Fill Brush Object
!--------------------------------------------------------------------------
TGdiPlusSolidBrush            CLASS(TGdiPlusBrush), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
!!!<summary>Creates a SolidBrush object based on a color.</summary>
CreateSolidBrush                PROCEDURE(GpARGB pColor), GpStatus, PROC
!!!<summary>Sets the color of this solid brush.</summary>
SetColor                        PROCEDURE(GpARGB pColor), GpStatus, PROC
!!!<summary>Gets the color of this solid brush.</summary>
GetColor                        PROCEDURE(), GpARGB
                              END


!--------------------------------------------------------------------------
! Texture Brush Fill Object
!--------------------------------------------------------------------------
TGdiPlusTextureBrush          CLASS(TGdiPlusBrush), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
!!!<summary>Creates a TextureBrush object based on an image and a wrap mode. The size of the brush defaults to the size of the image, so the entire image is used by the brush.</summary>
CreateTextureBrush              PROCEDURE(TGdiPlusImage pImage, GpWrapMode pWrapMode=WrapModeTile), GpStatus, PROC

!!!<summary>Creates a TextureBrush object based on an image, a wrap mode, and a defining set of coordinates.</summary>
CreateTextureBrush              PROCEDURE(TGdiPlusImage pImage, GpWrapMode pWrapMode, CONST *GpRectF pDstRect), GpStatus, PROC
!!!<summary>Creates a TextureBrush object based on an image, a wrap mode, and a defining set of coordinates.</summary>
CreateTextureBrush              PROCEDURE(TGdiPlusImage pImage, GpWrapMode pWrapMode, CONST *GpRect pDstRect), GpStatus, PROC
!!!<summary>Creates a TextureBrush object based on an image, a wrap mode, and a defining set of coordinates.</summary>
CreateTextureBrush              PROCEDURE(TGdiPlusImage pImage, GpWrapMode pWrapMode, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight), GpStatus, PROC
!!!<summary>Creates a TextureBrush object based on an image, a wrap mode, and a defining set of coordinates.</summary>
CreateTextureBrushI             PROCEDURE(TGdiPlusImage pImage, GpWrapMode pWrapMode, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight), GpStatus, PROC

!!!<summary>Creates a TextureBrush object based on an image, a defining rectangle, and a set of image properties.</summary>
CreateTextureBrush              PROCEDURE(TGdiPlusImage pImage, TGdiPlusImageAttributes pImageAttrs, CONST *GpRectF pDstRect), GpStatus, PROC
!!!<summary>Creates a TextureBrush object based on an image, a defining rectangle, and a set of image properties.</summary>
CreateTextureBrush              PROCEDURE(TGdiPlusImage pImage, TGdiPlusImageAttributes pImageAttrs, CONST *GpRect pDstRect), GpStatus, PROC
!!!<summary>Creates a TextureBrush object based on an image, a defining rectangle, and a set of image properties.</summary>
CreateTextureBrush              PROCEDURE(TGdiPlusImage pImage, TGdiPlusImageAttributes pImageAttrs, SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight), GpStatus, PROC
!!!<summary>Creates a TextureBrush object based on an image, a defining rectangle, and a set of image properties.</summary>
CreateTextureBrushI             PROCEDURE(TGdiPlusImage pImage, TGdiPlusImageAttributes pImageAttrs, SIGNED pX, SIGNED pY, SIGNED pWidth, SIGNED pHeight), GpStatus, PROC

!!!<summary>Sets the transformation matrix of this texture brush.</summary>
SetTransform                    PROCEDURE(TGdiPlusMatrix pMatrix), GpStatus, PROC
!!!<summary>Gets the transformation matrix of this texture brush.</summary>
GetTransform                    PROCEDURE(*TGdiPlusMatrix pMatrix), GpStatus, PROC
!!!<summary>Resets the transformation matrix of this texture brush to the identity matrix. This means that no transformation takes place.</summary>
ResetTransform                  PROCEDURE(), GpStatus, PROC
!!!<summary>Updates this brush's transformation matrix with the product of itself and another matrix.</summary>
MultiplyTransform               PROCEDURE(TGdiPlusMatrix pMatrix, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this brush's current transformation matrix with the product of itself and a translation matrix.</summary>
TranslateTransform              PROCEDURE(SREAL pDx, SREAL pDy, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this texture brush's current transformation matrix with the product of itself and a scaling matrix.</summary>
ScaleTransform                  PROCEDURE(SREAL pSx, SREAL pSy, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this texture brush's current transformation matrix with the product of itself and a rotation matrix.</summary>
RotateTransform                 PROCEDURE(SREAL pAngle, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Sets the wrap mode of this texture brush.</summary>
SetWrapMode                     PROCEDURE(GpWrapMode pMode), GpStatus, PROC
!!!<summary>Gets the wrap mode currently set for this texture brush.</summary>
GetWrapMode                     PROCEDURE(), GpWrapMode
!!!<summary>Gets an Image object that is defined by this texture brush.</summary>
GetImage                        PROCEDURE(*TGdiPlusImage pImage), GpStatus, PROC
                              END


!--------------------------------------------------------------------------
! Linear Gradient Brush Object
!--------------------------------------------------------------------------
TGdiPlusLinearGradientBrush   CLASS(TGdiPlusBrush), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
!!!<summary>Creates a LinearGradientBrush object from a set of boundary points and boundary colors.</summary>
CreateLineBrush                 PROCEDURE(CONST *GpPointF pPt1, CONST *GpPointF pPt2, GpARGB pColor1, GpARGB pColor2), GpStatus, PROC
!!!<summary>Creates a LinearGradientBrush object from a set of boundary points and boundary colors.</summary>
CreateLineBrush                 PROCEDURE(CONST *GpPoint pPt1, CONST *GpPoint pPt2, GpARGB pColor1, GpARGB pColor2), GpStatus, PROC

!!!<summary>Creates a LinearGradientBrush object based on a rectangle and mode of direction.</summary>
CreateLineBrush                 PROCEDURE(CONST *GpRectF pRect, GpARGB pColor1, GpARGB pColor2, GpLinearGradientMode pMode), GpStatus, PROC
!!!<summary>Creates a LinearGradientBrush object based on a rectangle and mode of direction.</summary>
CreateLineBrush                 PROCEDURE(CONST *GpRect pRect, GpARGB pColor1, GpARGB pColor2, GpLinearGradientMode pMode), GpStatus, PROC

!!!<summary>Creates a LinearGradientBrush object from a rectangle and angle of direction.</summary>
CreateLineBrush                 PROCEDURE(CONST *GpRectF pRect, GpARGB pColor1, GpARGB pColor2, SREAL pAngle, BOOL pIsAngleScalable), GpStatus, PROC
!!!<summary>Creates a LinearGradientBrush object from a rectangle and angle of direction.</summary>
CreateLineBrush                 PROCEDURE(CONST *GpRect pRect, GpARGB pColor1, GpARGB pColor2, SREAL pAngle, BOOL pIsAngleScalable), GpStatus, PROC

!!!<summary>Sets the starting color and ending color of this linear gradient brush.</summary>
SetLinearColors                 PROCEDURE(GpARGB pColor1, GpARGB pColor2), GpStatus, PROC
!!!<summary>Gets the starting color and ending color of this linear gradient brush.</summary>
GetLinearColors                 PROCEDURE(*GpARGB pColor1, *GpARGB pColor2), GpStatus, PROC
!!!<summary>Gets the rectangle that defines the boundaries of the gradient.</summary>
GetRectangle                    PROCEDURE(*GpRectF pRect), GpStatus, PROC
!!!<summary>Gets the rectangle that defines the boundaries of the gradient.</summary>
GetRectangle                    PROCEDURE(*GpRect pRect), GpStatus, PROC
!!!<summary>Specifies whether gamma correction is enabled for this linear gradient brush.</summary>
SetGammaCorrection              PROCEDURE(BOOL pUseGammaCorrection), GpStatus, PROC
!!!<summary>Determines whether gamma correction is enabled.</summary>
GetGammaCorrection              PROCEDURE(), BOOL
!!!<summary>Gets the number of blend factors currently set..</summary>
GetBlendCount                   PROCEDURE(), UNSIGNED
!!!<summary>Sets the blend factors and the blend positions of this linear gradient brush to create a custom blend.</summary>
SetBlend                        PROCEDURE(*SREAL[] pBlendFactors, *SREAL[] pBlendPositions), GpStatus, PROC
!!!<summary>Gets the blend factors and their corresponding blend positions from a LinearGradientBrush object.</summary>
GetBlend                        PROCEDURE(*SREAL[] pBlendFactors, *SREAL[] pBlendPositions), GpStatus, PROC
!!!<summary>Gets the number of colors currently set to be interpolated for this linear gradient brush.</summary>
GetInterpolationColorCount      PROCEDURE(), UNSIGNED
!!!<summary>Sets the colors to be interpolated for this linear gradient brush and their corresponding blend positions.</summary>
SetInterpolationColors          PROCEDURE(*GpARGB[] pPresetColors, *SREAL[] pBlendPositions), GpStatus, PROC
!!!<summary>Gets the colors currently set to be interpolated for this linear gradient brush and their corresponding blend positions.</summary>
GetInterpolationColors          PROCEDURE(*GpARGB[] pPresetColors, *SREAL[] pBlendPositions), GpStatus, PROC
!!!<summary>Sets the blend shape of this linear gradient brush to create a custom blend based on a bell-shaped curve.</summary>
SetBlendBellShape               PROCEDURE(SREAL pFocus, SREAL pScale=1.0), GpStatus, PROC
!!!<summary>Sets the blend shape of this linear gradient brush to create a custom blend based on a triangular shape.</summary>
SetBlendTriangularShape         PROCEDURE(SREAL pFocus, SREAL pScale=1.0), GpStatus, PROC
!!!<summary>Sets the transformation matrix of this linear gradient brush.</summary>
SetTransform                    PROCEDURE(TGdiPlusMatrix pMatrix), GpStatus, PROC
!!!<summary>Gets the transformation matrix of this linear gradient brush.</summary>
GetTransform                    PROCEDURE(*TGdiPlusMatrix pMatrix), GpStatus, PROC
!!!<summary>Resets the transformation matrix of this linear gradient brush to the identity matrix. This means that no transformation takes place.</summary>
ResetTransform                  PROCEDURE(), GpStatus, PROC
!!!<summary>Updates this brush's transformation matrix with the product of itself and another matrix.</summary>
MultiplyTransform               PROCEDURE(TGdiPlusMatrix pMatrix, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this brush's current transformation matrix with the product of itself and a translation matrix.</summary>
TranslateTransform              PROCEDURE(SREAL pDx, SREAL pDy, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this brush's current transformation matrix with the product of itself and a scaling matrix.</summary>
ScaleTransform                  PROCEDURE(SREAL pSx, SREAL pSy, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Updates this brush's current transformation matrix with the product of itself and a rotation matrix.</summary>
RotateTransform                 PROCEDURE(SREAL pAngle, GpMatrixOrder pOrder=MatrixOrderPrepend), GpStatus, PROC
!!!<summary>Sets the wrap mode of this linear gradient brush.</summary>
SetWrapMode                     PROCEDURE(GpWrapMode pMode), GpStatus, PROC
!!!<summary>Gets the wrap mode for this brush. The wrap mode determines how an area is tiled when it is painted with a brush.</summary>
GetWrapMode                     PROCEDURE(), GpWrapMode
                              END


!--------------------------------------------------------------------------
! Hatch Brush Object
!--------------------------------------------------------------------------
TGdiPlusHatchBrush            CLASS(TGdiPlusBrush), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
!!!<summary>Creates a HatchBrush object based on a hatch style, a foreground color, and a background color.</summary>
CreateHatchBrush                PROCEDURE(GpHatchStyle pHatchStyle, GpARGB pForeColor, GpARGB pBackColor=COLOR:Black), GpStatus, PROC
!!!<summary>Gets the hatch style of this hatch brush.</summary>
GetHatchStyle                   PROCEDURE(), GpHatchStyle
!!!<summary>Gets the foreground color of this hatch brush.</summary>
GetForegroundColor              PROCEDURE(), GpARGB
!!!<summary>Gets the background color of this hatch brush.</summary>
GetBackgroundColor              PROCEDURE(), GpARGB
                              END




!--------------------------------------------------------------------------
! GDI+ ImageAttributes class
!--------------------------------------------------------------------------
TGdiPlusImageAttributes       CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeImageAttr                 LONG, PROTECTED
lastResult                      GpStatus, PROTECTED

Destruct                        PROCEDURE(), VIRTUAL
!!!<summary>Creates an ImageAttributes object.</summary>
CreateImageAttributes           PROCEDURE(), GpStatus, PROC
!!!<summary>Releases resources used by the ImageAttributes object.</summary>
DeleteImageAttributes           PROCEDURE(), GpStatus, PROC
!!!<summary>Makes a copy of this ImageAttributes object.</summary>
Clone                           PROCEDURE(*TGdiPlusImageAttributes pCloneImageAttr), GpStatus, PROC
!!!<summary>Sets the color-adjustment matrix of a specified category to identity matrix.</summary>
SetToIdentity                   PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Clears all color- and grayscale-adjustment settings for a specified category.</summary>
Reset                           PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Sets the color-adjustment matrix for a specified category.</summary>
SetColorMatrix                  PROCEDURE(typColorMatrix pColorMatrix, GpColorMatrixFlags pMode=ColorMatrixFlagsDefault, GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Clears the color-adjustment matrix for a specified category.</summary>
ClearColorMatrix                PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Sets the color- and grayscale-adjustment matrices for a specified category.</summary>
SetColorMatrices                PROCEDURE(typColorMatrix pColorMatrix, typColorMatrix pGrayMatrix, GpColorMatrixFlags pMode=ColorMatrixFlagsDefault, GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Clears the color- and grayscale-adjustment matrices for a specified category.</summary>
ClearColorMatrices              PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Sets the threshold (transparency range) for a specified category.</summary>
SetThreshold                    PROCEDURE(SREAL pThreshold, GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Clears the threshold (transparency range) for a specified category.</summary>
ClearThreshold                  PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Sets the gamma value for a specified category.</summary>
SetGamma                        PROCEDURE(SREAL pGamma, GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Clears the gamma value for a specified category.</summary>
ClearGamma                      PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Turns off color adjustment for a specified category. You can call the ClearNoOp method to reinstate the color-adjustment settings that were in place before the call to SetNoOp method.</summary>
SetNoOp                         PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Turns onn color adjustment for a specified category.</summary>
ClearNoOp                       PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Sets the color key (transparency range) for a specified category.</summary>
SetColorKey                     PROCEDURE(GpARGB pColorLow, GpARGB pColorHigh, GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Clears the color key (transparency range) for a specified category.</summary>
ClearColorKey                   PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Sets the cyan-magenta-yellow-black (CMYK) output channel for a specified category.</summary>
SetOutputChannel                PROCEDURE(GpColorChannelFlags pChannelFlags, GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Clears the cyan-magenta-yellow-black (CMYK) output channel for a specified category.</summary>
ClearOutputChannel              PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Sets the output channel color-profile file for a specified category.</summary>
SetOutputChannelColorProfile    PROCEDURE(STRING pColorProfileFilename, GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Clears the output channel color-profile file for a specified category.</summary>
ClearOutputChannelColorProfile  PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Sets the color-remap table for a specified category.</summary>
SetRemapTable                   PROCEDURE(UNSIGNED pMapSize, LONG pMap, GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Clears the color-remap table for a specified category.</summary>
ClearRemapTable                 PROCEDURE(GpColorAdjustType pType=ColorAdjustTypeDefault), GpStatus, PROC
!!!<summary>Sets the color-remap table for a brush category.</summary>
SetBrushRemapTable              PROCEDURE(UNSIGNED pMapSize, LONG pMap), GpStatus, PROC
!!!<summary>Clears the color-remap table for a brush category.</summary>
ClearBrushRemapTable            PROCEDURE(), GpStatus, PROC
!!!<summary>Sets the wrap mode of this ImageAttributes object.</summary>
SetWrapMode                     PROCEDURE(GpWrapMode pWrap, GpARGB pColor=0FF000000h, BOOL pClamp=FALSE), GpStatus, PROC
!!!<summary>Adjusts the colors in a palette according to the adjustment settings of a specified category.</summary>
GetAdjustedPalette              PROCEDURE(*typColorPalette pColorPalette, GpColorAdjustType pType), GpStatus, PROC

                              END
