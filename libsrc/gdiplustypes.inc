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
cx                              REAL
cy                              REAL
                              END

GpRectF                       GROUP,TYPE
left                            REAL
top                             REAL
right                           REAL
bottom                          REAL
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

