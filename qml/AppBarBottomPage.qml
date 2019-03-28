/** Copyright (C) Olivier Le Doeuff 2019 
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import QQuickMaterialHelper.Components 1.12
import QQuickMaterialHelper.Containers 1.12
import QQuickMaterialHelper.Style 1.12

Page 
{
    id: page

    header: AppBar 
    {
        AppBarContent { anchors.fill: parent; title: "Buttons" }
    } // AppBar

    footer: AppBar 
    {
        Row
        {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 0

            AppBarButton 
            {
                icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/menu.svg"
                onPrimary: true
            } // ToolButton

            AppBarButton 
            {
                icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/settings.svg"
                onPrimary: true
            } // ToolButton
        } // RowLayout
    } // AppBar
} // Page
