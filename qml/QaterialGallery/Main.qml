/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Controls 2.12
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
      Qaterial.MenuItem { text: qsTr("New...");onTriggered: console.log(
    "New");action: Action { shortcut: "Ctrl+N" } } // MenuItem
      Qaterial.MenuItem { text: qsTr("Open...");onTriggered: console.log("Open") } // MenuItem
      Qaterial.MenuItem { text: qsTr("Save");onTriggered: console.log("Save") } // MenuItem
      Qaterial.MenuItem { text: qsTr("Save As...");onTriggered: console.log("Save As") } // MenuItem
      Qaterial.MenuSeparator { width: parent.width } // MenuItem
      Qaterial.MenuItem { text: qsTr("Quit");onTriggered: console.log("Quit") } // MenuItem
    } // Menu

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
          shortcut: "Ctrl+C"
          onTriggered: console.log("Copy")
        }
      } // MenuItem
      Qaterial.MenuItem { text: qsTr("Cut");onTriggered: console.log("Cut") } // MenuItem
      Qaterial.MenuItem { text: qsTr("Paste");onTriggered: console.log("Paster") } // MenuItem

      Qaterial.Menu
      {
        title: "Find/Replace"
        Qaterial.MenuItem { text: "Find Next" } // MenuItem
        Qaterial.MenuItem { text: "Find Previous" } // MenuItem
        Qaterial.MenuItem { text: "Replace" } // MenuItem
      } // Menu

      Qaterial.MenuSeparator { width: parent.width } // MenuSeperator

      Qaterial.MenuItem
      {
        text: qsTr("Dummy");
        icon.source: "qrc:/QaterialGallery/images/icons/airplane.svg";
        action: Action
        {
          shortcut: "Ctrl+Shift+F5"
          onTriggered: console.log("Dummy")
        }
      } // MenuItem
      Qaterial.MenuItem
      {
        text: qsTr("Colored Icon");
        icon.source: "qrc:/QaterialGallery/images/icons/album.svg";
        icon.color: "#8BC34A"
        action: Action
        {
          shortcut: "Ctrl+K,Ctrl+L"
          onTriggered: console.log("Colored")
        }
      } // MenuItem
    } // Menu

    Qaterial.Menu
    {
      title: qsTr("Test")
      Qaterial.MenuItem { text: qsTr("Checked 1 very loing afznuaefb");checked: true } // MenuItem
      Qaterial.MenuItem { text: qsTr("Checked 2");checkable: true } // MenuItem
      Qaterial.MenuItem { text: qsTr("Checked 3");checkable: true } // MenuItem
      Qaterial.MenuItem { text: qsTr("Checked 4");checkable: true } // MenuItem
      Qaterial.MenuItem { text: qsTr("Checked 5");checkable: true } // MenuItem
    } // Menu

    Qaterial.Menu
    {
      title: qsTr("Help")
      Qaterial.MenuItem { text: qsTr("About");onTriggered: console.log("About") } // MenuItem
    } // Menu
  } // MenuBar

  Component.onCompleted:
  {
    //Style.theme = Material.Dark
  }

  Shortcut
  {
    sequences: ["Esc", "Back"]
    enabled: stackView.depth > 1
    onActivated:
    {
      stackView.pop()
    }
  } // Shortcut

  Qaterial.StackView
  {
    id: stackView
    anchors.fill: parent

    initialItem: MaterialPage
    {
      id: materialPage
    }
  } // StackView

  Qaterial.StyleSettingsDialog
  {
    id: themeDialog
    width: window.width * 0.8
  } // StyleSettingsDialog
} // ApplicationWindow
