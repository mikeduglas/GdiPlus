# Gdi+ support
Over 600 functions that provide two-dimensional vector graphics, imaging, and typography. The services of GDI+ are exposed through a set of classes.


### Available GDI+ classes
- TGdiPlusImage
    - TGdiPlusBitmap
    - TGdiPlusMetafile
- TGdiPlusCachedBitmap
- TGdiPlusGraphics
- TGdiPlusGraphicsPath
- TGdiPlusPen
- TGdiPlusBrush
    - TGdiPlusSolidBrush
    - TGdiPlusTextureBrush
    - TGdiPlusLinearGradientBrush
    - TGdiPlusHatchBrush
    - TGdiPlusPathGradientBrush
- TGdiPlusImageAttributes
- TGdiPlusFont
- TGdiPlusFontFamily
- TGdiPlusFontCollection
    - TGdiPlusInstalledFontCollection
    - TGdiPlusPrivateFontCollection
- TGdiPlusGraphicsPath
- TGdiPlusRegion
- TGdiPlusMatrix
- TGdiPlusStringFormat
- TGdiPlusPixelFormat
- TGdiPlusEffect
    - TGdiPlusBlurEffect
    - TGdiPlusSharpenEffect
    - TGdiPlusRedEyeCorrectionEffect
    - TGdiPlusBrightnessContrastEffect
    - TGdiPlusHueSaturationLightnessEffect
    - TGdiPlusLevelsEffect
    - TGdiPlusTintEffect
    - TGdiPlusColorBalanceEffect
    - TGdiPlusColorMatrixEffect
    - TGdiPlusColorLUTEffect
    - TGdiPlusColorCurveEffect
- TGdiPlusPropertyItem
- TGdiPlusCustomLineCap
    - TGdiPlusAdjustableArrowCap

### Usage  
include gdiplus.inc in global data section:
```
  INCLUDE('gdiplus.inc'), ONCE
```

### Examples
All examples based on code found here:
https://docs.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-using-gdi--use


### Requirements
- Clarion versions: C6.3 and higher.
- Template chains: ABC, Clarion.
- Multi dll apps supported.
- [winapi](https://github.com/mikeduglas/winapi)
- [printf](https://github.com/mikeduglas/printf)


### Examples
All examples are written in C11.1.


### Contacts
- <mikeduglas@yandex.ru>
- <mikeduglas66@gmail.com>

