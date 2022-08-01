!https://docs.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-using-text-and-fonts-use

  PROGRAM

  INCLUDE('winapi.inc'), ONCE
  INCLUDE('gdiplus.inc'), ONCE

  MAP
    wndProc(HWND hWnd, ULONG wMsg, UNSIGNED wParam, LONG lParam), LONG, PASCAL, PRIVATE

    DrawTextAtSpecifiedLocation(HDC phdc)
    DrawTextInRect(HDC phdc)
    DrawAlignedText(HDC phdc)
    DrawVerticalText(HDC phdc)
    DrawTextWithTabstops(HDC phdc)

    INCLUDE('printf.inc'), ONCE
  END

Window                        WINDOW('GDI+ text drawing'),AT(,,298,203),CENTER,GRAY,SYSTEM,FONT('Segoe UI',9), |
                                RESIZE
                                BUTTON('Close'),AT(250,182,38),USE(?btnClose),STD(STD:Close)
                              END

TSimpleWindow                 CLASS(TCWnd), TYPE
OnPaint                         PROCEDURE(), VIRTUAL
                              END

thisWin                       TSimpleWindow

  CODE
  OPEN(Window)
  
  !- Sets the window's messaging procedure (wndProc)
  thisWin.Init(Window)
  thisWin.SetWndProc(ADDRESS(wndProc), ADDRESS(thisWin))
  
  ACCEPT
  END
  
  
wndProc                       PROCEDURE(HWND hWnd,ULONG wMsg,UNSIGNED wParam,LONG lParam)
win                             TWnd
this                            &TSimpleWindow
  CODE
  win.SetHandle(hWnd)
  !- get TSimpleWindow instance
  this &= win.GetWindowLong(GWL_USERDATA)
  IF this &= NULL
    !- not our window
    RETURN win.DefWindowProc(wMsg, wParam, lParam)
  END
  
  CASE wMsg
  OF WM_PAINT
    this.OnPaint()
    RETURN 0
  END
  
  !- call original window proc
  RETURN this.CallWindowProc(wMsg, wParam, lParam)

TSimpleWindow.OnPaint         PROCEDURE()
dc                              TPaintDC
  CODE
  dc.GetDC(SELF.hwnd)
  
  DrawTextAtSpecifiedLocation(dc.GetHandle())
  DrawTextInRect(dc.GetHandle())
  DrawAlignedText(dc.GetHandle())
  DrawVerticalText(dc.GetHandle())
  DrawTextWithTabstops(dc.GetHandle())
  
DrawTextAtSpecifiedLocation   PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
fFamily                         TGdiPlusFontFamily
f                               TGdiPlusFont
brush                           TGdiPlusSolidBrush
pt                              LIKE(GpPointF)
  CODE
  !The following example draws the string "Hello" at location (30, 10). 
  !The font family is Times New Roman. The font, which is an individual member of the font family, is Times New Roman, size 24 pixels, regular style. 
  
  g.FromHDC(phdc)
  
  fFamily.CreateFontFamily('Times New Roman')
  f.CreateFont(fFamily, 24, FontStyleRegular, UnitPixel)
  brush.CreateSolidBrush(0FF0000FFh)
  pt.x = 30; pt.y = 10

  g.DrawString('Hello', pt, f, brush)

DrawTextInRect                PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
fFamily                         TGdiPlusFontFamily
f                               TGdiPlusFont
brush                           TGdiPlusSolidBrush
rc                              LIKE(GpRectF)
pen                             TGdiPlusPen
  CODE
  !The following example creates a rectangle with upper-left corner (30, 60), width 100, and height 122. 
  !Then the code draws a string inside that rectangle. The string is restricted to the rectangle and wraps in such a way that individual words are not broken.
  g.FromHDC(phdc)
  
  fFamily.CreateFontFamily('Arial')
  f.CreateFont(fFamily, 12, FontStyleBold, UnitPoint)
  brush.CreateSolidBrush(0FFF00F00h)
  rc.x = 30; rc.y = 60; rc.width = 100; rc.height = 122
  g.DrawString('Draw text in a rectangle by passing a RectF to the DrawString method.', rc, f, brush)
  
  pen.CreatePen(0FF000000h)
  g.DrawRectangle(pen, rc)

