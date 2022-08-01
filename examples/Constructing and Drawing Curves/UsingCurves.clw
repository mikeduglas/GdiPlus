!https://docs.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-constructing-and-drawing-curves-use
  PROGRAM

  INCLUDE('winapi.inc'), ONCE
  INCLUDE('gdiplus.inc'), ONCE

  MAP
    wndProc(HWND hWnd, ULONG wMsg, UNSIGNED wParam, LONG lParam), LONG, PASCAL, PRIVATE

    DrawCardinalSplines(HDC phdc)
    DrawClosedCardinalSplines(HDC phdc)
    DrawBezierSplines(HDC phdc)
  END

Window                        WINDOW('GDI+ Curves'),AT(,,197,145),CENTER,GRAY,SYSTEM,FONT('Segoe UI',9),RESIZE
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
  
  DrawCardinalSplines(dc.GetHandle())
  DrawClosedCardinalSplines(dc.GetHandle())
  DrawBezierSplines(dc.GetHandle())
  
DrawCardinalSplines           PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
pen                             TGdiPlusPen
pts                             LIKE(GpPointF), DIM(5)
  CODE
  !- The following example draws a bell-shaped cardinal spline that passes through five designated points

  pts[1].x = 0;   pts[1].y = 100
  pts[2].x = 50;  pts[2].y = 80
  pts[3].x = 100; pts[3].y = 20
  pts[4].x = 150; pts[4].y = 80
  pts[5].x = 200; pts[5].y = 100
  
  g.FromHDC(phdc)
  pen.CreatePen(0FF0000FFh) ! blue pen
  g.DrawCurve(pen, ADDRESS(pts), 5)
  
DrawClosedCardinalSplines     PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
pen                             TGdiPlusPen
pts                             LIKE(GpPointF), DIM(6)
  CODE
  !- The following example draws a closed cardinal spline that passes through six designated points

  pts[1].x = 60;  pts[1].y = 60
  pts[2].x = 150; pts[2].y = 80
  pts[3].x = 200; pts[3].y = 40
  pts[4].x = 180; pts[4].y = 120
  pts[5].x = 120; pts[5].y = 100
  pts[6].x = 80;  pts[6].y = 160
  
  g.FromHDC(phdc)
  pen.CreatePen(0FFFF0000h) ! red pen
  g.DrawClosedCurve(pen, ADDRESS(pts), 6)
  
DrawBezierSplines             PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
pen                             TGdiPlusPen
p1                              LIKE(GpPointF)
p2                              LIKE(GpPointF)
c1                              LIKE(GpPointF)
c2                              LIKE(GpPointF)
  CODE
  !- The following example draws a Bezier spline with start point (10, 200) and end point (200, 200)

  p1.x = 10;  p1.y = 200  ! start point
  c1.x = 100; c1.y = 110   ! first control point
  c2.x = 150; c2.y = 250  ! second control point
  p2.x = 200; p2.y = 200  ! end point

  g.FromHDC(phdc)
  pen.CreatePen(0FF008000h) ! green pen
  g.DrawBezier(pen, p1, c1, c2, p2)
