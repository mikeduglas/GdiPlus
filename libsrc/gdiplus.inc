!* GDI+ support
!* Base class declarations
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

!GetImagePaletteSize
!GetImagePalette
!SetImagePalette
!FindFirstImageItem
!FindNextImageItem
!GetImageItemData
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
GetRealValue                    PROCEDURE(), SREAL
                              END


TGdiPlusBitmap                CLASS(TGdiPlusImage), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
!!!<summary>Creates a Bitmap object.</summary>
CreateBitmap                    PROCEDURE(LONG pWidth, LONG pHeight, GpPixelFormat pFormat), GpStatus, PROC
!!!<summary>Creates a Bitmap object based on a file.</summary>
FromFile                        PROCEDURE(STRING pFileName, BOOL pUseICM=FALSE), GpStatus, PROC
!!!<summary>Creates a Bitmap object based on a string data.</summary>
FromString                      PROCEDURE(STRING pImageData, BOOL pUseICM=FALSE), GpStatus, PROC
!!!<summary>Creates a Bitmap object based on an array of bytes along with size and format information.</summary>
FromScan0                       PROCEDURE(LONG pWidth, LONG pHeight, LONG pStride, GpPixelFormat pFormat, BYTE[] pScan0), GpStatus, PROC
!!!<summary>Creates a Bitmap object based on a Graphics object, a width, and a height.</summary>
FromGraphics                    PROCEDURE(LONG pWidth, LONG pHeight, TGdiPlusGraphics pTarget), GpStatus, PROC
!!!<summary>Creates a Bitmap object based on a BITMAPINFO structure and an array of pixel data.</summary>
!!!<param name="pBitmapInfo">BITMAPINFO</param>
!!!<param name="pBitmapData">An array of bytes that contains the pixel data.</param>
FromBITMAPINFO                  PROCEDURE(CONST *STRING pBitmapInfo, BYTE[] pBitmapData), GpStatus, PROC
!!!<summary>Creates a Bitmap object based on a handle to a Windows Graphics Device Interface (GDI) bitmap and a handle to a GDI palette.</summary>
!!!<param name="pHbm">Handle to a GDI bitmap.</param>
!!!<param name="pHpal">(HPALETTE) Handle to a GDI palette used to define the bitmap colors if hbm is not a device-independent bitmap (DIB).</param>
FromHBITMAP                     PROCEDURE(HBITMAP pHbm, HANDLE pHpal), GpStatus, PROC
!!!<summary>Creates a GDI bitmap from this Bitmap object.</summary>
GetHBITMAP                      PROCEDURE(ULONG pBackground), HBITMAP
!!!<summary>Creates a Bitmap object based on an icon.</summary>
FromHICON                       PROCEDURE(HICON pHicon), GpStatus, PROC
!!!<summary>Creates an icon from this Bitmap object.</summary>
GetHICON                        PROCEDURE(), HICON
!!!<summary>Creates a Bitmap object based on an application or DLL instance handle and the name of a bitmap resource.</summary>
FromResource                    PROCEDURE(HINSTANCE pHInstance, STRING pBitmapName), GpStatus, PROC
!!!<summary>Creates a new Bitmap object by copying a portion of this bitmap.</summary>
Clone                           PROCEDURE(SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight, GpPixelFormat pFormat, *TGdiPlusBitmap pDstBitmap), GpStatus, PROC
!!!<summary>Creates a new Bitmap object by copying a portion of this bitmap.</summary>
Clone                           PROCEDURE(SREAL pX, SREAL pY, SREAL pWidth, SREAL pHeight, GpPixelFormat pFormat), *TGdiPlusBitmap

                              END

TGdiPlusGraphics              CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeGraphics                  LONG, PROTECTED !- GpGraphics*
lastResult                      GpStatus, PROTECTED

Construct                       PROCEDURE()
Destruct                        PROCEDURE(), VIRTUAL

FromImage                       PROCEDURE(TGdiPlusImage pImage), GpStatus, PROC
DisposeGraphics                 PROCEDURE(), GpStatus, PROC

!ConvertToEmfPlus
!ConvertToEmfPlusToFile
!ConvertToEmfPlusToString
                              END

TGdiPlusPixelFormat           CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
pixfmt                          GpPixelFormat, PRIVATE

!!!<summary>Getter and Setter</summary>
PixelFormat                     PROCEDURE(<GpPixelFormat pPixfmt>), GpPixelFormat, PROC
GetSize                         PROCEDURE(), ULONG
IsIndexed                       PROCEDURE(), BOOL
IsAlpha                         PROCEDURE(), BOOL
IsExtended                      PROCEDURE(), BOOL
!!!<summary>Determine if the Pixel Format is Canonical format: 
!!!PixelFormat32bppARGB, PixelFormat32bppPARGB, PixelFormat64bppARGB, PixelFormat64bppPARGB
!!!</summary>
IsCanonical                     PROCEDURE(), BOOL
                              END
