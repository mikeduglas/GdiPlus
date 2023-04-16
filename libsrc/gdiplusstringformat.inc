!* GDI+ support
!* GDI+ StringFormat class
!* mikeduglas 2023
!* mikeduglas@yandex.ru


!GpCharacterRange              GROUP, TYPE
!First                           UNSIGNED
!Length                          UNSIGNED
!                              END


!--------------------------------------------------------------------------
! GDI+ StringFormat class
!--------------------------------------------------------------------------
TGdiPlusStringFormat          CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeFormat                    LONG, PROTECTED
lastResult                      GpStatus, PROTECTED

Destruct                        PROCEDURE(), VIRTUAL
Initialized                     PROCEDURE(), BOOL

!!!<summary>Creates a StringFormat object based on string format flags and a language.</summary>
CreateStringFormat              PROCEDURE(UNSIGNED pFormatFlags=0, USHORT pLanguage=0), GpStatus, PROC
!!!<summary>Creates a generic, default StringFormat object.</summary>
CreateGenericDefault            PROCEDURE(), GpStatus, PROC
!!!<summary>Creates a generic, typographic StringFormat object.</summary>
CreateGenericTypographic        PROCEDURE(), GpStatus, PROC
!!!<summary>Creates a StringFormat object from another StringFormat object.</summary>
Clone                           PROCEDURE(TGdiPlusStringFormat pClonedStringFormat), GpStatus, PROC
!!!<summary>Releases resources used by the StringFormat object.</summary>
DeleteStringFormat              PROCEDURE(), GpStatus, PROC
!!!<summary>Sets the format flags for this StringFormat object. The format flags determine most of the characteristics of a StringFormat object.</summary>
SetFormatFlags                  PROCEDURE(UNSIGNED pFlags), GpStatus, PROC
!!!<summary>Gets the string format flags for this StringFormat object.</summary>
GetFormatFlags                  PROCEDURE(), UNSIGNED
!!!<summary>Sets the character alignment of this StringFormat object in relation to the origin of the layout rectangle. The layout rectangle is used to position the displayed string.</summary>
SetAlignment                    PROCEDURE(GpStringAlignment pAlign), GpStatus, PROC
!!!<summary>Gets an element of the StringAlignment enumeration that indicates the character alignment of this StringFormat object in relation to the origin of the layout rectangle. A layout rectangle is used to position the displayed string.</summary>
GetAlignment                    PROCEDURE(), GpStringAlignment
!!!<summary>Sets the line alignment of this StringFormat object in relation to the origin of the layout rectangle. The line alignment setting specifies how to align the string vertically in the layout rectangle. The layout rectangle is used to position the displayed string.</summary>
SetLineAlignment                PROCEDURE(GpStringAlignment pAlign), GpStatus, PROC
!!!<summary>Gets an element of the StringAlignment enumeration that indicates the line alignment of this StringFormat object in relation to the origin of the layout rectangle. The line alignment setting specifies how to align the string vertically in the layout rectangle. The layout rectangle is used to position the displayed string.</summary>
GetLineAlignment                PROCEDURE(), GpStringAlignment
!!!<summary>Sets the type of processing that is performed on a string when the hot key prefix, an ampersand (&), is encountered. The ampersand is called the hot key prefix and can be used to designate certain keys as hot keys.</summary>
SetHotkeyPrefix                 PROCEDURE(GpHotkeyPrefix pHotkeyPrefix), GpStatus, PROC
!!!<summary>Gets an element of the HotkeyPrefix enumeration that indicates the type of processing that is performed on a string when a hot key prefix, an ampersand (&), is encountered.</summary>
GetHotkeyPrefix                 PROCEDURE(), GpHotkeyPrefix
!!!<summary>Sets the offsets for tab stops in this StringFormat object.</summary>
SetTabStops                     PROCEDURE(SREAL pFirstTabOffset, *SREAL[] pTabStops), GpStatus, PROC
!!!<summary>Gets the number of tab-stop offsets in this StringFormat object.</summary>
GetTabStopCount                 PROCEDURE(), UNSIGNED
!!!<summary>Gets the offsets of the tab stops in this StringFormat object.</summary>
GetTabStops                     PROCEDURE(UNSIGNED pCount, *SREAL pFirstTabOffset, *SREAL[] pTabStops), GpStatus, PROC
!!!<summary>Sets the digit substitution method and the language that corresponds to the digit substitutes.</summary>
SetDigitSubstitution            PROCEDURE(USHORT pLanguage, GpStringDigitSubstitute pSubstitute), GpStatus, PROC
!!!<summary>Gets the language that corresponds to the digit substitutes.</summary>
GetDigitSubstitutionLanguage    PROCEDURE(), USHORT
!!!<summary>Gets the digit substitution method that corresponds to the digit substitutes.</summary>
GetDigitSubstitutionMethod      PROCEDURE(), GpStringDigitSubstitute
!!!<summary>Sets the trimming style for this StringFormat object. The trimming style determines how to trim a string so that it fits into the layout rectangle.</summary>
SetTrimming                     PROCEDURE(GpStringTrimming pTrimming), GpStatus, PROC
!!!<summary>Gets an element of the StringTrimming enumeration that indicates the trimming style of this StringFormat object. The trimming style determines how to trim characters from a string that is too large to fit in the layout rectangle.</summary>
GetTrimming                     PROCEDURE(), GpStringTrimming
!!!<summary>Sets a series of character ranges for this StringFormat object that, when in a string, can be measured by the Graphics::MeasureCharacterRanges method.</summary>
SetMeasurableCharacterRanges    PROCEDURE(UNSIGNED pRangeCount, LONG pRanges), GpStatus, PROC
!!!<summary>Gets the number of measurable character ranges that are currently set. The character ranges that are set can be measured in a string by using the Graphics::MeasureCharacterRanges method.</summary>
GetMeasurableCharacterRangeCount    PROCEDURE(), UNSIGNED
                              END
