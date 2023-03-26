!* GDI+ support
!* Gdiplus effect objects
!* mikeduglas 2022
!* mikeduglas@yandex.ru


!- GDI+ effect GUIDs

BlurEffectGuidString                    EQUATE('{{633C80A4-1843-482b-9EF2-BE2834C5FDD4}')
SharpenEffectGuidString                 EQUATE('{{63CBF3EE-C526-402c-8F71-62C540BF5142}')
ColorMatrixEffectGuidString             EQUATE('{{718F2615-7933-40e3-A511-5F68FE14DD74}')
ColorLUTEffectGuidString                EQUATE('{{A7CE72A9-0F7F-40d7-B3CC-D0C02D5C3212}')
BrightnessContrastEffectGuidString      EQUATE('{{D3A1DBE1-8EC4-4c17-9F4C-EA97AD1C343D}')
HueSaturationLightnessEffectGuidString  EQUATE('{{8B2DD6C3-EB07-4d87-A5F0-7108E26A9C5F}')
LevelsEffectGuidString                  EQUATE('{{99C354EC-2A31-4f3a-8C34-17A803B33A25}')
TintEffectGuidString                    EQUATE('{{1077AF00-2848-4441-9489-44AD4C2D7A2C}')
ColorBalanceEffectGuidString            EQUATE('{{537E597D-251E-48da-9664-29CA496B70F8}')
RedEyeCorrectionEffectGuidString        EQUATE('{{74D29D05-69A4-4266-9549-3CC52836B632}')
ColorCurveEffectGuidString              EQUATE('{{DD6A0022-58E4-4a67-9D9B-D48EB881A53D}')


!-----------------------------------------------------------------------------

!!!<summary>typSharpenParams contains members that specify the nature of a sharpening adjustment to a bitmap.</summary>
typSharpenParams              GROUP, TYPE
!!!<summary>Specifies the sharpening radius (the radius of the convolution kernel) in pixels. The radius must be in the range 0 through 255. As the radius increases, more surrounding pixels are involved in calculating the new value of a given pixel.</summary>
radius                          SREAL
!!!<summary>Real number in the range 0 through 100 that specifies the amount of sharpening to be applied. A value of 0 specifies no sharpening. As the value of amount increases, the sharpness increases.</summary>
amount                          SREAL
                              END

!!!<summary>typBlurParams contains members that specify the nature of a Gaussian blur.</summary>
typBlurParams                 GROUP, TYPE
!!!<summary>Specifies the blur radius (the radius of the Gaussian convolution kernel) in pixels. The radius must be in the range 0 through 255. As the radius increases, the resulting bitmap becomes more blurry.</summary>
radius                          SREAL
!!!<summary>Specifies whether the bitmap expands by an amount equal to the blur radius. If TRUE, the bitmap expands by an amount equal to the radius so that it can have soft edges. If FALSE, the bitmap remains the same size and the soft edges are clipped.</summary>
expandEdge                      BOOL
                              END

!!!<summary>typBrightnessContrastParams contains members that specify the nature of a brightness or contrast adjustment.</summary>
typBrightnessContrastParams   GROUP, TYPE
!!!<summary>Integer in the range -255 through 255 that specifies the brightness level. If the value is 0, the brightness remains the same. As the value moves from 0 to 255, the brightness of the image increases. As the value moves from 0 to -255, the brightness of the image decreases.</summary>
brightnessLevel                 SIGNED
!!!<summary>Integer in the range -100 through 100 that specifies the contrast level. If the value is 0, the contrast remains the same. As the value moves from 0 to 100, the contrast of the image increases. As the value moves from 0 to -100, the contrast of the image decreases.</summary>
contrastLevel                   SIGNED
                              END

!!!<summary>typRedEyeCorrectionParams contains members that specify the areas of a bitmap to which a red-eye correction is applied.</summary>
typRedEyeCorrectionParams     GROUP, TYPE
!!!<summary>Specifies the number of _RECT_ structures in the areas array.</summary>
numberOfAreas                   UNSIGNED
!!!<summary>Pointer to an array of _RECT_ structures, each of which specifies an area of the bitmap to which red eye correction should be applied.</summary>
areas                           LONG  !RECT *
                              END

!!!<summary>typHueSaturationLightnessParams contains members that specify hue, saturation and lightness adjustments to a bitmap.</summary>
typHueSaturationLightnessParams   GROUP, TYPE
!!!<summary>Integer in the range -180 through 180 that specifies the change in hue. A value of 0 specifies no change. Positive values specify counterclockwise rotation on the color wheel. Negative values specify clockwise rotation on the color wheel.</summary>
hueLevel                            SIGNED
!!!<summary>Integer in the range -100 through 100 that specifies the change in saturation. A value of 0 specifies no change. Positive values specify increased saturation and negative values specify decreased saturation.</summary>
saturationLevel                     SIGNED
!!!<summary>Integer in the range -100 through 100 that specifies the change in lightness. A value of 0 specifies no change. Positive values specify increased lightness and negative values specify decreased lightness.</summary>
lightnessLevel                      SIGNED
                                  END

