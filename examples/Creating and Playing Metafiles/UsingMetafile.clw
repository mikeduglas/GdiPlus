!https://docs.microsoft.com/en-us/previous-versions//ms535989(v=vs.85)

  PROGRAM

  INCLUDE('winapi.inc'), ONCE
  INCLUDE('gdiplus.inc'), ONCE

  MAP
    wndProc(HWND hWnd, ULONG wMsg, UNSIGNED wParam, LONG lParam), LONG, PASCAL, PRIVATE
    metaCallback(GpEmfPlusRecordType pRecordType, UNSIGNED pFlags, UNSIGNED pDataSize, LONG pStr, LONG pCallbackData), BOOL, PASCAL, PRIVATE

    CreateAnddPlayMetafile(HDC phdc)
  END

Window                        WINDOW('GDI+ Using Metafile'),AT(,,197,145),CENTER,GRAY,SYSTEM,FONT('Segoe UI',9),RESIZE
                                BUTTON('Close'),AT(151,124,38),USE(?btnClose),STD(STD:Close)
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

  
metaCallback                  PROCEDURE(GpEmfPlusRecordType pRecordType, UNSIGNED pFlags, UNSIGNED pDataSize, LONG pStr, LONG pCallbackData)
metafile                        &TGdiPlusMetafile
EmfPlusRecordTypeFillEllipse    EQUATE(400Eh) !16398, see https://www.magnumdb.com/search?q=EmfPlusRecordTypeFillEllipse

  CODE
  !Play only EmfPlusRecordTypeFillEllipse records.
  IF pRecordType = EmfPlusRecordTypeFillEllipse
    metafile &= (pCallbackData)
    metafile.PlayRecord(pRecordType, pFlags, pDataSize, pStr)
  END
  
  RETURN TRUE

  
  
TSimpleWindow.OnPaint         PROCEDURE()
dc                              TPaintDC
  CODE
  dc.GetDC(SELF.hwnd)
  
  CreateAnddPlayMetafile(dc.GetHandle())
  
CreateAnddPlayMetafile        PROCEDURE(HDC phdc)
g                               TGdiPlusGraphics
metafile                        TGdiPlusMetafile
gMeta                           TGdiPlusGraphics
brush1                          TGdiPlusSolidBrush
brush2                          TGdiPlusSolidBrush
pt1                             LIKE(GpPoint)
pt2                             LIKE(GpPoint)
  CODE
  !The following example creates a Metafile object and writes two records to the metafile. Then the code passes the address of that Metafile object 
  !to the EnumerateMetafile method. The EnumerateMetafile method calls the callback function (metaCallback) for each of the records in the metafile. 
  !The callback function plays only one of the two records in the metafile, namely the one that has a record type of EmfPlusRecordTypeFillEllipse.
  
  g.FromHDC(phdc)
  metafile.RecordFileName('SampleMetafile.emf', phdc)
  
  brush1.CreateSolidBrush(0ff000000h)
  brush2.CreateSolidBrush(0ffff0000h)

  !Fill a rectangle and an ellipse in pMeta.
  gMeta.FromImage(metafile)
  gMeta.FillRectangle(brush1, 0, 0, 100, 100)
  gMeta.FillEllipse(brush2, 100, 0, 200, 100)
  gMeta.DeleteGraphics()
  
  !Enumerate metafile, passing metafile as the callback data.
  pt1.x = 0; pt1.y = 0
  g.EnumerateMetafile(metafile, pt1, ADDRESS(metaCallback), ADDRESS(metafile))
  
  pt2.x = 0; pt2.y = 150
  g.DrawImage(metafile, pt2)