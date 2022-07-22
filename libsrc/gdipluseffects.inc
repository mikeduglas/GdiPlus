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

typSharpenParams              GROUP, TYPE
radius                          SREAL
amount                          SREAL
                              END

typBlurParams                 GROUP, TYPE
radius                          SREAL
expandEdge                      BOOL
                              END

typBrightnessContrastParams   GROUP, TYPE
brightnessLevel                 SIGNED
contrastLevel                   SIGNED
                              END

typRedEyeCorrectionParams     GROUP, TYPE
numberOfAreas                   UNSIGNED
areas                           LONG  !RECT *
                              END

typHueSaturationLightnessParams   GROUP, TYPE
hueLevel                            SIGNED
saturationLevel                     SIGNED
lightnessLevel                      SIGNED
                                  END

typTintParams                 GROUP, TYPE
hue                             SIGNED
amount                          SIGNED
                              END

typLevelsParams               GROUP, TYPE
highlight                       SIGNED
midtone                         SIGNED
shadow                          SIGNED
                              END

typColorBalanceParams         GROUP, TYPE
cyanRed                         SIGNED
magentaGreen                    SIGNED
yellowBlue                      SIGNED
                              END

!ColorChannelLUT               EQUATE(BYTE,DIM(256))

typColorLUTParams             GROUP, TYPE
!look up tables for each color channel.
lutB                            BYTE,DIM(256)
lutG                            BYTE,DIM(256)
lutR                            BYTE,DIM(256)
lutA                            BYTE,DIM(256)
                              END

GpCurveAdjustments            EQUATE(LONG)
                              ITEMIZE
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
                              ITEMIZE
CurveChannelAll                 EQUATE
CurveChannelRed                 EQUATE
CurveChannelGreen               EQUATE
CurveChannelBlue                EQUATE
                              END

typColorCurveParams           GROUP, TYPE
adjustment                      GpCurveAdjustments
channel                         GpCurveChannel
adjustValue                     SIGNED
                              END

typColorMatrix                GROUP, TYPE
m                               SREAL,DIM(5,5)
                              END

!-----------------------------------------------------------------------------

TGdiPlusEffect                CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeEffect                    LONG, PROTECTED
auxDataSize                     UNSIGNED, PROTECTED
auxData                         &STRING, PROTECTED
bUseAuxData                     BOOL, PROTECTED
lastResult                      GpStatus, PROTECTED

Destruct                        PROCEDURE(), VIRTUAL
GetAuxDataSize                  PROCEDURE(), UNSIGNED
GetAuxData                      PROCEDURE(), *STRING
UseAuxData                      PROCEDURE(<BOOL pUseAuxData>), BOOL, PROC
GetParameterSize                PROCEDURE(), UNSIGNED
SetParameters                   PROCEDURE(STRING pParams, UNSIGNED pSize), GpStatus, PROC, PROTECTED
GetParameters                   PROCEDURE(*UNSIGNED pSize, *STRING pParams), GpStatus, PROC, PROTECTED
                              END

TGdiPlusBlurEffect            CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typBlurParams pParams), GpStatus, PROC
GetParameters                   PROCEDURE(*UNSIGNED pSize, *typBlurParams pParams), GpStatus, PROC
                              END

TGdiPlusSharpenEffect         CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typSharpenParams pParams), GpStatus, PROC
GetParameters                   PROCEDURE(*UNSIGNED pSize, *typSharpenParams pParams), GpStatus, PROC
                              END

TGdiPlusRedEyeCorrectionEffect    CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                           PROCEDURE()
SetParameters                       PROCEDURE(typRedEyeCorrectionParams pParams), GpStatus, PROC
GetParameters                       PROCEDURE(*UNSIGNED pSize, *typRedEyeCorrectionParams pParams), GpStatus, PROC
                                  END

TGdiPlusBrightnessContrastEffect  CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                           PROCEDURE()
SetParameters                       PROCEDURE(typBrightnessContrastParams pParams), GpStatus, PROC
GetParameters                       PROCEDURE(*UNSIGNED pSize, *typBrightnessContrastParams pParams), GpStatus, PROC
                                  END

TGdiPlusHueSaturationLightnessEffect  CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                               PROCEDURE()
SetParameters                           PROCEDURE(typHueSaturationLightnessParams pParams), GpStatus, PROC
GetParameters                           PROCEDURE(*UNSIGNED pSize, *typHueSaturationLightnessParams pParams), GpStatus, PROC
                                      END

TGdiPlusLevelsEffect          CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typLevelsParams pParams), GpStatus, PROC
GetParameters                   PROCEDURE(*UNSIGNED pSize, *typLevelsParams pParams), GpStatus, PROC
                              END

TGdiPlusTintEffect            CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typTintParams pParams), GpStatus, PROC
GetParameters                   PROCEDURE(*UNSIGNED pSize, *typTintParams pParams), GpStatus, PROC
                              END

TGdiPlusColorBalanceEffect    CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typColorBalanceParams pParams), GpStatus, PROC
GetParameters                   PROCEDURE(*UNSIGNED pSize, *typColorBalanceParams pParams), GpStatus, PROC
                              END

TGdiPlusColorMatrixEffect     CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typColorMatrix pMatrix), GpStatus, PROC
GetParameters                   PROCEDURE(*UNSIGNED pSize, *typColorMatrix pMatrix), GpStatus, PROC
                              END

TGdiPlusColorLUTEffect        CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typColorLUTParams pLUT), GpStatus, PROC
GetParameters                   PROCEDURE(*UNSIGNED pSize, *typColorLUTParams pLUT), GpStatus, PROC
                              END

TGdiPlusColorCurveEffect      CLASS(TGdiPlusEffect), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                       PROCEDURE()
SetParameters                   PROCEDURE(typColorCurveParams pParams), GpStatus, PROC
GetParameters                   PROCEDURE(*UNSIGNED pSize, *typColorCurveParams pParams), GpStatus, PROC
                              END
