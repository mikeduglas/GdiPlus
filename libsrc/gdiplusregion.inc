!* GDI+ support
!* GDI+ Region class
!* mikeduglas 2023
!* mikeduglas@yandex.ru


!--------------------------------------------------------------------------
! GDI+ Region class
!--------------------------------------------------------------------------
TGdiPlusRegion                CLASS, TYPE, MODULE('gdiplus.clw'), LINK('gdiplus.clw')
nativeRegion                    LONG, PROTECTED
lastResult                      GpStatus, PROTECTED

Destruct                        PROCEDURE(), VIRTUAL
Initialized                     PROCEDURE(), BOOL

!!!<summary>Creates a region that is infinite.</summary>
CreateRegion                    PROCEDURE(), GpStatus, PROC
!!!<summary>Creates a region that is defined by a rectangle.</summary>
FromRect                        PROCEDURE(CONST *GpRectF pRect), GpStatus, PROC
!!!<summary>Creates a region that is defined by a rectangle.</summary>
FromRect                        PROCEDURE(CONST *GpRect pRect), GpStatus, PROC
!!!<summary>Creates a region that is defined by a GraphicsPath object and has a fill mode that is contained in the GraphicsPath object.</summary>
FromGraphicsPath                PROCEDURE(TGdiPlusGraphicsPath pPath), GpStatus, PROC
!!!<summary>Creates a region that is defined by data obtained from another region.</summary>
FromRegionData                  PROCEDURE(*BYTE[] pData), GpStatus, PROC
!!!<summary>Creates a region that is identical to the region that is specified by a handle to a GDI region.</summary>
FromHRGN                        PROCEDURE(HRGN phRgn), GpStatus, PROC
!!!<summary>Releases resources used by the Region object.</summary>
DeleteRegion                    PROCEDURE(), GpStatus, PROC
!!!<summary>Makes a copy of this Region object.</summary>
Clone                           PROCEDURE(*TGdiPlusRegion cloneRegion), GpStatus, PROC
!!!<summary>Updates this region to an infinite region.</summary>
MakeInfinite                    PROCEDURE(), GpStatus, PROC
!!!<summary>Updates this region to an empty region. In other words, the region occupies no space on the display device.</summary>
MakeEmpty                       PROCEDURE(), GpStatus, PROC

CombineRegion                   PROCEDURE(CONST *GpRectF pRect, GpCombineMode pMode), GpStatus, PROC
CombineRegion                   PROCEDURE(CONST *GpRect pRect, GpCombineMode pMode), GpStatus, PROC
CombineRegion                   PROCEDURE(TGdiPlusGraphicsPath pPath, GpCombineMode pMode), GpStatus, PROC
CombineRegion                   PROCEDURE(TGdiPlusRegion pRegion, GpCombineMode pMode), GpStatus, PROC

