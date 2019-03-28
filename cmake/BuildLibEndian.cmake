#
#	Download Script by Olivier Le Doeuff
#
## CMAKE INPUT	
#	
#	-LIBENDIAN_REPOSITORY : repository url
#	-LIBENDIAN_TAG : git tag
#
## CMAKE OUTPUT
# 
#

MESSAGE(STATUS "Build LibEndian Started")
# repository path & tag
IF( NOT LIBENDIAN_REPOSITORY )
	SET( LIBENDIAN_REPOSITORY "https://github.com/OlivierLDff/LibEndian.git" CACHE STRING "LibEndian repository, can be a local URL" FORCE )
ENDIF()
MESSAGE(STATUS "LibEndian repository folder: " ${LIBENDIAN_REPOSITORY})

IF( NOT DEFINED LIBENDIAN_TAG )
	SET( LIBENDIAN_TAG master CACHE STRING "LibEndian git tag" FORCE )
ENDIF()
MESSAGE( STATUS "LibEndian repository tag: " ${LIBENDIAN_TAG} )

INCLUDE( ${PROJECT_SOURCE_DIR}/cmake/DownloadProject.cmake )

DOWNLOAD_PROJECT(PROJ 	LibEndian
	GIT_REPOSITORY 		${LIBENDIAN_REPOSITORY}
	GIT_TAG 			${LIBENDIAN_TAG}
	UPDATE_DISCONNECTED 1
	QUIET
	)

ADD_SUBDIRECTORY( ${LibEndian_SOURCE_DIR} ${LibEndian_BINARY_DIR} )