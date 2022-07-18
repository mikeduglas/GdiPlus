  PROGRAM

  INCLUDE('gdiplus.inc'), ONCE
  INCLUDE('winapi.inc'), ONCE

  MAP
    GetImageProperties()

    INCLUDE('printf.inc'), ONCE
  END

  CODE
  GetImageProperties()
  
!- Expected result:
!Image c:\Clarion\Clarion11.1\Images\cwwall.bmp, resolution in pixels 168x180, dpi 72
!Image c:\Clarion\Clarion11.1\Images\softvelocity.gif, resolution in pixels 150x84, dpi 96
!Image c:\Clarion\Clarion11.1\Images\DISKCOPY.ICO, resolution in pixels 32x32, dpi 96
!Image c:\Clarion\Clarion11.1\Images\sv_small.jpg, resolution in pixels 110x60, dpi 72
!Image c:\Clarion\Clarion11.1\Images\AnyScreen.png, resolution in pixels 333x319, dpi 150

  
GetImageProperties            PROCEDURE()
image                           TGdiPlusImage
qImages                         QUEUE, PRE(qImages)
ImageFile                         STRING(FILE:MaxFilePath)
                                END
i                               LONG, AUTO
  CODE
  printd('GetImageProperties...')
  !- list of images
  qImages.ImageFile = 'c:\Clarion\Clarion11.1\Images\cwwall.bmp';       ADD(qImages)
  qImages.ImageFile = 'c:\Clarion\Clarion11.1\Images\softvelocity.gif'; ADD(qImages)
  qImages.ImageFile = 'c:\Clarion\Clarion11.1\Images\DISKCOPY.ICO';     ADD(qImages)
  qImages.ImageFile = 'c:\Clarion\Clarion11.1\Images\sv_small.jpg';     ADD(qImages)
  qImages.ImageFile = 'c:\Clarion\Clarion11.1\Images\AnyScreen.png';    ADD(qImages)
!  qImages.ImageFile = 'c:\Clarion\Clarion12.1\Images\AnyScreen.png';    ADD(qImages)    !- invalid image file
  
  LOOP i=1 TO RECORDS(qImages)
    GET(qImages, i)
    image.FromFile(qImages.ImageFile)
    printd('Image %s, resolution in pixels %ix%i, dpi %i', qImages.ImageFile, | 
      image.GetWidth(), image.GetHeight(), | 
      ROUND(image.GetHorizontalResolution(), 1))
    image.DisposeImage()
  END
