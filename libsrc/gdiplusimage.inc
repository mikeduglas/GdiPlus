!* GDI+ support
!* GDI+ Image, Bitmap, CachedBitmap classes
!* mikeduglas 2022
!* mikeduglas@yandex.ru


!---------------------------------------------------------------------------
! Information about image pixel data
!---------------------------------------------------------------------------
GpBitmapData                  GROUP, TYPE
Width                           UNSIGNED
Height                          UNSIGNED
Stride                          LONG
PixelFormat                     GpPixelFormat
Scan0                           LONG  !- VOID*
Reserved                        LONG  !- UINT_PTR
                              END


!--------------------------------------------------------------------------
! GDI+ Image class
!--------------------------------------------------------------------------
TGdiPlusImage                 CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeImage                     LONG, PROTECTED
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
GetThumbnailImage               PROCEDURE(UNSIGNED pThumbWidth, UNSIGNED pThumbHeight), *TGdiPlusImage
!!!<summary>Gets a thumbnail image from this Image object.</summary>
GetThumbnailImage               PROCEDURE(UNSIGNED pThumbWidth, UNSIGNED pThumbHeight, *TGdiPlusImage pThumbImage), GpStatus, PROC
!!!<summary>Releases resources used by the Image object.</summary>
DisposeImage                    PROCEDURE(), GpStatus, PROC
!!!<summary>Gets the width, in pixels, of this image.</summary>
GetWidth                        PROCEDURE(), UNSIGNED
!!!<summary>Gets the height, in pixels, of this image.</summary>
GetHeight                       PROCEDURE(), UNSIGNED
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
GetPropertyCount                PROCEDURE(), UNSIGNED
!!!<summary>Gets a list of the property identifiers used in the metadata of this Image object.</summary>
GetPropertyIdList               PROCEDURE(UNSIGNED pNumOfProperty, *ULONG[] pList), GpStatus, PROC
!!!<summary>Gets a specified property item (piece of metadata) from this Image object.</summary>
GetPropertyItem                 PROCEDURE(ULONG pPropId, *TGdiPlusPropertyItem pItem), GpStatus, PROC
!!!<summary>Sets a property item (piece of metadata) for this Image object. If the item already exists, then its contents are updated; otherwise, a new item is added.</summary>
SetPropertyItem                 PROCEDURE(GpPropertyItem pItem), GpStatus, PROC
!!!<summary>Sets a property item (piece of metadata) for this Image object. If the item already exists, then its contents are updated; otherwise, a new item is added.</summary>
SetPropertyItem                 PROCEDURE(TGdiPlusPropertyItem pItem), GpStatus, PROC
!!!<summary>Removes a property item (piece of metadata) from this Image object.</summary>
RemovePropertyItem              PROCEDURE(ULONG pPropId), GpStatus, PROC
!!!<summary>Gets the total size, in bytes, of all the property items stored in this Image object. This method also gets the number of property items stored in this Image object.</summary>
GetPropertySize                 PROCEDURE(*UNSIGNED pTotalBufferSize, *UNSIGNED pNumProperties), GpStatus, PROC
!!!<summary>Gets all the property items (metadata) stored in this Image object.</summary>
GetAllPropertyItems             PROCEDURE(UNSIGNED pTotalBufferSize, UNSIGNED pNumProperties, LONG pAllItems), GpStatus, PROC
!!!<summary>Rotates and flips this image.</summary>
RotateFlip                      PROCEDURE(GpRotateFlipType pRfType), GpStatus, PROC
!!!<summary>Gets the size, in bytes, of the color palette of this Image object.</summary>
GetPaletteSize                  PROCEDURE(), UNSIGNED
!!!<summary>Gets the ColorPalette of this Image object.</summary>
GetPalette                      PROCEDURE(CONST *STRING pPalette, UNSIGNED pSize), GpStatus, PROC
!!!<summary>Sets the ColorPalette of this Image object.</summary>
SetPalette                      PROCEDURE(CONST *STRING pPalette), GpStatus, PROC
!!!<summary>Gets the size, in bytes, of the parameter list for a specified image encoder.</summary>
GetEncoderParameterListSize     PROCEDURE(_CLSID pEncoder), UNSIGNED
!!!<summary>Gets a list of the parameters supported by a specified image encoder.</summary>
GetEncoderParameterList         PROCEDURE(_CLSID pEncoder, UNSIGNED pSize, CONST *STRING pEncoderParams), GpStatus, PROC
!!!<summary>Adds a frame to a file or stream specified in a previous call to the Save method. Use this method to save selected frames from a multiple-frame image to another multiple-frame image.</summary>
SaveAdd                         PROCEDURE(CONST *STRING pEncoderParams), GpStatus, PROC
!!!<summary>Adds a frame to a file or stream specified in a previous call to the Save method.</summary>
SaveAdd                         PROCEDURE(TGdiPlusImage pNewImage, CONST *STRING pEncoderParams), GpStatus, PROC
!!!<summary>Gets the number of frame dimensions in this Image object.</summary>
GetFrameDimensionsCount         PROCEDURE(), UNSIGNED
!!!<summary>Gets the identifiers for the frame dimensions of this Image object.</summary>
GetFrameDimensionsList          PROCEDURE(LONG pDimensionIDs, UNSIGNED pCount), GpStatus, PROC
!!!<summary>Gets the number of frames in a specified dimension of this Image object.</summary>
GetFrameCount                   PROCEDURE(GUID pDimensionID), UNSIGNED
!!!<summary>Selects the frame in this Image object specified by a dimension and an index.</summary>
SelectActiveFrame               PROCEDURE(GUID pDimensionID, UNSIGNED pFrameIndex), GpStatus, PROC
!!!<summary>Retrieves the description and the data size of the first metadata item in this Image object.</summary>
FindFirstItem                   PROCEDURE(*GpImageItemData pItem), GpStatus, PROC
!!!<summary>Retrieves the description and the data size of the next metadata item in this Image object. This method is used along with the Image::FindFirstItem method to enumerate the metadata items stored in this ImImageage object.</summary>
FindNextImageItem               PROCEDURE(*GpImageItemData pItem), GpStatus, PROC
!!!<summary>Gets one piece of metadata from this Image object.</summary>
GetImageItemData                PROCEDURE(*GpImageItemData pItem), GpStatus, PROC
                              END


