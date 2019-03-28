#
#	Download Script by Olivier Le Doeuff
#	Ereimul All Right Reserved 2018 (C)
#
## CMAKE INPUT	
#	
#	-QBC_REPOSITORY : QBC repository url
#	-QBC_TAG : QBC git tag
#
## CMAKE OUTPUT
#

# repository path & tag
IF( NOT QBC_REPOSITORY )
	SET( QBC_REPOSITORY "https://github.com/OlivierLdff/QBCInstaller.git" CACHE STRING "QBC repository, can be a local URL" FORCE )
ENDIF()
MESSAGE(STATUS "QBC repository folder: " ${QBC_REPOSITORY})

IF( NOT DEFINED QBC_TAG )
	SET( QBC_TAG master CACHE STRING "QBC git tag" FORCE )
ENDIF()
MESSAGE( STATUS "QBC repository tag: " ${QBC_TAG} )

INCLUDE( ${PROJECT_SOURCE_DIR}/cmake/DownloadProject.cmake )

DOWNLOAD_PROJECT(PROJ 	QBCInstaller
	GIT_REPOSITORY 		${QBC_REPOSITORY}
	GIT_TAG 			${QBC_TAG}
	UPDATE_DISCONNECTED 1
	QUIET
	)


INCLUDE( ${QBCInstaller_SOURCE_DIR}/AddQtBinaryCreator.cmake )