!https://stackoverflow.com/questions/74508343/is-there-a-simple-way-to-draw-a-graph-in-christmas-tree-farm-in-r
  
  PROGRAM

  INCLUDE('winapi.inc'), ONCE
  INCLUDE('gdiplus.inc'), ONCE

  MAP
    MODULE('win api')
      winapi::SystemParametersInfo(ULONG uiAction, ULONG uiParam, ULONG pvParam, ULONG fWinIni),BYTE,PROC,PASCAL,NAME('SystemParametersInfoA')
    END
    PointInPolygon(LONG nvert, LONG vertices, GpPointF pt), BOOL !https://stackoverflow.com/questions/217578/how-can-i-determine-whether-a-2d-point-is-within-a-polygon/2922778#2922778
    INCLUDE('printf.inc'), ONCE
  END

!- winapi equates
WS_EX_LAYERED                 EQUATE(80000h)  !- Window extended style
SPI_GETWORKAREA               EQUATE(48)      !- SystemParametersInfo: uiAction


!- UpdateLayeredWindow arameters
tagBLENDFUNCTION              GROUP, TYPE
BlendOp                         BYTE
BlendFlags                      BYTE
SourceConstantAlpha             BYTE
AlphaFormat                     BYTE
                              END
!currentlly defined blend function
AC_SRC_OVER                   EQUATE(0)
!alpha format flags
AC_SRC_ALPHA                  EQUATE(01h)
ULW_ALPHA                     EQUATE(2h)



TChristmasTree                CLASS(TWnd), TYPE
imgStatic                       &TGdiPlusBitmap, PRIVATE
imgDynamic                      &TGdiPlusBitmap, PRIVATE
scaleX                          SREAL, PRIVATE
scaleY                          SREAL, PRIVATE
origin                          LIKE(GpPointF), PRIVATE
branchPts                       LIKE(GpPointF), DIM(11), PRIVATE
trunkPts                        LIKE(GpPointF), DIM(4), PRIVATE
maxBulbs                        LONG(200), PRIVATE
starSize                        SREAL(0.75), PRIVATE

Construct                       PROCEDURE()
Destruct                        PROCEDURE(), VIRTUAL
Init                            PROCEDURE(<WINDOW pW>), DERIVED
Kill                            PROCEDURE()
MakeStaticImage                 PROCEDURE(), PRIVATE
MakeDynamicImage                PROCEDURE(), PRIVATE
OpenWindow                      PROCEDURE(), BYTE, PROTECTED
Display                         PROCEDURE()
MakeTopmost                     PROCEDURE(), PRIVATE
TransformPoint                  PROCEDURE(GpPointF pt), PRIVATE
                              END


Me                            TChristmasTree


Window                        WINDOW('Christmas tree'),AT(,,186,179),GRAY,FONT('Segoe UI',9)
                              END

  CODE
  OPEN(Window)
  Window{PROP:Timer} = 50
  
  Me.Init(Window)
  
  Me.Display()

  ACCEPT
    CASE EVENT()
    OF EVENT:Timer
      Me.Display()
    END
  END
  
  Me.Kill()

  
  
  
TChristmasTree.Construct      PROCEDURE()
  CODE
  
TChristmasTree.Destruct       PROCEDURE()
  CODE

TChristmasTree.Init           PROCEDURE(<WINDOW pW>)
rcScreen                        LIKE(_RECT_)
rcWin                           LIKE(_RECT_)
  CODE
  PARENT.Init(pW)
  SELF.ModifyStyleEx(0, WS_EX_LAYERED)    !- enable UpdateLayeredWindow api
  SELF.ModifyStyleEx(0, WS_EX_TOOLWINDOW) !- don't show on taskbar
  
  REGISTEREVENT(EVENT:OpenWindow, ADDRESS(SELF.OpenWindow), ADDRESS(SELF), SELF.w)  !- take control over Event:OpenWindow

  !- move the window to right-bottom
  winapi::SystemParametersInfo(SPI_GETWORKAREA, 0, ADDRESS(rcScreen), 0)
  SELF.GetClientRect(rcWin)
  SELF.SetWindowPos(0, rcScreen.right - rcWin.right, rcScreen.bottom - rcWin.bottom, rcWin.right, rcWin.bottom, 0)

  !- make static image
  SELF.MakeStaticImage()

