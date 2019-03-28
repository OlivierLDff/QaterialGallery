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

    header: ToolBar 
    {
        AppBarContent { anchors.fill: parent; title: "Control Buttons" }
    } // ToolBar

    SwipeView 
    {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Pane 
        {
            width: swipeView.width
            height: swipeView.height
            bottomPadding: 0
            ColumnLayout
            {
                anchors.fill: parent

                Label 
                {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop

                    wrapMode: Label.Wrap
                    text: "Use switches to: \n" + 
                    "- Toggle a single option on or off, on mobile and tablet\n" +
                    "- Immediately activate or deactivate something"
                }

                ColumnLayout 
                {
                    spacing: 0
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    Layout.fillWidth: true
                    SwitchButton
                    {
                        text: "Switch Button 1"
                        checked: true
                        Layout.alignment: Qt.AlignLeft 
                    } // SwitchButton
                    SwitchButton
                    {
                        text: "Switch Button 2"
                        Layout.alignment: Qt.AlignLeft
                    } // SwitchButton
                    SwitchButton
                    {
                        text: "Switch Button Disabled"
                        enabled: false
                        Layout.alignment: Qt.AlignLeft 
                    } // SwitchButton
                } // Grid Layout
            } // Column
        } // Pane
        Pane 
        {
            width: swipeView.width
            height: swipeView.height
            bottomPadding: 0
            ColumnLayout
            {
                anchors.fill: parent

                Label 
                {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop

                    wrapMode: Label.Wrap
                    text: "Use checkboxes to: \n" +
                        "- Select one or multiple items from a list\n" +
                        "- Present a list containing sub-selections\n" +
                        "- Turn an option on or off in desktop environment" 
                }

                ColumnLayout 
                {
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    Layout.fillWidth: true
                    spacing: 0
                    ButtonGroup 
                    {
                        id: childGroup
                        exclusive: false
                        checkState: parentBox.checkState
                    }

                    CheckButton 
                    {
                        id: parentBox
                        text: qsTr("Parent")
                        checkState: childGroup.checkState
                    } // CheckButton

                    CheckButton 
                    {
                        checked: true
                        text: qsTr("Child 1")
                        leftPadding: indicator.width
                        ButtonGroup.group: childGroup
                    } // CheckButton

                    CheckButton 
                    {
                        text: qsTr("Child 2")
                        leftPadding: indicator.width
                        ButtonGroup.group: childGroup
                    } // CheckButton

                    CheckButton 
                    {
                        text: qsTr("Child 3")
                        leftPadding: indicator.width
                        ButtonGroup.group: childGroup
                        checked: true
                        enabled: false
                    } // CheckButton
                } // Grid Layout
            } // Column
        } // Pane
        Pane 
        {
            width: swipeView.width
            height: swipeView.height
            bottomPadding: 0
            ColumnLayout
            {
                anchors.fill: parent

                Label 
                {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop

                    wrapMode: Label.Wrap
                    text: "Use radio buttons to:\n" +
                    "Select a single option from a list\n" +
                    "Expose all available options\n" +
                    "If available options can be collapsed, consider using a dropdown menu instead, as it uses less space."
                }

                ColumnLayout 
                {
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    Layout.fillWidth: true
                    spacing: 0

                    RadioButton 
                    {
                        checked: true
                        text: qsTr("Child 1")
                    }  // ButtonGroup

                    RadioButton 
                    {
                        text: qsTr("Child 2")
                    } // ButtonGroup

                    RadioButton 
                    {
                        text: qsTr("Child 3")
                        enabled: false
                    } // ButtonGroup
                } // Grid Layout
            } // Column
        } // Pane
    } // SwipeView

    footer: FixedTabBar 
    {
        id: tabBar
        elevation: 20
        currentIndex: swipeView.currentIndex

        model: ListModel
        {
            ListElement{ text: "Switch" }
            ListElement{ text: "Check" }
            ListElement{ text: "Radio" }
        }
    }
}
