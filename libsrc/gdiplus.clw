!* GdiPlus support
!* mikeduglas 2022
!* mikeduglas@yandex.ru

  MEMBER

  INCLUDE('svcomdef.inc'), ONCE
  INCLUDE('gdiplus.inc'), ONCE
  INCLUDE('winapi.inc'), ONCE

size_t                        EQUATE(UNSIGNED)

tagGdiplusStartupInput        GROUP, TYPE
GdiplusVersion                  ULONG
DebugEventCallback              LONG  !- void* 
SuppressBackgroundThread        BOOL
SuppressExternalCodecs          BOOL
                              END

szGdiplusStartup                      CSTRING('GdiplusStartup'), STATIC
szGdiplusShutdown                     CSTRING('GdiplusShutdown'), STATIC
szGdipCreateHBITMAPFromBitmap         CSTRING('GdipCreateHBITMAPFromBitmap'), STATIC
szGdipLoadImageFromFile               CSTRING('GdipLoadImageFromFile'), STATIC
szGdipLoadImageFromFileICM            CSTRING('GdipLoadImageFromFileICM'), STATIC
szGdipLoadImageFromStream             CSTRING('GdipLoadImageFromStream'), STATIC
szGdipLoadImageFromStreamICM          CSTRING('GdipLoadImageFromStreamICM'), STATIC
szGdipDisposeImage                    CSTRING('GdipDisposeImage'), STATIC
szGdipGetImageWidth                   CSTRING('GdipGetImageWidth'), STATIC
szGdipGetImageHeight                  CSTRING('GdipGetImageHeight'), STATIC
szGdipGetImageHorizontalResolution    CSTRING('GdipGetImageHorizontalResolution'), STATIC
szGdipGetImageVerticalResolution      CSTRING('GdipGetImageVerticalResolution'), STATIC
szGdipGetImageBounds                  CSTRING('GdipGetImageBounds'), STATIC
szGdipGetImageDimension               CSTRING('GdipGetImageDimension'), STATIC
szGdipGetImageType                    CSTRING('GdipGetImageType'), STATIC
szGdipGetImageFlags                   CSTRING('GdipGetImageFlags'), STATIC
szGdipGetImageRawFormat               CSTRING('GdipGetImageRawFormat'), STATIC
szGdipGetImagePixelFormat             CSTRING('GdipGetImagePixelFormat'), STATIC
szGdipGetPropertyCount                CSTRING('GdipGetPropertyCount'), STATIC
szGdipGetPropertyIdList               CSTRING('GdipGetPropertyIdList'), STATIC
szGdipGetPropertyItemSize             CSTRING('GdipGetPropertyItemSize'), STATIC
szGdipGetPropertyItem                 CSTRING('GdipGetPropertyItem'), STATIC

