!https://docs.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-constructing-and-drawing-paths-use

  PROGRAM

  INCLUDE('winapi.inc'), ONCE
  INCLUDE('gdiplus.inc'), ONCE

  MAP
    wndProc(HWND hWnd, ULONG wMsg, UNSIGNED wParam, LONG lParam), LONG, PASCAL, PRIVATE

    CreatingFigures(HDC phdc)
    CreatingFigures2(HDC phdc)
  END

Window                        WINDOW('GDI+ Using Path'),AT(,,197,145),CENTER,GRAY,SYSTEM,FONT('Segoe UI',9),RESIZE
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
  
  CreatingFigures(dc.GetHandle())
  CreatingFigures2(dc.GetHandle())
  
CreatingFigures               PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
pen                             TGdiPlusPen
path                            TGdiPlusGraphicsPath
pts                             LIKE(GpPointF),DIM(3)
  CODE
  !The following example creates a path that has two figures. The first figure is an arc followed by a line. The second figure is a line followed by a curve, 
  !followed by a line. The first figure is left open, and the second figure is closed.
  
  g.FromHDC(phdc)
  pen.CreatePen(GdipMakeARGB(COLOR:Red), 2)
  path.CreatePath()
  
  pts[1].x = 40; pts[1].y = 60
  pts[2].x = 50; pts[2].y = 70
  pts[3].x = 30; pts[3].y = 90
  
  !The first figure is started automatically, so there is no need to call StartFigure here.
  path.AddArc(175, 50, 50, 50, 0, -180)
  path.AddLine(100, 0, 250, 20)

  path.StartFigure()
  path.AddLine(50, 20, 5, 90)
  path.AddCurve(ADDRESS(pts), 3)
  path.AddLine(50, 150, 150, 180)
  path.CloseFigure()

  g.DrawPath(pen, path)

  
CreatingFigures2              PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
pen                             TGdiPlusPen
brush                           TGdiPlusSolidBrush
path                            TGdiPlusGraphicsPath
rect                            LIKE(GpRect)
  CODE
  !The following example creates a path that has two lines, a rectangle, and an ellipse. The code uses a pen to draw the path and a brush to fill the path.
  
  g.FromHDC(phdc)
  pen.CreatePen(0FFFF0000h, 2)
  brush.CreateSolidBrush(0ff0000C8h)
  path.CreatePath()
  
  path.AddLine(210, 110, 300, 140)
  path.AddLine(300, 160, 230, 160)
  rect.x = 250; rect.y = 135; rect.width = 20; rect.height = 40
  path.AddRectangle(rect)
  path.AddEllipse(210, 175, 40, 30)

  g.DrawPath(pen, path)
  g.FillPath(brush, path)
