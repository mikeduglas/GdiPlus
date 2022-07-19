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
!GetImageProperties...
!Image c:\Clarion\Clarion11.1\Images\cwwall.bmp, type 1, flags 013010, pixel format 021808, size in pixels 168x180, dpi 72, bounds (0,0,168,180), unit 2, physical size 168x180
!Image c:\Clarion\Clarion11.1\Images\softvelocity.gif, type 1, flags 013012, pixel format 030803, size in pixels 150x84, dpi 96, bounds (0,0,150,84), unit 2, physical size 150x84
!    Image properties (count=5):
!      Prop[1].Id 0x5100, Length 1 longs, Value[1] 0x00
!      Prop[2].Id 0x5101, Length 1 shorts, Value[1] 0x01
!      Prop[3].Id 0x5102, Length 768 bytes, Value[1] 0x00
!      Prop[4].Id 0x5103, Length 1 bytes, Value[1] 0x00
!      Prop[5].Id 0x5104, Length 1 bytes, Value[1] 0xff
!Image c:\Clarion\Clarion11.1\Images\DISKCOPY.ICO, type 1, flags 012012, pixel format 26200a, size in pixels 32x32, dpi 96, bounds (0,0,32,32), unit 2, physical size 32x32
!Image c:\Clarion\Clarion11.1\Images\sv_small.jpg, type 1, flags 013010, pixel format 021808, size in pixels 110x60, dpi 72, bounds (0,0,110,60), unit 2, physical size 110x60
!    Image properties (count=2):
!      Prop[1].Id 0x5091, Length 64 shorts, Value[1] 0x05
!      Prop[2].Id 0x5090, Length 64 shorts, Value[1] 0x05
!Image c:\Clarion\Clarion11.1\Images\AnyScreen.png, type 1, flags 013010, pixel format 021808, size in pixels 333x319, dpi 150, bounds (0,0,333,319), unit 2, physical size 333x319
!    Image properties (count=4):
!      Prop[1].Id 0x0132, Value 2019:09:05 08:57:35
!      Prop[2].Id 0x5110, Length 1 bytes, Value[1] 0x01
!      Prop[3].Id 0x5111, Length 1 longs, Value[1] 0x1711
!      Prop[4].Id 0x5112, Length 1 longs, Value[1] 0x1711

  
GetImageProperties            PROCEDURE()
image                           TGdiPlusImage
qImages                         QUEUE, PRE(qImages)
ImageFile                         STRING(FILE:MaxFilePath)
                                END
imgType                         GpImageType, AUTO
flags                           ULONG, AUTO
pixelFmt                        GpPixelFormat, AUTO
w                               ULONG, AUTO
h                               ULONG, AUTO
dpi                             SREAL, AUTO
rc                              LIKE(GpRectF)
imgUnit                         GpUnit, AUTO
phSize                          LIKE(GpSizeF)
imgGuid                         LIKE(GUID)

nPropCount                      ULONG, AUTO
propList                        ULONG, DIM(10)
propId                          ULONG, AUTO
propSize                        ULONG, AUTO
propItem                        TGdiPlusPropertyItem

i                               LONG, AUTO
j                               LONG, AUTO
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
    IF image.FromFile(qImages.ImageFile) = GpStatus:Ok
      imgType = image.GetType()
      flags = image.GetFlags()
      pixelFmt = image.GetPixelFormat()
      w = image.GetWidth()
      h = image.GetHeight()
      dpi = image.GetHorizontalResolution()
      image.GetBounds(rc, imgUnit)
      image.GetPhysicalDimension(phSize)
      image.GetRawFormat(imgGuid)
      
      printd('Image %s, type %i, flags %x, pixel format %x, size in pixels %ix%i, dpi %i, bounds (%f,%f,%f,%f), unit %i, physical size %fx%f', | 
        qImages.ImageFile, | 
        imgType, | 
        flags, |
        pixelFmt, |
        w, h, | 
        ROUND(dpi, 1), | 
        rc.left, rc.top, rc.right, rc.bottom, imgUnit, | 
        phSize.cx, phSize.cy)
      
!      printd('    GUID: {{%x-%x-%x-%x%x%x%x%x%x%x%x}', imgGuid.Data1, imgGuid.Data2, imgGuid.Data3, | 
!        imgGuid.Data4[1], | 
!        imgGuid.Data4[2], | 
!        imgGuid.Data4[3], | 
!        imgGuid.Data4[4], | 
!        imgGuid.Data4[5], | 
!        imgGuid.Data4[6], | 
!        imgGuid.Data4[7], | 
!        imgGuid.Data4[8])
          
      nPropCount = image.GetPropertyCount()
      IF nPropCount > 0
        printd('    Image properties (count=%i):', nPropCount)
        
        image.GetPropertyIdList(nPropCount, propList)
        LOOP j=1 TO nPropCount
          propId   = propList[j]
          propSize = image.GetPropertyItemSize(propId)
          image.GetPropertyItem(propId, propSize, propItem)
          
          CASE propItem.GetType()
          OF GpPropertyTagType:ASCII
            printd('      Prop[%i].Id 0x%x, Value %s', j, propId, propItem.GetStringValue())
          OF GpPropertyTagType:Byte
            printd('      Prop[%i].Id 0x%x, Length %i bytes, Value[1] 0x%x', j, propId, propItem.GetArraySize(), propItem.GetByteValue())
          OF GpPropertyTagType:Short
            printd('      Prop[%i].Id 0x%x, Length %i shorts, Value[1] 0x%x', j, propId, propItem.GetArraySize(), propItem.GetShortValue())
          OF GpPropertyTagType:Long
            printd('      Prop[%i].Id 0x%x, Length %i longs, Value[1] 0x%x', j, propId, propItem.GetArraySize(), propItem.GetLongValue())
          OF GpPropertyTagType:Rational
            printd('      Prop[%i].Id 0x%x, Length %i reals, Value[1] 0x%x', j, propId, propItem.GetArraySize(), propItem.GetRealValue())
          ELSE
            printd('      Prop[%i].Id 0x%x, Length %i bytes, Value %s', j, propId, propItem.GetArraySize(), propItem.GetStringValue())
          END
          
          !- Displse dynamically allocated buffer
          propItem.Free()

        END
      END
      
      image.DisposeImage()
    END
  END
