# GDI+
Over 600 functions that provide two-dimensional vector graphics, imaging, and typography. The services of GDI+ are exposed through a set of classes.


### Available GDI+ classes
- [TGdiPlusImage](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusheaders/nl-gdiplusheaders-image)
    - [TGdiPlusBitmap](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusheaders/nl-gdiplusheaders-bitmap)
    - [TGdiPlusMetafile](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusheaders/nl-gdiplusheaders-metafile)
- [TGdiPlusCachedBitmap](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusheaders/nl-gdiplusheaders-cachedbitmap)
- [TGdiPlusGraphics](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusgraphics/nl-gdiplusgraphics-graphics)
- [TGdiPlusGraphicsPath](https://docs.microsoft.com/en-us/windows/win32/api/gdipluspath/nl-gdipluspath-graphicspath)
- [TGdiPlusGraphisPathIterator](https://docs.microsoft.com/en-us/windows/win32/api/gdipluspath/nl-gdipluspath-graphicspathiterator)
- [TGdiPlusPen](https://docs.microsoft.com/en-us/windows/win32/api/gdipluspen/nl-gdipluspen-pen)
- [TGdiPlusBrush](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusbrush/nl-gdiplusbrush-brush)
    - [TGdiPlusSolidBrush](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusbrush/nl-gdiplusbrush-solidbrush)
    - [TGdiPlusTextureBrush](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusbrush/nl-gdiplusbrush-texturebrush)
    - [TGdiPlusLinearGradientBrush](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusbrush/nl-gdiplusbrush-lineargradientbrush)
    - [TGdiPlusHatchBrush](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusbrush/nl-gdiplusbrush-hatchbrush)
    - [TGdiPlusPathGradientBrush](https://docs.microsoft.com/en-us/windows/win32/api/gdipluspath/nl-gdipluspath-pathgradientbrush)
- [TGdiPlusImageAttributes](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusimageattributes/nl-gdiplusimageattributes-imageattributes)
- [TGdiPlusFont](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusheaders/nl-gdiplusheaders-font)
- [TGdiPlusFontFamily](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusheaders/nl-gdiplusheaders-fontfamily)
- [TGdiPlusFontCollection](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusheaders/nl-gdiplusheaders-fontcollection)
    - [TGdiPlusInstalledFontCollection](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusheaders/nl-gdiplusheaders-installedfontcollection)
    - [TGdiPlusPrivateFontCollection](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusheaders/nl-gdiplusheaders-privatefontcollection)
- [TGdiPlusRegion](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusheaders/nl-gdiplusheaders-region)
- [TGdiPlusMatrix](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusmatrix/nl-gdiplusmatrix-matrix)
- [TGdiPlusStringFormat](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusstringformat/nl-gdiplusstringformat-stringformat)
- [TGdiPlusPixelFormat](https://docs.microsoft.com/en-us/windows/win32/api/gdipluspixelformats/)
- [TGdiPlusEffect](https://docs.microsoft.com/en-us/windows/win32/api/gdipluseffects/nl-gdipluseffects-effect)
    - [TGdiPlusBlurEffect](https://docs.microsoft.com/en-us/windows/win32/api/gdipluseffects/nl-gdipluseffects-blur)
    - [TGdiPlusSharpenEffect](https://docs.microsoft.com/en-us/windows/win32/api/gdipluseffects/nl-gdipluseffects-sharpen)
    - [TGdiPlusRedEyeCorrectionEffect](https://docs.microsoft.com/en-us/windows/win32/api/gdipluseffects/nl-gdipluseffects-redeyecorrection)
    - [TGdiPlusBrightnessContrastEffect](https://docs.microsoft.com/en-us/windows/win32/api/gdipluseffects/nl-gdipluseffects-brightnesscontrast)
    - [TGdiPlusHueSaturationLightnessEffect](https://docs.microsoft.com/en-us/windows/win32/api/gdipluseffects/nl-gdipluseffects-huesaturationlightness)
    - [TGdiPlusLevelsEffect](https://docs.microsoft.com/en-us/windows/win32/api/gdipluseffects/nl-gdipluseffects-levels)
    - [TGdiPlusTintEffect](https://docs.microsoft.com/en-us/windows/win32/api/gdipluseffects/nl-gdipluseffects-tint)
    - [TGdiPlusColorBalanceEffect](https://docs.microsoft.com/en-us/windows/win32/api/gdipluseffects/nl-gdipluseffects-colorbalance)
    - [TGdiPlusColorMatrixEffect](https://docs.microsoft.com/en-us/windows/win32/api/gdipluseffects/nl-gdipluseffects-colormatrixeffect)
    - [TGdiPlusColorLUTEffect](https://docs.microsoft.com/en-us/windows/win32/api/gdipluseffects/nl-gdipluseffects-colorlut)
    - [TGdiPlusColorCurveEffect](https://docs.microsoft.com/en-us/windows/win32/api/gdipluseffects/nl-gdipluseffects-colorcurve)
- [TGdiPlusPropertyItem](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusimaging/nl-gdiplusimaging-propertyitem)
- [TGdiPlusCustomLineCap](https://docs.microsoft.com/en-us/windows/win32/api/gdiplusheaders/nl-gdiplusheaders-customlinecap)
    - [TGdiPlusAdjustableArrowCap](https://docs.microsoft.com/en-us/windows/win32/api/gdipluslinecaps/nl-gdipluslinecaps-adjustablearrowcap)

### Usage  
include gdiplus.inc in global data section:
```
  INCLUDE('gdiplus.inc'), ONCE
```

### Examples
All examples based on code found here:
https://docs.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-using-gdi--use  

*Also*, there is [Photo Corrector](https://github.com/mikeduglas/PhotoCorr) - handy image editor written in Clarion using gdi+ classes.


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

