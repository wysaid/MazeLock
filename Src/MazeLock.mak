# Microsoft Developer Studio Generated NMAKE File, Based on MazeLock.dsp
!IF "$(CFG)" == ""
CFG=MazeLock - Win32 Debug
!MESSAGE No configuration specified. Defaulting to MazeLock - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "MazeLock - Win32 Release" && "$(CFG)" != "MazeLock - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "MazeLock.mak" CFG="MazeLock - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "MazeLock - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "MazeLock - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "MazeLock - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\MazeLock.exe" "$(OUTDIR)\MazeLock.bsc"


CLEAN :
	-@erase "$(INTDIR)\MazeLock.obj"
	-@erase "$(INTDIR)\MazeLock.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\wysaid.obj"
	-@erase "$(INTDIR)\wysaid.sbr"
	-@erase "$(OUTDIR)\MazeLock.bsc"
	-@erase "$(OUTDIR)\MazeLock.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\MazeLock.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\MazeLock.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\MazeLock.sbr" \
	"$(INTDIR)\wysaid.sbr"

"$(OUTDIR)\MazeLock.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\MazeLock.pdb" /machine:I386 /out:"$(OUTDIR)\MazeLock.exe" 
LINK32_OBJS= \
	"$(INTDIR)\MazeLock.obj" \
	"$(INTDIR)\wysaid.obj"

"$(OUTDIR)\MazeLock.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "MazeLock - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\MazeLock.exe" "$(OUTDIR)\MazeLock.bsc"


CLEAN :
	-@erase "$(INTDIR)\MazeLock.obj"
	-@erase "$(INTDIR)\MazeLock.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\wysaid.obj"
	-@erase "$(INTDIR)\wysaid.sbr"
	-@erase "$(OUTDIR)\MazeLock.bsc"
	-@erase "$(OUTDIR)\MazeLock.exe"
	-@erase "$(OUTDIR)\MazeLock.ilk"
	-@erase "$(OUTDIR)\MazeLock.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\MazeLock.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\MazeLock.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\MazeLock.sbr" \
	"$(INTDIR)\wysaid.sbr"

"$(OUTDIR)\MazeLock.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\MazeLock.pdb" /debug /machine:I386 /out:"$(OUTDIR)\MazeLock.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\MazeLock.obj" \
	"$(INTDIR)\wysaid.obj"

"$(OUTDIR)\MazeLock.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("MazeLock.dep")
!INCLUDE "MazeLock.dep"
!ELSE 
!MESSAGE Warning: cannot find "MazeLock.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "MazeLock - Win32 Release" || "$(CFG)" == "MazeLock - Win32 Debug"
SOURCE=.\MazeLock.cpp

"$(INTDIR)\MazeLock.obj"	"$(INTDIR)\MazeLock.sbr" : $(SOURCE) "$(INTDIR)"


SOURCE=.\wysaid.cpp

"$(INTDIR)\wysaid.obj"	"$(INTDIR)\wysaid.sbr" : $(SOURCE) "$(INTDIR)"



!ENDIF 

