!* GDI+ support
!* Base struct and enum declarations
!* mikeduglas 2022
!* mikeduglas@yandex.ru

  INCLUDE('svcomdef.inc'), ONCE

GpStatus                      EQUATE(LONG)
GpStatusEnum                  ITEMIZE, PRE(GpStatus)
Ok                              EQUATE(0)
GenericError                    EQUATE(1)
InvalidParameter                EQUATE(2)
OutOfMemory                     EQUATE(3)
ObjectBusy                      EQUATE(4)
InsufficientBuffer              EQUATE(5)
NotImplemented                  EQUATE
Win32Error                      EQUATE
WrongState                      EQUATE
Aborted                         EQUATE
FileNotFound                    EQUATE(10)
ValueOverflow                   EQUATE
AccessDenied                    EQUATE
UnknownImageFormat              EQUATE
FontFamilyNotFound              EQUATE
FontStyleNotFound               EQUATE(15)
NotTrueTypeFont                 EQUATE
UnsupportedGdiplusVersion       EQUATE
GdiplusNotInitialized           EQUATE
PropertyNotFound                EQUATE
PropertyNotSupported            EQUATE(20)
                              END

GpImageType                   EQUATE(LONG)
GpImageTypeEnum               ITEMIZE, PRE(GpImageType)
Unknown                         EQUATE(0)
Bitmap                          EQUATE
Metafile                        EQUATE
                              END

GpSizeF                       GROUP, TYPE
cx                              SREAL
cy                              SREAL
                              END

GpRectF                       GROUP,TYPE
left                            SREAL
top                             SREAL
right                           SREAL
bottom                          SREAL
                              END

GpUnit                        EQUATE(LONG)
GpUnitEnum                    ITEMIZE, PRE(GpUnit)
World                           EQUATE(0)   ! 0 -- World coordinate (non-physical unit).
Display                         EQUATE      ! 1 -- Variable -- for PageTransform only.
Pixel                           EQUATE      ! 2 -- Each unit is one device pixel.
Point                           EQUATE      ! 3 -- Each unit is a printer's point, or 1/72 inch.
Inch                            EQUATE      ! 4 -- Each unit is 1 inch.
Document                        EQUATE      ! 5 -- Each unit is 1/300 inch.
Millimeter                      EQUATE      ! 6 -- Each unit is 1 millimeter.
                              END


GpImageFlags                  EQUATE(LONG)
GpImageFlagsEnum              ITEMIZE, PRE(GpImageFlags)
None                            EQUATE
Scalable                        EQUATE(00001h)
HasAlpha                        EQUATE(00002h)
HasTranslucent                  EQUATE(00004h)
PartiallyScalable               EQUATE(00008h)
ColorSpaceRGB                   EQUATE(00010h)
ColorSpaceCMYK                  EQUATE(00020h)
ColorSpaceGRAY                  EQUATE(00040h)
ColorSpaceYCBCR                 EQUATE(00080h)
ColorSpaceYCCK                  EQUATE(00100h)
HasRealDPI                      EQUATE(01000h)
HasRealPixelSize                EQUATE(02000h)
ReadOnly                        EQUATE(10000h)
Caching                         EQUATE(20000h)
                              END

GpPixelFormat                 EQUATE(LONG)
GpPixelFormatIndexed          EQUATE(00010000h) !- Indexes into a palette
GpPixelFormatGDI              EQUATE(00020000h) !- Is a GDI-supported format
GpPixelFormatAlpha            EQUATE(00040000h) !- Has an alpha component
GpPixelFormatPAlpha           EQUATE(00080000h) !- Pre-multiplied alpha
GpPixelFormatExtended         EQUATE(00100000h) !- Extended color 16 bits/channel
GpPixelFormatCanonical        EQUATE(00200000h)

GpPixelFormatUndefined        EQUATE(0)
GpPixelFormatDontCare         EQUATE(0)