paGdiplusStartup                      LONG, NAME('fptr_GdiplusStartup')
paGdiplusShutdown                     LONG, NAME('fptr_GdiplusShutdown')
paGdipCreateHBITMAPFromBitmap         LONG, NAME('fptr_GdipCreateHBITMAPFromBitmap')
paGdipLoadImageFromFile               LONG, NAME('fptr_GdipLoadImageFromFile')
paGdipLoadImageFromFileICM            LONG, NAME('fptr_GdipLoadImageFromFileICM')
paGdipLoadImageFromStream             LONG, NAME('fptr_GdipLoadImageFromStream')
paGdipLoadImageFromStreamICM          LONG, NAME('fptr_GdipLoadImageFromStreamICM')
paGdipDisposeImage                    LONG, NAME('fptr_GdipDisposeImage')
paGdipGetImageWidth                   LONG, NAME('fptr_GdipGetImageWidth')
paGdipGetImageHeight                  LONG, NAME('fptr_GdipGetImageHeight')
paGdipGetImageHorizontalResolution    LONG, NAME('fptr_GdipGetImageHorizontalResolution')
paGdipGetImageVerticalResolution      LONG, NAME('fptr_GdipGetImageVerticalResolution')
paGdipGetImageBounds                  LONG, NAME('fptr_GdipGetImageBounds')
paGdipGetImageDimension               LONG, NAME('fptr_GdipGetImageDimension')
paGdipGetImageType                    LONG, NAME('fptr_GdipGetImageType')
paGdipGetImageFlags                   LONG, NAME('fptr_GdipGetImageFlags')
paGdipGetImageRawFormat               LONG, NAME('fptr_GdipGetImageRawFormat')
paGdipGetImagePixelFormat             LONG, NAME('fptr_GdipGetImagePixelFormat')
paGdipGetPropertyCount                LONG, NAME('fptr_GdipGetPropertyCount')
paGdipGetPropertyIdList               LONG, NAME('fptr_GdipGetPropertyIdList')
paGdipGetPropertyItemSize             LONG, NAME('fptr_GdipGetPropertyItemSize')
paGdipGetPropertyItem                 LONG, NAME('fptr_GdipGetPropertyItem')

  MAP
    MODULE('win api')
      winapi::LoadLibrary(*CSTRING szLibFileName),HINSTANCE,PASCAL,RAW,NAME('LoadLibraryA')
      winapi::FreeLibrary(LONG hModule),BOOL,PASCAL,PROC,NAME('FreeLibrary')
      winapi::GetProcAddress(LONG hModule, *CSTRING szProcName),LONG,PASCAL,RAW,NAME('GetProcAddress')
      winapi::GetProcAddress(LONG hModule, LONG pOrdinalValue),LONG,PASCAL,RAW,NAME('GetProcAddress')
      winapi::GetLastError(),LONG,PASCAL,NAME('GetLastError')
    END
    MODULE('GdiPlus api')
      !c:\Program Files (x86)\Windows Kits\10\Include\10.0.22621.0\um\gdiplusinit.h
      gp::Startup(*ULONG pToken, LONG pInput, LONG pOutput),GpStatus,PASCAL,NAME('fptr_GdiplusStartup'),DLL
      gp::Shutdown(ULONG pToken),PASCAL,NAME('fptr_GdiplusShutdown'),DLL
      !c:\Program Files (x86)\Windows Kits\10\Include\10.0.22621.0\um\gdiplusflat.h
      gp::CreateHBITMAPFromBitmap(LONG pBitmap, *HBITMAP pHbmReturn, ULONG pBackground),GpStatus,PASCAL,NAME('fptr_GdipCreateHBITMAPFromBitmap'),DLL
      gp::LoadImageFromFile(LONG pFileName, *LONG pBitmap),GpStatus,PASCAL,NAME('fptr_GdipLoadImageFromFile'),DLL
      gp::LoadImageFromFileICM(LONG pFileName, *LONG pBitmap),GpStatus,PASCAL,NAME('fptr_GdipLoadImageFromFileICM'),DLL
      gp::LoadImageFromStream(LONG pStream, *LONG pBitmap),GpStatus,PASCAL,NAME('fptr_GdipLoadImageFromStream'),DLL
      gp::LoadImageFromStreamICM(LONG pStream, *LONG pBitmap),GpStatus,PASCAL,NAME('fptr_GdipLoadImageFromStreamICM'),DLL
      gp::DisposeImage(LONG pImage),GpStatus,PASCAL,NAME('fptr_GdipDisposeImage'),DLL
      gp::GetImageWidth(LONG pImage, *ULONG pWidth),GpStatus,PASCAL,NAME('fptr_GdipGetImageWidth'),DLL
      gp::GetImageHeight(LONG pImage, *ULONG pHeight),GpStatus,PASCAL,NAME('fptr_GdipGetImageHeight'),DLL
      gp::GetImageHorizontalResolution(LONG pImage, *SREAL pResolution),GpStatus,PASCAL,NAME('fptr_GdipGetImageHorizontalResolution'),DLL
      gp::GetImageVerticalResolution(LONG pImage, *SREAL pResolution),GpStatus,PASCAL,NAME('fptr_GdipGetImageVerticalResolution'),DLL
      gp::GetImageBounds(LONG pImage,LONG pRect,LONG pUnit),GpStatus,PASCAL,NAME('fptr_GdipGetImageBounds'),DLL
      gp::GetImageDimension(LONG pImage,*SREAL pWidth,*SREAL pHeight),GpStatus,PASCAL,NAME('fptr_GdipGetImageDimension'),DLL
      gp::GetImageType(LONG pImage,*GpImageType pType),GpStatus,PASCAL,NAME('fptr_GdipGetImageType'),DLL
      gp::GetImageFlags(LONG pImage,*ULONG pFlags),GpStatus,PASCAL,NAME('fptr_GdipGetImageFlags'),DLL
      gp::GetImageRawFormat(LONG pImage,LONG pGuid),GpStatus,PASCAL,NAME('fptr_GdipGetImageRawFormat'),DLL
      gp::GetImagePixelFormat(LONG pImage,*GpPixelFormat pFmt),GpStatus,PASCAL,NAME('fptr_GdipGetImagePixelFormat'),DLL
      gp::GetPropertyCount(LONG pImage,*ULONG pCount),GpStatus,PASCAL,NAME('fptr_GdipGetPropertyCount'),DLL
      gp::GetPropertyIdList(LONG pImage,ULONG pCount,LONG pList),GpStatus,PASCAL,NAME('fptr_GdipGetPropertyIdList'),DLL
      gp::GetPropertyItemSize(LONG pImage,ULONG pPropId,*ULONG pSize),GpStatus,PASCAL,NAME('fptr_GdipGetPropertyItemSize'),DLL
      gp::GetPropertyItem(LONG pImage,ULONG pPropId,ULONG pSize,LONG pBuffer),GpStatus,PASCAL,NAME('fptr_GdipGetPropertyItem'),DLL
    END
    MODULE('Global memory api')
      winapi::GlobalAlloc(LONG uFlags,LONG dwBytes),HGLOBAL,PASCAL,NAME('GlobalAlloc')
      winapi::GlobalLock(HGLOBAL hMem),LONG,PASCAL,PROC,NAME('GlobalLock')
      winapi::GlobalUnlock(HGLOBAL hMem),BOOL,PASCAL,PROC,NAME('GlobalUnlock')
      winapi::GlobalFree(HGLOBAL hMem),BOOL,PASCAL,PROC,NAME('GlobalUnlock')
      winapi::memcpy(LONG lpDest,LONG lpSource,LONG nCount),LONG,PROC,NAME('_memcpy')
      winapi::CreateStreamOnHGlobal(LONG hGlobal,BOOL fDeleteOnRelease,LONG ppstm),LONG,PASCAL,PROC,NAME('CreateStreamOnHGlobal')
    END

    ReportError(STRING pMethodName, GpStatus pErr),PRIVATE
    ToStream(STRING pData),LONG,PRIVATE

    INCLUDE('printf.inc'), ONCE
  END

