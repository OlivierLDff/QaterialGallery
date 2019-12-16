#ifndef __QATERIALGALLERY_COMMON_HPP__
#define __QATERIALGALLERY_COMMON_HPP__

// ─────────────────────────────────────────────────────────────
//                  INCLUDE
// ─────────────────────────────────────────────────────────────

// C Header
#include <stdint.h>

// C++ Header

// Qt Header
#include <QString>

// Dependancies Header

// Application Header

// ─────────────────────────────────────────────────────────────
//                  DECLARATION
// ─────────────────────────────────────────────────────────────

#ifdef WIN32
    #ifdef QATERIALGALLERY_SHARED   // Shared build
        #define QATERIALGALLERY_API_ __declspec(dllexport)
    #elif QATERIALGALLERY_STATIC    // No decoration when building staticlly
        #define QATERIALGALLERY_API_
    #else               // Link to lib
        #define QATERIALGALLERY_API_ __declspec(dllimport)
    #endif
#else
    #define QATERIALGALLERY_API_
#endif

#ifdef QATERIALGALLERY_USE_NAMESPACE
#ifndef QATERIALGALLERY_NAMESPACE
#define QATERIALGALLERY_NAMESPACE Qqhg
#endif
#define QATERIALGALLERY_NAMESPACE_START namespace QATERIALGALLERY_NAMESPACE {
#define QATERIALGALLERY_NAMESPACE_END }
#define QATERIALGALLERY_USING_NAMESPACE using namespace QATERIALGALLERY_NAMESPACE;
#else
#undef QATERIALGALLERY_NAMESPACE
#define QATERIALGALLERY_NAMESPACE
#define QATERIALGALLERY_NAMESPACE_START
#define QATERIALGALLERY_NAMESPACE_END
#define QATERIALGALLERY_USING_NAMESPACE
#endif

QATERIALGALLERY_NAMESPACE_START

class QATERIALGALLERY_API_ Version
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

QATERIALGALLERY_NAMESPACE_END

#endif