!!!<summary>typTintParams contains members that specify the nature of a tint adjustment to a bitmap.</summary>
typTintParams                 GROUP, TYPE
!!!<summary>Integer in the range -180 through 180 that specifies the hue to be strengthened or weakened.
!!!A value of 0 specifies blue. A positive value specifies a clockwise angle on the color wheel.
!!!For example, positive 60 specifies cyan and positive 120 specifies green. A negative value specifies a counter-clockwise angle on the color wheel.
!!!For example, negative 60 specifies magenta and negative 120 specifies red.</summary>
hue                             SIGNED
!!!<summary>Integer in the range -100 through 100 that specifies how much the hue (given by the hue parameter) is strengthened or weakened. A value of 0 specifies no change. Positive values specify that the hue is strengthened and negative values specify that the hue is weakened.</summary>
amount                          SIGNED
                              END

!!!<summary>typLevelsParams contains members that specify adjustments to the light, midtone, or dark areas of a bitmap.</summary>
typLevelsParams               GROUP, TYPE
!!!<summary>Integer in the range 0 through 100 that specifies which pixels should be lightened. You can use this adjustment to lighten pixels that are already lighter than a certain threshold.
!!!Setting highlight to 100 specifies no change. Setting highlight to t specifies that a color channel value is increased if it is already greater than t percent of full intensity.\
!!!For example, setting highlight to 90 specifies that all color channel values greater than 90 percent of full intensity are increased.</summary>
highlight                       SIGNED
!!!<summary>Integer in the range -100 through 100 that specifies how much to lighten or darken an image. Color channel values in the middle of the intensity range are altered more than color channel values near the minimum or maximum intensity.
!!!You can use this adjustment to lighten (or darken) an image without loosing the contrast between the darkest and lightest portions of the image. A value of 0 specifies no change.
!!!Positive values specify that the midtones are made lighter, and negative values specify that the midtones are made darker.</summary>
midtone                         SIGNED
!!!<summary>Integer in the range 0 through 100 that specifies which pixels should be darkened. You can use this adjustment to darken pixels that are already darker than a certain threshold. Setting shadow to 0 specifies no change. 
!!!Setting shadow to t specifies that a color channel value is decreased if it is already less than t percent of full intensity. 
!!!For example, setting shadow to 10 specifies that all color channel values less than 10 percent of full intensity are decreased.</summary>
shadow                          SIGNED
                              END

!!!<summary>typColorBalanceParams contains members that specify the nature of a color balance adjustment.</summary>
typColorBalanceParams         GROUP, TYPE
!!!<summary>Integer in the range -100 through 100 that specifies a change in the amount of red in the image. If the value is 0, there is no change. As the value moves from 0 to 100, the amount of red in the image increases and the amount of cyan decreases. 
!!!As the value moves from 0 to -100, the amount of red in the image decreases and the amount of cyan increases.</summary>
cyanRed                         SIGNED
!!!<summary>Integer in the range -100 through 100 that specifies a change in the amount of green in the image. If the value is 0, there is no change. As the value moves from 0 to 100, the amount of green in the image increases and the amount of magenta decreases. 
!!!As the value moves from 0 to -100, the amount of green in the image decreases and the amount of magenta increases.</summary>
magentaGreen                    SIGNED
!!!<summary>Integer in the range -100 through 100 that specifies a change in the amount of blue in the image. If the value is 0, there is no change. As the value moves from 0 to 100, the amount of blue in the image increases and the amount of yellow decreases. 
!!!As the value moves from 0 to -100, the amount of blue in the image decreases and the amount of yellow increases.</summary>
yellowBlue                      SIGNED
                              END

!ColorChannelLUT               EQUATE(BYTE,DIM(256))

!!!<summary>typColorLUTParams contains members (color lookup tables) that specify color adjustments to a bitmap.</summary>
typColorLUTParams             GROUP, TYPE
!look up tables for each color channel.
!!!<summary>Array of 256 bytes that specifies the adjustment for the blue channel.</summary>
lutB                            BYTE,DIM(256)
!!!<summary>Array of 256 bytes that specifies the adjustment for the green channel.</summary>
lutG                            BYTE,DIM(256)
!!!<summary>Array of 256 bytes that specifies the adjustment for the red channel.</summary>
lutR                            BYTE,DIM(256)
!!!<summary>Array of 256 bytes that specifies the adjustment for the alpha channel.</summary>
lutA                            BYTE,DIM(256)
                              END

