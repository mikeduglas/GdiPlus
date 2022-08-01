!https://docs.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-using-a-pen-to-draw-lines-and-shapes-use
!This example demonstrates how to draw a line and a string using GDI Plus.

                              PROGRAM

  INCLUDE('winapi.inc'), ONCE
  INCLUDE('gdiplus.inc'), ONCE

  MAP
    wndProc(HWND hWnd, ULONG wMsg, UNSIGNED wParam, LONG lParam), LONG, PASCAL, PRIVATE

    DrawRectangle(HDC phdc)
    DrawLineCaps(HDC phdc)
    DrawJoinedLines(HDC phdc)
  END

Window                        WINDOW('GDI+ Using pen'),AT(,,197,145),CENTER,GRAY,SYSTEM,FONT('Segoe UI',9),RESIZE
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
  
  DrawRectangle(dc.GetHandle())
  DrawLineCaps(dc.GetHandle())
  DrawJoinedLines(dc.GetHandle())
  
DrawRectangle                 PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
pen                             TGdiPlusPen
  CODE
  !The following example draws a rectangle with its upper-left corner at (10, 10). The rectangle has a width of 100 and a height of 50.
  
  g.FromHDC(phdc)
  pen.CreatePen(GdipMakeARGB(COLOR:Black))
  pen.SetWidth(5)
  g.DrawRectangle(pen, 20, 20, 100, 50)

DrawLineCaps                  PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
pen                             TGdiPlusPen
  CODE
  !The following example draws a line with an arrowhead at one end and a round cap at the other end
  
  g.FromHDC(phdc)
  pen.CreatePen(0FF0000FFh, 8)
  pen.SetStartCap(LineCapArrowAnchor)
  pen.SetEndCap(LineCapRoundAnchor)
  g.DrawLine(pen, 20, 120, 300, 120)

DrawJoinedLines               PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
path                            TGdiPlusGraphicsPath
pen                             TGdiPlusPen
  CODE
  !The following example demonstrates a beveled line join between a horizontal line and a vertical line
  
  g.FromHDC(phdc)
  pen.CreatePen(0FF00FF00h, 8)
  
  path.CreatePath()
  path.StartFigure()
  path.AddLine(50, 150, 100, 150)
  path.AddLine(100, 150, 100, 200)

  pen.SetLineJoin(LineJoinBevel)
  g.DrawPath(pen, path)
