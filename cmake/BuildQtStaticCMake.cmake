#
#	Download Script by Olivier Le Doeuff
#
## CMAKE INPUT	
#	
#	-QTSTATICCMAKE_REPOSITORY : repository url
#	-QTSTATICCMAKE_TAG : git tag
#
## CMAKE OUTPUT
# 
#

MESSAGE(STATUS "Build QtStaticCMake Started")
# repository path & tag
IF( NOT QTSTATICCMAKE_REPOSITORY )
	SET( QTSTATICCMAKE_REPOSITORY "https://github.com/OlivierLDff/QtStaticCMake.git" CACHE STRING "QtStaticCMake repository, can be a local URL" FORCE )
ENDIF()
MESSAGE(STATUS "QtStaticCMake repository folder: " ${QTSTATICCMAKE_REPOSITORY})

IF( NOT DEFINED QTSTATICCMAKE_TAG )
	SET( QTSTATICCMAKE_TAG master CACHE STRING "QtStaticCMake git tag" FORCE )
ENDIF()
MESSAGE( STATUS "QtStaticCMake repository tag: " ${QTSTATICCMAKE_TAG} )

INCLUDE( ${PROJECT_SOURCE_DIR}/cmake/DownloadProject.cmake )

DOWNLOAD_PROJECT(PROJ 	QtStaticCMake
	GIT_REPOSITORY 		${QTSTATICCMAKE_REPOSITORY}
	GIT_TAG 			${QTSTATICCMAKE_TAG}
	UPDATE_DISCONNECTED 1
	QUIET
	)

INCLUDE(${QtStaticCMake_SOURCE_DIR}/QtStaticCMake.cmake)