!!!region GdiPlus initializer
!https://www.codeproject.com/Messages/2274891/Re-GDIplus-initialization
TGdiPlusInitializer           CLASS, TYPE
hDll                            HINSTANCE, PRIVATE
bInitialized                    BOOL, PRIVATE
token                           ULONG, PRIVATE
Construct                       PROCEDURE(), PRIVATE
Destruct                        PROCEDURE(), PRIVATE
Startup                         PROCEDURE(), GpStatus, PROC, PRIVATE
Shutdown                        PROCEDURE(), PRIVATE
                              END

gpInitializer                 TGdiPlusInitializer

TGdiPlusInitializer.Construct PROCEDURE()
GP_DLLNAME                      CSTRING('Gdiplus.dll'), STATIC
  CODE
  SELF.hDll = winapi::LoadLibrary(GP_DLLNAME)
  IF SELF.hDll
    !- get procedure addresses
    paGdiplusStartup  = winapi::GetProcAddress(SELF.hDll, szGdiplusStartup)
    paGdiplusShutdown = winapi::GetProcAddress(SELF.hDll, szGdiplusShutdown)

    IF paGdiplusStartup AND paGdiplusShutdown
      SELF.bInitialized = TRUE

      paGdipCreateHBITMAPFromBitmap       = winapi::GetProcAddress(SELF.hDll, szGdipCreateHBITMAPFromBitmap)
      paGdipLoadImageFromFile             = winapi::GetProcAddress(SELF.hDll, szGdipLoadImageFromFile)
      paGdipLoadImageFromFileICM          = winapi::GetProcAddress(SELF.hDll, szGdipLoadImageFromFileICM)
      paGdipLoadImageFromStream           = winapi::GetProcAddress(SELF.hDll, szGdipLoadImageFromStream)
      paGdipLoadImageFromStreamICM        = winapi::GetProcAddress(SELF.hDll, szGdipLoadImageFromStreamICM)
      paGdipDisposeImage                  = winapi::GetProcAddress(SELF.hDll, szGdipDisposeImage)
      paGdipGetImageWidth                 = winapi::GetProcAddress(SELF.hDll, szGdipGetImageWidth)
      paGdipGetImageHeight                = winapi::GetProcAddress(SELF.hDll, szGdipGetImageHeight)
      paGdipGetImageHorizontalResolution  = winapi::GetProcAddress(SELF.hDll, szGdipGetImageHorizontalResolution)
      paGdipGetImageVerticalResolution    = winapi::GetProcAddress(SELF.hDll, szGdipGetImageVerticalResolution)
      paGdipGetImageBounds                = winapi::GetProcAddress(SELF.hDll, szGdipGetImageBounds)
      paGdipGetImageDimension             = winapi::GetProcAddress(SELF.hDll, szGdipGetImageDimension)
      paGdipGetImageType                  = winapi::GetProcAddress(SELF.hDll, szGdipGetImageType)
      paGdipGetImageFlags                 = winapi::GetProcAddress(SELF.hDll, szGdipGetImageFlags)
      paGdipGetImageRawFormat             = winapi::GetProcAddress(SELF.hDll, szGdipGetImageRawFormat)
      paGdipGetImagePixelFormat           = winapi::GetProcAddress(SELF.hDll, szGdipGetImagePixelFormat)
      paGdipGetPropertyCount              = winapi::GetProcAddress(SELF.hDll, szGdipGetPropertyCount)
      paGdipGetPropertyIdList             = winapi::GetProcAddress(SELF.hDll, szGdipGetPropertyIdList)
      paGdipGetPropertyItemSize           = winapi::GetProcAddress(SELF.hDll, szGdipGetPropertyItemSize)
      paGdipGetPropertyItem               = winapi::GetProcAddress(SELF.hDll, szGdipGetPropertyItem)

    ELSE
      printd('[GdiPlus] TGdiPlusInitializer.Construct: Cannot load GdiPlus APIs.')
    END
  ELSE
    printd('[GdiPlus] TGdiPlusInitializer.Construct: LoadLibrary(%Z) failed, error %i', GP_DLLNAME, winapi::GetLastError())
  END
  
  IF SELF.bInitialized = TRUE
    SELF.Startup()
  END

