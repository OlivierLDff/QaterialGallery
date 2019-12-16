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
        Page
        {
            clip: true
            //anchors.fill: parent
            width: parent.width
            height: parent.width
            padding: 0
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

                        text: "Fixed Tab Bar"
                        textType: Style.TextType.Title
                        elide: Label.ElideRight
                    } // Label

                    SwitchDelegate
                    {
                        Layout.fillWidth: true
                        onPrimary: true
                        text: "Show Text"
                        checked: true
                        id: _displaySwitch
                        onCheckedChanged: if(!checked && !_showIconSwitch.checked) _showIconSwitch.checked = true
                    }

                    SwitchDelegate
                    {
                        Layout.fillWidth: true
                        onPrimary: true
                        text: "Show Icon"
                        checked: true
                        id: _showIconSwitch
                        onCheckedChanged: if(!checked && !_displaySwitch.checked) _displaySwitch.checked = true
                    }

                    FixedTabBar
                    {
                        id: tabBar
                        Layout.fillWidth: true
                        currentIndex: swipeView.currentIndex
                        onPrimary: true
                        enabled: root.enabled

                        display: _displaySwitch.checked && _showIconSwitch.checked ? AbstractButton.TextUnderIcon :
                            _showIconSwitch.checked ? AbstractButton.IconOnly : AbstractButton.TextOnly

                        model: ListModel
                        {
                            ListElement { text: "Explore"; source: "/QaterialGallery/images/icons/compass.svg"}
                            ListElement { text: "Flights"; source: "/QaterialGallery/images/icons/airplane.svg"}
                            ListElement { text: "Trips"; source: "/QaterialGallery/images/icons/briefcase.svg"}
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
                        text: "Explore View"
                        textType: Style.TextType.Display1
                        color: "#FFF44336"
                    } // FixedTabBarPage
                } // Item

                Item
                {
                    width: swipeView.width
                    height: swipeView.height
                    Label
                    {
                        anchors.centerIn: parent
                        text: "Flight View"
                        textType: Style.TextType.Display1
                        color: "#FFE91E63"
                    } // FixedTabBarPage
                } // Item

                Item
                {
                    width: swipeView.width
                    height: swipeView.height
                    Label
                    {
                        anchors.centerIn: parent
                        text: "Trips View"
                        textType: Style.TextType.Display1
                        color: "#FF9C27B0"
                    } // FixedTabBarPage
                } // Item

            } // SwipeView
        } // Page
    } // Pane
} // Page