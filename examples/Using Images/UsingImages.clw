!https://docs.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-using-images-bitmaps-and-metafiles-use
!This example demonstrates how to use images and bitmaps.

                              PROGRAM

  INCLUDE('winapi.inc'), ONCE
  INCLUDE('gdiplus.inc'), ONCE

  MAP
    wndProc(HWND hWnd, ULONG wMsg, UNSIGNED wParam, LONG lParam), LONG, PASCAL, PRIVATE

    ScaleCropImage(HDC phdc)
    MappedToParallelogram(HDC phdc)
    ColorProfile(HDC phdc)
    CachedBitmap(HDC phdc)
  END

Window                        WINDOW('GDI+ Using images'),AT(,,418,243),CENTER,SYSTEM,FONT('Segoe UI',9), |
                                RESIZE
                                BUTTON('Close'),AT(365,221,45),USE(?btnClose),STD(STD:Close)
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
  
  ScaleCropImage(dc.GetHandle())
  MappedToParallelogram(dc.GetHandle())
  ColorProfile(dc.GetHandle())
!  CachedBitmap(dc.GetHandle())
  
ScaleCropImage                PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
img                             TGdiPlusImage
w                               UNSIGNED, AUTO
h                               UNSIGNED, AUTO
srcRect                         LIKE(GpRectF)
destRect                        LIKE(GpRectF)
  CODE
  !The following example constructs an Image object from the file apple-dreaming.jpg. 
  !The code draws the entire apple image in its original size. The code then calls the DrawImage method of a Graphics object to draw a portion of the apple image 
  !in a destination rectangle that is larger than the original apple image.
  
  g.FromHDC(phdc)
  img.FromFile('apple-dreaming.jpg')
  w = img.GetWidth()
  h = img.GetHeight()
  
  !Draw the image unaltered with its upper-left corner at (0, 0).
  g.DrawImage(img, 0, 0)
    
  !Make the destination rectangle 30 percent wider and 30 percent taller than the original image.
  !Put the upper-left corner of the destination rectangle at (100, 10).
  destRect.x = 100
  destRect.y = 10
  destRect.width = 1.3 * w
  destRect.height = 1.3 * h

  !Draw a portion of the image. Scale that portion of the image so that it fills the destination rectangle.
  srcRect.x = 0                 !upper-left corner of source rectangle
  srcRect.y = 0                 !of source rectangle
  srcRect.width = 0.75 * w      !width of source rectangle
  srcRect.height = 0.75 * h     !height of source rectangle
  g.DrawImage(img, destRect, srcRect, UnitPixel)
  
  
MappedToParallelogram         PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
img                             TGdiPlusImage
pt1                             LIKE(GpPointF)
pt2                             LIKE(GpPointF)
pt3                             LIKE(GpPointF)
  CODE
  !The following example demonstrates how to fill an ellipse with a hatch pattern:
  
  g.FromHDC(phdc)
  img.FromFile('image.png')
  
  g.DrawImage(img, 320, 0)

  pt1.x = 320+250
  pt1.y = 20
  
  pt2.x = 320+160
  pt2.y = 100
  
  pt3.x = 320+350
  pt3.y = 80
  
  g.DrawImage(img, pt1, pt2, pt3)
    
ColorProfile                  PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
img                             TGdiPlusImage
imAtt                           TGdiPlusImageAttributes
w                               UNSIGNED, AUTO
h                               UNSIGNED, AUTO
  CODE
  !https://docs.microsoft.com/en-us/windows/win32/api/gdiplusimageattributes/nf-gdiplusimageattributes-imageattributes-setoutputchannelcolorprofile
  
  !The following example creates an Image object and calls the DrawImage method to draw the image. 
  !Then the code creates an ImageAttributes object and calls its ImageAttributes::SetOutputChannelColorProfile method to specify a profile file for the bitmap category. 
  !The call to ImageAttributes::SetOutputChannel sets the output channel (for the bitmap category) to cyan. 
  !The code calls DrawImage a second time, passing the address of the Image object and the address of the ImageAttributes object. 
  !The cyan channel of each pixel is calculated, and the rendered image shows the intensities of the cyan channel as shades of gray. 
  !The code calls DrawImage three more times to show the intensities of the magenta, yellow, and black channels.
  
  g.FromHDC(phdc)
  
  img.FromFile('mosaic.bmp')
  imAtt.CreateImageAttributes()
  
  w = img.GetWidth()
  h = img.GetHeight()
  
  !Draw the image unaltered.
  g.DrawImage(img, 20, 250, w, h)
  
!  imAtt.SetOutputChannelColorProfile('TEKPH600.ICM', ColorAdjustTypeBitmap)  !- I have no such file in c:\windows\System32\Spool\Drivers\Color\
  imAtt.SetOutputChannelColorProfile('RSWOP.icm', ColorAdjustTypeBitmap)      !- I do have such file in c:\windows\System32\Spool\Drivers\Color\, so lets using it!

  !Draw the image, showing the intensity of the cyan channel.
  imAtt.SetOutputChannel(ColorChannelFlagsC, ColorAdjustTypeBitmap)
  g.DrawImage(img, 120, 250, w, h, 0, 0, w, h, UnitPixel, imAtt)

  !Draw the image, showing the intensity of the magenta channel.
  imAtt.SetOutputChannel(ColorChannelFlagsM, ColorAdjustTypeBitmap)
  g.DrawImage(img, 220, 250, w, h, 0, 0, w, h, UnitPixel, imAtt)

  !Draw the image, showing the intensity of the yellow channel.
  imAtt.SetOutputChannel(ColorChannelFlagsY, ColorAdjustTypeBitmap)
  g.DrawImage(img, 20, 350, w, h, 0, 0, w, h, UnitPixel, imAtt)

  !Draw the image, showing the intensity of the black channel.
  imAtt.SetOutputChannel(ColorChannelFlagsK, ColorAdjustTypeBitmap)
  g.DrawImage(img, 120, 350, w, h, 0, 0, w, h, UnitPixel, imAtt)

  

CachedBitmap                  PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
bmp                             TGdiPlusBitmap
cbmp                            TGdiPlusCachedBitmap
w                               UNSIGNED, AUTO
h                               UNSIGNED, AUTO
j                               LONG, AUTO
k                               LONG, AUTO
  CODE
  !The following example creates a Bitmap object and a CachedBitmap object from the file. 
  !The Bitmap and the CachedBitmap are each drawn 30,000 times. If you run the code, you will see that 
  !the CachedBitmap images are drawn substantially faster than the Bitmap images.
  
  g.FromHDC(phdc)
  
  bmp.FromFile('image.png')
  w = bmp.GetWidth()
  h = bmp.GetHeight()
  
  cbmp.CrewateCachedBitmap(bmp, g)
  
  LOOP j=0 TO 300-1 BY 10
    LOOP k=0 TO 1000-1
      g.DrawImage(bmp, j, j/2, w, h)
    END
  END
    
  LOOP j=0 TO 300-1 BY 10
    LOOP k=0 TO 1000-1
      g.DrawCachedBitmap(cbmp, j, 150 + j/2)
    END
  END
