!* GdiPlus support
!* mikeduglas 2022
!* mikeduglas@yandex.ru

  MEMBER

  INCLUDE('svcomdef.inc'), ONCE
  INCLUDE('gdiplus.inc'), ONCE
  INCLUDE('winapi.inc'), ONCE

tagGdiplusStartupInput        GROUP, TYPE
GdiplusVersion                  ULONG
DebugEventCallback              LONG  !void* 
SuppressBackgroundThread        BOOL
SuppressExternalCodecs          BOOL
                              END

szGdiplusStartup              CSTRING('GdiplusStartup'), STATIC
paGdiplusStartup              LONG, NAME('fptr_GdiplusStartup')
szGdiplusShutdown             CSTRING('GdiplusShutdown'), STATIC
paGdiplusShutdown             LONG, NAME('fptr_GdiplusShutdown')
szGdipCreateHBITMAPFromBitmap CSTRING('GdipCreateHBITMAPFromBitmap'), STATIC
paGdipCreateHBITMAPFromBitmap LONG, NAME('fptr_GdipCreateHBITMAPFromBitmap')
szGdipLoadImageFromFile       CSTRING('GdipLoadImageFromFile'), STATIC
paGdipLoadImageFromFile       LONG, NAME('fptr_GdipLoadImageFromFile')
szGdipLoadImageFromStream     CSTRING('GdipLoadImageFromStream'), STATIC
paGdipLoadImageFromStream     LONG, NAME('fptr_GdipLoadImageFromStream')
szGdipGetImageWidth           CSTRING('GdipGetImageWidth'), STATIC
paGdipGetImageWidth           LONG, NAME('fptr_GdipGetImageWidth')
szGdipGetImageHeight          CSTRING('GdipGetImageHeight'), STATIC
paGdipGetImageHeight          LONG, NAME('fptr_GdipGetImageHeight')
szGdipDisposeImage            CSTRING('GdipDisposeImage'), STATIC
paGdipDisposeImage            LONG, NAME('fptr_GdipDisposeImage')

  MAP
    MODULE('win api')
      winapi::LoadLibrary(*CSTRING szLibFileName),HINSTANCE,PASCAL,RAW,NAME('LoadLibraryA')
      winapi::FreeLibrary(LONG hModule),BOOL,PASCAL,PROC,NAME('FreeLibrary')
      winapi::GetProcAddress(LONG hModule, *CSTRING szProcName),LONG,PASCAL,RAW,NAME('GetProcAddress')
      winapi::GetProcAddress(LONG hModule, LONG pOrdinalValue),LONG,PASCAL,RAW,NAME('GetProcAddress')
      winapi::GetLastError(),LONG,PASCAL,NAME('GetLastError')
    END
    MODULE('GdiPlus api')
      gp::Startup(*ULONG pToken, LONG pInput, LONG pOutput),GpStatus,PASCAL,NAME('fptr_GdiplusStartup'),DLL
      gp::Shutdown(ULONG pToken),PASCAL,NAME('fptr_GdiplusShutdown'),DLL
      gp::CreateHBITMAPFromBitmap(LONG pBitmap, *HBITMAP pHbmReturn, ULONG pBackground),GpStatus,PASCAL,NAME('fptr_GdipCreateHBITMAPFromBitmap'),DLL
      gp::LoadImageFromFile(LONG pFileName, *LONG pBitmap),GpStatus,PASCAL,NAME('fptr_GdipLoadImageFromFile'),DLL
      gp::LoadImageFromStream(LONG pStream, *LONG pBitmap),GpStatus,PASCAL,NAME('fptr_GdipLoadImageFromStream'),DLL
      gp::LoadImageFromStream(IStream pStream, *LONG pBitmap),GpStatus,PASCAL,NAME('fptr_GdipLoadImageFromStream'),DLL
      gp::GetImageWidth(LONG pBitmap, *ULONG pWidth),GpStatus,PASCAL,NAME('fptr_GdipGetImageWidth'),DLL
      gp::GetImageHeight(LONG pBitmap, *ULONG pHeight),GpStatus,PASCAL,NAME('fptr_GdipGetImageHeight'),DLL
      gp::DisposeImage(LONG pBitmap),GpStatus,PASCAL,NAME('fptr_GdipDisposeImage'),DLL
    END
    MODULE('Global memory api')
      winapi::GlobalAlloc(LONG uFlags,LONG dwBytes),HGLOBAL,PASCAL,NAME('GlobalAlloc')
      winapi::GlobalLock(HGLOBAL hMem),LONG,PASCAL,PROC,NAME('GlobalLock')
      winapi::GlobalUnlock(HGLOBAL hMem),BOOL,PASCAL,PROC,NAME('GlobalUnlock')
      winapi::GlobalFree(HGLOBAL hMem),BOOL,PASCAL,PROC,NAME('GlobalUnlock')
      winapi::memcpy(LONG lpDest,LONG lpSource,LONG nCount),LONG,PROC,NAME('_memcpy')
      winapi::CreateStreamOnHGlobal(LONG hGlobal,BOOL fDeleteOnRelease,LONG ppstm),LONG,PASCAL,PROC,NAME('CreateStreamOnHGlobal')
    END

    INCLUDE('printf.inc'), ONCE
  END