TChristmasTree.Kill           PROCEDURE()
  CODE
  UNREGISTEREVENT(EVENT:OpenWindow, ADDRESS(SELF.OpenWindow), ADDRESS(SELF), SELF.w)
  
  IF NOT SELF.imgStatic &= NULL
    SELF.imgStatic.DisposeImage()
    DISPOSE(SELF.imgStatic)
    SELF.imgStatic &= NULL
  END
    
  IF NOT SELF.imgDynamic &= NULL
    SELF.imgDynamic.DisposeImage()
    DISPOSE(SELF.imgDynamic)
    SELF.imgDynamic &= NULL
  END

TChristmasTree.MakeStaticImage    PROCEDURE()
g                                   TGdiPlusGraphics
pth                                 TGdiPlusGraphicsPath
brTrunk                             TGdiPlusHatchBrush
brBranches                          TGdiPlusHatchBrush
rc                                  TRect
pt                                  &GpPointF
i                                   LONG, AUTO
  CODE
  IF SELF.imgStatic &= NULL
    SELF.GetClientRect(rc)

    SELF.imgStatic &= NEW TGdiPlusBitmap
    SELF.imgStatic.FromScan0(rc.Width(), rc.Height(), rc.Width()*4, PixelFormat32bppARGB, 0)
    
    g.FromImage(SELF.imgStatic)
    g.SetSmoothingMode(SmoothingModeAntiAlias)
        
    !- coordinate transformation
    SELF.scaleX = rc.Width() / 12  !(-6..+6)
    SELF.scaleY = rc.Height() / 9  !(0..9)
    SELF.origin.x = (rc.Width() - rc.left) / 2
    SELF.origin.y = rc.top + rc.Height()

    !- draw trunk
    SELF.trunkPts[1].x = -0.7; SELF.trunkPts[1].y = 0
    SELF.trunkPts[2].x = -0.2; SELF.trunkPts[2].y = 6.75
    SELF.trunkPts[3].x = 0.2; SELF.trunkPts[3].y = 6.75
    SELF.trunkPts[4].x = 0.7; SELF.trunkPts[4].y = 0
    
    LOOP i=1 TO MAXIMUM(SELF.trunkPts, 1)
      pt &= ADDRESS(SELF.trunkPts[i])
      SELF.TransformPoint(pt)
    END
    
    pth.CreatePath()
    pth.AddPolygon(ADDRESS(SELF.trunkPts), 4)
    brTrunk.CreateHatchBrush(HatchStyleHorizontalBrick, GdipMakeARGB(COLOR:Red, 255), GdipMakeARGB(COLOR:Maroon, 255))
    g.FillPath(brTrunk, pth)
    brTrunk.DeleteBrush()
    pth.DeletePath()

    !- draw branches
    SELF.branchPts[1].x = -5; SELF.branchPts[1].y = 1
    SELF.branchPts[2].x = -1.25; SELF.branchPts[2].y = 3
    SELF.branchPts[3].x = -3.8; SELF.branchPts[3].y = 3
    SELF.branchPts[4].x = -1.25; SELF.branchPts[4].y = 5
    SELF.branchPts[5].x = -3; SELF.branchPts[5].y = 5
    SELF.branchPts[6].x = 0; SELF.branchPts[6].y = 7    !- tree top
    SELF.branchPts[7].x = 3; SELF.branchPts[7].y = 5
    SELF.branchPts[8].x = 1.25; SELF.branchPts[8].y = 5
    SELF.branchPts[9].x = 3.8; SELF.branchPts[9].y = 3
    SELF.branchPts[10].x = 1.25; SELF.branchPts[10].y = 3
    SELF.branchPts[11].x = 5; SELF.branchPts[11].y = 1

    LOOP i=1 TO MAXIMUM(SELF.branchPts, 1)
      pt &= ADDRESS(SELF.branchPts[i])
      SELF.TransformPoint(pt)
    END
    
    pth.CreatePath()
    pth.AddPolygon(ADDRESS(SELF.branchPts), 11)
    brBranches.CreateHatchBrush(HatchStyle25Percent, GdipMakeARGB(COLOR:Black, 220), GdipMakeARGB(COLOR:Green, 220))
    g.FillPath(brBranches, pth)
    brBranches.DeleteBrush()
    pth.DeletePath()
    
    g.DeleteGraphics()
  END
  
