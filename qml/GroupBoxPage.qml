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
        AppBarContent { anchors.fill: parent; title: "Group Box" }
    } // ToolBar

    property alias button: _group1.button

    readonly property int itemWidth: Math.max(button.implicitWidth, Math.min(button.implicitWidth * 3, page.availableWidth / 3 * 2))

    Column 
    {
        spacing: 20
        width: parent.width

        Label 
        {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "A GroupBox provides a frame, a title on top of it, and a logical group of controls within that frame."
        } // Label

        GroupBoxLayout
        {
            id: _group1
            title: "Inline Title"
            columnWidth: page.itemWidth
            anchors.horizontalCenter: parent.horizontalCenter
            inlineTitle: true
        } // GroupBoxLayout

        GroupBoxLayout
        {
            title: "Default Title"
            columnWidth: page.itemWidth
            anchors.horizontalCenter: parent.horizontalCenter
        } // GroupBoxLayout

        GroupBoxLayout
        {
            title: "Caption Inline Title"
            columnWidth: page.itemWidth
            anchors.horizontalCenter: parent.horizontalCenter
            titleType: MaterialStyle.TextType.Caption
            inlineTitle: true
        } // GroupBoxLayout

        GroupBoxLayout
        {
            title: "Caption Default Title"
            columnWidth: page.itemWidth
            anchors.horizontalCenter: parent.horizontalCenter
            titleType: MaterialStyle.TextType.Caption
        } // GroupBoxLayout
    }
}
