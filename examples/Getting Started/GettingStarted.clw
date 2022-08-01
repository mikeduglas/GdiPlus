!https://docs.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-getting-started-use
!This example demonstrates how to draw a line and a string using GDI Plus.

  PROGRAM

  INCLUDE('winapi.inc'), ONCE
  INCLUDE('gdiplus.inc'), ONCE

  MAP
    wndProc(HWND hWnd, ULONG wMsg, UNSIGNED wParam, LONG lParam), LONG, PASCAL, PRIVATE

    DrawLine(HDC phdc)
    DrawString(HDC phdc)
    DrawGradientString(HDC phdc)
  END

Window                        WINDOW('GDI+ Getting Started'),AT(,,197,145),CENTER,GRAY,SYSTEM,FONT('Segoe UI',9),RESIZE
                                BUTTON('Close'),AT(151,124,38),USE(?btnClose),STD(STD:Close)
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
  
  DrawLine(dc.GetHandle())
  DrawString(dc.GetHandle())
  DrawGradientString(dc.GetHandle())
  
DrawLine                      PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
pen                             TGdiPlusPen
  CODE
  !- draw blue line
  g.FromHDC(phdc)
  pen.CreatePen(GdipMakeARGB(COLOR:Blue))
  pen.SetWidth(5)
  g.DrawLine(pen, 0, 0, 200, 100)

DrawString                    PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
brush                           TGdiPlusSolidBrush
f                               TGdiPlusFont
rc                              LIKE(GpRectF)
  CODE
  g.FromHDC(phdc)
  
  !- create green solid brush
  brush.CreateSolidBrush(GdipMakeARGB(COLOR:Green))
  
  !- create font
  f.CreateFont('Times New Roman', 24, FontStyleRegular, UnitPixel)
  
  !- draw string inside the rectangle
  rc.x = 20
  rc.y = 50
  rc.width = 80
  rc.height = 50
  g.DrawString('Hello world!', rc, f, brush)

DrawGradientString            PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
brush                           TGdiPlusLinearGradientBrush
brRect                          LIKE(GpRectF)
f                               TGdiPlusFont
rc                              LIKE(GpRectF)
  CODE
  g.FromHDC(phdc)
  
  !- create linear gradient (red-yellow) brush
  brRect.x = 0
  brRect.y = 0
  brRect.width = 100
  brRect.height = 100
  brush.CreateLineBrush(brRect, GdipMakeARGB(COLOR:Red), GdipMakeARGB(COLOR:Yellow), LinearGradientModeHorizontal)
  
  !- create font
  f.CreateFont('Times New Roman', 36, FontStyleRegular, UnitPixel)
  
  !- draw string inside the rectangle
  rc.x = 50
  rc.y = 120
  rc.width = 250
  rc.height = 80
  g.DrawString('Hello world!', rc, f, brush)
