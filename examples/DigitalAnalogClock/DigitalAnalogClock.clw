  PROGRAM

  INCLUDE('winapi.inc'), ONCE
  INCLUDE('gdiplus.inc'), ONCE

  MAP
    wndProc(HWND hWnd, ULONG wMsg, UNSIGNED wParam, LONG lParam), LONG, PASCAL, PRIVATE
    INCLUDE('printf.inc'), ONCE
  END

COLOR:WINDOWGRAY              EQUATE(0F0F0F0H)  !- window background

Window                        WINDOW('Digital-Analog Clock'),AT(,,243,190),CENTER,GRAY,SYSTEM, |
                                FONT('Calibri',10),TIMER(100)
                              END

TClockWindow                  CLASS(TCWnd), TYPE
brBack                          &TGdiPlusSolidBrush, PRIVATE
brArrow                         &TGdiPlusSolidBrush, PRIVATE
fntArrow                        &TGdiPlusFont, PRIVATE
penCenter                       &TGdiPlusPen, PRIVATE

Destruct                        PROCEDURE(), DERIVED
OnPaint                         PROCEDURE(), VIRTUAL, PROTECTED
UpdateClock                     PROCEDURE(TGdiPlusGraphics g, TRect rc), PRIVATE
DrawClockLine                   PROCEDURE(TGdiPlusGraphics g, TPoint pt, SREAL dxCenter, SREAL angle, STRING text, BYTE repeatCnt), PRIVATE
                              END

thisWin                       TClockWindow

  CODE
  OPEN(Window)
  
  thisWin.Init(Window)
  thisWin.SetWndProc(ADDRESS(wndProc), ADDRESS(thisWin))  !- set the window's messaging procedure (wndProc)
  
  ACCEPT
    CASE EVENT()
    OF EVENT:Timer
    OROF EVENT:Sized
      thisWin.InvalidateRect(FALSE) !- force WM_PAINT
    END
  END
  
  thisWin.Destruct()  !- early destructor call, to dispose gdi+ objects as soon as possible.
  
wndProc                       PROCEDURE(HWND hWnd,ULONG wMsg,UNSIGNED wParam,LONG lParam)
win                             TWnd
this                            &TClockWindow
  CODE
  win.SetHandle(hWnd)
  !- get TClockWindow instance
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

  

TClockWindow.Destruct         PROCEDURE()
  CODE
  DISPOSE(SELF.brBack)
  DISPOSE(SELF.brArrow)
  DISPOSE(SELF.penCenter)
  DISPOSE(SELF.fntArrow)

TClockWindow.OnPaint          PROCEDURE()
dc                              TPaintDC
rc                              TRect
g                               TGdiPlusGraphics
bm                              TGdiPlusBitmap
  CODE
  IF SELF.brBack &= NULL
    !- gdi+ objects initialization
    SELF.brBack &= NEW TGdiPlusSolidBrush
    SELF.brArrow &= NEW TGdiPlusSolidBrush
    SELF.penCenter &= NEW TGdiPlusPen
    SELF.fntArrow &= NEW TGdiPlusFont

    SELF.brBack.CreateSolidBrush(GdipMakeARGB(COLOR:WINDOWGRAY))
    SELF.brArrow.CreateSolidBrush(GdipMakeARGB(COLOR:Black))
    SELF.penCenter.CreatePen(SELF.brArrow)
    SELF.fntArrow.CreateFont('Calibri', 18, FontStyleRegular, UnitPixel)
  END
  
  SELF.GetClientRect(rc)
  dc.GetDC(SELF.hwnd)
    
  !- create a bitmap for drawing
  bm.CreateBitmap(rc.Width(), rc.Height(), PixelFormat24bppRGB)
  g.FromImage(bm)
  g.FillRectangle(SELF.brBack, rc)

  !- draw the clock
  SELF.UpdateClock(g, rc)

  !- draw the bitmap on the window
  g.DeleteGraphics()
  g.FromHDC(dc.GetHandle())
  g.DrawImage(bm, rc)

