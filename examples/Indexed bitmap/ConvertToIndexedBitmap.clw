!Very simple conversion of bitmap to indexed bitmap
!https://www.codeproject.com/Tips/5358737/Very-simple-conversion-of-bitmap-to-indexed-bitmap
  

  PROGRAM

  INCLUDE('gdiplus.inc'), ONCE

  MAP
    ToIndexed(TGdiPlusBitmap pSource, GpPixelFormat pFmt, *TGdiPlusBitmap pResult), BOOL, PROC
    INCLUDE('printf.inc'), ONCE
  END

source                        TGdiPlusBitmap
result                        TGdiPlusBitmap

  CODE
  source.FromFile('image.png')
  IF source.ToIndexed(PixelFormat32bppRGB, result)    !- same as ToIndexed(source, PixelFormat32bppRGB, result)
    result.Save('indexed.png')
    MESSAGE('Done!')
  ELSE
    MESSAGE('Error!')
  END
  
  source.DisposeImage()
  result.DisposeImage()
  
  
ToIndexed                     PROCEDURE(TGdiPlusBitmap pSource, GpPixelFormat pFmt, *TGdiPlusBitmap pResult)
rc                              LIKE(GpRect), AUTO
sourceData                      LIKE(GpBitmapData), AUTO
resultData                      LIKE(GpBitmapData), AUTO
sourceFlags                     LONG, AUTO
resultFlags                     LONG, AUTO
offset                          LONG, AUTO
sourceBuffer                    &BYTE
resultBuffer                    &BYTE
i                               LONG, AUTO
  CODE
  !- no error checking for simplicity
  
  rc.x = 0; rc.y = 0; rc.width = pSource.GetWidth(); rc.height = pSource.GetHeight()
  pResult.CreateBitmap(pSource.GetWidth(), pSource.GetHeight(), pFmt)
  
  pSource.LockBits(rc, ImageLockModeRead, pSource.GetPixelFormat(), sourceData)
  pResult.LockBits(rc, ImageLockModeWrite, pFmt, resultData)
  
  sourceFlags = sourceData.Stride * sourceData.Height
  resultFlags = resultData.Stride * resultData.Height
  
  offset = sourceFlags / resultFlags
  LOOP i=0 TO sourceFlags-1
    sourceBuffer &= (sourceData.Scan0 + i)
    resultBuffer &= (resultData.Scan0 + i/offset)
    resultBuffer = sourceBuffer
  END
  
  pResult.UnlockBits(resultData)
  pSource.UnlockBits(sourceData)
  
  RETURN TRUE