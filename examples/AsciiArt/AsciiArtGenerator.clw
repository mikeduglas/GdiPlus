!* Changing a picture into ASCII art.
!* "Generate ASCII Art – A Simple How To in C#": https://www.codeproject.com/Articles/5367237/Generate-ASCII-Art-A-Simple-How-To-in-Csharp
!* GitHub: https://github.com/ncosentino/DevLeader/tree/master/AsciiArtGenerator
  
  PROGRAM

  INCLUDE('gdiplus.inc'), ONCE

  MAP
    INCLUDE('printf.inc'), ONCE
  END

TAsciiArtGenerator            CLASS, TYPE
asciiArtResult                  &STRING, PROTECTED

Construct                       PROCEDURE()
Destruct                        PROCEDURE(), VIRTUAL
Cleanup                         PROCEDURE()
GenerateAsciiArt                PROCEDURE(TGdiPlusBitmap pImage, UNSIGNED pStep=0)
FromFile                        PROCEDURE(STRING pImageFile, UNSIGNED pStep=0), BOOL, PROC
Display                         PROCEDURE(SIGNED pFeq)
                              END

sImageFile                    STRING(256)
aag                           TAsciiArtGenerator

Window                        WINDOW('Ascii Art Generator'),AT(,,526,366),CENTER,GRAY,SYSTEM,MAX, |
                                FONT('Segoe UI',9),RESIZE
                                TOOLBAR,AT(0,0,526,18),USE(?TOOLBAR1)
                                  BUTTON,AT(2,1,14,12),USE(?btnOpen),ICON(ICON:Open),TIP('Select image file')
                                END
                                TEXT,AT(1,1),FULL,USE(?txtAsciiArt),HVSCROLL,FONT('Consolas',6),READONLY
                              END

  CODE
  OPEN(Window)
  
  !- process predefined image
  sImageFile = 'Photo1.jpg'
  IF aag.FromFile(sImageFile)
    aag.Display(?txtAsciiArt)
    aag.Cleanup()
    
    Window{PROP:Text} = printf('Ascii Art Generator (%s)', sImageFile)
  ELSE
    MESSAGE(printf('Unable to process %s', sImageFile), 'Error', ICON:Exclamation)
  END

  ACCEPT
    CASE ACCEPTED()
    OF ?btnOpen
      IF FILEDIALOG(, sImageFile, |
        'All graphics (*.png;*.jpg;*.gif;*.bmp;*.tif)|*.png;*.jpg;*.gif;*.bmp;*.tif|'&|
        'Portable Network Graphics (*.png)|*.png|'&|
        'Graphics Interchange Format (*.gif)|*.gif|'&|
        'File Interchange Format (*.jpg)|*.jpg|'&|
        'Bitmap files (*.bmp)|*.bmp|'&|
        'Tagged Image File Format (*.tif)|*.tif|All files|*.*', |
        FILE:LongName + FILE:AddExtension + FILE:KeepDir)
        
        ?txtAsciiArt{PROP:Text} =  ''
        DISPLAY(?txtAsciiArt)
        
        SETCURSOR(CURSOR:Wait)
        IF aag.FromFile(sImageFile)
          aag.Display(?txtAsciiArt)
          aag.Cleanup()
    
          Window{PROP:Text} = printf('Ascii Art Generator (%s)', sImageFile)
        ELSE
          MESSAGE(printf('Unable to process %s', sImageFile), 'Error', ICON:Exclamation)
        END
        SETCURSOR()
      END
    END
  END
  
  
  
  
TAsciiArtGenerator.Construct  PROCEDURE()
  CODE
  
TAsciiArtGenerator.Destruct   PROCEDURE()
  CODE
  SELF.Cleanup()
  
TAsciiArtGenerator.Cleanup    PROCEDURE()
  CODE
  IF NOT SELF.asciiArtResult &= NULL
    DISPOSE(SELF.asciiArtResult)
    SELF.asciiArtResult &= NULL
  END
  