TChristmasTree.MakeDynamicImage   PROCEDURE()
g                                   TGdiPlusGraphics
br                                  TGdiPlusSolidBrush
pen                                 TGdiPlusPen
ptBulb                              LIKE(GpPointF), AUTO
clrBulb                             LONG, AUTO
nBulbs                              LONG(0)
counter                             LONG, STATIC
starAlpha                           SREAL, AUTO
starPts                             LIKE(GpPointF), DIM(10), AUTO
starCenter                          LIKE(GpPointF), AUTO
pt                                  &GpPointF, AUTO
dx                                  SREAL, AUTO
i                                   LONG, AUTO
  CODE
  !- Clone static image
  IF SELF.imgDynamic &= NULL
    SELF.imgDynamic &= NEW TGdiPlusBitmap
  ELSE
    SELF.imgDynamic.DisposeImage()
  END
  SELF.imgStatic.Clone(SELF.imgDynamic)
  
  g.FromImage(SELF.imgDynamic)
  g.SetSmoothingMode(SmoothingModeAntiAlias)

  !- draw light bulbs
  LOOP WHILE nBulbs < SELF.maxBulbs
    ptBulb.x = RANDOM(-490, 490) / 100 !- branches x-edges
    ptBulb.y = RANDOM(110, 690) / 100   !- branches y-edges
    SELF.TransformPoint(ptBulb)
    IF PointInPolygon(MAXIMUM(SELF.branchPts, 1), ADDRESS(SELF.branchPts), ptBulb)
      EXECUTE RANDOM(1, 4)
        clrBulb = COLOR:Red
        clrBulb = COLOR:White
        clrBulb = COLOR:Blue
        clrBulb = COLOR:Yellow
      END
      br.CreateSolidBrush(GdipMakeARGB(clrBulb, 220))
      g.FillEllipse(br, ptBulb.x-2.5, ptBulb.y-2.5, 5, 5) 
      br.DeleteBrush()
      
      nBulbs += 1
    END
  END
  
  !- draw star
  starAlpha = SIN(counter / 10)
  counter = (counter + 1) % 31

  dx = 2.199
  LOOP i=1 TO 10 BY 2
    starPts[i].x = COS(dx)*SELF.starSize/2
    starPts[i].y = SIN(dx)*SELF.starSize/2 + 8 - SELF.starSize
    dx = dx + 0.628
    starPts[i+1].x = COS(dx)*SELF.starSize
    starPts[i+1].y = SIN(dx)*SELF.starSize + 8 - SELF.starSize
    dx = dx + 0.628
  END
  LOOP i=1 TO MAXIMUM(starPts, 1)
    pt &= ADDRESS(starPts[i])
    SELF.TransformPoint(pt)
  END

  pen.CreatePen(0FFFF5050h, 1, UnitPixel)
  br.CreateSolidBrush(GdipMakeARGB(COLOR:Blue, starAlpha * 128 + 127))
  
  !- star shape
  g.FillPolygon(br, ADDRESS(starPts), 10)
  g.DrawPolygon(pen, ADDRESS(starPts), 10)
  
  !- star radiuses
  starCenter.x = 0
  starCenter.y = 8 - SELF.starSize
  SELF.TransformPoint(starCenter)
  
  LOOP i=1 TO 10
    g.DrawLine(pen, starCenter.x, starCenter.y, starPts[i].x, starPts[i].y)
  END

  pen.DeletePen()
  br.DeleteBrush()
  
  g.DeleteGraphics()

