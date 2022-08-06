!* GDI+ support
!* Base struct and enum declarations
!* mikeduglas 2022
!* mikeduglas@yandex.ru

  INCLUDE('svcomdef.inc'), ONCE


HPALETTE                      EQUATE(HANDLE)
HMETAFILE                     EQUATE(HANDLE)
HENHMETAFILE                  EQUATE(HANDLE)

GpARGB                        EQUATE(ULONG)
GpGraphicsState               EQUATE(ULONG)


GpStatus                      EQUATE(LONG)
                              ITEMIZE, PRE(GpStatus)
Ok                              EQUATE(0)
GenericError                    EQUATE(1)
InvalidParameter                EQUATE(2)
OutOfMemory                     EQUATE(3)
ObjectBusy                      EQUATE(4)
InsufficientBuffer              EQUATE(5)
NotImplemented                  EQUATE(6)
Win32Error                      EQUATE(7)
WrongState                      EQUATE(8)
Aborted                         EQUATE(9)
FileNotFound                    EQUATE(10)
ValueOverflow                   EQUATE(11)
AccessDenied                    EQUATE(12)
UnknownImageFormat              EQUATE(13)
FontFamilyNotFound              EQUATE(14)
FontStyleNotFound               EQUATE(15)
NotTrueTypeFont                 EQUATE(16)
UnsupportedGdiplusVersion       EQUATE(17)
GdiplusNotInitialized           EQUATE(18)
PropertyNotFound                EQUATE(19)
PropertyNotSupported            EQUATE(20)
                              END


!--------------------------------------------------------------------------
! Image types
!--------------------------------------------------------------------------
GpImageType                   EQUATE(LONG)
ImageTypeUnknown              EQUATE(0)
ImageTypeBitmap               EQUATE(1)
ImageTypeMetafile             EQUATE(2)


!--------------------------------------------------------------------------
! Unit constants
!--------------------------------------------------------------------------
GpUnit                        EQUATE(LONG)
UnitWorld                     EQUATE(0)     ! 0 -- World coordinate (non-physical unit).
UnitDisplay                   EQUATE(1)     ! 1 -- Variable -- for PageTransform only.
UnitPixel                     EQUATE(2)     ! 2 -- Each unit is one device pixel.
UnitPoint                     EQUATE(3)     ! 3 -- Each unit is a printer's point, or 1/72 inch.
UnitInch                      EQUATE(4)     ! 4 -- Each unit is 1 inch.
UnitDocument                  EQUATE(5)     ! 5 -- Each unit is 1/300 inch.
UnitMillimeter                EQUATE(6)     ! 6 -- Each unit is 1 millimeter.


GpImageFlags                  EQUATE(LONG)
ImageFlagsNone                EQUATE(0)
!- Low-word: shared with SINKFLAG_x
ImageFlagsScalable            EQUATE(00001h)
ImageFlagsHasAlpha            EQUATE(00002h)
ImageFlagsHasTranslucent      EQUATE(00004h)
ImageFlagsPartiallyScalable   EQUATE(00008h)
!- Low-word: color space definition
ImageFlagsColorSpaceRGB       EQUATE(00010h)
ImageFlagsColorSpaceCMYK      EQUATE(00020h)
ImageFlagsColorSpaceGRAY      EQUATE(00040h)
ImageFlagsColorSpaceYCBCR     EQUATE(00080h)
ImageFlagsColorSpaceYCCK      EQUATE(00100h)
!- Low-word: image size info
ImageFlagsHasRealDPI          EQUATE(01000h)
ImageFlagsHasRealPixelSize    EQUATE(02000h)
!- High-word
ImageFlagsReadOnly            EQUATE(10000h)
ImageFlagsCaching             EQUATE(20000h)


