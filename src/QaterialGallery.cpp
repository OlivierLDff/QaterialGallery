// ─────────────────────────────────────────────────────────────
//                  INCLUDE
// ─────────────────────────────────────────────────────────────

// Application Header
#include <QaterialGallery/QaterialGallery.hpp>

// ─────────────────────────────────────────────────────────────
//                  DECLARATION
// ─────────────────────────────────────────────────────────────

using namespace qaterial::gallery;

// ─────────────────────────────────────────────────────────────
//                  FUNCTIONS
// ─────────────────────────────────────────────────────────────

uint32_t Version::GetMajor()
{
    return QATERIALGALLERY_VERSION_MAJOR;
}

uint32_t Version::GetMinor()
{
    return QATERIALGALLERY_VERSION_MINOR;
}

uint32_t Version::GetPatch()
{
    return QATERIALGALLERY_VERSION_PATCH;
}

uint32_t Version::GetTag()
{
    return QATERIALGALLERY_VERSION_TAG_HEX;
}

QString Version::GetVersion()
{
    return QString::number(GetMajor()) + "." +
        QString::number(GetMinor()) + "." +
        QString::number(GetPatch()) + "." +
        QString::number(GetTag(), 16);
}
