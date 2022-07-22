!* GDI+ support
!* Property items
!* mikeduglas 2022
!* mikeduglas@yandex.ru

!- Image property types 
GpPropertyTagType             EQUATE(LONG)
                              ITEMIZE, PRE(GpPropertyTagType)
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
                              ITEMIZE, PRE(GpPropertyTag)
ImageDescription                EQUATE(010Eh)
DateTime                        EQUATE(0132h)
Artist                          EQUATE(013Bh)
                              END

GpPropertyItem                GROUP, TYPE
id                              ULONG       !- ID of this property
length                          UNSIGNED    !- Length of the property value, in bytes
type                            USHORT      !- Type of the value, as one of GpPropertyTagType enum
dummy                           BYTE,DIM(2) !- alignment
refvalue                        LONG        !- a reference to property value
                              END


TGdiPlusPropertyItem          CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
id                              ULONG, PRIVATE       !- ID of this property
length                          UNSIGNED, PRIVATE    !- Length of the property value, in bytes
type                            USHORT, PRIVATE      !- Type of the value, as one of GpPropertyTagType enum
value                           &CSTRING, PRIVATE    !- property value

Destruct                        PROCEDURE()
Assign                          PROCEDURE(GpPropertyItem pItem), PRIVATE
!!!<summary>Releases resources used by the property item.</summary>
Free                            PROCEDURE()
GetId                           PROCEDURE(), ULONG
GetLength                       PROCEDURE(), UNSIGNED
GetType                         PROCEDURE(), GpPropertyTagType
GetArraySize                    PROCEDURE(), UNSIGNED
GetValueAddress                 PROCEDURE(), LONG
GetStringValue                  PROCEDURE(), STRING
GetByteValue                    PROCEDURE(), BYTE
GetShortValue                   PROCEDURE(), SHORT
GetLongValue                    PROCEDURE(), LONG
GetRealValue                    PROCEDURE(), SREAL
                              END

