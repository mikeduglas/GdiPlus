!* GdiPlus support
!* mikeduglas 2022
!* mikeduglas@yandex.ru

  INCLUDE('svapi.inc'), ONCE
  INCLUDE('svcomdef.inc'), ONCE
  INCLUDE('gdiplustypes.inc'), ONCE

TGdiPlusImage                 CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeImage                     LONG, PROTECTED   !- GpImage*
lastResult                      GpStatus, PROTECTED

Construct                       PROCEDURE()
Destruct                        PROCEDURE(), VIRTUAL

GetLastStatus                   PROCEDURE(), GpStatus

!!!<summary>Creates an Image object based on a file.</summary>
FromFile                        PROCEDURE(STRING pFileName, BOOL pUseICM=FALSE), GpStatus, PROC
!!!<summary>Creates an Image object based on a string data.</summary>
FromString                      PROCEDURE(STRING pImageData, BOOL pUseICM=FALSE), GpStatus, PROC
!!!<summary>Releases resources used by the Image object.</summary>
DisposeImage                    PROCEDURE(), GpStatus, PROC
!!!<summary>Gets the width, in pixels, of this image.</summary>
GetWidth                        PROCEDURE(), ULONG
!!!<summary>Gets the height, in pixels, of this image.</summary>
GetHeight                       PROCEDURE(), ULONG
!!!<summary>Gets the horizontal resolution, in dots per inch, of this image.</summary>
GetHorizontalResolution         PROCEDURE(), SREAL
!!!<summary>Gets the vertical resolution, in dots per inch, of this image.</summary>
GetVerticalResolution           PROCEDURE(), SREAL
!!!<summary>Gets the bounding rectangle for this image.</summary>
GetBounds                       PROCEDURE(*GpRectF pRect, *GpUnit pUnit), GpStatus, PROC
!!!<summary>Gets the width and height of this image.</summary>
GetPhysicalDimension            PROCEDURE(*GpSizeF pSize), GpStatus, PROC
!!!<summary>Gets the type (bitmap or metafile) of this Image object.</summary>
GetType                         PROCEDURE(), GpImageType
!!!<summary>Gets a set of flags that indicate certain attributes of this Image object.</summary>
GetFlags                        PROCEDURE(), ULONG
!!!<summary>Gets a globally unique identifier (GUID) that identifies the format of this Image object.</summary>
GetRawFormat                    PROCEDURE(*GUID pGuid), GpStatus, PROC
!!!<summary>Gets the pixel format of this Image object.</summary>
GetPixelFormat                  PROCEDURE(), GpPixelFormat
!!!<summary>Gets the number of properties (pieces of metadata) stored in this Image object.</summary>
GetPropertyCount                PROCEDURE(), ULONG
!!!<summary>Gets a list of the property identifiers used in the metadata of this Image object.</summary>
GetPropertyIdList               PROCEDURE(ULONG pNumOfProperty, *ULONG[] pList), GpStatus, PROC
!!!<summary>Gets the size, in bytes, of a specified property item of this Image object.</summary>
GetPropertyItemSize             PROCEDURE(ULONG pPropId), ULONG
!!!<summary>Gets a specified property item (piece of metadata) from this Image object.</summary>
GetPropertyItem                 PROCEDURE(ULONG pPropId, ULONG pItemSize, *TGdiPlusPropertyItem pItem), GpStatus, PROC

!Clone                           PROCEDURE(), *TGdiPlusImage
!ToFile                          PROCEDURE(STRING pFileName), GpStatus, PROC
                              END

TGdiPlusPropertyItem          CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
id                              ULONG, PRIVATE       !- ID of this property
length                          ULONG, PRIVATE       !- Length of the property value, in bytes
type                            USHORT, PRIVATE      !- Type of the value, as one of GpPropertyTagType enum
value                           &STRING, PRIVATE     !- property value

Destruct                        PROCEDURE()
Assign                          PROCEDURE(GpPropertyItem pItem), PRIVATE
!!!<summary>Releases resources used by the property item.</summary>
Free                            PROCEDURE()
GetId                           PROCEDURE(), ULONG
GetLength                       PROCEDURE(), ULONG
GetType                         PROCEDURE(), GpPropertyTagType
GetArraySize                    PROCEDURE(), ULONG
GetValueAddress                 PROCEDURE(), LONG
GetStringValue                  PROCEDURE(), STRING
GetByteValue                    PROCEDURE(), BYTE
GetShortValue                   PROCEDURE(), SHORT
GetLongValue                    PROCEDURE(), LONG
GetRealValue                    PROCEDURE(), REAL
                              END


TGdiPlusBitmap                CLASS(TGdiPlusImage), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
GetHBITMAP                      PROCEDURE(ULONG pBackground), HBITMAP
                              END

