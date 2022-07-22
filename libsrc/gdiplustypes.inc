!* GDI+ support
!* Base struct and enum declarations
!* mikeduglas 2022
!* mikeduglas@yandex.ru

  INCLUDE('svcomdef.inc'), ONCE

GpStatus                      EQUATE(LONG)
                              ITEMIZE, PRE(GpStatus)
Ok                              EQUATE(0)
GenericError                    EQUATE(1)
InvalidParameter                EQUATE(2)
OutOfMemory                     EQUATE(3)
ObjectBusy                      EQUATE(4)
InsufficientBuffer              EQUATE(5)
NotImplemented                  EQUATE(6)
Win32Error                      EQUATE(7)
WrongState                      EQUATE(8)
Aborted                         EQUATE(9)
FileNotFound                    EQUATE(10)
ValueOverflow                   EQUATE(11)
AccessDenied                    EQUATE(12)
UnknownImageFormat              EQUATE(13)
FontFamilyNotFound              EQUATE(14)
FontStyleNotFound               EQUATE(15)
NotTrueTypeFont                 EQUATE(16)
UnsupportedGdiplusVersion       EQUATE(17)
GdiplusNotInitialized           EQUATE(18)
PropertyNotFound                EQUATE(19)
PropertyNotSupported            EQUATE(20)
                              END


GpImageType                   EQUATE(LONG)
ImageTypeUnknown              EQUATE(0)
ImageTypeBitmap               EQUATE(1)
ImageTypeMetafile             EQUATE(2)


GpUnit                        EQUATE(LONG)
UnitWorld                     EQUATE(0)     ! 0 -- World coordinate (non-physical unit).
UnitDisplay                   EQUATE(1)     ! 1 -- Variable -- for PageTransform only.
UnitPixel                     EQUATE(2)     ! 2 -- Each unit is one device pixel.
UnitPoint                     EQUATE(3)     ! 3 -- Each unit is a printer's point, or 1/72 inch.
UnitInch                      EQUATE(4)     ! 4 -- Each unit is 1 inch.
UnitDocument                  EQUATE(5)     ! 5 -- Each unit is 1/300 inch.
UnitMillimeter                EQUATE(6)     ! 6 -- Each unit is 1 millimeter.


GpImageFlags                  EQUATE(LONG)
ImageFlagsNone                EQUATE(0)
!- Low-word: shared with SINKFLAG_x
ImageFlagsScalable            EQUATE(00001h)
ImageFlagsHasAlpha            EQUATE(00002h)
ImageFlagsHasTranslucent      EQUATE(00004h)
ImageFlagsPartiallyScalable   EQUATE(00008h)
!- Low-word: color space definition
ImageFlagsColorSpaceRGB       EQUATE(00010h)
ImageFlagsColorSpaceCMYK      EQUATE(00020h)
ImageFlagsColorSpaceGRAY      EQUATE(00040h)
ImageFlagsColorSpaceYCBCR     EQUATE(00080h)
ImageFlagsColorSpaceYCCK      EQUATE(00100h)
!- Low-word: image size info
ImageFlagsHasRealDPI          EQUATE(01000h)
ImageFlagsHasRealPixelSize    EQUATE(02000h)
!- High-word
ImageFlagsReadOnly            EQUATE(10000h)
ImageFlagsCaching             EQUATE(20000h)


GpRotateFlipType              EQUATE(LONG)
RotateNoneFlipNone            EQUATE(0)
Rotate90FlipNone              EQUATE(1)
Rotate180FlipNone             EQUATE(2)
Rotate270FlipNone             EQUATE(3)
RotateNoneFlipX               EQUATE(4)
Rotate90FlipX                 EQUATE(5)
Rotate180FlipX                EQUATE(6)
Rotate270FlipX                EQUATE(7)
RotateNoneFlipY               EQUATE(Rotate180FlipX)
Rotate90FlipY                 EQUATE(Rotate270FlipX)
Rotate180FlipY                EQUATE(RotateNoneFlipX)
Rotate270FlipY                EQUATE(Rotate90FlipX)
RotateNoneFlipXY              EQUATE(Rotate180FlipNone)
Rotate90FlipXY                EQUATE(Rotate270FlipNone)
Rotate180FlipXY               EQUATE(RotateNoneFlipNone)
Rotate270FlipXY               EQUATE(Rotate90FlipNone)


