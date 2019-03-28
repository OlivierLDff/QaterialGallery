#
#	Download Script by Olivier Le Doeuff
#
## CMAKE INPUT	
#	
#	-SFPM_REPOSITORY : SFPM repository url
#	-SFPM_TAG : SFPM git tag
#
## CMAKE OUTPUT
# 
# 	See SFPM README
#

# repository path & tag
IF( NOT SFPM_REPOSITORY )
	SET( SFPM_REPOSITORY "https://github.com/OlivierLDff/QSortFilterProxyModel.git" CACHE STRING "SortFilterProxyModel repository, can be a local URL" FORCE )
ENDIF()
MESSAGE(STATUS "SortFilterProxyModel repository folder: " ${SFPM_REPOSITORY})

IF( NOT DEFINED SFPM_TAG )
	SET( SFPM_TAG master CACHE STRING "SortFilterProxyModel git tag" FORCE )
ENDIF()
MESSAGE( STATUS "SortFilterProxyModel repository tag: " ${SFPM_TAG} )

INCLUDE( ${PROJECT_SOURCE_DIR}/cmake/DownloadProject.cmake )

DOWNLOAD_PROJECT(PROJ 	QSortFilterProxyModel
	GIT_REPOSITORY 		${SFPM_REPOSITORY}
	GIT_TAG 			${SFPM_TAG}
	UPDATE_DISCONNECTED 1
	QUIET
	)

ADD_SUBDIRECTORY( ${QSortFilterProxyModel_SOURCE_DIR} ${QSortFilterProxyModel_BINARY_DIR} )