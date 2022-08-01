!* GDI+ support
!* Pixel format
!* mikeduglas 2022
!* mikeduglas@yandex.ru


! In-memory pixel data formats:
! bits 0-7 = format index
! bits 8-15 = pixel size (in bits)
! bits 16-23 = flags
! bits 24-31 = reserved

GpPixelFormat                 EQUATE(LONG)
PixelFormatIndexed            EQUATE(00010000h) !- Indexes into a palette
PixelFormatGDI                EQUATE(00020000h) !- Is a GDI-supported format
PixelFormatAlpha              EQUATE(00040000h) !- Has an alpha component
PixelFormatPAlpha             EQUATE(00080000h) !- Pre-multiplied alpha
PixelFormatExtended           EQUATE(00100000h) !- Extended color 16 bits/channel
PixelFormatCanonical          EQUATE(00200000h)

PixelFormatUndefined          EQUATE(0)
PixelFormatDontCare           EQUATE(0)

PixelFormat1bppIndexed        EQUATE(00030101h) !- (1 | ( 1 << 8) | PixelFormatIndexed | PixelFormatGDI)
PixelFormat4bppIndexed        EQUATE(00030402h) !- (2 | ( 4 << 8) | PixelFormatIndexed | PixelFormatGDI)
PixelFormat8bppIndexed        EQUATE(00030803h) !- (3 | ( 8 << 8) | PixelFormatIndexed | PixelFormatGDI)
PixelFormat16bppGrayScale     EQUATE(00101004h) !- (4 | (16 << 8) | PixelFormatExtended)
PixelFormat16bppRGB555        EQUATE(00021005h) !- (5 | (16 << 8) | PixelFormatGDI)
PixelFormat16bppRGB565        EQUATE(00021006h) !- (6 | (16 << 8) | PixelFormatGDI)
PixelFormat16bppARGB1555      EQUATE(00061007h) !- (7 | (16 << 8) | PixelFormatAlpha | PixelFormatGDI)
PixelFormat24bppRGB           EQUATE(00021808h) !- (8 | (24 << 8) | PixelFormatGDI)
PixelFormat32bppRGB           EQUATE(00022009h) !- (9 | (32 << 8) | PixelFormatGDI)
PixelFormat32bppARGB          EQUATE(0026200Ah) !- (10 | (32 << 8) | PixelFormatAlpha | PixelFormatGDI | PixelFormatCanonical)
PixelFormat32bppPARGB         EQUATE(000E200Bh) !- (11 | (32 << 8) | PixelFormatAlpha | PixelFormatPAlpha | PixelFormatGDI)
PixelFormat48bppRGB           EQUATE(0010300Ch) !- (12 | (48 << 8) | PixelFormatExtended)
PixelFormat64bppARGB          EQUATE(0034400Dh) !- (13 | (64 << 8) | PixelFormatAlpha  | PixelFormatCanonical | PixelFormatExtended)
PixelFormat64bppPARGB         EQUATE(001C400Eh) !- (14 | (64 << 8) | PixelFormatAlpha  | PixelFormatPAlpha | PixelFormatExtended)
PixelFormat32bppCMYK          EQUATE(0000200Fh) !- (15 | (32 << 8))
PixelFormatMax                EQUATE(16)


!--------------------------------------------------------------------------
! GDI+ Pixel Format class
!--------------------------------------------------------------------------
TGdiPlusPixelFormat           CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
pixfmt                          GpPixelFormat, PRIVATE

!!!<summary>Getter and Setter</summary>
PixelFormat                     PROCEDURE(<GpPixelFormat pPixfmt>), GpPixelFormat, PROC
GetSize                         PROCEDURE(), UNSIGNED
IsIndexed                       PROCEDURE(), BOOL
IsAlpha                         PROCEDURE(), BOOL
IsExtended                      PROCEDURE(), BOOL
!!!<summary>Determine if the Pixel Format is Canonical format: 
!!!PixelFormat32bppARGB, PixelFormat32bppPARGB, PixelFormat64bppARGB, PixelFormat64bppPARGB
!!!</summary>
IsCanonical                     PROCEDURE(), BOOL
                              END
