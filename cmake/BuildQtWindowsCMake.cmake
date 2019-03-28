#
#	Download Script by Olivier Le Doeuff
#	Ereimul All Right Reserved 2019 (C)
#
## CMAKE INPUT	
#	
#	-QTWINDOWSCMAKE_REPOSITORY : QtWindowsCMake repository url
#	-QTWINDOWSCMAKE_TAG : QtWindowsCMake git tag
#
## CMAKE OUTPUT
#

IF( NOT QTWINDOWSCMAKE_REPOSITORY )
	SET( QTWINDOWSCMAKE_REPOSITORY "https://github.com/OlivierLdff/QtWindowsCMake.git" CACHE STRING "QtWindowsCMake repository, can be a local URL" FORCE )
ENDIF()
MESSAGE(STATUS "QtWindowsCMake repository folder: " ${QTWINDOWSCMAKE_REPOSITORY})

IF( NOT DEFINED QTWINDOWSCMAKE_TAG )
	SET( QTWINDOWSCMAKE_TAG master CACHE STRING "QTWINDOWSCMAKE git tag" FORCE )
ENDIF()
MESSAGE( STATUS "QtWindowsCMake repository tag: " ${QTWINDOWSCMAKE_TAG} )

INCLUDE( ${PROJECT_SOURCE_DIR}/cmake/DownloadProject.cmake )

DOWNLOAD_PROJECT(PROJ 	QtWindowsCMake
	GIT_REPOSITORY 		${QTWINDOWSCMAKE_REPOSITORY}
	GIT_TAG 			${QTWINDOWSCMAKE_TAG}
	UPDATE_DISCONNECTED 1
	QUIET
	)

INCLUDE( ${QtWindowsCMake_SOURCE_DIR}/AddQtWindowsExe.cmake )