GpCurveAdjustments            EQUATE(LONG)
                              ITEMIZE(0)
AdjustExposure                  EQUATE
AdjustDensity                   EQUATE
AdjustContrast                  EQUATE
AdjustHighlight                 EQUATE
AdjustShadow                    EQUATE
AdjustMidtone                   EQUATE
AdjustWhiteSaturation           EQUATE
AdjustBlackSaturation           EQUATE
                              END

GpCurveChannel                EQUATE(LONG)
                              ITEMIZE(0)
CurveChannelAll                 EQUATE
CurveChannelRed                 EQUATE
CurveChannelGreen               EQUATE
CurveChannelBlue                EQUATE
                              END

!!!<summary>typColorCurveParams contains members that specify an adjustment to the colors of a bitmap.</summary>
typColorCurveParams           GROUP, TYPE
!!!<summary>Specifies the adjustment to be applied.</summary>
adjustment                      GpCurveAdjustments
!!!<summary>Specifies the color channel to which the adjustment applies.</summary>
channel                         GpCurveChannel
!!!<summary>Specifies the intensity of the adjustment. The range of acceptable values depends on which adjustment is being applied.</summary>
adjustValue                     SIGNED
                              END

!-----------------------------------------------------------------------------

TGdiPlusEffect                CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeEffect                    LONG, PROTECTED
auxDataSize                     UNSIGNED, PROTECTED
auxData                         &STRING, PROTECTED
bUseAuxData                     BOOL, PROTECTED
lastResult                      GpStatus, PROTECTED

Destruct                        PROCEDURE(), VIRTUAL
Initialized                     PROCEDURE(), BOOL

GetAuxDataSize                  PROCEDURE(), UNSIGNED
GetAuxData                      PROCEDURE(), *STRING
UseAuxData                      PROCEDURE(<BOOL pUseAuxData>), BOOL, PROC
GetParameterSize                PROCEDURE(), UNSIGNED
SetParameters                   PROCEDURE(*GROUP pParams), GpStatus, PROC
GetParameters                   PROCEDURE(*GROUP pParams), GpStatus, PROC
                              END

TGdiPlusBlurEffect            CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typBlurParams pParams), GpStatus, PROC
GetParameters                   PROCEDURE(*typBlurParams pParams), GpStatus, PROC
                              END

TGdiPlusSharpenEffect         CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typSharpenParams pParams), GpStatus, PROC
GetParameters                   PROCEDURE(*typSharpenParams pParams), GpStatus, PROC
                              END

TGdiPlusRedEyeCorrectionEffect    CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                           PROCEDURE()
SetParameters                       PROCEDURE(typRedEyeCorrectionParams pParams), GpStatus, PROC
GetParameters                       PROCEDURE(*typRedEyeCorrectionParams pParams), GpStatus, PROC
                                  END

TGdiPlusBrightnessContrastEffect  CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                           PROCEDURE()
SetParameters                       PROCEDURE(typBrightnessContrastParams pParams), GpStatus, PROC
GetParameters                       PROCEDURE(*typBrightnessContrastParams pParams), GpStatus, PROC
                                  END

TGdiPlusHueSaturationLightnessEffect  CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                               PROCEDURE()
SetParameters                           PROCEDURE(typHueSaturationLightnessParams pParams), GpStatus, PROC
GetParameters                           PROCEDURE(*typHueSaturationLightnessParams pParams), GpStatus, PROC
                                      END

TGdiPlusLevelsEffect          CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typLevelsParams pParams), GpStatus, PROC
GetParameters                   PROCEDURE(*typLevelsParams pParams), GpStatus, PROC
                              END

TGdiPlusTintEffect            CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typTintParams pParams), GpStatus, PROC
GetParameters                   PROCEDURE(*typTintParams pParams), GpStatus, PROC
                              END

TGdiPlusColorBalanceEffect    CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typColorBalanceParams pParams), GpStatus, PROC
GetParameters                   PROCEDURE(*typColorBalanceParams pParams), GpStatus, PROC
                              END

TGdiPlusColorMatrixEffect     CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typColorMatrix pMatrix), GpStatus, PROC
GetParameters                   PROCEDURE(*typColorMatrix pMatrix), GpStatus, PROC
                              END

TGdiPlusColorLUTEffect        CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typColorLUTParams pLUT), GpStatus, PROC
GetParameters                   PROCEDURE(*typColorLUTParams pLUT), GpStatus, PROC
                              END

TGdiPlusColorCurveEffect      CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typColorCurveParams pParams), GpStatus, PROC
GetParameters                   PROCEDURE(*typColorCurveParams pParams), GpStatus, PROC
                              END
