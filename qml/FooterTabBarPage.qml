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
    id: root
    property bool enabled: true
    Pane 
    {
        padding: 0

        elevation: 20
        anchors.centerIn: parent
        width: parent.width - 30
        height: parent.height - 40
        implicitHeight: height

        Page
        {
            clip: true
            width: parent.width
            implicitWidth: width
            height: parent.height
            header: ToolBar
            {
                ColumnLayout
                {
                    anchors.fill: parent
                    spacing: 0

                    Label 
                    {
                        id: titleLabel

                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        onPrimary: true
                        Layout.topMargin: (MaterialStyle.toolbar.implicitHeight-implicitHeight)/2
                        Layout.bottomMargin: (MaterialStyle.toolbar.implicitHeight-implicitHeight)/2

                        text: "Footer Tab Bar"
                        textType: MaterialStyle.TextType.Title
                        elide: Label.ElideRight
                    } // Label

                    SwitchDelegate
                    {
                        Layout.fillWidth: true
                        onPrimary: true
                        text: "Hint Text"
                        checked: true
                        id: _displaySwitch
                    }
                } // ColumnLayout
            } // ToolBar

            SwipeView 
            {
                id: swipeView
                anchors.fill: parent
                currentIndex: tabBar.currentIndex
                interactive: root.enabled

                Item
                {
                    width: swipeView.width
                    height: swipeView.height
                    Label
                    {
                        anchors.centerIn: parent
                        text: "Favorites View"
                        textType: MaterialStyle.TextType.Display1
                        color: "#FFF44336"
                    } // Label                    
                }

                Item
                {
                    width: swipeView.width
                    height: swipeView.height
                    Label
                    {
                        anchors.centerIn: parent
                        text: "Music View"
                        textType: MaterialStyle.TextType.Display1
                        color: "#FFE91E63"
                    } // Label                    
                }

                Item
                {
                    width: swipeView.width
                    height: swipeView.height
                    Label
                    {
                        anchors.centerIn: parent
                        text: "Album View"
                        textType: MaterialStyle.TextType.Display1
                        color: "#FF9C27B0"
                    } // Label                    
                }

                Item
                {
                    width: swipeView.width
                    height: swipeView.height
                    Label
                    {
                        anchors.centerIn: parent
                        text: "Settings View"
                        textType: MaterialStyle.TextType.Display1
                        color: "#FF673AB7"
                    } // Label                    
                }

            } // SwipeView

            footer: FixedTabBar
            {
                id: tabBar
                width: parent.width
                //Layout.fillWidth: true
                currentIndex: swipeView.currentIndex
                onPrimary: true
                enabled: root.enabled
                hintText: _displaySwitch.checked
                useSmallFont: true

                model: ListModel
                {
                    ListElement{ text: "Favorites"; source: "/QQuickMaterialHelperGallery/images/icons/heart.svg" }
                    ListElement{ text: "Music"; source: "/QQuickMaterialHelperGallery/images/icons/music-note.svg" }
                    ListElement{ text: "Albums"; source: "/QQuickMaterialHelperGallery/images/icons/album.svg" }
                    ListElement{ text: "Settings"; source: "/QQuickMaterialHelperGallery/images/icons/settings.svg" }
                }                          
            } // TabBar
        } // Page
    } // Pane
} // Page