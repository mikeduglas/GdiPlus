  PROGRAM

  INCLUDE('gdiplus.inc'), ONCE

  MAP
    INCLUDE('printf.inc'), ONCE
  END

gp                            TGdiPlus
res                           GpStatus, AUTO
qImages                       QUEUE, PRE(qImages)
ImageFile                       STRING(FILE:MaxFilePath)
                              END
w                             ULONG, AUTO
h                             ULONG, AUTO
i                             LONG, AUTO
  CODE
  !- list of images
  qImages.ImageFile = 'c:\Clarion\Clarion11.1\Images\cwwall.bmp';       ADD(qImages)
  qImages.ImageFile = 'c:\Clarion\Clarion11.1\Images\softvelocity.gif'; ADD(qImages)
  qImages.ImageFile = 'c:\Clarion\Clarion11.1\Images\DISKCOPY.ICO';     ADD(qImages)
  qImages.ImageFile = 'c:\Clarion\Clarion11.1\Images\sv_small.jpg';     ADD(qImages)
  qImages.ImageFile = 'c:\Clarion\Clarion11.1\Images\AnyScreen.png';    ADD(qImages)
  
  res = gp.Startup()
  IF res = GpStatus:Ok
    LOOP i=1 TO RECORDS(qImages)
      GET(qImages, i)
      res = gp.LoadImageFromFile(qImages.ImageFile)
      IF res = GpStatus:Ok
        gp.GetImageResolution(w, h)
        printd('Image %s, resolution %ix%i', qImages.ImageFile, w, h)
        
        gp.DisposeImage()
      END
    END
    
    gp.Shutdown()
  END

!- Expected result:
!Image c:\Clarion\Clarion11.1\Images\cwwall.bmp, resolution 168x180
!Image c:\Clarion\Clarion11.1\Images\softvelocity.gif, resolution 150x84
!Image c:\Clarion\Clarion11.1\Images\DISKCOPY.ICO, resolution 32x32
!Image c:\Clarion\Clarion11.1\Images\sv_small.jpg, resolution 110x60
!Image c:\Clarion\Clarion11.1\Images\AnyScreen.png, resolution 333x319
  