GpRotateFlipType              EQUATE(LONG)
RotateNoneFlipNone            EQUATE(0)
Rotate90FlipNone              EQUATE(1)
Rotate180FlipNone             EQUATE(2)
Rotate270FlipNone             EQUATE(3)
RotateNoneFlipX               EQUATE(4)
Rotate90FlipX                 EQUATE(5)
Rotate180FlipX                EQUATE(6)
Rotate270FlipX                EQUATE(7)
RotateNoneFlipY               EQUATE(Rotate180FlipX)
Rotate90FlipY                 EQUATE(Rotate270FlipX)
Rotate180FlipY                EQUATE(RotateNoneFlipX)
Rotate270FlipY                EQUATE(Rotate90FlipX)
RotateNoneFlipXY              EQUATE(Rotate180FlipNone)
Rotate90FlipXY                EQUATE(Rotate270FlipNone)
Rotate180FlipXY               EQUATE(RotateNoneFlipNone)
Rotate270FlipXY               EQUATE(Rotate90FlipNone)


GpPaletteType                 EQUATE(LONG)
PaletteTypeCustom             EQUATE(0)
PaletteTypeOptimal            EQUATE(1)
PaletteTypeFixedBW            EQUATE(2)
PaletteTypeFixedHalftone8     EQUATE(3)
PaletteTypeFixedHalftone27    EQUATE(4)
PaletteTypeFixedHalftone64    EQUATE(5)
PaletteTypeFixedHalftone125   EQUATE(6)
PaletteTypeFixedHalftone216   EQUATE(7)
PaletteTypeFixedHalftone252   EQUATE(8)
PaletteTypeFixedHalftone256   EQUATE(9)
  

GpDitherType                  EQUATE(LONG)
DitherTypeNone                EQUATE(0)
DitherTypeSolid               EQUATE(1)
DitherTypeOrdered4x4          EQUATE(2)
DitherTypeOrdered8x8          EQUATE(3)
DitherTypeOrdered16x16        EQUATE(4)
DitherTypeSpiral4x4           EQUATE(5)
DitherTypeSpiral8x8           EQUATE(6)
DitherTypeDualSpiral4x4       EQUATE(7)
DitherTypeDualSpiral8x8       EQUATE(8)
DitherTypeErrorDiffusion      EQUATE(9)
DitherTypeMax                 EQUATE(10)


!--------------------------------------------------------------------------
! Per-channel Histogram for 8bpp images.
!--------------------------------------------------------------------------
GpHistogramFormat             EQUATE(LONG)
HistogramFormatARGB           EQUATE(0)
HistogramFormatPARGB          EQUATE(1)
HistogramFormatRGB            EQUATE(2)
HistogramFormatGray           EQUATE(3)
HistogramFormatB              EQUATE(4)
HistogramFormatG              EQUATE(5)
HistogramFormatR              EQUATE(6)
HistogramFormatA              EQUATE(7) 


!--------------------------------------------------------------------------
! Quality mode constants
!--------------------------------------------------------------------------
GpQualityMode                 EQUATE(LONG)
QualityModeInvalid            EQUATE(-1)
QualityModeDefault            EQUATE(0)
QualityModeLow                EQUATE(1)   !- Best performance
QualityModeHigh               EQUATE(2)   !- Best rendering quality

!--------------------------------------------------------------------------
! Alpha Compositing mode constants
!--------------------------------------------------------------------------
GpCompositingMode             EQUATE(LONG)
CompositingModeSourceOver     EQUATE(0)
CompositingModeSourceCopy     EQUATE(1)

!--------------------------------------------------------------------------
! Alpha Compositing quality constants
!--------------------------------------------------------------------------
GpCompositingQuality          EQUATE(LONG)
CompositingQualityInvalid     EQUATE(QualityModeInvalid)
CompositingQualityDefault     EQUATE(QualityModeDefault)
CompositingQualityHighSpeed   EQUATE(QualityModeLow)
CompositingQualityHighQuality EQUATE(QualityModeHigh)
CompositingQualityGammaCorrected  EQUATE(3)
CompositingQualityAssumeLinear    EQUATE(4)


!---------------------------------------------------------------------------
! Smoothing Mode
!---------------------------------------------------------------------------
GpSmoothingMode               EQUATE(LONG)
SmoothingModeInvalid          EQUATE(QualityModeInvalid)
SmoothingModeDefault          EQUATE(QualityModeDefault)
SmoothingModeHighSpeed        EQUATE(QualityModeLow)
SmoothingModeHighQuality      EQUATE(QualityModeHigh)
SmoothingModeNone             EQUATE(3)
SmoothingModeAntiAlias        EQUATE(4)
SmoothingModeAntiAlias8x4     EQUATE(SmoothingModeAntiAlias)
SmoothingModeAntiAlias8x8     EQUATE(5)


