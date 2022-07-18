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
  
  ReportError('TGdiPlusImage.FromFile', SELF.lastResult)
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
  RETURN resolution
  
TGdiPlusImage.GetVerticalResolution   PROCEDURE()
resolution                              SREAL(0.0)
  CODE
  SELF.lastResult = gp::GetImageVerticalResolution(SELF.nativeImage, resolution)
  RETURN resolution

!!!endregion
  
!!!region TGdiPlusBitmap
TGdiPlusBitmap.GetHBITMAP     PROCEDURE(ULONG pBackground)
hbmReturn                       HBITMAP(0)
  CODE
  SELF.lastResult = gp::CreateHBITMAPFromBitmap(SELF.nativeImage, hbmReturn, pBackground)
  ReportError('TGdiPlusBitmap.GetHBITMAP', SELF.lastResult)
  RETURN hbmReturn

!!!endregion
