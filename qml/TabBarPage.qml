/** Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12
import QtQuick.Layouts 1.12

import Qaterial 1.0

Page {
    id: page

    header: ToolBar
    {
        ColumnLayout
        {
            anchors.fill: parent
            spacing: 0
            AppBarContent { title: "Tab Bar" }

            SwitchDelegate
            {
                Layout.fillWidth: true
                text: checked ? "Enabled" : "Disabled"
                checked: true
                id: _enabledSwitch
                onPrimary: true
            }
        } // ColumnLayout
    } // ToolBar

    SwipeView
    {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        FixedTabBarPage
        {
            width: swipeView.width
            height: swipeView.height
            enabled: _enabledSwitch.checked
        } // FixedTabBarPage

        FooterTabBarPage
        {
            width: swipeView.width
            height: swipeView.height
            enabled: _enabledSwitch.checked
        } // FooterTabBarPage

        ScrollableTabBarPage
        {
            width: swipeView.width
            height: swipeView.height
            enabled: _enabledSwitch.checked
        } // FooterTabBarPage

        ClusturedTabBarPage
        {
            width: swipeView.width
            height: swipeView.height
            enabled: _enabledSwitch.checked
        } // FooterTabBarPage

    } // SwipeView

    footer: FixedTabBar
    {
        id: tabBar
        elevation: 20
        currentIndex: swipeView.currentIndex

        model: ListModel
        {
            ListElement { text: "Fixed" }
            ListElement { text: "Footer" }
            ListElement { text: "Scrollable" }
            ListElement { text: "Clustured" }
        }
    }
}
