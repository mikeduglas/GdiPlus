!* GDI+ support
!* GDI+ Font class
!* mikeduglas 2022
!* mikeduglas@yandex.ru


GpLOGFONTA                    EQUATE(tagLOGFONTA)

!--------------------------------------------------------------------------
! GDI+ Font class
!--------------------------------------------------------------------------
TGdiPlusFont                  CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeFont                      LONG, PROTECTED
lastResult                      GpStatus, PROTECTED

Destruct                        PROCEDURE(), VIRTUAL
!!!<summary>Creates a Font object based on the GDI font object that is currently selected into a specified device context.</summary>
FromDC                          PROCEDURE(HDC phdc), GpStatus, PROC
!!!<summary>Creates a Font object directly from a GDI logical font.</summary>
FromHFONT                       PROCEDURE(HDC phdc, HFONT phfont), GpStatus, PROC
!!!<summary>Creates a Font object directly from a GDI logical font.</summary>
FromLogfontA                    PROCEDURE(HDC phdc, GpLOGFONTA pLogFont), GpStatus, PROC
!!!<summary>Creates a Font object based on a font family, a size, a font style, and a unit of measurement.</summary>
CreateFont                      PROCEDURE(TGdiPlusFontFamily pFamily, SREAL pEmSize, GpFontStyle pStyle, GpUnit pUnit), GpStatus, PROC
!!!<summary>Creates a Font object based on a font family, a size, a font style, a unit of measurement, and a FontCollection object.</summary>
CreateFont                      PROCEDURE(STRING pFamilyName, SREAL pEmSize, GpFontStyle pStyle, GpUnit pUnit, <TGdiPlusFontCollection pFontCollection>), GpStatus, PROC
!!!<summary>Uses a LOGFONTA structure to get the attributes of this Font object.</summary>
GetLogFontA                     PROCEDURE(*GpLOGFONTA pLogFont), GpStatus, PROC
!!!<summary>Uses a LOGFONTA structure to get the attributes of this Font object.</summary>
GetLogFontA                     PROCEDURE(TGdiPlusGraphics pGraphics, *GpLOGFONTA pLogFont), GpStatus, PROC
!!!<summary>Creates a new Font object based on this Font object.</summary>
Clone                           PROCEDURE(*TGdiPlusFont cloneFont), GpStatus, PROC
!!!<summary>Creates a new Font object based on this Font object.</summary>
Clone                           PROCEDURE(), *TGdiPlusFont
!!!<summary>Cleans up resources used by a Font object.</summary>
DeleteFont                      PROCEDURE(), GpStatus, PROC
IsAvailable                     PROCEDURE(), BOOL
!!!<summary>Gets the font family on which this font is based.</summary>
GetFamily                       PROCEDURE(*TGdiPlusFontFamily pFamily), GpStatus, PROC
!!!<summary>Gets the style of this font's typeface.</summary>
GetStyle                        PROCEDURE(), UNSIGNED
!!!<summary>Returns the font size (commonly called the em size) of this Font object. The size is in the units of this Font object.</summary>
GetSize                         PROCEDURE(), SREAL
!!!<summary>Returns the unit of measure of this Font object.</summary>
GetUnit                         PROCEDURE(), GpUnit
!!!<summary>Gets the line spacing of this font in the current unit of a specified Graphics object. The line spacing is the vertical distance between the base lines of two consecutive lines of text.
!!! Thus, the line spacing includes the blank space between lines along with the height of the character itself.</summary>
GetHeight                       PROCEDURE(TGdiPlusGraphics pGraphics), SREAL
!!!<summary>Gets the line spacing, in pixels, of this font. The line spacing is the vertical distance between the base lines of two consecutive lines of text.
!!! Thus, the line spacing includes the blank space between lines along with the height of the character itself.</summary>
GetHeight                       PROCEDURE(SREAL pDpi), SREAL
                              END


