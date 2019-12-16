/** Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12
import QtQuick.Layouts 1.12

import Qaterial 1.0

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
                icon.source: "qrc:/QaterialGallery/images/icons/menu.svg"
                onPrimary: true
            } // ToolButton

            AppBarButton
            {
                icon.source: "qrc:/QaterialGallery/images/icons/settings.svg"
                onPrimary: true
            } // ToolButton
        } // RowLayout
    } // AppBar
} // Page