TChristmasTree.OpenWindow     PROCEDURE()
  CODE
  SELF.MakeTopmost()
  RETURN Level:Benign
  
TChristmasTree.Display        PROCEDURE()
g                               TGdiPlusGraphics
img                             &TGdiPlusBitmap
imageWidth                      LONG, AUTO
imageHeight                     LONG, AUTO
screenDC                        TDC
drawingDC                       TDC
newBitmap                       TBitmap
oldBitmap                       TBitmap
rcImage                         LIKE(GpRect), AUTO
blend                           LIKE(tagBLENDFUNCTION), AUTO
windowPosition                  LIKE(POINT), AUTO
windowSize                      LIKE(SIZE), AUTO
imagePosition                   LIKE(POINT), AUTO
rcWin                           TRect
  CODE
  SELF.MakeDynamicImage()
  img &= SELF.imgDynamic

  imageWidth = img.GetWidth()
  imageHeight = img.GetHeight()

  screenDC.GetDC(0)
  
  !- Make a DC which which hold the bitmap for drawing
  drawingDC.CreateCompatibleDC(screenDC)
  
  !- Create a new bitmap for drawing on it
  newBitmap.CreateCompatibleBitmap(screenDC, imageWidth, imageHeight)
  
  !- Select the new bitmap onto the drawing DC and save the old one
  newBitmap.SelectObject(drawingDC, oldBitmap)
  
  !- Draw image to the newly created DC
  g.FromHDC(drawingDC.GetHandle())
  rcImage.x = 0
  rcImage.y = 0
  rcImage.width = imageWidth
  rcImage.height = imageHeight
  g.DrawImage(img, rcImage)
  
  !- Create a blend function
  blend.AlphaFormat = AC_SRC_ALPHA
  blend.SourceConstantAlpha = 255
  blend.BlendOp = AC_SRC_OVER
  blend.BlendFlags = 0

  !- Set window info
  SELF.GetWindowRect(rcWin)
  
  windowPosition.x = rcWin.left
  windowPosition.y = rcWin.top
  windowSize.cx = imageWidth
  windowSize.cy = imageHeight
  imagePosition.x = 0
  imagePosition.y = 0
  
  !- Display image
  SELF.UpdateLayeredWindow(screenDC.GetHandle(), ADDRESS(windowPosition), ADDRESS(windowSize), drawingDC.GetHandle(), ADDRESS(imagePosition), 0, ADDRESS(blend), ULW_ALPHA)
  
  !- Clean up gdi objects
  oldBitmap.SelectObject(drawingDC)
  newBitmap.DeleteObject()
  drawingDC.DeleteDC()
  screenDC.ReleaseDC()


TChristmasTree.MakeTopmost    PROCEDURE()
  CODE
  SELF.SetWindowPos(HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE+SWP_NOSIZE)

TChristmasTree.TransformPoint PROCEDURE(GpPointF pt)
  CODE
  pt.x = SELF.origin.x + SELF.scaleX*pt.x
  pt.y = SELF.origin.y - SELF.scaleY*pt.y


PointInPolygon                PROCEDURE(LONG nvert, LONG vertices, GpPointF pt)
verti                           &GpPointF
vertj                           &GpPointF
i                               LONG, AUTO
j                               LONG, AUTO
odd                             BOOL(FALSE)
  CODE
  j = nvert
  LOOP i=1 TO nvert
    verti &= vertices + SIZE(GpPointF)*(i-1)
    vertj &= vertices + SIZE(GpPointF)*(j-1)
    
    IF (CHOOSE(verti.y > pt.y) <> CHOOSE(vertj.y > pt.y)) AND |
       (pt.x < (vertj.x-verti.x) * (pt.y-verti.y) / (vertj.y-verti.y) + verti.x)
      odd = CHOOSE(NOT odd)
    END
    
    j = i
  END
  
  RETURN odd