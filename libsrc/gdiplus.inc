!* GDI+ support
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
!!!<summary>Saves this image to a file.</summary>
!!!<param name="pFileName">The path name for the saved image.</param>
!!!<param name="pFormat">The encoder to use to save the image. Built-in formats:
!!!image/bmp, image/jpeg, image/gif, image/tiff, image/png. 
!!!If omitted, the encoder is taken from the file extension.
!!!</param>
Save                            PROCEDURE(STRING pFileName, <STRING pFormat>), GpStatus, PROC
!!!<summary>Saves this image to a string.</summary>
!!!<param name="pFormat">The encoder to use to save the image. Built-in formats:
!!!image/bmp, image/jpeg, image/gif, image/tiff, image/png.
!!!</param>
ToString                        PROCEDURE(STRING pFormat), *STRING
!!!<summary>Creates a new Image object and initializes it with the contents of this Image object.</summary>
Clone                           PROCEDURE(), *TGdiPlusImage
!!!<summary>Creates a new Image object and initializes it with the contents of this Image object.</summary>
Clone                           PROCEDURE(*TGdiPlusImage pCloneImage), GpStatus, PROC
!!!<summary>Gets a thumbnail image from this Image object.</summary>
GetThumbnailImage               PROCEDURE(ULONG pThumbWidth, ULONG pThumbHeight), *TGdiPlusImage
!!!<summary>Gets a thumbnail image from this Image object.</summary>
GetThumbnailImage               PROCEDURE(ULONG pThumbWidth, ULONG pThumbHeight, *TGdiPlusImage pThumbImage), GpStatus, PROC
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
!!!<summary>Gets a specified property item (piece of metadata) from this Image object.</summary>
GetPropertyItem                 PROCEDURE(ULONG pPropId, *TGdiPlusPropertyItem pItem), GpStatus, PROC
!!!<summary>Sets a property item (piece of metadata) for this Image object. If the item already exists, then its contents are updated; otherwise, a new item is added.</summary>
SetPropertyItem                 PROCEDURE(GpPropertyItem pItem), GpStatus, PROC
!!!<summary>Sets a property item (piece of metadata) for this Image object. If the item already exists, then its contents are updated; otherwise, a new item is added.</summary>
SetPropertyItem                 PROCEDURE(TGdiPlusPropertyItem pItem), GpStatus, PROC
!!!<summary>Removes a property item (piece of metadata) from this Image object.</summary>
RemovePropertyItem              PROCEDURE(ULONG pPropId), GpStatus, PROC

!!!<summary>Rotates and flips this image.</summary>
RotateFlip                      PROCEDURE(GpRotateFlipType pRfType), GpStatus, PROC
                              END

TGdiPlusPropertyItem          CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
id                              ULONG, PRIVATE       !- ID of this property
length                          ULONG, PRIVATE       !- Length of the property value, in bytes
type                            USHORT, PRIVATE      !- Type of the value, as one of GpPropertyTagType enum
value                           &CSTRING, PRIVATE     !- property value

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

TGdiPlusGraphics              CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeGraphics                  LONG, PROTECTED !- GpGraphics*
lastResult                      GpStatus, PROTECTED

Construct                       PROCEDURE()
Destruct                        PROCEDURE(), VIRTUAL

FromImage                       PROCEDURE(TGdiPlusImage pImage), GpStatus, PROC
DisposeGraphics                 PROCEDURE(), GpStatus, PROC
                              END