TGdiPlusInitializer.Destruct  PROCEDURE()
  CODE
  IF SELF.token
    SELF.Shutdown()
  END
  
  IF SELF.hDll
    winapi::FreeLibrary(SELF.hDll)
    SELF.hDll = 0
    SELF.bInitialized = FALSE
  END
  
TGdiPlusInitializer.Startup   PROCEDURE()
input                           LIKE(tagGdiplusStartupInput)
err                             GpStatus, AUTO
  CODE
  input.GdiplusVersion = 1
  input.DebugEventCallback = 0
  input.SuppressBackgroundThread = FALSE
  input.SuppressExternalCodecs = FALSE
  err = gp::Startup(SELF.token, ADDRESS(input), 0)
  ReportError('TGdiPlusInitializer.Startup', err)
  RETURN err

TGdiPlusInitializer.Shutdown  PROCEDURE()
  CODE
  gp::Shutdown(SELF.token)
!!!endregion
  
!!!region Helper functions
ReportError                   PROCEDURE(STRING pMethodName, GpStatus pErr)
  CODE
  IF pErr <> GpStatus:Ok
    printd('[TGdiPlus] %s failed, error code %i', pMethodName, pErr)
  END
  
ToStream                      PROCEDURE(STRING pData)
nDataLen                        LONG, AUTO
lpStream                        LONG, AUTO
hMem                            HGDIOBJ, AUTO
pvData                          LONG
hr                              HRESULT, AUTO
  CODE
  nDataLen = SIZE(pData)
  hMem = winapi::GlobalAlloc(GMEM_MOVEABLE, nDataLen)
  IF hMem
    pvData = winapi::GlobalLock(hMem)
    IF pvData
      winapi::memcpy(pvData, ADDRESS(pData), nDataLen)
      winapi::GlobalUnlock(hMem)

      hr = winapi::CreateStreamOnHGlobal(hMem, FALSE, ADDRESS(lpStream))
      IF hr <> S_OK
        printd('CreateStreamOnHGlobal error %x', hr)
      END
    ELSE
      printd('GlobalLock error %i', winapi::GetLastError())
    END
    
    winapi::GlobalFree(hMem)
  ELSE
    printd('GlobalAlloc error %i', winapi::GetLastError())
  END
  
  RETURN lpStream