!---------------------------------------------------------------------------
! Pixel Format Mode
!---------------------------------------------------------------------------
GpPixelOffsetMode             EQUATE(LONG)
PixelOffsetModeInvalid        EQUATE(QualityModeInvalid)
PixelOffsetModeDefault        EQUATE(QualityModeDefault)
PixelOffsetModeHighSpeed      EQUATE(QualityModeLow)
PixelOffsetModeHighQuality    EQUATE(QualityModeHigh)
PixelOffsetModeNone           EQUATE(3)   !- No pixel offset
PixelOffsetModeHalf           EQUATE(4)   !- Offset by -0.5, -0.5 for fast anti-alias perf


!---------------------------------------------------------------------------
! Text Rendering Hint
!---------------------------------------------------------------------------
GpTextRenderingHint                       EQUATE(LONG)
TextRenderingHintSystemDefault            EQUATE(0)     !- Glyph with system default rendering hint
TextRenderingHintSingleBitPerPixelGridFit EQUATE(1)     !- Glyph bitmap with hinting
TextRenderingHintSingleBitPerPixel        EQUATE(2)     !- Glyph bitmap without hinting
TextRenderingHintAntiAliasGridFit         EQUATE(3)     !- Glyph anti-alias bitmap with hinting
TextRenderingHintAntiAlias                EQUATE(4)     !- Glyph anti-alias bitmap without hinting
TextRenderingHintClearTypeGridFit         EQUATE(5)     !- Glyph CT bitmap with hinting


!--------------------------------------------------------------------------
! Interpolation modes
!--------------------------------------------------------------------------
GpInterpolationMode           EQUATE(LONG)
InterpolationModeInvalid      EQUATE(QualityModeInvalid)
InterpolationModeDefault      EQUATE(QualityModeDefault)
InterpolationModeLowQuality   EQUATE(QualityModeLow)
InterpolationModeHighQuality  EQUATE(QualityModeHigh)
InterpolationModeBilinear     EQUATE(3)
InterpolationModeBicubic      EQUATE(4)
InterpolationModeNearestNeighbor  EQUATE(5)
InterpolationModeHighQualityBilinear  EQUATE(6)
InterpolationModeHighQualityBicubic   EQUATE(7)


!--------------------------------------------------------------------------
! Coordinate space identifiers
!--------------------------------------------------------------------------
GpCoordinateSpace             EQUATE(LONG)
CoordinateSpaceWorld          EQUATE(0)
CoordinateSpacePage           EQUATE(1)
CoordinateSpaceDevice         EQUATE(2)


!--------------------------------------------------------------------------
! Fill mode constants
!--------------------------------------------------------------------------
GpFillMode                    EQUATE(LONG)
FillModeAlternate             EQUATE(0)
FillModeWinding               EQUATE(1)


!--------------------------------------------------------------------------
! Default bezier flattening tolerance in device pixels.
!--------------------------------------------------------------------------
FlatnessDefault               EQUATE(0.25)


!--------------------------------------------------------------------------
! WarpMode constants
!--------------------------------------------------------------------------
GpWarpMode                    EQUATE(LONG)
WarpModePerspective           EQUATE(0)
WarpModeBilinear              EQUATE(1)


!--------------------------------------------------------------------------
! Line cap constants (only the lowest 8 bits are used).
!--------------------------------------------------------------------------
GpLineCap                     EQUATE(LONG)
LineCapFlat                   EQUATE(0)
LineCapSquare                 EQUATE(1)
LineCapRound                  EQUATE(2)
LineCapTriangle               EQUATE(3)
LineCapNoAnchor               EQUATE(010h) ! corresponds to flat cap
LineCapSquareAnchor           EQUATE(011h) ! corresponds to square cap
LineCapRoundAnchor            EQUATE(012h) ! corresponds to round cap
LineCapDiamondAnchor          EQUATE(013h) ! corresponds to triangle cap
LineCapArrowAnchor            EQUATE(014h) ! no correspondence
LineCapCustom                 EQUATE(0ffh) ! custom cap
LineCapAnchorMask             EQUATE(0f0h)  ! mask to check for anchor or not.


