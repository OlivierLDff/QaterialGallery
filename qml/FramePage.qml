/** Copyright (C) Olivier Le Doeuff 2019 
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import QQuickMaterialHelper.Components 1.12
import QQuickMaterialHelper.Containers 1.12
import QQuickMaterialHelper.Style 1.12

ScrollablePage 
{
    id: page

    header: ToolBar 
    {
        AppBarContent { anchors.fill: parent; title: "Frame" }
    } // ToolBar

    readonly property int itemWidth: Math.max(button.implicitWidth, Math.min(button.implicitWidth * 3, page.availableWidth / 3 * 2))

    Column 
    {
        spacing: 40
        width: parent.width

        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "Frame is used to layout a logical group of controls together, within a visual frame."
        }

        Frame 
        {
            anchors.horizontalCenter: parent.horizontalCenter

            Column 
            {
                spacing: 0
                width: page.itemWidth

                RadioButton 
                {
                    text: "First"
                    checked: true
                    width: parent.width
                }
                RadioButton 
                {
                    id: button
                    text: "Second"
                    width: parent.width
                }
                RadioButton 
                {
                    text: "Third"
                    width: parent.width
                }
            }
        }
    }
}
