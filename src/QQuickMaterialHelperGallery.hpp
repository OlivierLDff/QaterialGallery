#ifndef __QQUICKMATERIALHELPERGALLERY_COMMON_HPP__
#define __QQUICKMATERIALHELPERGALLERY_COMMON_HPP__

// ─────────────────────────────────────────────────────────────
//					INCLUDE
// ─────────────────────────────────────────────────────────────

// C Header
#include <stdint.h>

// C++ Header

// Qt Header
#include <QString>

// Dependancies Header

// Application Header

// ─────────────────────────────────────────────────────────────
//					DECLARATION
// ─────────────────────────────────────────────────────────────

#ifdef WIN32
	#ifdef QQUICKMATERIALHELPERGALLERY_SHARED	// Shared build
		#define QQUICKMATERIALHELPERGALLERY_API_ __declspec(dllexport)
	#elif QQUICKMATERIALHELPERGALLERY_STATIC 	// No decoration when building staticlly
		#define QQUICKMATERIALHELPERGALLERY_API_
	#else 				// Link to lib 
		#define QQUICKMATERIALHELPERGALLERY_API_ __declspec(dllimport)
	#endif
#else
	#define QQUICKMATERIALHELPERGALLERY_API_
#endif

#ifdef QQUICKMATERIALHELPERGALLERY_USE_NAMESPACE
#ifndef QQUICKMATERIALHELPERGALLERY_NAMESPACE
#define QQUICKMATERIALHELPERGALLERY_NAMESPACE Qqhg
#endif
#define QQUICKMATERIALHELPERGALLERY_NAMESPACE_START namespace QQUICKMATERIALHELPERGALLERY_NAMESPACE {
#define QQUICKMATERIALHELPERGALLERY_NAMESPACE_END }
#define QQUICKMATERIALHELPERGALLERY_USING_NAMESPACE using namespace QQUICKMATERIALHELPERGALLERY_NAMESPACE;
#else
#undef QQUICKMATERIALHELPERGALLERY_NAMESPACE
#define QQUICKMATERIALHELPERGALLERY_NAMESPACE
#define QQUICKMATERIALHELPERGALLERY_NAMESPACE_START
#define QQUICKMATERIALHELPERGALLERY_NAMESPACE_END
#define QQUICKMATERIALHELPERGALLERY_USING_NAMESPACE
#endif

QQUICKMATERIALHELPERGALLERY_NAMESPACE_START

class QQUICKMATERIALHELPERGALLERY_API_ Version
{
public:
	/** Library Major Version */
	static uint32_t GetMajor();
	/** Library Minor Version */
	static uint32_t GetMinor();
	/** Library Patch Version */
	static uint32_t GetPatch();
	/** Library Tag Version */
	static uint32_t GetTag();
	/** Library Version as major.minor.patch.tag */
	static QString GetVersion();
};

QQUICKMATERIALHELPERGALLERY_NAMESPACE_END

#endif