!--------------------------------------------------------------------------
! Dash cap constants
!--------------------------------------------------------------------------
GpDashCap                     EQUATE(LONG)
DashCapFlat                   EQUATE(0)
DashCapRound                  EQUATE(2)
DashCapTriangle               EQUATE(3)


!--------------------------------------------------------------------------
! Dash style constants
!--------------------------------------------------------------------------
GpDashStyle                   EQUATE(LONG)
DashStyleSolid                EQUATE(0)
DashStyleDash                 EQUATE(1)
DashStyleDot                  EQUATE(2)
DashStyleDashDot              EQUATE(3)
DashStyleDashDotDot           EQUATE(4)
DashStyleCustom               EQUATE(5)


!--------------------------------------------------------------------------
! Line join constants
!--------------------------------------------------------------------------
GpLineJoin                    EQUATE(LONG)
LineJoinMiter                 EQUATE(0)
LineJoinBevel                 EQUATE(1)
LineJoinRound                 EQUATE(2)
LineJoinMiterClipped          EQUATE(3)


!--------------------------------------------------------------------------
! Pen alignment
!--------------------------------------------------------------------------
GpPenAlignment                EQUATE(LONG)
PenAlignmentCenter            EQUATE(0)
PenAlignmentInset             EQUATE(1)


!--------------------------------------------------------------------------
! Brush types
!--------------------------------------------------------------------------
GpBrushType                   EQUATE(LONG)
BrushTypeSolidColor           EQUATE(0)
BrushTypeHatchFill            EQUATE(1)
BrushTypeTextureFill          EQUATE(2)
BrushTypePathGradient         EQUATE(3)
BrushTypeLinearGradient       EQUATE(4)


!--------------------------------------------------------------------------
! Pen's Fill types
!--------------------------------------------------------------------------
GpPenType                     EQUATE(LONG)
PenTypeSolidColor             EQUATE(BrushTypeSolidColor)
PenTypeHatchFill              EQUATE(BrushTypeHatchFill)
PenTypeTextureFill            EQUATE(BrushTypeTextureFill)
PenTypePathGradient           EQUATE(BrushTypePathGradient)
PenTypeLinearGradient         EQUATE(BrushTypeLinearGradient)
PenTypeUnknown                EQUATE(-1)


!--------------------------------------------------------------------------
! Various wrap modes for brushes
!--------------------------------------------------------------------------
GpWrapMode                    EQUATE(LONG)
WrapModeTile                  EQUATE(0)
WrapModeTileFlipX             EQUATE(1)
WrapModeTileFlipY             EQUATE(2)
WrapModeTileFlipXY            EQUATE(3)
WrapModeClamp                 EQUATE(4)


!--------------------------------------------------------------------------
! LineGradient Mode
!--------------------------------------------------------------------------
GpLinearGradientMode          EQUATE(LONG)
LinearGradientModeHorizontal  EQUATE(0)
LinearGradientModeVertical    EQUATE(1)
LinearGradientModeForwardDiagonal EQUATE(2)
LinearGradientModeBackwardDiagonal    EQUATE(3)