GpPaletteType                 EQUATE(LONG)
PaletteTypeCustom             EQUATE(0)
PaletteTypeOptimal            EQUATE(1)
PaletteTypeFixedBW            EQUATE(2)
PaletteTypeFixedHalftone8     EQUATE(3)
PaletteTypeFixedHalftone27    EQUATE(4)
PaletteTypeFixedHalftone64    EQUATE(5)
PaletteTypeFixedHalftone125   EQUATE(6)
PaletteTypeFixedHalftone216   EQUATE(7)
PaletteTypeFixedHalftone252   EQUATE(8)
PaletteTypeFixedHalftone256   EQUATE(9)
  

GpDitherType                  EQUATE(LONG)
DitherTypeNone                EQUATE(0)
DitherTypeSolid               EQUATE(1)
DitherTypeOrdered4x4          EQUATE(2)
DitherTypeOrdered8x8          EQUATE(3)
DitherTypeOrdered16x16        EQUATE(4)
DitherTypeSpiral4x4           EQUATE(5)
DitherTypeSpiral8x8           EQUATE(6)
DitherTypeDualSpiral4x4       EQUATE(7)
DitherTypeDualSpiral8x8       EQUATE(8)
DitherTypeErrorDiffusion      EQUATE(9)
DitherTypeMax                 EQUATE(10)


!Per-channel Histogram for 8bpp images.
GpHistogramFormat             EQUATE(LONG)
HistogramFormatARGB           EQUATE(0)
HistogramFormatPARGB          EQUATE(1)
HistogramFormatRGB            EQUATE(2)
HistogramFormatGray           EQUATE(3)
HistogramFormatB              EQUATE(4)
HistogramFormatG              EQUATE(5)
HistogramFormatR              EQUATE(6)
HistogramFormatA              EQUATE(7) 


GpSizeF                       GROUP, TYPE
cx                              SREAL
cy                              SREAL
                              END

GpRect                        GROUP,TYPE
left                            LONG
top                             LONG
right                           LONG
bottom                          LONG
                              END

GpRectF                       GROUP,TYPE
left                            SREAL
top                             SREAL
right                           SREAL
bottom                          SREAL
                              END

GpImageCodecInfo              GROUP, TYPE
Clsid                           LIKE(_CLSID)
FormatID                        LIKE(GUID)
CodecName                       LONG  !WCHAR*
DllName                         LONG  !WCHAR*
FormatDescription               LONG  !WCHAR*
FilenameExtension               LONG  !WCHAR*
MimeType                        LONG  !WCHAR*
Flags                           ULONG
Version                         ULONG
SigCount                        UNSIGNED
SigSize                         UNSIGNED
SigPattern                      LONG  !BYTE*
SigMask                         LONG  !BYTE*
                              END

!https://docs.microsoft.com/en-us/previous-versions/ms534468(v=vs.85)
GpImageItemData               GROUP, TYPE
Size                            UNSIGNED  !- size of the structure.
Position                        ULONG     !- flags describing how the data is to be used.
Desc                            LONG      !- VOID*. description on how the data is to be saved. it is different for every codec type. (1 byte for JPEG, 4 bytes for PNG, 11 bytes for GIF)
DescSize                        UNSIGNED  !- size memory pointed by Desc
PtrData                         LONG      !- VOID*. pointer to the data that is to be saved in the file, could be anything saved directly.
DataSize                        UNSIGNED  !- size memory pointed by PtrData.
Cookie                          ULONG     !- opaque for the apps data member used during enumeration of image data items.
                              END