GpPixelFormat1bppIndexed      EQUATE(00030101h) !- (1 | ( 1 << 8) | PixelFormatIndexed | PixelFormatGDI)
GpPixelFormat4bppIndexed      EQUATE(00030402h) !- (2 | ( 4 << 8) | PixelFormatIndexed | PixelFormatGDI)
GpPixelFormat8bppIndexed      EQUATE(00030803h) !- (3 | ( 8 << 8) | PixelFormatIndexed | PixelFormatGDI)
GpPixelFormat16bppGrayScale   EQUATE(00101004h) !- (4 | (16 << 8) | PixelFormatExtended)
GpPixelFormat16bppRGB555      EQUATE(00021005h) !- (5 | (16 << 8) | PixelFormatGDI)
GpPixelFormat16bppRGB565      EQUATE(00021006h) !- (6 | (16 << 8) | PixelFormatGDI)
GpPixelFormat16bppARGB1555    EQUATE(00061007h) !- (7 | (16 << 8) | PixelFormatAlpha | PixelFormatGDI)
GpPixelFormat24bppRGB         EQUATE(00021808h) !- (8 | (24 << 8) | PixelFormatGDI)
GpPixelFormat32bppRGB         EQUATE(00022009h) !- (9 | (32 << 8) | PixelFormatGDI)
GpPixelFormat32bppARGB        EQUATE(0026200Ah) !- (10 | (32 << 8) | PixelFormatAlpha | PixelFormatGDI | PixelFormatCanonical)
GpPixelFormat32bppPARGB       EQUATE(000E200Bh) !- (11 | (32 << 8) | PixelFormatAlpha | PixelFormatPAlpha | PixelFormatGDI)
GpPixelFormat48bppRGB         EQUATE(0010300Ch) !- (12 | (48 << 8) | PixelFormatExtended)
GpPixelFormat64bppARGB        EQUATE(0034400Dh) !- (13 | (64 << 8) | PixelFormatAlpha  | PixelFormatCanonical | PixelFormatExtended)
GpPixelFormat64bppPARGB       EQUATE(001C400Eh) !- (14 | (64 << 8) | PixelFormatAlpha  | PixelFormatPAlpha | PixelFormatExtended)
GpPixelFormat32bppCMYK        EQUATE(0000200Fh) !- (15 | (32 << 8))
GpPixelFormatMax              EQUATE(16)


!- Image property types 
GpPropertyTagType             EQUATE(LONG)
GpPropertyTagTypeEnum         ITEMIZE, PRE(GpPropertyTagType)
Byte                            EQUATE(1)
ASCII                           EQUATE(2)
Short                           EQUATE(3)
Long                            EQUATE(4)
Rational                        EQUATE(5)
Undefined                       EQUATE(7)
SLONG                           EQUATE(9)
SRational                       EQUATE(10)
                              END
!- Image property ID tags (full list of the tags in c:\Program Files (x86)\Windows Kits\10\Include\10.0.22621.0\um\gdiplusimaging.h)
GpPropertyTag                 EQUATE(LONG)
GpPropertyTagEnum             ITEMIZE, PRE(GpPropertyTag)
ImageDescription                EQUATE(010Eh)
DateTime                        EQUATE(0132h)
Artist                          EQUATE(013Bh)
                              END

GpPropertyItem                GROUP, TYPE
id                              ULONG       !- ID of this property
length                          ULONG       !- Length of the property value, in bytes
type                            USHORT      !- Type of the value, as one of GpPropertyTagType enum
dummy                           BYTE,DIM(2) !- alignment
refvalue                        LONG        !- a reference to property value
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
SigCount                        ULONG
SigSize                         ULONG
SigPattern                      LONG  !BYTE*
SigMask                         LONG  !BYTE*
                              END

GpRotateFlipType              EQUATE(LONG)
GpRotateFlipTypeEnum          ITEMIZE
RotateNoneFlipNone              EQUATE(0)
Rotate90FlipNone                EQUATE(1)
Rotate180FlipNone               EQUATE(2)
Rotate270FlipNone               EQUATE(3)

RotateNoneFlipX                 EQUATE(4)
Rotate90FlipX                   EQUATE(5)
Rotate180FlipX                  EQUATE(6)
Rotate270FlipX                  EQUATE(7)

RotateNoneFlipY                 EQUATE(Rotate180FlipX)
Rotate90FlipY                   EQUATE(Rotate270FlipX)
Rotate180FlipY                  EQUATE(RotateNoneFlipX)
Rotate270FlipY                  EQUATE(Rotate90FlipX)

RotateNoneFlipXY                EQUATE(Rotate180FlipNone)
Rotate90FlipXY                  EQUATE(Rotate270FlipNone)
Rotate180FlipXY                 EQUATE(RotateNoneFlipNone)
Rotate270FlipXY                 EQUATE(Rotate90FlipNone)
                              END

!https://docs.microsoft.com/en-us/previous-versions/ms534468(v=vs.85)
GpImageItemData               GROUP, TYPE
Size                            ULONG !- size of the structure.
Position                        ULONG !- flags describing how the data is to be used.
Desc                            LONG  !- VOID*. description on how the data is to be saved. it is different for every codec type. (1 byte for JPEG, 4 bytes for PNG, 11 bytes for GIF)
DescSize                        ULONG !- size memory pointed by Desc
PtrData                         LONG  !- VOID*. pointer to the data that is to be saved in the file, could be anything saved directly.
DataSize                        ULONG !- size memory pointed by PtrData.
Cookie                          ULONG !- opaque for the apps data member used during enumeration of image data items.
                              END
