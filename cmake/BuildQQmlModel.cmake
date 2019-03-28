#
#	Download Script by Olivier Le Doeuff
#
## CMAKE INPUT	
#	
#	-QQMLMODEL_REPOSITORY : QBC repository url
#	-QQMLMODEL_TAG : QBC git tag
#
## CMAKE OUTPUT
# 
#

MESSAGE(STATUS "Build QQmlModel Started")
# repository path & tag
IF( NOT QQMLMODEL_REPOSITORY )
	SET( QQMLMODEL_REPOSITORY "https://github.com/OlivierLDff/QQmlModel.git" CACHE STRING "QQmlModel repository, can be a local URL" FORCE )
ENDIF()
MESSAGE(STATUS "QQmlModel repository folder: " ${QQMLMODEL_REPOSITORY})

IF( NOT DEFINED QQML_MODEL_TAG )
	SET( QQML_MODEL_TAG master CACHE STRING "QQmlModel git tag" FORCE )
ENDIF()
MESSAGE( STATUS "QQmlModel repository tag: " ${QQML_MODEL_TAG} )

INCLUDE( ${PROJECT_SOURCE_DIR}/cmake/DownloadProject.cmake )

DOWNLOAD_PROJECT(PROJ 	QQmlModel
	GIT_REPOSITORY 		${QQMLMODEL_REPOSITORY}
	GIT_TAG 			${QQMLMODEL_TAG}
	UPDATE_DISCONNECTED 1
	QUIET
	)

ADD_SUBDIRECTORY( ${QQmlModel_SOURCE_DIR} ${QQmlModel_BINARY_DIR} )