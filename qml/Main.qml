import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import Qt.labs.settings 1.0

import QQuickMaterialHelper.Components 1.12
import QQuickMaterialHelper.Style 1.12

ApplicationWindow 
{
    id: window
    width: 480
    height: 750
    visible: true
	title: "Oliv Material Gallery"

    menuBar: MenuBar 
    {
        visible: false
        Menu 
        {
            title: qsTr("File")
            width: 300
            MenuItem { text: qsTr("New..."); onTriggered: console.log("New"); action: Action{shortcut : "Ctrl+N"} }
            MenuItem { text: qsTr("Open..."); onTriggered: console.log("Open") }
            MenuItem { text: qsTr("Save"); onTriggered: console.log("Save") }
            MenuItem { text: qsTr("Save As..."); onTriggered: console.log("Save As") }
            MenuSeparator { width: parent.width }
            MenuItem { text: qsTr("Quit"); onTriggered: console.log("Quit") }
        }
        Menu 
        {
            width: 300
            title: qsTr("Edit")
            MenuItem 
            { 
                text: qsTr("Copy"); 
                icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/content-copy.svg"; 
                action: Action
                {
                    shortcut : "Ctrl+C"
                    onTriggered: console.log("Copy")
                }
            }
            MenuItem { text: qsTr("Cut"); onTriggered: console.log("Cut") }
            MenuItem { text: qsTr("Paste"); onTriggered: console.log("Paster") }
            Menu 
            {
                title: "Find/Replace"
                MenuItem { text: "Find Next" }
                MenuItem { text: "Find Previous" }
                MenuItem { text: "Replace" }
            }
            MenuSeparator { width: parent.width }
            MenuItem 
            { 
                text: qsTr("Dummy"); 
                icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/airplane.svg"; 
                action: Action
                {
                    shortcut : "Ctrl+Shift+F5"
                    onTriggered: console.log("Dummy")
                }
            }
            MenuItem 
            { 
                text: qsTr("Colored Icon"); 
                icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/album.svg";
                icon.color: "#8BC34A"
                action: Action
                {
                    shortcut : "Ctrl+K,Ctrl+L"
                    onTriggered: console.log("Colored")
                }
            }
        }
        Menu 
        {
            title: qsTr("Test")
            MenuItem { text: qsTr("Checked 1 very loing afznuaefb"); checked: true }
            MenuItem { text: qsTr("Checked 2"); checkable: true }
            MenuItem { text: qsTr("Checked 3"); checkable: true }
            MenuItem { text: qsTr("Checked 4"); checkable: true }
            MenuItem { text: qsTr("Checked 5"); checkable: true }
        }
        Menu 
        {
            title: qsTr("Help")
            MenuItem { text: qsTr("About"); onTriggered: console.log("About") }
        }
    }

    Component.onCompleted:
    {
        //MaterialStyle.theme = Material.Dark
    }

    Material.theme: MaterialStyle.theme
    Material.primary : MaterialStyle.primaryColor
    Material.background : MaterialStyle.backgroundColor
    Material.accent : MaterialStyle.accentColor
    Material.foreground: MaterialStyle.foregroundColor

    Shortcut {
        sequences: ["Esc", "Back"]
        enabled: stackView.depth > 1
        onActivated: {
            stackView.pop()
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: MaterialPage 
        {
            id: materialPage
        }
    }

    Dialog 
    {
        id: themeDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: window.width*0.8
        height: window.height*0.8
        modal: true
        focus: true
        title: "Settings"

        standardButtons: Dialog.Ok | Dialog.Cancel
        onAccepted: {
            themeDialog.close()
        }
        onRejected: {
            themeDialog.close()
        }

        drawSeparator: true

        contentItem: Flickable
        {
            width: themeDialog.width*0.8
            height: themeDialog.height
            contentWidth: width
            contentHeight: settingsColumn.implicitHeight

            clip: true
            ColumnLayout 
            {
                id: settingsColumn
                width: parent.width
                spacing: 0

                SwitchDelegate
                {
                    Layout.fillWidth: true
                    text: "Debug Icon Label"
                    checked: MaterialStyle.debug.drawDebugIconLabel
                    onCheckedChanged:
                    {
                        MaterialStyle.debug.drawDebugIconLabel = checked
                    }
                }

                SwitchDelegate
                {
                    Layout.fillWidth: true
                    text: "Debug Buttons"
                    checked: MaterialStyle.debug.drawDebugButton
                    onCheckedChanged:
                    {
                        MaterialStyle.debug.drawDebugButton = checked
                    }
                }

                SwitchDelegate
                {
                    Layout.fillWidth: true
                    text: "Debug Delegates"
                    checked: MaterialStyle.debug.drawDebugDelegate
                    onCheckedChanged:
                    {
                        MaterialStyle.debug.drawDebugDelegate = checked
                    }
                }

                SwitchDelegate
                {
                    Layout.fillWidth: true
                    text: checked ? "Dark" : "Light"
                    onCheckedChanged:
                    {
                        MaterialStyle.theme = checked ? Material.Dark : Material.Light
                    }
                }

                SwitchDelegate
                {
                    Layout.fillWidth: true
                    text: checked ? "Dense" : "Normal"
                    onCheckedChanged:
                    {
                        MaterialStyle.dense = checked
                    }
                }

                SwitchDelegate
                {
                    Layout.fillWidth: true
                    text: "Reverse Color on Primary (Light)"
                    checked: MaterialStyle.foregroundReversedOnPrimaryLight
                    onCheckedChanged:
                    {
                        MaterialStyle.foregroundReversedOnPrimaryLight = checked
                    }
                }

                SwitchDelegate
                {
                    Layout.fillWidth: true
                    text: "Reverse Color on Primary (Dark)"
                    checked: MaterialStyle.foregroundReversedOnPrimaryDark
                    onCheckedChanged:
                    {
                        MaterialStyle.foregroundReversedOnPrimaryDark = checked
                    }
                }

                SwitchDelegate
                {
                    Layout.fillWidth: true
                    text: "Reverse Ripple on Primary (Light)"
                    checked: MaterialStyle.rippleReversedOnPrimaryLight
                    onCheckedChanged:
                    {
                        MaterialStyle.rippleReversedOnPrimaryLight = checked
                    }
                }

                SwitchDelegate
                {
                    Layout.fillWidth: true
                    text: "Reverse Ripple on Primary (Dark)"
                    checked: MaterialStyle.rippleReversedOnPrimaryDark
                    onCheckedChanged:
                    {
                        MaterialStyle.rippleReversedOnPrimaryDark = checked
                    }
                }

                SwitchDelegate
                {
                    Layout.fillWidth: true
                    text: "Reverse Color on Accent (Light)"
                    checked: MaterialStyle.foregroundReversedOnAccentLight
                    onCheckedChanged:
                    {
                        MaterialStyle.foregroundReversedOnAccentLight = checked
                    }
                }

                SwitchDelegate
                {
                    Layout.fillWidth: true
                    text: "Reverse Color on Accent (Dark)"
                    checked: MaterialStyle.foregroundReversedOnAccentDark
                    onCheckedChanged:
                    {
                        MaterialStyle.foregroundReversedOnAccentDark = checked
                    }
                }

                SwitchDelegate
                {
                    Layout.fillWidth: true
                    text: "Prefer Accent Color on Primary (Light)"
                    checked: MaterialStyle.preferAccentOnPrimaryLight
                    onCheckedChanged:
                    {
                        MaterialStyle.preferAccentOnPrimaryLight = checked
                    }
                }

                SwitchDelegate
                {
                    Layout.fillWidth: true
                    text: "Prefer Accent Color on Primary (Dark)"
                    checked: MaterialStyle.preferAccentOnPrimaryDark
                    onCheckedChanged:
                    {
                        MaterialStyle.preferAccentOnPrimaryDark = checked
                    }
                }

                Label 
                {
                    text: "Primary Color"
                    horizontalAlignment: Label.AlignHCenter
                    verticalAlignment: Label.AlignVCenter
                    Layout.fillWidth: true
                }
                ListModel
                {
                    id: colorModel
                    ListElement { color: Material.Red; materialColor: true }
                    ListElement { color: Material.DeepOrange; materialColor: true }
                    ListElement { color: Material.Orange; materialColor: true }
                    ListElement { color: Material.Amber; materialColor: true }
                    ListElement { color: Material.Yellow; materialColor: true }
                    ListElement { color: Material.Lime; materialColor: true }
                    ListElement { color: Material.LightGreen; materialColor: true }
                    ListElement { color: Material.Green; materialColor: true }
                    ListElement { color: Material.Teal; materialColor: true }
                    ListElement { color: Material.Cyan; materialColor: true }
                    ListElement { color: Material.LightBlue; materialColor: true }
                    ListElement { color: Material.Blue; materialColor: true }
                    ListElement { color: Material.Indigo; materialColor: true }
                    ListElement { color: Material.DeepPurple; materialColor: true }
                    ListElement { color: Material.Purple; materialColor: true }
                    ListElement { color: Material.Pink; materialColor: true }
                    ListElement { color: 0; materialColor: false; colorString: "#303030" }
                    ListElement { color: 0; materialColor: false; colorString: "#212121" }
                    
                }

                GridLayout
                {
                    //width: parent.width
                    columns: parent.width/45
                    Layout.fillWidth: true
                    Repeater
                    {
                        model: colorModel

                        delegate: Rectangle
                        {
                            id: icon
                            width: 40; height: 40
                            color: model.materialColor ? Material.color(model.color) : model.colorString
                            radius: 3
                            MouseArea
                            {
                                anchors.fill: parent
                                onClicked: 
                                {
                                    if(MaterialStyle.theme == Material.Light)
                                    {
                                        MaterialStyle.primaryColorLight = model.materialColor ? Material.color(model.color) : model.colorString
                                    }
                                    else
                                    {
                                        MaterialStyle.primaryColorDark = model.materialColor ? Material.color(model.color) : model.colorString
                                    }
                                }
                            }
                        }
                    }
                }

                Label 
                {
                    text: "Accent Color"
                    horizontalAlignment: Label.AlignHCenter
                    verticalAlignment: Label.AlignVCenter
                    Layout.fillWidth: true
                }
                GridLayout
                {
                    //width: parent.width
                    columns: parent.width/45
                    Layout.fillWidth: true
                    Repeater
                    {
                        model: colorModel

                        delegate: Rectangle
                        {
                            id: icon
                            width: 40; height: 40
                            color: model.materialColor ? Material.color(model.color) : model.colorString
                            radius: 3
                            MouseArea
                            {
                                anchors.fill: parent
                                onClicked:
                                {
                                    if(MaterialStyle.theme == Material.Light)
                                    {
                                        MaterialStyle.accentColorLight = model.materialColor ? Material.color(model.color) : model.colorString
                                    }
                                    else
                                    {
                                        MaterialStyle.accentColorDark = model.materialColor ? Material.color(model.color) : model.colorString
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