!!!region GdiPlus initializer
GP_DLLNAME                    CSTRING('Gdiplus.dll'), STATIC

TGdiPlusInitializer           CLASS, TYPE
hDll                            HINSTANCE
bInitialized                    BOOL
Construct                       PROCEDURE()
Destruct                        PROCEDURE()
                              END

gpInitializer                 TGdiPlusInitializer

TGdiPlusInitializer.Construct PROCEDURE()
  CODE
  SELF.hDll = winapi::LoadLibrary(GP_DLLNAME)
  IF SELF.hDll
    !- get procedure addresses
    paGdiplusStartup = winapi::GetProcAddress(SELF.hDll, szGdiplusStartup)
    paGdiplusShutdown = winapi::GetProcAddress(SELF.hDll, szGdiplusShutdown)
    paGdipCreateHBITMAPFromBitmap = winapi::GetProcAddress(SELF.hDll, szGdipCreateHBITMAPFromBitmap)
    paGdipLoadImageFromFile = winapi::GetProcAddress(SELF.hDll, szGdipLoadImageFromFile)
    paGdipLoadImageFromStream = winapi::GetProcAddress(SELF.hDll, szGdipLoadImageFromStream)
    paGdipGetImageWidth = winapi::GetProcAddress(SELF.hDll, szGdipGetImageWidth)
    paGdipGetImageHeight = winapi::GetProcAddress(SELF.hDll, szGdipGetImageHeight)
    paGdipDisposeImage = winapi::GetProcAddress(SELF.hDll, szGdipDisposeImage)
    
    IF paGdiplusStartup AND paGdiplusShutdown AND paGdipCreateHBITMAPFromBitmap |
      AND paGdipLoadImageFromFile AND paGdipLoadImageFromStream AND paGdipGetImageWidth | paGdipGetImageHeight |
      AND paGdipDisposeImage
      !- initialized
      SELF.bInitialized = TRUE
    ELSE
      printd('[GdiPlus] TGdiPlusInitializer.Construct: Cannot load GdiPlus APIs.')
    END
  ELSE
    printd('[GdiPlus] TGdiPlusInitializer.Construct: LoadLibrary(%Z) failed, error %i', GP_DLLNAME, winapi::GetLastError())
  END
  
TGdiPlusInitializer.Destruct  PROCEDURE()
  CODE
  IF SELF.hDll
    winapi::FreeLibrary(SELF.hDll)
    SELF.hDll = 0
    SELF.bInitialized = FALSE
  END
!!!endregion

!!!region TGdiPlus
TGdiPlus.Construct            PROCEDURE()
  CODE
  