!--------------------------------------------------------------------------
! Various hatch styles
!--------------------------------------------------------------------------
GpHatchStyle                  EQUATE(LONG)
HatchStyleHorizontal          EQUATE(0)
HatchStyleVertical            EQUATE(1)
HatchStyleForwardDiagonal     EQUATE(2)
HatchStyleBackwardDiagonal    EQUATE(3)
HatchStyleCross               EQUATE(4)
HatchStyleDiagonalCross       EQUATE(5)
HatchStyle05Percent           EQUATE(6)
HatchStyle10Percent           EQUATE(7)
HatchStyle20Percent           EQUATE(8)
HatchStyle25Percent           EQUATE(9)
HatchStyle30Percent           EQUATE(10)
HatchStyle40Percent           EQUATE(11)
HatchStyle50Percent           EQUATE(12)
HatchStyle60Percent           EQUATE(13)
HatchStyle70Percent           EQUATE(14)
HatchStyle75Percent           EQUATE(15)
HatchStyle80Percent           EQUATE(16)
HatchStyle90Percent           EQUATE(17)
HatchStyleLightDownwardDiagonal   EQUATE(18)
HatchStyleLightUpwardDiagonal EQUATE(19)
HatchStyleDarkDownwardDiagonal    EQUATE(20)
HatchStyleDarkUpwardDiagonal  EQUATE(21)
HatchStyleWideDownwardDiagonal    EQUATE(22)
HatchStyleWideUpwardDiagonal  EQUATE(23)
HatchStyleLightVertical       EQUATE(24)
HatchStyleLightHorizontal     EQUATE(25)
HatchStyleNarrowVertical      EQUATE(26)
HatchStyleNarrowHorizontal    EQUATE(27)
HatchStyleDarkVertical        EQUATE(28)
HatchStyleDarkHorizontal      EQUATE(29)
HatchStyleDashedDownwardDiagonal  EQUATE(30)
HatchStyleDashedUpwardDiagonal    EQUATE(31)
HatchStyleDashedHorizontal    EQUATE(32)
HatchStyleDashedVertical      EQUATE(33)
HatchStyleSmallConfetti       EQUATE(34)
HatchStyleLargeConfetti       EQUATE(35)
HatchStyleZigZag              EQUATE(36)
HatchStyleWave                EQUATE(37)
HatchStyleDiagonalBrick       EQUATE(38)
HatchStyleHorizontalBrick     EQUATE(39)
HatchStyleWeave               EQUATE(40)
HatchStylePlaid               EQUATE(41)
HatchStyleDivot               EQUATE(42)
HatchStyleDottedGrid          EQUATE(43)
HatchStyleDottedDiamond       EQUATE(44)
HatchStyleShingle             EQUATE(45)
HatchStyleTrellis             EQUATE(46)
HatchStyleSphere              EQUATE(47)
HatchStyleSmallGrid           EQUATE(48)
HatchStyleSmallCheckerBoard   EQUATE(49)
HatchStyleLargeCheckerBoard   EQUATE(50)
HatchStyleOutlinedDiamond     EQUATE(51)
HatchStyleSolidDiamond        EQUATE(52)
HatchStyleTotal               EQUATE(53)
HatchStyleLargeGrid           EQUATE(HatchStyleCross)
HatchStyleMin                 EQUATE(HatchStyleHorizontal)
HatchStyleMax                 EQUATE(HatchStyleTotal - 1)


!--------------------------------------------------------------------------
! Region Combine Modes
!--------------------------------------------------------------------------
GpCombineMode                 EQUATE(LONG)
CombineModeReplace            EQUATE(0)
CombineModeIntersect          EQUATE(1)
CombineModeUnion              EQUATE(2)
CombineModeXor                EQUATE(3)
CombineModeExclude            EQUATE(4)
CombineModeComplement         EQUATE(5)  !(Exclude From)


!---------------------------------------------------------------------------
! Flush Intention flags
!---------------------------------------------------------------------------
GpFlushIntention              EQUATE(LONG)
FlushIntentionFlush           EQUATE(0)        ! Flush all batched rendering operations
FlushIntentionSync            EQUATE(1)        ! Flush all batched rendering operations and wait for them to complete


!--------------------------------------------------------------------------
! FontStyle: face types and common styles
!--------------------------------------------------------------------------
GpFontStyle                   EQUATE(LONG)
FontStyleRegular              EQUATE(0)
FontStyleBold                 EQUATE(1)
FontStyleItalic               EQUATE(2)
FontStyleBoldItalic           EQUATE(3)
FontStyleUnderline            EQUATE(4)
FontStyleStrikeout            EQUATE(8)


!--------------------------------------------------------------------------
! Matrix Order
!--------------------------------------------------------------------------
GpMatrixOrder                 EQUATE(LONG)
MatrixOrderPrepend            EQUATE(0)
MatrixOrderAppend             EQUATE(1)



!---------------------------------------------------------------------------
! String alignment flags
!---------------------------------------------------------------------------
GpStringAlignment             EQUATE(LONG)
! Left edge for left-to-right text,
! right for right-to-left text,
! and top for vertical
StringAlignmentNear           EQUATE(0)
StringAlignmentCenter         EQUATE(1)
StringAlignmentFar            EQUATE(2)