!!!endregion
  
!!!region TGdiPlusImage
TGdiPlusImage.Construct       PROCEDURE()
  CODE
  
TGdiPlusImage.Destruct        PROCEDURE()
  CODE
  SELF.DisposeImage()
  
TGdiPlusImage.GetLastStatus   PROCEDURE()
  CODE
  RETURN SELF.lastResult
  
TGdiPlusImage.FromFile        PROCEDURE(STRING pFileName, BOOL pUseICM=FALSE)
enc                             TStringEncoding
wstr                            STRING(FILE:MaxFilePath*2+2)
  CODE
  SELF.nativeImage = 0
  wstr = enc.ToCWStr(pFileName)
  IF pUseICM
    SELF.lastResult = gp::LoadImageFromFileICM(ADDRESS(wstr), SELF.nativeImage)
  ELSE
    SELF.lastResult = gp::LoadImageFromFile(ADDRESS(wstr), SELF.nativeImage)
  END
  ReportError(printf('TGdiPlusImage.FromFile(%S, %b)', pFileName, pUseICM), SELF.lastResult)
  RETURN SELF.lastResult

TGdiPlusImage.FromString      PROCEDURE(STRING pImageData, BOOL pUseICM=FALSE)
lpStream                        LONG, AUTO
stream                          &IStream, AUTO
  CODE
  SELF.nativeImage = 0
  lpStream = ToStream(pImageData)
  IF lpStream
    stream &= (lpStream)
    IF pUseICM
      SELF.lastResult = gp::LoadImageFromStreamICM(lpStream, SELF.nativeImage)
    ELSE
      SELF.lastResult = gp::LoadImageFromStream(lpStream, SELF.nativeImage)
    END
    stream.Release()
    ReportError('TGdiPlusImage.FromString', SELF.lastResult)
  END
  RETURN SELF.lastResult

TGdiPlusImage.DisposeImage    PROCEDURE()
  CODE
  IF SELF.nativeImage
    SELF.lastResult = gp::DisposeImage(SELF.nativeImage)
    SELF.nativeImage = 0
    ReportError('TGdiPlusImage.DisposeImage', SELF.lastResult)
  END
  RETURN SELF.lastResult
 
TGdiPlusImage.GetWidth        PROCEDURE()
w                               ULONG(0)
  CODE
  SELF.lastResult = gp::GetImageWidth(SELF.nativeImage, w)
  ReportError('TGdiPlusImage.GetWidth', SELF.lastResult)
  RETURN w

TGdiPlusImage.GetHeight       PROCEDURE()
h                               ULONG(0)
  CODE
  SELF.lastResult = gp::GetImageHeight(SELF.nativeImage, h)
  ReportError('TGdiPlusImage.GetHeight', SELF.lastResult)
  RETURN h

TGdiPlusImage.GetHorizontalResolution PROCEDURE()
resolution                              SREAL(0.0)
  CODE
  SELF.lastResult = gp::GetImageHorizontalResolution(SELF.nativeImage, resolution)
  ReportError('TGdiPlusImage.GetHorizontalResolution', SELF.lastResult)
  RETURN resolution
  
TGdiPlusImage.GetVerticalResolution   PROCEDURE()
resolution                              SREAL(0.0)
  CODE
  SELF.lastResult = gp::GetImageVerticalResolution(SELF.nativeImage, resolution)
  ReportError('TGdiPlusImage.GetVerticalResolution', SELF.lastResult)
  RETURN resolution

