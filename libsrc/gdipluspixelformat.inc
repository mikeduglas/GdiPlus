!* GDI+ support
!* Pixel format
!* mikeduglas 2022
!* mikeduglas@yandex.ru

GrARGB                        EQUATE(ULONG)

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

GpBitmapData                  GROUP, TYPE
Width                           UNSIGNED
Height                          UNSIGNED
Stride                          LONG
PixelFormat                     GpPixelFormat
Scan0                           LONG  !- VOID*
Reserved                        LONG  !- UINT_PTR
                              END


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