!---------------------------------------------------------------------------
! Hotkey prefix interpretation
!---------------------------------------------------------------------------
GpHotkeyPrefix                EQUATE(LONG)
HotkeyPrefixNone              EQUATE(0)
HotkeyPrefixShow              EQUATE(1)
HotkeyPrefixHide              EQUATE(2)


!---------------------------------------------------------------------------
! National language digit substitution
!---------------------------------------------------------------------------
GpStringDigitSubstitute       EQUATE(LONG)
StringDigitSubstituteUser     EQUATE(0)  !As NLS setting
StringDigitSubstituteNone     EQUATE(1)
StringDigitSubstituteNational EQUATE(2)
StringDigitSubstituteTraditional  EQUATE(3)


!---------------------------------------------------------------------------
! StringTrimming
!---------------------------------------------------------------------------
GpStringTrimming              EQUATE(LONG)
StringTrimmingNone            EQUATE(0)
StringTrimmingCharacter       EQUATE(1)
StringTrimmingWord            EQUATE(2)
StringTrimmingEllipsisCharacter   EQUATE(3)
StringTrimmingEllipsisWord    EQUATE(4)
StringTrimmingEllipsisPath    EQUATE(5)


!---------------------------------------------------------------------------
! StringFormatFlags
!---------------------------------------------------------------------------
GpStringFormatFlags                   EQUATE(LONG)
StringFormatFlagsDirectionRightToLeft EQUATE(00000001h)
StringFormatFlagsDirectionVertical    EQUATE(00000002h)
StringFormatFlagsNoFitBlackBox        EQUATE(00000004h)
StringFormatFlagsDisplayFormatControl EQUATE(00000020h)
StringFormatFlagsNoFontFallback       EQUATE(00000400h)
StringFormatFlagsMeasureTrailingSpaces    EQUATE(00000800h)
StringFormatFlagsNoWrap               EQUATE(00001000h)
StringFormatFlagsLineLimit            EQUATE(00002000h)
StringFormatFlagsNoClip               EQUATE(00004000h)
StringFormatFlagsBypassGDI            EQUATE(80000000h)


!---------------------------------------------------------------------------
! StringFormatFlags
!---------------------------------------------------------------------------






GpPoint                       GROUP, TYPE
x                               SIGNED
y                               SIGNED
                              END

GpPointF                      GROUP, TYPE
x                               SREAL
y                               SREAL
                              END

GpSizeF                       GROUP, TYPE
cx                              SREAL
cy                              SREAL
                              END

GpRect                        GROUP, TYPE
x                               SIGNED
y                               SIGNED
width                           SIGNED
height                          SIGNED
                              END

GpRectF                       GROUP, TYPE
x                               SREAL
y                               SREAL
width                           SREAL
height                          SREAL
                              END

GpImageCodecInfo              GROUP, TYPE
Clsid                           LIKE(_CLSID)
FormatID                        LIKE(GUID)
CodecName                       LONG  !WCHAR*
DllName                         LONG  !WCHAR*
FormatDescription               LONG  !WCHAR*
FilenameExtension               LONG  !WCHAR*
MimeType                        LONG  !WCHAR*
Flags                           ULONG
Version                         ULONG
SigCount                        UNSIGNED
SigSize                         UNSIGNED
SigPattern                      LONG  !BYTE*
SigMask                         LONG  !BYTE*
                              END

!https://docs.microsoft.com/en-us/previous-versions/ms534468(v=vs.85)
GpImageItemData               GROUP, TYPE
Size                            UNSIGNED  !- size of the structure.
Position                        ULONG     !- flags describing how the data is to be used.
Desc                            LONG      !- VOID*. description on how the data is to be saved. it is different for every codec type. (1 byte for JPEG, 4 bytes for PNG, 11 bytes for GIF)
DescSize                        UNSIGNED  !- size memory pointed by Desc
PtrData                         LONG      !- VOID*. pointer to the data that is to be saved in the file, could be anything saved directly.
DataSize                        UNSIGNED  !- size memory pointed by PtrData.
Cookie                          ULONG     !- opaque for the apps data member used during enumeration of image data items.
                              END


!----------------------------------------------------------------------------
! Color matrix
!----------------------------------------------------------------------------
typColorMatrix                GROUP, TYPE
m                               SREAL,DIM(5,5)
                              END


