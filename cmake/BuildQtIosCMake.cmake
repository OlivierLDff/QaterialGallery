#
#	Download Script by Olivier Le Doeuff
#
## CMAKE INPUT	
#	
#	-QQTIOSCMAKE_REPOSITORY : repository url
#	-QQTIOSCMAKE_TAG : git tag
#
## CMAKE OUTPUT
# 
#

MESSAGE(STATUS "Build QtIosCMake Started")
# repository path & tag
IF( NOT QQTIOSCMAKE_REPOSITORY )
	SET( QQTIOSCMAKE_REPOSITORY "https://github.com/OlivierLDff/QtIosCMake.git" CACHE STRING "QtIosCMake repository, can be a local URL" FORCE )
ENDIF()
MESSAGE(STATUS "QtIosCMake repository folder: " ${QQTIOSCMAKE_REPOSITORY})

IF( NOT DEFINED QQTIOSCMAKE_TAG )
	SET( QQTIOSCMAKE_TAG master CACHE STRING "QtIosCMake git tag" FORCE )
ENDIF()
MESSAGE( STATUS "QtIosCMake repository tag: " ${QQTIOSCMAKE_TAG} )

INCLUDE( ${PROJECT_SOURCE_DIR}/cmake/DownloadProject.cmake )

DOWNLOAD_PROJECT(PROJ 	QtIosCMake
	GIT_REPOSITORY 		${QQTIOSCMAKE_REPOSITORY}
	GIT_TAG 			${QQTIOSCMAKE_TAG}
	UPDATE_DISCONNECTED 1
	QUIET
	)

INCLUDE(${QtIosCMake_SOURCE_DIR}/AddQtIosApp.cmake)