TAsciiArtGenerator.GenerateAsciiArt   PROCEDURE(TGdiPlusBitmap pImage, UNSIGNED pStep=0)
!Based on https://github.com/ncosentino/DevLeader/blob/master/AsciiArtGenerator/AsciiArtGenerator/Steps/Step1/GdiAsciiArtGenerator.cs

asciiChars                              STRING('@%#*+=-:,. ')
imageWidth                              UNSIGNED, AUTO
imageHeight                             UNSIGNED, AUTO
outputWidth                             UNSIGNED, AUTO
outputHeight                            UNSIGNED, AUTO
widthStep                               UNSIGNED, AUTO
heightStep                              UNSIGNED, AUTO
w                                       UNSIGNED, AUTO
h                                       UNSIGNED, AUTO
pixelColor                              GpARGB, AUTO
pixelColorARGB                          GROUP, OVER(pixelColor)
B                                         BYTE
G                                         BYTE
R                                         BYTE
Alpha                                     BYTE
                                        END
grayValue                               UNSIGNED, AUTO
asciiCharIndex                          LONG, AUTO
asciiChar                               STRING(1), AUTO
i                                       LONG, AUTO
  CODE
  SELF.Cleanup()
  
  imageWidth = pImage.GetWidth()
  imageHeight = pImage.GetHeight()
  
  IF pStep=0
    !- calc approx step
    pStep = (imageWidth*imageHeight) / 500000
    IF pStep=0
      pStep=1
    END
  END
    
  outputWidth = INT(imageWidth / pStep)
  outputHeight = INT(imageHeight / pStep)
  widthStep = INT(imageWidth / outputWidth)
  heightStep = INT(imageHeight / outputHeight)
  SELF.asciiArtResult &= NEW STRING(outputWidth*outputHeight + outputHeight*2)  !- extra space for <13,10> on each line.
  
  printd('TAsciiArtGenerator.GenerateAsciiArt: image size %ix%i, art size %ix%i, step %i, bufsize %i bytes', imageWidth, imageHeight, outputWidth, outputHeight, pStep, SIZE(SELF.asciiArtResult))
  
  i = 0
    
  LOOP h=1 TO outputHeight
    LOOP w=1 TO outputWidth
      i += 1
      IF i > SIZE(SELF.asciiArtResult)
        printd('Out of range: i=%i', i)
        BREAK
      END
 
      pixelColor = pImage.GetPixel((w-1)*widthStep, (h-1)*heightStep)
      grayValue = ROUND(pixelColorARGB.R*0.3 + pixelColorARGB.G*0.59 + pixelColorARGB.B*0.11, 1)
      asciiCharIndex = grayValue * (SIZE(asciiChars) - 1) / 255
      asciiChar = asciiChars[asciiCharIndex + 1]

      SELF.asciiArtResult[i] = asciiChar
      
      IF w=outputWidth
        SELF.asciiArtResult[i+1 : i+2] = '<13,10>'
        i += 2
      END
    END
  END

  
TAsciiArtGenerator.FromFile   PROCEDURE(STRING pImageFile, UNSIGNED pStep=0)
bm                              TGdiPlusBitmap
  CODE
  IF bm.FromFile(sImageFile) = GpStatus:Ok
    SELF.GenerateAsciiArt(bm, pStep)
    RETURN TRUE
  ELSE
    RETURN FALSE
  END
  
TAsciiArtGenerator.Display    PROCEDURE(SIGNED pFeq)
  CODE
  IF SELF.asciiArtResult &= NULL
    printd('TAsciiArtGenerator.Display(%i): ascii art doesn''t exist.', pFeq)
    RETURN
  END
  
  ASSERT(pFeq{PROP:Type} = CREATE:text)
  IF pFeq{PROP:Type} <> CREATE:text
    printd('TAsciiArtGenerator.Display(%i): invalid control type.', pFeq)
    RETURN
  END
  
  pFeq{PROP:Text} = SELF.asciiArtResult
  DISPLAY(pFeq)
