  PROGRAM

  INCLUDE('winapi.inc'), ONCE
  INCLUDE('gdiplus.inc'), ONCE

  MAP
    wndProc(HWND hWnd, ULONG wMsg, UNSIGNED wParam, LONG lParam), LONG, PASCAL, PRIVATE
    INCLUDE('printf.inc'), ONCE
  END

Window                        WINDOW('Heart'),AT(,,197,145),CENTER,GRAY,SYSTEM,FONT('Segoe UI',9)
                              END

TSimpleWindow                 CLASS(TCWnd), TYPE
a                               SREAL, PROTECTED
Construct                       PROCEDURE()
Iterate                         PROCEDURE()
DrawCurve                       PROCEDURE(HDC hdc), PROTECTED, VIRTUAL
OnPaint                         PROCEDURE(), VIRTUAL
                              END

thisWin                       TSimpleWindow

pi                            EQUATE(3.141592625)
COLOR:WINDOWGRAY              EQUATE(0F0F0F0H)    !- default TAB background 

  CODE
  OPEN(Window)
  Window{PROP:Timer} = 1
  
  !- Sets the window's messaging procedure (wndProc)
  thisWin.Init(Window)
  thisWin.SetWndProc(ADDRESS(wndProc), ADDRESS(thisWin))
 
  ACCEPT
    CASE EVENT() 
    OF EVENT:Timer
      thisWin.Iterate()
    END
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
  
  
TSimpleWindow.Construct       PROCEDURE()
  CODE
  SELF.a = 5
  
TSimpleWindow.Iterate         PROCEDURE()
rc                              TRect
  CODE
  SELF.a += 0.2
  IF SELF.a > 30
    SELF.a = 5
  END
  
  SELF.GetClientRect(rc)
  SELF.InvalidateRect(rc, FALSE)
    
TSimpleWindow.DrawCurve       PROCEDURE(HDC hdc)
rc                              TRect
g                               TGdiPlusGraphics
gTmp                            TGdiPlusGraphics
img                             TGdiPlusBitmap
pen                             TGdiPlusPen
brush                           TGdiPlusSolidBrush

x                               SREAL, AUTO
y                               SREAL, AUTO
dx                              SREAL, AUTO
minX                            SREAL, AUTO
maxX                            SREAL, AUTO
numPoints                       UNSIGNED, AUTO
pts                             LIKE(GpPointF), DIM(1000)
i                               LONG(0)
w                               UNSIGNED, AUTO
h                               UNSIGNED, AUTO
  CODE
  SELF.GetClientRect(rc)
  w = rc.Width()
  h = rc.Height()

  numPoints = MAXIMUM(pts, 1)
  
  !- calc points of cardinal splines
  minX = -1.83
  maxX = +1.83
  x = minX
  dx = 1.0 / ((numPoints-1) / (maxX - minX))
  LOOP i=1 TO numPoints
    y = (x^2)^(1/3) + 0.9*((3.3-x^2)^0.5)*SIN(SELF.a*pi*x)

    !- convert to client coordinates
    pts[i].x = x*w/4 + w/2                !- -2.0..+2.0
    pts[i].y = -y*h/4 + h/2 + h/8         !- -1.5..+2.5
    x += dx
  END

  pen.CreatePen(GdipMakeARGB(COLOR:Red), 1)
  brush.CreateSolidBrush(GdipMakeARGB(COLOR:WINDOWGRAY))
  
  !- create temp image
  img.CreateBitmap(w, h, PixelFormat24bppRGB)
  gTmp.FromImage(img)
  
  !- set background
  gTmp.FillRectangle(brush, 0, 0, img.GetWidth(), img.GetHeight())
  
  !- draw cardinal splines
  gTmp.DrawCurve(pen, ADDRESS(pts), numPoints)
  
  !- draw temp image on the device context
  g.FromHDC(hdc)
  g.DrawImage(img, rc.left, rc.top, w, h)

TSimpleWindow.OnPaint         PROCEDURE()
dc                              TPaintDC
hdc                             HDC, AUTO
  CODE
  hdc = dc.GetDC(SELF.hwnd)
  SELF.DrawCurve(hdc)
