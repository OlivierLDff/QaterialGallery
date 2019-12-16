import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.12
import Qt.labs.settings 1.0

import Qaterial 1.0

ApplicationWindow
{
    id: window
    width: 480
    height: 750
    visible: true
    title: "Qaterial Gallery"

    RobotoFontLoader {}

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
                icon.source: "qrc:/QaterialGallery/images/icons/content-copy.svg";
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
                icon.source: "qrc:/QaterialGallery/images/icons/airplane.svg";
                action: Action
                {
                    shortcut : "Ctrl+Shift+F5"
                    onTriggered: console.log("Dummy")
                }
            }
            MenuItem
            {
                text: qsTr("Colored Icon");
                icon.source: "qrc:/QaterialGallery/images/icons/album.svg";
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
        //Style.theme = Material.Dark
    }

    Material.theme: Style.theme
    Material.primary : Style.primaryColor
    Material.background : Style.backgroundColor
    Material.accent : Style.accentColor
    Material.foreground: Style.foregroundColor

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

    StyleSettingsDialog
    {
        id: themeDialog
        width: window.width*0.8
    }
}
