!https://docs.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-filling-shapes-with-a-gradient-brush-use

  PROGRAM

  INCLUDE('winapi.inc'), ONCE
  INCLUDE('gdiplus.inc'), ONCE

  MAP
    wndProc(HWND hWnd, ULONG wMsg, UNSIGNED wParam, LONG lParam), LONG, PASCAL, PRIVATE

    FillLinearGradients(HDC phdc)
    FillWithRelativeIntensities(HDC phdc)
  END

Window                        WINDOW('GDI+ Shapes'),AT(,,337,219),CENTER,GRAY,SYSTEM,FONT('Segoe UI',9), |
                                RESIZE
                                BUTTON('Close'),AT(291,197,38),USE(?btnClose),STD(STD:Close)
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
  
  FillLinearGradients(dc.GetHandle())
  FillWithRelativeIntensities(dc.GetHandle())
  
FillLinearGradients           PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
brush                           TgdiPlusLinearGradientBrush
pt1                             LIKE(GpPointF)
pt2                             LIKE(GpPointF)
pen                             TGdiPlusPen
  CODE
  !- The following example uses a horizontal linear gradient brush to fill a line, an ellipse, and a rectangle
  
  g.FromHDC(phdc)
  
  pt1.x = 0;   pt1.y = 10
  pt2.x = 200; pt2.y = 10
  brush.CreateLineBrush(pt1, pt2, 0FFFF0000h, 0FF0000FFh) !- opaque red to opaque blue
  pen.CreatePen(brush)

  g.DrawLine(pen, 0, 10, 200, 10)
  g.FillEllipse(brush, 0, 30, 200, 100)
  g.FillRectangle(brush, 0, 155, 500, 30)
  
FillWithRelativeIntensities   PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
brush                           TgdiPlusLinearGradientBrush
pt1                             LIKE(GpPointF)
pt2                             LIKE(GpPointF)
relativeIntensities             SREAL, DIM(3)
relativePositions               SREAL, DIM(3)
  CODE
  !- The following example calls the LinearGradientBrush.SetBlend method of a LinearGradientBrush object to associate three relative intensities with three relative positions.
  
  g.FromHDC(phdc)
  
  pt1.x = 0;   pt1.y = 10
  pt2.x = 200; pt2.y = 10
  brush.CreateLineBrush(pt1, pt2, 0FF000000h, 0FFFF0000h) !- opaque black to opaque red

  relativeIntensities[1] = 0.0
  relativeIntensities[2] = 0.5
  relativeIntensities[3] = 1.0
  
  relativePositions[1] = 0.0
  relativePositions[2] = 0.2
  relativePositions[3] = 1.0
  
  brush.SetBlend(relativeIntensities, relativePositions)

  g.FillEllipse(brush, 0, 230, 200, 100)
  g.FillRectangle(brush, 0, 355, 500, 30)