!--------------------------------------------------------------------------
! GDI+ Font Family class
!--------------------------------------------------------------------------
TGdiPlusFontFamily            CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeFamily                    LONG, PROTECTED
lastResult                      GpStatus, PROTECTED

Destruct                        PROCEDURE(), VIRTUAL
!!!<summary>Creates a FontFamily object based on a specified font family.</summary>
CreateFontFamily                PROCEDURE(STRING pName), GpStatus, PROC
!!!<summary>Creates a FontFamily object based on a specified font family.</summary>
FromName                        PROCEDURE(STRING pName, <TGdiPlusFontCollection pFontCollection>), GpStatus, PROC
!!!<summary>Gets a FontFamily object that specifies a generic sans serif typeface.</summary>
GenericSansSerif                PROCEDURE(), GpStatus, PROC
!!!<summary>Gets a FontFamily object that specifies a generic serif typeface.</summary>
GenericSerif                    PROCEDURE(), GpStatus, PROC
!!!<summary>Gets a FontFamily object that specifies a generic monospace typeface.</summary>
GenericMonospace                PROCEDURE(), GpStatus, PROC
!!!<summary>Cleans up resources used by a FontFamily object.</summary>
DeleteFontFamily                PROCEDURE(), GpStatus, PROC
!!!<summary>Creates a new FontFamily object based on this FontFamily object.</summary>
Clone                           PROCEDURE(*TGdiPlusFontFamily pCloneFamily), GpStatus, PROC
!!!<summary>Creates a new FontFamily object based on this FontFamily object.</summary>
Clone                           PROCEDURE(), *TGdiPlusFontFamily
!!!<summary>Gets the name of this font family.</summary>
GetFamilyName                   PROCEDURE(*STRING pName, *USHORT pLanguage), GpStatus, PROC
!!!<summary>Gets the name of this font family.</summary>
GetFamilyName                   PROCEDURE(), STRING
!!!<summary>Determines whether the specified style is available for this font family.</summary>
IsStyleAvailable                PROCEDURE(UNSIGNED pStyle), BOOL
!!!<summary>Gets the size (commonly called em size or em height), in design units, of this font family.</summary>
GetEmHeight                     PROCEDURE(UNSIGNED pStyle), USHORT
!!!<summary>Gets the cell ascent, in design units, of this font family for the specified style or style combination.</summary>
GetCellAscent                   PROCEDURE(UNSIGNED pStyle), USHORT
!!!<summary>Gets the cell descent, in design units, of this font family for the specified style or style combination.</summary>
GetCellDescent                  PROCEDURE(UNSIGNED pStyle), USHORT
!!!<summary>Gets the line spacing, in design units, of this font family for the specified style or style combination. The line spacing is the vertical distance between the base lines of two consecutive lines of text.</summary>
GetLineSpacing                  PROCEDURE(UNSIGNED pStyle), USHORT
                              END

!--------------------------------------------------------------------------
! GDI+ Font Collection class
!--------------------------------------------------------------------------
TGdiPlusFontCollection            CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeFontCollection                LONG, PROTECTED
lastResult                          GpStatus, PROTECTED

Construct                           PROCEDURE()
Destruct                            PROCEDURE(), VIRTUAL
GetFamilyCount                      PROCEDURE(), UNSIGNED
GetFamily                           PROCEDURE(UNSIGNED pCount, UNSIGNED pIndex, *TGdiPlusFontFamily pFamily), GpStatus, PROC
                                  END
TGdiPlusInstalledFontCollection   CLASS(TGdiPlusFontCollection), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                           PROCEDURE()
Destruct                            PROCEDURE(), DERIVED
                                  END
TGdiPlusPrivateFontCollection     CLASS(TGdiPlusFontCollection), TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
Construct                           PROCEDURE()
Destruct                            PROCEDURE(), DERIVED
AddFontFile                         PROCEDURE(STRING pFileName), GpStatus, PROC
                                  END
