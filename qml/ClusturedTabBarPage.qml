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

                    Label
                    {
                        id: titleLabel

                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        onPrimary: true
                        Layout.topMargin: (Style.toolbar.implicitHeight-implicitHeight)/2
                        Layout.bottomMargin: (Style.toolbar.implicitHeight-implicitHeight)/2

                        text: "Clustured Tab Bar"
                        textType: Style.TextType.Title
                        elide: Label.ElideRight
                    } // Label

                    SwitchDelegate
                    {
                        Layout.fillWidth: true
                        text: checked ? "Center" : "Right"
                        onPrimary: true
                        checked: true
                        id: _displaySwitch
                    } // SwitchDelegate

                    ClusturedTabBar
                    {
                        id: tabBar
                        currentIndex: swipeView.currentIndex
                        onPrimary: true
                        enabled: root.enabled

                        Layout.alignment: _displaySwitch.checked ? Qt.AlignHCenter : Qt.AlignRight

                        model: ListModel
                        {
                            ListElement { text: "Landscape" }
                            ListElement { text: "City" }
                            ListElement { text: "Abstract" }
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
                Item
                {
                    width: swipeView.width
                    height: swipeView.height
                    Label
                    {
                        anchors.centerIn: parent
                        text: "Landscape View"
                        textType: Style.TextType.Display1
                        color: "#FF2196F3"
                    } // FixedTabBarPage
                }

                Item
                {
                    width: swipeView.width
                    height: swipeView.height
                    Label
                    {
                        anchors.centerIn: parent
                        text: "City View"
                        textType: Style.TextType.Display1
                        color: "#FF00BCD4"
                    } // FixedTabBarPage
                }

                Item
                {
                    width: swipeView.width
                    height: swipeView.height
                    Label
                    {
                        anchors.centerIn: parent
                        text: "Abstract View"
                        textType: Style.TextType.Display1
                        color: "#FFFFC107"
                    } // FixedTabBarPage
                }

            } // SwipeView
        } // Page
    } // Pane
} // Page