!--------------------------------------------------------------------------
! GDI+ Bitmap class
!--------------------------------------------------------------------------
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
!!!<param name="pHpal">Handle to a GDI palette used to define the bitmap colors if hbm is not a device-independent bitmap (DIB).</param>
FromHBITMAP                     PROCEDURE(HBITMAP pHbm, HPALETTE pHpal), GpStatus, PROC
!!!<summary>Creates a GDI bitmap from this Bitmap object.</summary>
GetHBITMAP                      PROCEDURE(ULONG pBackground), HBITMAP
!!!<summary>Creates a Bitmap object based on an icon.</summary>
FromHICON                       PROCEDURE(HICON pHicon), GpStatus, PROC
!!!<summary>Creates an icon from this Bitmap object.</summary>
GetHICON                        PROCEDURE(), HICON
!!!<summary>Creates a Bitmap object based on an application or DLL instance handle and the name of a bitmap resource.</summary>
FromResource                    PROCEDURE(HINSTANCE pHInstance, STRING pBitmapName), GpStatus, PROC
!!!<summary>Creates a new Bitmap object by copying a portion of this bitmap.</summary>
Clone                           PROCEDURE(LONG pX, LONG pY, LONG pWidth, LONG pHeight, GpPixelFormat pFormat, *TGdiPlusBitmap pDstBitmap), GpStatus, PROC
!!!<summary>Creates a new Bitmap object by copying a portion of this bitmap.</summary>
Clone                           PROCEDURE(GpRect pRect, GpPixelFormat pFormat, *TGdiPlusBitmap pDstBitmap), GpStatus, PROC
!!!<summary>Creates a new Bitmap object by copying a portion of this bitmap.</summary>
Clone                           PROCEDURE(LONG pX, LONG pY, LONG pWidth, LONG pHeight, GpPixelFormat pFormat), *TGdiPlusBitmap
!!!<summary>Locks a rectangular portion of this bitmap and provides a temporary buffer that you can use to read or write pixel data in a specified format. Any pixel data that you write to the buffer is copied to the Bitmap object when you call UnlockBits.</summary>
LockBits                        PROCEDURE(GpRect pRect, ULONG pFlags, GpPixelFormat pFormat, *GpBitmapData pLockedBitmapData), GpStatus, PROC
!!!<summary>Unlocks a portion of this bitmap that was previously locked by a call to LockBits.</summary>
UnlockBits                      PROCEDURE(GpBitmapData pLockedBitmapData), GpStatus, PROC
!!!<summary>Gets the color of a specified pixel in this bitmap.</summary>
GetPixel                        PROCEDURE(LONG pX, LONG pY), GpARGB
!!!<summary>Sets the color of a specified pixel in this bitmap.</summary>
SetPixel                        PROCEDURE(LONG pX, LONG pY, GpARGB pColor), GpStatus, PROC
!!!<summary>Sets the resolution of this bitmap object.</summary>
SetResolution                   PROCEDURE(SREAL pXDpi, SREAL pYDpi), GpStatus, PROC
!!!<summary>Converts a bitmap to a specified pixel format. The original pixel data in the bitmap is replaced by the new pixel data.</summary>
ConvertFormat                   PROCEDURE(GpPixelFormat pFormat, GpDitherType pDithertype, GpPaletteType pPalettetype, CONST *STRING pPalette, SREAL pAlphaThresholdPercent), GpStatus, PROC
!!!<summary>Initializes a standard, optimal, or custom color palette.</summary>
!!!<param name="pPalette">Pointer to a buffer that contains a ColorPalette structure followed by an array of ARGB values. The Entries member of a ColorPalette structure is an array of one ARGB value.
!!! You must allocate memory for the ColorPalette structure and for the additional ARGB values in the palette. For example, if the palette has 36 ARGB values, allocate a buffer as follows:
!!! malloc(sizeof(ColorPalette) + 35*sizeof(ARGB)).</param>
!!!<param name="pPaletteType">Palette type.</param>
!!!<param name="pOptimalColors">The number of colors you want to have in an optimal palette based on a specified bitmap.
!!! If this parameter is greater than 0, the pPaletteType parameter must be set to PaletteTypeOptimal.
!!! If you are creating a standard or custom palette rather than an optimal palette, set this parameter to 0.</param>
!!!<param name="pUseTransparentColor">Specifies whether to include the transparent color in the palette.</param>
InitializePalette               PROCEDURE(CONST *STRING pPalette, GpPaletteType pPaletteType, UNSIGNED pOptimalColors, BOOL pUseTransparentColor), GpStatus, PROC
!!!<summary>Alters this Bitmap object by applying a specified effect.</summary>
ApplyEffect                     PROCEDURE(TGdiPlusEffect pEffect, <_RECT_ pRect>), GpStatus, PROC
!!!<summary>Creates a new Bitmap object by applying a specified effect to an existing Bitmap object.</summary>
ApplyEffect                     PROCEDURE(TGdiPlusEffect pEffect, <_RECT_ pRect>, <*_RECT_ pOutputRect>, *TGdiPlusBitmap pOutputBitmap), GpStatus, PROC
!!!<summary>Returns the number of elements (in an array of UINTs) that you must allocate before you call the GetHistogram method of a Bitmap object.</summary>
GetHistogramSize                PROCEDURE(GpHistogramFormat pFormat), UNSIGNED
!!!<summary>Returns one or more histograms for specified color channels of this Bitmap object.</summary>
GetHistogram                    PROCEDURE(GpHistogramFormat pFormat, UNSIGNED pNumberOfEntries, *ULONG[] pChannel0, <*ULONG[] pChannel1>, <*ULONG[] pChannel2>, <*ULONG[] pChannel3>), GpStatus, PROC
                              END


!--------------------------------------------------------------------------
! GDI+ CachedBitmap class
!--------------------------------------------------------------------------
TGdiPlusCachedBitmap          CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeCachedBitmap              LONG, PROTECTED
lastResult                      GpStatus, PROTECTED

Destruct                        PROCEDURE(), VIRTUAL
CrewateCachedBitmap             PROCEDURE(TGdiPlusBitmap pBitmap, TGdiPlusGraphics pGraphics), GpStatus, PROC
DeleteCachedBitmap              PROCEDURE(), GpStatus, PROC
                              END
