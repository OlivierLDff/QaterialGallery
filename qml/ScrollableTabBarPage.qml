/** Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12
import QtQuick.Layouts 1.12

import Qaterial 1.0

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
            anchors.fill: parent
            header: ToolBar
            {
                ColumnLayout
                {
                    anchors.fill: parent
                    spacing: 0
                    id: _column

                    Label
                    {
                        id: titleLabel

                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        onPrimary: true
                        Layout.topMargin: (Style.toolbar.implicitHeight-implicitHeight)/2
                        Layout.bottomMargin: (Style.toolbar.implicitHeight-implicitHeight)/2

                        text: "Scrollable Tab Bar"
                        textType: Style.TextType.Title
                        elide: Label.ElideRight
                    } // Label

                    ScrollableTabBar
                    {
                        id: tabBar
                        width: _column.width
                        currentIndex: swipeView.currentIndex
                        onPrimary: true
                        enabled: root.enabled

                        minWidth: 110
                        maxElement: 6

                        model: ListModel
                        {
                            ListElement { text: "Chapter 1" }
                            ListElement { text: "Chapter 2" }
                            ListElement { text: "Chapter 3" }
                            ListElement { text: "Chapter 4" }
                            ListElement { text: "Chapter 5" }
                            ListElement { text: "Chapter 6" }
                            ListElement { text: "Chapter 7" }
                            ListElement { text: "Chapter 8" }
                            ListElement { text: "Chapter 9" }
                            ListElement { text: "Chapter 10" }
                            ListElement { text: "Chapter 11" }
                            ListElement { text: "Chapter 12" }
                            ListElement { text: "Chapter 13" }
                            ListElement { text: "Chapter 14" }
                            ListElement { text: "Chapter 15" }
                            ListElement { text: "Chapter 16" }
                            ListElement { text: "Chapter 17" }
                            ListElement { text: "Chapter 18" }
                            ListElement { text: "Chapter 19" }
                            ListElement { text: "Chapter 20" }
                        }
                    } // TabBar
                } // ColumnLayout
            } // ToolBar

            SwipeView
            {
                id: swipeView
                anchors.fill: parent
                currentIndex: tabBar.currentIndex
                interactive: root.enabled

                Repeater
                {
                    model: 20
                    Item
                    {
                        width: swipeView.width
                        height: swipeView.height
                        Label
                        {
                            anchors.centerIn: parent
                            text: "Chapter " + (index+1)
                            textType: Style.TextType.Display1
                        } // FixedTabBarPage
                    }
                } // Repeater
            } // SwipeView
        } // Page
    } // Pane
} // Page