!* GdiPlus support
!* mikeduglas 2022
!* mikeduglas@yandex.ru

  INCLUDE('svapi.inc'), ONCE
  INCLUDE('gdiplustypes.inc'), ONCE

TGdiPlusImage                 CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeImage                     LONG, PROTECTED   !- GpImage*
lastResult                      GpStatus, PROTECTED

Construct                       PROCEDURE()
Destruct                        PROCEDURE(), VIRTUAL

GetLastStatus                   PROCEDURE(), GpStatus

FromFile                        PROCEDURE(STRING pFileName, BOOL pUseICM=FALSE), GpStatus, PROC
FromString                      PROCEDURE(STRING pImageData, BOOL pUseICM=FALSE), GpStatus, PROC
DisposeImage                    PROCEDURE(), GpStatus, PROC
!!!<summary>Gets the width, in pixels, of this image.</summary>
GetWidth                        PROCEDURE(), ULONG
!!!<summary>Gets the height, in pixels, of this image.</summary>
GetHeight                       PROCEDURE(), ULONG
!!!<summary>Gets the horizontal resolution, in dots per inch, of this image.</summary>
GetHorizontalResolution         PROCEDURE(), SREAL
!!!<summary>Gets the vertical resolution, in dots per inch, of this image.</summary>
GetVerticalResolution           PROCEDURE(), SREAL
!Clone                           PROCEDURE(), *TGdiPlusImage
!ToFile                          PROCEDURE(STRING pFileName), GpStatus, PROC
!GetType                         PROCEDURE(), GpImageType
!GetPhysicalDimension            PROCEDURE(*GpSizeF pSize), GpStatus, PROC
!GetBounds                       PROCEDURE(*GpRectF pRect, *GpUnit pUnit), GpStatus, PROC
                              END

TGdiPlusBitmap                CLASS(TGdiPlusImage), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
GetHBITMAP                      PROCEDURE(ULONG pBackground), HBITMAP
                              END