TClockWindow.UpdateClock      PROCEDURE(TGdiPlusGraphics g, TRect rc)
ptCenter                        TPoint
now                             LONG, AUTO
hours                           BYTE, AUTO
minutes                         BYTE, AUTO
seconds                         BYTE, AUTO
sText                           STRING(12), AUTO
angle                           SREAL, AUTO
rcCenter                        LIKE(TRectF), AUTO
szCenter                        LIKE(GpSizeF), AUTO
  CODE
  !- center
  ptCenter.x = (rc.right-rc.left)/2
  ptCenter.y = (rc.bottom-rc.top)/2
  
  szCenter.cx = 2
  szCenter.cy = 2
  rcCenter.Assign(ptCenter.x - szCenter.cx/2, ptCenter.y - szCenter.cy/2, ptCenter.x + szCenter.cx/2, ptCenter.y + szCenter.cy/2)
  g.DrawEllipse(SELF.penCenter, rcCenter)
  
  !- time
  now = CLOCK()
  hours = (now-1)/360000
  minutes = (now-hours*360000-1)/6000
  seconds = (now-hours*360000-minutes*6000-1)/100
  
  !- draw seconds
  sText = FORMAT(seconds, @n02)
  angle = seconds*6+90
  SELF.DrawClockLine(g, ptCenter, szCenter.cx+1, angle, sText, 6)
    
  !- draw minutes
  sText = FORMAT(minutes, @n02)
  angle = minutes*6+90
  SELF.DrawClockLine(g, ptCenter, szCenter.cx+1, angle, sText, 5)
    
  !- draw hours (0..12)
  hours = hours % 12
  IF hours = 0
    hours = 12
  END
  
  sText = FORMAT(hours, @n02)
  angle = (hours % 12)*30 + minutes*0.5 + 90
  SELF.DrawClockLine(g, ptCenter, szCenter.cx+1, angle, sText, 3)

TClockWindow.DrawClockLine    PROCEDURE(TGdiPlusGraphics g, TPoint pt, SREAL dxCenter, SREAL angle, STRING text, BYTE repeatCnt)
!https://stackoverflow.com/questions/4421381/how-to-rotate-text-in-gdi
ptOrigin                        LIKE(GpPointF)    ! initially (0, 0)
boundingBox                     LIKE(GpRectF), AUTO
bOnLeftSide                     BOOL, AUTO        !- left clock side (from 6 to 12 hrs)
i                               LONG, AUTO
  CODE  
  g.TranslateTransform(pt.x, pt.y)                      ! Set rotation point
  
  bOnLeftSide = CHOOSE(angle >= 270)
  IF bOnLeftSide
    g.RotateTransform(angle)                            ! Rotate text
  ELSE
    g.RotateTransform(angle+180)                        ! Rotate text
  END

  g.TranslateTransform(-pt.x, -pt.y)                    ! Reset translate transform
  g.MeasureString(text, ptOrigin, SELF.fntArrow,, boundingBox)   ! Get size of rotated text (bounding box)
  
  IF bOnLeftSide
    ptOrigin.x = pt.x - boundingBox.width - dxCenter
    ptOrigin.y = pt.y - boundingBox.height/2
  ELSE
    ptOrigin.x = pt.x + dxCenter
    ptOrigin.y = pt.y - boundingBox.height/2
  END

  LOOP i=1 TO repeatCnt
    g.DrawString(text, ptOrigin, SELF.fntArrow, SELF.brArrow)             ! Draw string from x, y
    !- next string starts where previous string ends
    IF bOnLeftSide
      ptOrigin.x -= boundingBox.width
    ELSE
      ptOrigin.x += boundingBox.width
    END
  END
  
  g.ResetTransform()                                    ! Only needed if you reuse the Graphics object for multiple calls to DrawString
