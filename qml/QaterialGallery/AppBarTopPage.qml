/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

// Qaterial
import Qaterial 1.0 as Qaterial

Qaterial.Page
{
  id: _page

  header: Qaterial.ToolBar
  {
    RowLayout
    {
      anchors.fill: parent
      property alias title: _titleLabel.text

      Qaterial.AppBarButton
      {
        id: _backButton
        icon.source: "qrc:/QaterialGallery/images/icons/arrow-left.svg"
        onClicked: stackView.pop()
        visible: stackView.depth > 1
        onPrimary: true
      } // AppBarButton

      Qaterial.LabelHeadline6
      {
        id: _titleLabel

        Layout.fillWidth: true
        Layout.leftMargin: !_backButton.visible ? 20 : undefined
        onPrimary: true

        text: "App Bar Top"
        elide: Label.ElideRight
      } // Label

      Qaterial.AppBarButton
      {
        icon.source: "qrc:/QaterialGallery/images/icons/palette.svg"
        onPrimary: true
        onClicked: themeDialog.open()
      } // ToolButton

      Qaterial.AppBarButton
      {
        icon.source: "qrc:/QaterialGallery/images/icons/dots-vertical.svg"
        onPrimary: true
        onClicked: _optionsMenu.open()

        Qaterial.Menu
        {
          id: _optionsMenu
          x: parent.width - width
          transformOrigin: Menu.TopRight

          Qaterial.MenuItem
          {
            text: "Settings"
            onTriggered: console.log("click settings")
          } // MenuItem

          Qaterial.MenuItem
          {
            text: "About"
            onTriggered: console.log("click about")
          } // MenuItem
        } // Menu
      } // AppBarButton
    } // RowLayout
  } // AppBar
} // Page
