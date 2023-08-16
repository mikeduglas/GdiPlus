  PROGRAM

  INCLUDE('gdiplus.inc'), ONCE

  MAP
    ReadMetadata(STRING pImageFile)
    GetLatitude(TGdiPlusBitmap bm, *SREAL pDegrees, *SREAL pMinutes, *SREAL pSeconds, *STRING pRef)
    GetLongitude(TGdiPlusBitmap bm, *SREAL pDegrees, *SREAL pMinutes, *SREAL pSeconds, *STRING pRef)
    GetAltitude(TGdiPlusBitmap bm, *SREAL pMeters, *BYTE pRef)

    INCLUDE('printf.inc'), ONCE
  END

!see https://learn.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-constant-property-tags-in-numerical-order
GpPropertyTag:GpsLatitudeRef  EQUATE(0001h)
GpPropertyTag:GpsLatitude     EQUATE(0002h)
GpPropertyTag:GpsLongitudeRef EQUATE(0003h)
GpPropertyTag:GpsLongitude    EQUATE(0004h)
GpPropertyTag:GpsAltitudeRef  EQUATE(0005h)
GpPropertyTag:GpsAltitude     EQUATE(0006h)

  CODE
  ReadMetadata('myphoto.jpg')
  
  
ReadMetadata                  PROCEDURE(STRING pImageFile)
bm                              TGdiPlusBitmap

fLatitude                       SREAL, DIM(3)      !- degrees/minutes/seconds
sLatitudeRef                    STRING(1), AUTO   !- N | S

fLongitude                      SREAL, DIM(3)      !- degrees/minutes/seconds
sLongitudeRef                   STRING(1), AUTO   !- W | E

fAltitude                       SREAL, AUTO
iAltitudeRef                    BYTE, AUTO

  CODE
  IF bm.FromFile(pImageFile)=GpStatus:Ok
  
    bm.GetLatitude(fLatitude[1], fLatitude[2], fLatitude[3], sLatitudeRef)
    bm.GetLongitude(fLongitude[1], fLongitude[2], fLongitude[3], sLongitudeRef)
    bm.GetAltitude(fAltitude, iAltitudeRef)
  
    printd('Metadata extracted from %s', pImageFile)
    printd('....Latitude:  %f; %f; %f; %s', fLatitude[1], fLatitude[2], fLatitude[3], sLatitudeRef)
    printd('....Longitude: %f; %f; %f; %s', fLongitude[1], fLongitude[2], fLongitude[3], sLongitudeRef)
    printd('....Altitude:  %f; %i', fAltitude, iAltitudeRef)
  END
  
  
GetLatitude                   PROCEDURE(TGdiPlusBitmap bm, *SREAL pDegrees, *SREAL pMinutes, *SREAL pSeconds, *STRING pRef)
pi                              TGdiPlusPropertyItem
adrValue                        LONG, AUTO
long1                           &LONG, AUTO
long2                           &LONG, AUTO
  CODE
  pDegrees = 0
  pMinutes = 0
  pSeconds = 0
  pRef = ''
  
  !- Latitude is expressed as three rational values giving the degrees, minutes, and seconds respectively.
  !- See https://learn.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-constant-property-item-descriptions.
  IF bm.GetPropertyItem(GpPropertyTag:GpsLatitude, pi) = GpStatus:Ok
  
    !- Latitude value is an array of 3 rationals. Each rational is 2 LONGs (Rational=LONG1/LONG2).
    !- So first we get an address of a value buffer,
    adrValue = pi.GetValueAddress()

    !- then read 2 LONGs one followed by the other, and calculate a rational degrees value:
    long1 &= (adrValue+0)
    long2 &= (adrValue+4)
    pDegrees = long1/long2
    
    !- next 2 LONGs are Minutes value.
    long1 &= (adrValue+8)
    long2 &= (adrValue+12)
    pMinutes = long1/long2
      
    !- next 2 LONGs are Seconds value.
    long1 &= (adrValue+16)
    long2 &= (adrValue+20)
    pSeconds = long1/long2
  END
  
  !- Another property for LatitudeRef.
  !- It is of STRING type.
  !- N specifies north latitude, and S specifies south latitude.
  IF bm.GetPropertyItem(GpPropertyTag:GpsLatitudeRef, pi) = GpStatus:Ok
    pRef = pi.GetStringValue()
  END
  
GetLongitude                  PROCEDURE(TGdiPlusBitmap bm, *SREAL pDegrees, *SREAL pMinutes, *SREAL pSeconds, *STRING pRef)
pi                              TGdiPlusPropertyItem
adrValue                        LONG, AUTO
long1                           &LONG, AUTO
long2                           &LONG, AUTO
  CODE
  pDegrees = 0
  pMinutes = 0
  pSeconds = 0
  pRef = ''
  
  !- Longitude is expressed as three rational values giving the degrees, minutes, and seconds respectively.
  !- See comments in GetLatitude code.
  
  IF bm.GetPropertyItem(GpPropertyTag:GpsLongitude, pi) = GpStatus:Ok
    adrValue = pi.GetValueAddress()
  
    long1 &= (adrValue+0)
    long2 &= (adrValue+4)
    pDegrees = long1/long2
    
    long1 &= (adrValue+8)
    long2 &= (adrValue+12)
    pMinutes = long1/long2
      
    long1 &= (adrValue+16)
    long2 &= (adrValue+20)
    pSeconds = long1/long2
  END
  
  !- E specifies east longitude, and W specifies west longitude.
  IF bm.GetPropertyItem(GpPropertyTag:GpsLongitudeRef, pi) = GpStatus:Ok
    pRef = pi.GetStringValue()
  END
  
GetAltitude                   PROCEDURE(TGdiPlusBitmap bm, *SREAL pMeters, *BYTE pRef)
pi                              TGdiPlusPropertyItem
adrValue                        LONG, AUTO
long1                           &LONG, AUTO
long2                           &LONG, AUTO
  CODE
  pMeters = 0
  pRef = 0
  
  !- Altitude, in meters, based on the reference altitude specified by PropertyTagGpsAltitudeRef.
  IF bm.GetPropertyItem(GpPropertyTag:GpsAltitude, pi) = GpStatus:Ok

    !- Altitude value is 1 rational.
    adrValue = pi.GetValueAddress()
  
    long1 &= (adrValue+0)
    long2 &= (adrValue+4)
    pMeters = long1/long2
  END
  
  !- Reference altitude, in meters.
  !- It is of BYTE type.
  IF bm.GetPropertyItem(GpPropertyTag:GpsAltitudeRef, pi) = GpStatus:Ok
    pRef = pi.GetByteValue()
  END
  