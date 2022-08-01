!* GDI+ support
!* Main inc file
!* mikeduglas 2022
!* mikeduglas@yandex.ru

  INCLUDE('svapi.inc'), ONCE
  INCLUDE('svcomdef.inc'), ONCE
  INCLUDE('winapi.inc'), ONCE
  INCLUDE('gdiplustypes.inc'), ONCE
  INCLUDE('gdipluspixelformat.inc'), ONCE
  INCLUDE('gdiplusstringformat.inc'), ONCE
  INCLUDE('gdiplusimage.inc'), ONCE
  INCLUDE('gdiplusgraphics.inc'), ONCE
  INCLUDE('gdiplusregion.inc'), ONCE
  INCLUDE('gdipluspropertyitem.inc'), ONCE
  INCLUDE('gdipluseffects.inc'), ONCE
  INCLUDE('gdiplusmatrix.inc'), ONCE
  INCLUDE('gdipluspen.inc'), ONCE
  INCLUDE('gdiplusbrush.inc'), ONCE
  INCLUDE('gdiplusfont.inc'), ONCE
  INCLUDE('gdipluspath.inc'), ONCE

  MAP
    MODULE('gdiplus.clw')
      GdipMakeARGB(BYTE pAlpha, BYTE pRed, BYTE pGreen, BYTE pBlue), GpARGB
      GdipMakeARGB(LONG pClarionColor, BYTE pAlpha=255), GpARGB
    END
  END
