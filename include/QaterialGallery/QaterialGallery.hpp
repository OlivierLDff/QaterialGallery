#ifndef __QATERIALGALLERY_COMMON_HPP__
#define __QATERIALGALLERY_COMMON_HPP__

// ─────────────────────────────────────────────────────────────
//                  INCLUDE
// ─────────────────────────────────────────────────────────────

#include <QString>
#include <stdint.h>

// ─────────────────────────────────────────────────────────────
//                  DECLARATION
// ─────────────────────────────────────────────────────────────

#ifdef WIN32
    #ifdef QATERIALGALLERY_SHARED   // Shared build
        #define QATERIALGALLERY_API_ __declspec(dllexport)
    #elif QATERIALGALLERY_STATIC    // No decoration when building staticlly
        #define QATERIALGALLERY_API_
    #else                           // Link to lib
        #define QATERIALGALLERY_API_ __declspec(dllimport)
    #endif
#else
    #define QATERIALGALLERY_API_
#endif

namespace QaterialGallery {

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

}

#endif
