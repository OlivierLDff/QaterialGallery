import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import Qt.labs.settings 1.0

import Qaterial 1.0 as Qaterial

Qaterial.ApplicationWindow
{
  id: window
  width: 480
  height: 750
  visible: true
  title: "Qaterial Gallery"

  menuBar: Qaterial.MenuBar
  {
    visible: false
    Qaterial.Menu
    {
      title: qsTr("File")
      width: 300
      Qaterial.MenuItem { text: qsTr("New..."); onTriggered: console.log("New"); action: Action{shortcut : "Ctrl+N"} }
      Qaterial.MenuItem { text: qsTr("Open..."); onTriggered: console.log("Open") }
      Qaterial.MenuItem { text: qsTr("Save"); onTriggered: console.log("Save") }
      Qaterial.MenuItem { text: qsTr("Save As..."); onTriggered: console.log("Save As") }
      Qaterial.MenuSeparator { width: parent.width }
      Qaterial.MenuItem { text: qsTr("Quit"); onTriggered: console.log("Quit") }
    }
    Qaterial.Menu
    {
      width: 300
      title: qsTr("Edit")
      Qaterial.MenuItem
      {
        text: qsTr("Copy");
        icon.source: "qrc:/QaterialGallery/images/icons/content-copy.svg";
        action: Action
        {
          shortcut : "Ctrl+C"
          onTriggered: console.log("Copy")
        }
      }
      Qaterial.MenuItem { text: qsTr("Cut"); onTriggered: console.log("Cut") }
      Qaterial.MenuItem { text: qsTr("Paste"); onTriggered: console.log("Paster") }
      Qaterial.Menu
      {
        title: "Find/Replace"
        Qaterial.MenuItem { text: "Find Next" }
        Qaterial.MenuItem { text: "Find Previous" }
        Qaterial.MenuItem { text: "Replace" }
      }
      Qaterial.MenuSeparator { width: parent.width }
      Qaterial.MenuItem
      {
        text: qsTr("Dummy");
        icon.source: "qrc:/QaterialGallery/images/icons/airplane.svg";
        action: Action
        {
          shortcut : "Ctrl+Shift+F5"
          onTriggered: console.log("Dummy")
        }
      }
      Qaterial.MenuItem
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
    Qaterial.Menu
    {
      title: qsTr("Test")
      Qaterial.MenuItem { text: qsTr("Checked 1 very loing afznuaefb"); checked: true }
      Qaterial.MenuItem { text: qsTr("Checked 2"); checkable: true }
      Qaterial.MenuItem { text: qsTr("Checked 3"); checkable: true }
      Qaterial.MenuItem { text: qsTr("Checked 4"); checkable: true }
      Qaterial.MenuItem { text: qsTr("Checked 5"); checkable: true }
    }
    Qaterial.Menu
    {
      title: qsTr("Help")
      Qaterial.MenuItem { text: qsTr("About"); onTriggered: console.log("About") }
    }
  }

  Component.onCompleted:
  {
    //Style.theme = Material.Dark
  }

  // Ugly trick for now : todo remove
  Material.theme: Qaterial.Style.theme
  Material.primary : Qaterial.Style.primaryColor
  Material.background : Qaterial.Style.backgroundColor
  Material.accent : Qaterial.Style.accentColor
  Material.foreground: Qaterial.Style.foregroundColor

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

  Qaterial.StyleSettingsDialog
  {
    id: themeDialog
    width: window.width*0.8
  }
}