!----------------------------------------------------------------------------
! Color Matrix flags
!----------------------------------------------------------------------------
GpColorMatrixFlags            EQUATE(LONG)
ColorMatrixFlagsDefault       EQUATE(0)
ColorMatrixFlagsSkipGrays     EQUATE(1)
ColorMatrixFlagsAltGray       EQUATE(2)



!----------------------------------------------------------------------------
! Color Adjust Type
!----------------------------------------------------------------------------
GpColorAdjustType             EQUATE(LONG)
ColorAdjustTypeDefault        EQUATE(0)
ColorAdjustTypeBitmap         EQUATE(1)
ColorAdjustTypeBrush          EQUATE(2)
ColorAdjustTypePen            EQUATE(3)
ColorAdjustTypeText           EQUATE(4)
ColorAdjustTypeCount          EQUATE(5)
ColorAdjustTypeAny            EQUATE(6)     ! Reserved



!----------------------------------------------------------------------------
! Color Map
!----------------------------------------------------------------------------
typColorMap                   GROUP, TYPE
oldColor                        GpARGB
newColor                        GpARGB
                              END


!----------------------------------------------------------------------------
! Color mode
!----------------------------------------------------------------------------
GpColorMode                   EQUATE(LONG)
ColorModeARGB32               EQUATE(0)
ColorModeARGB64               EQUATE(1)


!----------------------------------------------------------------------------
! Color Channel flags
!----------------------------------------------------------------------------
GpColorChannelFlags           EQUATE(LONG)
ColorChannelFlagsC            EQUATE(0)
ColorChannelFlagsM            EQUATE(1)
ColorChannelFlagsY            EQUATE(2)
ColorChannelFlagsK            EQUATE(3)
ColorChannelFlagsLast         EQUATE(4)


!----------------------------------------------------------------------------
! Color Palette
!----------------------------------------------------------------------------
typColorPalette               GROUP, TYPE
Flags                           UNSIGNED             ! Palette flags
Count                           UNSIGNED             ! Number of color entries
Entries                         GpARGB,DIM(1)        ! Palette color entries
                              END

!---------------------------------------------------------------------------
! Encoder Parameter structure
!---------------------------------------------------------------------------
typEncoderParameter           GROUP, TYPE
Guid                            LIKE(GUID)  ! GUID of the parameter
NumberOfValues                  ULONG       ! Number of the parameter values
Type                            ULONG       ! Value type, like ValueTypeLONG  etc.
Value                           LONG        ! VOID*, A pointer to the parameter values
                              END
!---------------------------------------------------------------------------
! Encoder Parameters structure
!---------------------------------------------------------------------------
!class EncoderParameters
!{
!public:
!    UINT Count;                      // Number of parameters in this structure
!    EncoderParameter Parameter[1];   // Parameter values
!};


!---------------------------------------------------------------------------
! Metafile structs
!---------------------------------------------------------------------------
GpMetafileType                EQUATE(LONG)
MetafileTypeInvalid           EQUATE(0)            ! Invalid metafile
MetafileTypeWmf               EQUATE(1)                ! Standard WMF
MetafileTypeWmfPlaceable      EQUATE(2)       ! Placeable WMF
MetafileTypeEmf               EQUATE(3)               ! EMF (not EMF+)
MetafileTypeEmfPlusOnly       EQUATE(4)        ! EMF+ without dual, down-level records
MetafileTypeEmfPlusDual       EQUATE(5)         ! EMF+ with dual, down-level records

!---------------------------------------------------------------------------
! Specifies the type of EMF to record
!---------------------------------------------------------------------------
GpEmfType                     EQUATE(LONG)
EmfTypeEmfOnly                EQUATE(MetafileTypeEmf)          ! no EMF+, only EMF
EmfTypeEmfPlusOnly            EQUATE(MetafileTypeEmfPlusOnly)  ! no EMF, only EMF+
EmfTypeEmfPlusDual            EQUATE(MetafileTypeEmfPlusDual)   ! both EMF+ and EMF


typPWMFRect16                 GROUP, TYPE
Left                            SHORT
Top                             SHORT
Right                           SHORT
Bottom                          SHORT
                              END