TGdiPlus.Destruct             PROCEDURE()
  CODE
  
TGdiPlus.ReportError          PROCEDURE(STRING pMethodName, GpStatus pErr)
  CODE
  IF pErr <> GpStatus:Ok
    printd('[TGdiPlus] %s failed, error code %i', pMethodName, pErr)
  END

TGdiPlus.Startup              PROCEDURE()
input                           LIKE(tagGdiplusStartupInput)
err                             GpStatus, AUTO
  CODE
  input.GdiplusVersion = 1
  input.DebugEventCallback = 0
  input.SuppressBackgroundThread = FALSE
  input.SuppressExternalCodecs = FALSE
  err = gp::Startup(SELF.token, ADDRESS(input), 0)
  SELF.ReportError('Startup', err)
  RETURN err
  
TGdiPlus.Shutdown             PROCEDURE()
  CODE
  gp::Shutdown(SELF.token)
  
TGdiPlus.CreateHBITMAPFromBitmap  PROCEDURE(*HBITMAP pHbmReturn, ULONG pBackground=0)
err                                 GpStatus, AUTO
  CODE
  err = gp::CreateHBITMAPFromBitmap(SELF.bitmap, pHbmReturn, pBackground)
  SELF.ReportError('CreateHBITMAPFromBitmap', err)
  RETURN err

TGdiPlus.LoadImageFromFile    PROCEDURE(STRING pFileName)
enc                             TStringEncoding
wstr                            STRING(FILE:MaxFilePath*2+2)
err                             GpStatus, AUTO
  CODE
  wstr = enc.ToCWStr(pFileName)
  err = gp::LoadImageFromFile(ADDRESS(wstr), SELF.bitmap)
  SELF.ReportError('LoadImageFromFile', err)
  RETURN err

TGdiPlus.LoadImageFromString  PROCEDURE(STRING pImageData)
nDataLen                        LONG, AUTO
stream                          &IStream
lpStream                        LONG, AUTO
hMem                            HGDIOBJ, AUTO
pvData                          LONG
err                             GpStatus, AUTO
  CODE
  nDataLen = SIZE(pImageData)
  hMem = winapi::GlobalAlloc(GMEM_MOVEABLE, nDataLen)
  IF hMem
    pvData = winapi::GlobalLock(hMem)
    IF pvData
      winapi::memcpy(pvData, ADDRESS(pImageData), nDataLen)
      winapi::GlobalUnlock(hMem)

      IF winapi::CreateStreamOnHGlobal(hMem, FALSE, ADDRESS(lpStream)) = S_OK
        stream &= (lpStream)
        err = gp::LoadImageFromStream(lpStream, SELF.bitmap)
        SELF.ReportError('LoadImageFromStream', err)
        stream.Release()
      ELSE
        err = 1000
        SELF.ReportError('CreateStreamOnHGlobal', err)
      END
    ELSE
      err = 1000
      SELF.ReportError('winapi::GlobalLock', err)
    END
    
    winapi::GlobalFree(hMem)
  ELSE
    err = 1000
    SELF.ReportError('winapi::GlobalAlloc', err)
  END
  RETURN err
 
TGdiPlus.GetImageWidth        PROCEDURE(*ULONG pWidth)
err                             GpStatus, AUTO
  CODE
  err = gp::GetImageWidth(SELF.bitmap, pWidth)
  SELF.ReportError('GetImageWidth', err)
  RETURN err

TGdiPlus.GetImageHeight       PROCEDURE(*ULONG pHeight)
err                             GpStatus, AUTO
  CODE
  err = gp::GetImageHeight(SELF.bitmap, pHeight)
  SELF.ReportError('GetImageHeight', err)
  RETURN err

TGdiPlus.DisposeImage         PROCEDURE()
err                             GpStatus, AUTO
  CODE
  RETURN gp::DisposeImage(SELF.bitmap)
  SELF.ReportError('DisposeImage', err)
  RETURN err
!!!endregion