TGdiPlusImage.GetBounds       PROCEDURE(*GpRectF pRect, *GpUnit pUnit)
  CODE
  SELF.lastResult = gp::GetImageBounds(SELF.nativeImage, ADDRESS(pRect), ADDRESS(pUnit))
  ReportError('TGdiPlusImage.GetBounds', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusImage.GetPhysicalDimension    PROCEDURE(*GpSizeF pSize)
w                                       SREAL, AUTO
h                                       SREAL, AUTO
  CODE
  SELF.lastResult = gp::GetImageDimension(SELF.nativeImage, w, h)
  ReportError('TGdiPlusImage.GetPhysicalDimension', SELF.lastResult)
  pSize.cx = w
  pSize.cy = h
  RETURN SELF.lastResult
  
TGdiPlusImage.GetType         PROCEDURE()
imgType                         GpImageType(GpImageType:Unknown)
  CODE
  SELF.lastResult = gp::GetImageType(SELF.nativeImage, imgType)
  ReportError('TGdiPlusImage.GetType', SELF.lastResult)
  RETURN imgType
  
TGdiPlusImage.GetFlags        PROCEDURE()
flags                           ULONG(0)
  CODE
  SELF.lastResult = gp::GetImageFlags(SELF.nativeImage, flags)
  ReportError('TGdiPlusImage.GetFlags', SELF.lastResult)
  RETURN flags
  
TGdiPlusImage.GetRawFormat    PROCEDURE(*GUID pGuid)
  CODE
  CLEAR(pGuid, -1)
  SELF.lastResult = gp::GetImageRawFormat(SELF.nativeImage, ADDRESS(pGuid))
  ReportError('TGdiPlusImage.GetRawFormat', SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusImage.GetPixelFormat  PROCEDURE()
fmt                             GpPixelFormat(0)
  CODE
  SELF.lastResult = gp::GetImagePixelFormat(SELF.nativeImage, fmt)
  ReportError('TGdiPlusImage.GetPixelFormat', SELF.lastResult)
  RETURN fmt
  
TGdiPlusImage.GetPropertyCount    PROCEDURE()
nCount                              ULONG(0)
  CODE
  SELF.lastResult = gp::GetPropertyCount(SELF.nativeImage, nCount)
  ReportError('TGdiPlusImage.GetPropertyCount', SELF.lastResult)
  RETURN nCOunt

TGdiPlusImage.GetPropertyIdList   PROCEDURE(ULONG pNumOfProperty, *ULONG[] pList)
  CODE
  CLEAR(pList)
  SELF.lastResult = gp::GetPropertyIdList(SELF.nativeImage, pNumOfProperty, ADDRESS(pList))
  ReportError(printf('TGdiPlusImage.GetPropertyIdList(%i)', pNumOfProperty), SELF.lastResult)
  RETURN SELF.lastResult
  
TGdiPlusImage.GetPropertyItemSize PROCEDURE(ULONG pPropId)
itemSize                            ULONG(0)
  CODE
  SELF.lastResult = gp::GetPropertyItemSize(SELF.nativeImage, pPropId, itemSize)
  ReportError(printf('TGdiPlusImage.GetPropertyItemSize(%x)', pPropId), SELF.lastResult)
  RETURN itemSize
  
TGdiPlusImage.GetPropertyItem PROCEDURE(ULONG pPropId, ULONG pItemSize, *TGdiPlusPropertyItem pItem)
buf                             STRING(pItemSize), AUTO
itm                             LIKE(GpPropertyItem)
  CODE
  CLEAR(buf, -1)
  SELF.lastResult = gp::GetPropertyItem(SELF.nativeImage, pPropId, pItemSize, ADDRESS(buf))
  ReportError(printf('TGdiPlusImage.GetPropertyItem(%x)', pPropId), SELF.lastResult)
  IF SELF.lastResult = GpStatus:Ok
    itm = buf
    pItem.Assign(itm)
  END
  
  RETURN SELF.lastResult
!!!endregion
  
!!!region TGdiPlusPropertyItem
TGdiPlusPropertyItem.Destruct PROCEDURE()
  CODE
  SELF.Free()
  
TGdiPlusPropertyItem.Assign   PROCEDURE(GpPropertyItem pItem)
  CODE
  SELF.id = pItem.id
  SELF.length = pItem.length
  SELF.type = pItem.type
  SELF.value &= NEW STRING(pItem.length)
  winapi::memcpy(ADDRESS(SELF.value), pItem.refvalue, pItem.length)

TGdiPlusPropertyItem.Free     PROCEDURE()
  CODE
  IF NOT SELF.value &= NULL
    DISPOSE(SELF.value)
    SELF.value &= NULL
  END
  
TGdiPlusPropertyItem.GetId    PROCEDURE()
  CODE
  RETURN SELF.id
  
TGdiPlusPropertyItem.GetLength    PROCEDURE()
  CODE
  RETURN SELF.length
  
TGdiPlusPropertyItem.GetType  PROCEDURE()
  CODE
  RETURN SELF.type
  
TGdiPlusPropertyItem.GetArraySize PROCEDURE()
elSize                              ULONG, AUTO
  CODE
  CASE SELF.type
  OF GpPropertyTagType:ASCII
    elSize = 1
  OF GpPropertyTagType:Byte
    elSize = 1
  OF GpPropertyTagType:Short
    elSize = 2
  OF GpPropertyTagType:Long OROF GpPropertyTagType:SLONG
    elSize = 4
  OF GpPropertyTagType:Rational OROF GpPropertyTagType:SRational
    elSize = 8
  ELSE
    elSize = 1
  END
  
  RETURN SELF.length / elSize

TGdiPlusPropertyItem.GetValueAddress  PROCEDURE()
  CODE
  RETURN ADDRESS(SELF.value)
  
TGdiPlusPropertyItem.GetStringValue   PROCEDURE()
  CODE
  RETURN SELF.value
  
TGdiPlusPropertyItem.GetByteValue PROCEDURE()
v                                   BYTE, AUTO
  CODE
  v = VAL(SELF.value[1])
  RETURN v
    
TGdiPlusPropertyItem.GetShortValue    PROCEDURE()
strValue                                STRING(2), AUTO
v                                       SHORT, OVER(strValue)
  CODE
  strValue = SELF.value
  RETURN v
    
TGdiPlusPropertyItem.GetLongValue PROCEDURE()
strValue                            STRING(4), AUTO
v                                   LONG, OVER(strValue)
  CODE
  strValue = SELF.value
  RETURN v
    
TGdiPlusPropertyItem.GetRealValue PROCEDURE()
strValue                            STRING(8), AUTO
v                                   REAL, OVER(strValue)
  CODE
  strValue = SELF.value
  RETURN v

!TGdiPlusPropertyItem.GetValue PROCEDURE()
!strValue                        STRING(SELF.length), AUTO
!aValue                          ANY, AUTO
!byteValue                       BYTE, AUTO
!shortValue                      USHORT, AUTO
!longValue                       ULONG, AUTO
!  CODE
!  strValue = SELF.value
!  aValue = ''
!  
!  CASE SELF.type
!  OF GpPropertyTagType:ASCII
!    aValue = strValue
!  OF GpPropertyTagType:Byte
!    IF SELF.length = SIZE(byteValue)
!      byteValue = VAL(strValue[1])
!      aValue = byteValue
!    ELSE
!      aValue = '<<An array of bytes>'
!    END
!  OF GpPropertyTagType:Short
!    IF SELF.length = SIZE(shortValue)
!      shortValue = VAL(strValue[1])
!      aValue = shortValue
!    ELSE
!      aValue = '<<An array of shorts>'
!    END
!  END
!  RETURN aValue
!!!endregion
  
!!!region TGdiPlusBitmap
TGdiPlusBitmap.GetHBITMAP     PROCEDURE(ULONG pBackground)
hbmReturn                       HBITMAP(0)
  CODE
  SELF.lastResult = gp::CreateHBITMAPFromBitmap(SELF.nativeImage, hbmReturn, pBackground)
  ReportError(printf('TGdiPlusBitmap.GetHBITMAP(%x)', pBackground), SELF.lastResult)
  RETURN hbmReturn

!!!endregion