DrawAlignedText               PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
fFamily                         TGdiPlusFontFamily
f                               TGdiPlusFont
brush                           TGdiPlusSolidBrush
sFormat                         TGdiPlusStringFormat
rc                              LIKE(GpRectF)
pen                             TGdiPlusPen
  CODE
  !The following example draws text in a rectangle. Each line of text is centered (side to side), and the entire block of text is centered (top to bottom) in the rectangle.
  g.FromHDC(phdc)
  
  fFamily.CreateFontFamily('Arial')
  f.CreateFont(fFamily, 12, FontStyleBold, UnitPoint)
  brush.CreateSolidBrush(0FFF00F00h)
  sFormat.CreateStringFormat()
  
  rc.x = 150; rc.y = 60; rc.width = 120; rc.height = 142
  
  !Use StringFormat and RectF objects to center text in a rectangle.
  sFormat.SetAlignment(StringAlignmentCenter)
  !Center the block of text (top to bottom) in the rectangle.
  sFormat.SetLineAlignment(StringAlignmentCenter)
  
  g.DrawString('Use StringFormat and RectF objects to center text in a rectangle.', rc, f, brush, sFormat)
  
  pen.CreatePen(0FF000000h)
  g.DrawRectangle(pen, rc)

DrawVerticalText              PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
fFamily                         TGdiPlusFontFamily
f                               TGdiPlusFont
brush                           TGdiPlusSolidBrush
sFormat                         TGdiPlusStringFormat
pt                              LIKE(GpPointF)
  CODE
  g.FromHDC(phdc)
  
  fFamily.CreateFontFamily('Lucida Console')
  f.CreateFont(fFamily, 14, FontStyleRegular, UnitPoint)
  brush.CreateSolidBrush(0FF008000h)
  
  pt.x = 300; pt.y = 50
  
  sFormat.CreateStringFormat()
  sFormat.SetFormatFlags(StringFormatFlagsDirectionVertical)

  g.DrawString('Vertical text', pt, f, brush, sFormat)

DrawTextWithTabstops          PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
fFamily                         TGdiPlusFontFamily
f                               TGdiPlusFont
brush                           TGdiPlusSolidBrush
sFormat                         TGdiPlusStringFormat
rc                              LIKE(GpRectF)
tabs                            SREAL, DIM(3)
sText                           STRING(256), AUTO
pen                             TGdiPlusPen
  CODE
  !The following example sets tab stops at 150, 250, and 350. Then the code displays a tabbed list of names and test scores.
  
  sText = printf('' |
    & 'Name<9>Test 1<9>Test 2<9>Test 3%|' |
    & 'Joe<9>95<9>88<9>91%|' |
    & 'Mary<9>98<9>84<9>90%|' |
    & 'Sam<9>42<9>76<9>98%|' |
    & 'Jane<9>65<9>73<9>92')
  
  
  g.FromHDC(phdc)
  
  fFamily.CreateFontFamily('Courier New')
  f.CreateFont(fFamily, 12, FontStyleRegular, UnitPoint)
  brush.CreateSolidBrush(0FF0000FFh)
  
  rc.x = 20; rc.y = 230; rc.width = 450; rc.height = 100
  
  tabs[1] = 150
  tabs[2] = 100
  tabs[3] = 100
  
  sFormat.CreateStringFormat()
  sFormat.SetTabStops(0, tabs)

  g.DrawString(sText, rc, f, brush, sFormat)
  
  !- rect around the text
  pen.CreatePen(0FF000000h)
  g.DrawRectangle(pen, rc)