!!!<summary>Updates this region to the portion of itself that intersects the specified rectangle's interior.</summary>
Intersect                       PROCEDURE(CONST *GpRectF pRect), GpStatus, PROC
!!!<summary>Updates this region to the portion of itself that intersects the specified rectangle's interior.</summary>
Intersect                       PROCEDURE(CONST *GpRect pRect), GpStatus, PROC
!!!<summary>Updates this region to the portion of itself that intersects the specified path's interior.</summary>
Intersect                       PROCEDURE(TGdiPlusGraphicsPath pPath), GpStatus, PROC
!!!<summary>Updates this region to the portion of itself that intersects another region.</summary>
Intersect                       PROCEDURE(TGdiPlusRegion pRegion), GpStatus, PROC
!- no online Remarks for these methods (https://docs.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-region-flat)
Union                           PROCEDURE(CONST *GpRectF pRect), GpStatus, PROC
Union                           PROCEDURE(CONST *GpRect pRect), GpStatus, PROC
Union                           PROCEDURE(TGdiPlusGraphicsPath pPath), GpStatus, PROC
Union                           PROCEDURE(TGdiPlusRegion pRegion), GpStatus, PROC
CombineXor                      PROCEDURE(CONST *GpRectF pRect), GpStatus, PROC
CombineXor                      PROCEDURE(CONST *GpRect pRect), GpStatus, PROC
CombineXor                      PROCEDURE(TGdiPlusGraphicsPath pPath), GpStatus, PROC
CombineXor                      PROCEDURE(TGdiPlusRegion pRegion), GpStatus, PROC
Exclude                         PROCEDURE(CONST *GpRectF pRect), GpStatus, PROC
Exclude                         PROCEDURE(CONST *GpRect pRect), GpStatus, PROC
Exclude                         PROCEDURE(TGdiPlusGraphicsPath pPath), GpStatus, PROC
Exclude                         PROCEDURE(TGdiPlusRegion pRegion), GpStatus, PROC
Complement                      PROCEDURE(CONST *GpRectF pRect), GpStatus, PROC
Complement                      PROCEDURE(CONST *GpRect pRect), GpStatus, PROC
Complement                      PROCEDURE(TGdiPlusGraphicsPath pPath), GpStatus, PROC
Complement                      PROCEDURE(TGdiPlusRegion pRegion), GpStatus, PROC

!!!<summary>Offsets this region by specified amounts in the horizontal and vertical directions.</summary>
Translate                       PROCEDURE(SREAL pDx, SREAL pDy), GpStatus, PROC
!!!<summary>Offsets this region by specified amounts in the horizontal and vertical directions.</summary>
TranslateI                      PROCEDURE(SIGNED pDx, SIGNED pDy), GpStatus, PROC
!!!<summary>Transforms this region by multiplying each of its data points by a specified matrix.</summary>
Transform                       PROCEDURE(TGdiPlusMatrix pMatrix), GpStatus, PROC
!!!<summary>Gets a rectangle that encloses this region.</summary>
GetBounds                       PROCEDURE(TGdiPlusGraphicsPath pPath, *GpRectF pRect), GpStatus, PROC
!!!<summary>Gets a rectangle that encloses this region.</summary>
GetBounds                       PROCEDURE(TGdiPlusGraphicsPath pPath, *GpRect pRect), GpStatus, PROC
!!!<summary>Creates a GDI region from this region.</summary>
GetHRGN                         PROCEDURE(TGdiPlusGraphicsPath pPath), HRGN
!!!<summary>Determines whether this region is empty.</summary>
IsEmpty                         PROCEDURE(TGdiPlusGraphicsPath pPath), BOOL
!!!<summary>Determines whether this region is infinite.</summary>
IsInfinite                      PROCEDURE(TGdiPlusGraphicsPath pPath), BOOL
!!!<summary>Determines whether this region is equal to a specified region.</summary>
Equals                          PROCEDURE(TGdiPlusRegion pRegion, TGdiPlusGraphicsPath pPath), BOOL
!!!<summary>Gets the number of bytes of data that describes this region.</summary>
GetDataSize                     PROCEDURE(), UNSIGNED
!!!<summary>Gets data that describes this region.</summary>
GetData                         PROCEDURE(*BYTE[] pData, <*UNSIGNED pSizeFilled>), GpStatus, PROC
!!!<summary>Determines whether a point is inside this region.</summary>
IsVisible                       PROCEDURE(CONST *GpPointF pPoint, TGdiPlusGraphicsPath pPath), BOOL
!!!<summary>Determines whether a point is inside this region.</summary>
IsVisible                       PROCEDURE(CONST *GpPoint pPoint, TGdiPlusGraphicsPath pPath), BOOL
!!!<summary>Determines whether a rectangle intersects this region.</summary>
IsVisible                       PROCEDURE(CONST *GpRectF pRect, TGdiPlusGraphicsPath pPath), BOOL
!!!<summary>Determines whether a rectangle intersects this region.</summary>
IsVisible                       PROCEDURE(CONST *GpRect pRect, TGdiPlusGraphicsPath pPath), BOOL
!!!<summary>Gets the number of rectangles that approximate this region. The region is transformed by a specified matrix before the rectangles are calculated.</summary>
GetRegionScansCount             PROCEDURE(TGdiPlusMatrix pMatrix), UNSIGNED
!!!<summary>Gets an array of rectangles that approximate this region. The region is transformed by a specified matrix before the rectangles are calculated.</summary>
GetRegionScans                  PROCEDURE(TGdiPlusMatrix pMatrix, LONG pRect, *UNSIGNED pCount), GpStatus, PROC
!!!<summary>Gets an array of rectangles that approximate this region. The region is transformed by a specified matrix before the rectangles are calculated.</summary>
GetRegionScansI                 PROCEDURE(TGdiPlusMatrix pMatrix, LONG pRect, *UNSIGNED pCount), GpStatus, PROC
                              END

