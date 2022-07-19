!* GdiPlus support
!* mikeduglas 2022
!* mikeduglas@yandex.ru

GpStatus                      EQUATE(LONG)
GpStatusEnum                  ITEMIZE, PRE(GpStatus)
Ok                              EQUATE(0)
GenericError                    EQUATE
InvalidParameter                EQUATE
OutOfMemory                     EQUATE
ObjectBusy                      EQUATE
InsufficientBuffer              EQUATE
NotImplemented                  EQUATE
Win32Error                      EQUATE
WrongState                      EQUATE
Aborted                         EQUATE
FileNotFound                    EQUATE
ValueOverflow                   EQUATE
AccessDenied                    EQUATE
UnknownImageFormat              EQUATE
FontFamilyNotFound              EQUATE
FontStyleNotFound               EQUATE
NotTrueTypeFont                 EQUATE
UnsupportedGdiplusVersion       EQUATE
GdiplusNotInitialized           EQUATE
PropertyNotFound                EQUATE
PropertyNotSupported            EQUATE
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
DateTime                        EQUATE(0132h)
                              END

GpPropertyItem                GROUP, TYPE
id                              ULONG       !- ID of this property
length                          ULONG       !- Length of the property value, in bytes
type                            USHORT      !- Type of the value, as one of GpPropertyTagType enum
dummy                           BYTE,DIM(2) !- alignment
refvalue                        LONG        !- a reference to property value
                              END