typWmfPlaceableFileHeader     GROUP, TYPE
Key                             ULONG               ! GDIP_WMF_PLACEABLEKEY
Hmf                             SHORT               ! Metafile HANDLE number (always 0)
BoundingBox                     LIKE(typPWMFRect16) ! Coordinates in metafile units
Inch                            SHORT               ! Number of metafile units per inch
Reserved                        ULONG               ! Reserved (always 0)
Checksum                        SHORT               ! Checksum value for previous 10 WORDs
                              END


GDIP_EMFPLUSFLAGS_DISPLAY     EQUATE(00000001h)

tagMETAHEADER                 GROUP, TYPE
mtType                          USHORT
mtHeaderSize                    USHORT
mtVersion                       USHORT
mtSize                          ULONG
mtNoObjects                     USHORT
mtMaxRecord                     ULONG
mtNoParameters                  USHORT
                              END

tagENHMETAHEADER3             GROUP, TYPE
iType                           ULONG             ! Record type EMR_HEADER
nSize                           ULONG             ! Record size in bytes.  This may be greater
                                                  ! than the sizeof(ENHMETAHEADER).
rclBounds                       LIKE(_RECT_)      ! Inclusive-inclusive bounds in device units
rclFrame                        LIKE(_RECT_)      ! Inclusive-inclusive Picture Frame .01mm unit
dSignature                      ULONG             ! Signature.  Must be ENHMETA_SIGNATURE.
nVersion                        ULONG             ! Version number
nBytes                          ULONG             ! Size of the metafile in bytes
nRecords                        ULONG             ! Number of records in the metafile
nHandles                        USHORT            ! Number of handles in the handle table
                                                  ! Handle index zero is reserved.
sReserved                       USHORT            ! Reserved.  Must be zero.
nDescription                    ULONG             ! Number of chars in the unicode desc string
                                                  ! This is 0 if there is no description string
offDescription                  ULONG             ! Offset to the metafile description record.
                                                  ! This is 0 if there is no description string
nPalEntries                     ULONG             ! Number of entries in the metafile palette.
szlDevice                       LIKE(SIZEL)       ! Size of the reference device in pels
szlMillimeters                  LIKE(SIZEL)       ! Size of the reference device in millimeters
                              END




typMetafileHeader             GROUP, TYPE
Type                            GpMetafileType
Size                            ULONG                            ! Size of the metafile (in bytes)
Version                         ULONG                            ! EMF+, EMF, or WMF version
EmfPlusFlags                    ULONG
DpiX                            SREAL
DpiY                            SREAL
X                               LONG                  ! Bounds in device units
Y                               LONG
Width                           LONG
Height                          LONG

EmfHeader                       LIKE(tagENHMETAHEADER3)
WmfHeader                       LIKE(tagMETAHEADER), OVER(EmfHeader)

EmfPlusHeaderSize               LONG  ! size of the EMF+ header in file
LogicalDpiX                     LONG        ! Logical Dpi of reference Hdc
LogicalDpiY                     LONG        ! usually valid only for EMF+
                              END


GpEmfPlusRecordType           EQUATE(LONG)
! See possible types in c:\Program Files (x86)\Windows Kits\10\Include\10.0.22621.0\um\gdiplusenums.h


!--------------------------------------------------------------------------
! MetafileFrameUnit
!
! The frameRect for creating a metafile can be specified in any of these
! units.  There is an extra frame unit value (MetafileFrameUnitGdi) so
! that units can be supplied in the same units that GDI expects for
! frame rects -- these units are in .01 (1/100ths) millimeter units
! as defined by GDI.
!--------------------------------------------------------------------------
GpMetafileFrameUnit           EQUATE(LONG)
MetafileFrameUnitPixel        EQUATE(UnitPixel)  
MetafileFrameUnitPoint        EQUATE(UnitPoint)  
MetafileFrameUnitInch         EQUATE(UnitInch)  
MetafileFrameUnitDocument     EQUATE(UnitDocument)  
MetafileFrameUnitMillimeter   EQUATE(UnitMillimeter)  
MetafileFrameUnitGdi          EQUATE(UnitMillimeter+1)   ! GDI compatible .01 MM units
