!https://docs.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-using-a-brush-to-fill-shapes-use
!This example demonstrates how to fill shapes.

                              PROGRAM

  INCLUDE('winapi.inc'), ONCE
  INCLUDE('gdiplus.inc'), ONCE

  MAP
    wndProc(HWND hWnd, ULONG wMsg, UNSIGNED wParam, LONG lParam), LONG, PASCAL, PRIVATE

    FillSolidColor(HDC phdc)
    FillHatchPattern(HDC phdc)
    FillImageTexture(HDC phdc)
  END

Window                        WINDOW('GDI+ Using brush'),AT(,,197,145),CENTER,GRAY,SYSTEM,FONT('Segoe UI',9),RESIZE
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
  
  FillSolidColor(dc.GetHandle())
  FillHatchPattern(dc.GetHandle())
  FillImageTexture(dc.GetHandle())
  
FillSolidColor                PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
brush                           TGdiPlusSolidBrush
  CODE
  !The following example shows how to fill an ellipse with the color red:
  
  g.FromHDC(phdc)
  brush.CreateSolidBrush(GdipMakeARGB(255, 255, 0, 0))
  g.FillEllipse(brush, 0, 0, 100, 60)
  
FillHatchPattern              PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
brush                           TGdiPlusHatchBrush
  CODE
  !The following example demonstrates how to fill an ellipse with a hatch pattern:
  
  g.FromHDC(phdc)
  brush.CreateHatchBrush(HatchStyleHorizontal, 0FFFF0000h, 0FF80FFFFh)
  g.FillEllipse(brush, 0, 80, 100, 60)

FillImageTexture              PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
img                             TGdiPlusImage
brush                           TGdiPlusTextureBrush
m                               TGdiPlusMatrix
  CODE
  !The following example fills an ellipse with an image.
  
  g.FromHDC(phdc)
  img.FromFile('WAPP216.GIF')
  brush.CreateTextureBrush(img)
  
  !Scale the image
  m.CreateMatrix(75.0/640.0, 0.0, 0.0, 75.0/480.0, 0.0, 0.0)
  brush.SetTransform(m)
  
  !Fill the ellipse with repeated copies of the scaled image
  g.FillEllipse(brush, 120, 0, 150, 250)
