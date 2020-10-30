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
  id: page

  header: Qaterial.ToolBar
  {
    ColumnLayout
    {
      anchors.fill: parent
      AppBarContent { title: "Icon Buttons" } // AppBarContent
    } // ColumnLayout
  } // ToolBar

  Qaterial.ScrollablePage
  {
    anchors.fill: parent
    pane.padding: 16

    ColumnLayout
    {
      width: parent.width
      spacing: 20

      Qaterial.Label
      {
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop

        wrapMode: Label.Wrap
        text: "Icon buttons are round or square button dedicated to one action."
        horizontalAlignment: Text.AlignHCenter
      } // Label

      Qaterial.Label
      {
        text: "AppBar Button"
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
        textType: Qaterial.Style.TextType.Body2
      } // Label

      RowLayout
      {
        Layout.alignment: Qt.AlignHCenter
        spacing: 20

        Qaterial.AppBarButton
        {
          icon.source: "qrc:/QaterialGallery/images/icons/arrow-left.svg"
        } // AppBarButton

        Qaterial.AppBarButton
        {
          icon.source: "qrc:/QaterialGallery/images/icons/arrow-left.svg"
          enabled: false
        } // AppBarButton
      } // RowLayout

      Qaterial.Label
      {
        text: "Round Button"
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
        textType: Qaterial.Style.TextType.Body2
      } // Label

      RowLayout
      {
        Layout.alignment: Qt.AlignHCenter
        spacing: 20

        Qaterial.RoundButton
        {
          icon.source: "qrc:/QaterialGallery/images/icons/thumb-up.svg"
          checkable: true

        } // RoundButton

        Qaterial.RoundButton
        {
          icon.source: "qrc:/QaterialGallery/images/icons/thumb-up.svg"
        } // RoundButton

        Qaterial.RoundButton
        {
          icon.source: "qrc:/QaterialGallery/images/icons/thumb-up.svg"
          enabled: false
        } // RoundButton
      } // RowLayout

      Qaterial.Label
      {
        text: "Square Button"
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
        textType: Qaterial.Style.TextType.Body2
      } // Label

      RowLayout
      {
        Layout.alignment: Qt.AlignHCenter
        spacing: 20

        Qaterial.SquareButton
        {
          icon.source: "qrc:/QaterialGallery/images/icons/heart.svg"
          checkable: true
        } // SquareButton

        Qaterial.SquareButton
        {
          icon.source: "qrc:/QaterialGallery/images/icons/heart.svg"
        } // SquareButton

        Qaterial.SquareButton
        {
          icon.source: "qrc:/QaterialGallery/images/icons/heart.svg"
          enabled: false
        } // SquareButton
      } // RowLayout

      Qaterial.Label
      {
        text: "Toggle Button"
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
        textType: Qaterial.Style.TextType.Body2
      } // Label

      RowLayout
      {
        Layout.alignment: Qt.AlignHCenter
        spacing: 0

        Row
        {
          property int checked: 0

          Qaterial.ToggleButton
          {
            icon.source: "qrc:/QaterialGallery/images/icons/format-align-left.svg"
            onClicked: parent.checked = 0
            checked: parent.checked === 0
          } // ToggleButton

          Qaterial.ToggleButton
          {
            icon.source: "qrc:/QaterialGallery/images/icons/format-align-center.svg"
            onClicked: parent.checked = 1
            checked: parent.checked === 1
          } // ToggleButton

          Qaterial.ToggleButton
          {
            icon.source: "qrc:/QaterialGallery/images/icons/format-align-right.svg"
            onClicked: parent.checked = 2
            checked: parent.checked === 2
          } // ToggleButton
        } // Row

        Qaterial.ToggleSeparator {} // ToggleSeparator

        Row
        {
          property int checked: 0

          Qaterial.ToggleButton
          {
            icon.source: "qrc:/QaterialGallery/images/icons/format-bold.svg"
            onClicked: parent.checked = 0
            checked: parent.checked === 0
          } // ToggleButton

          Qaterial.ToggleButton
          {
            icon.source: "qrc:/QaterialGallery/images/icons/format-italic.svg"
            onClicked: parent.checked = 1
            checked: parent.checked === 1
          } // ToggleButton

          Qaterial.ToggleButton
          {
            icon.source: "qrc:/QaterialGallery/images/icons/format-underline.svg"
            onClicked: parent.checked = 2
            checked: parent.checked === 2
          } // ToggleButton
        } // Row

        Qaterial.ToggleSeparator {} // ToggleSeparator

        Qaterial.ToggleButton
        {
          icon.source: "qrc:/QaterialGallery/images/icons/pencil.svg"
          enabled: false
        } // ToggleButton
      } // RowLayout

      Qaterial.Label
      {
        text: "Tool Button"
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
        textType: Qaterial.Style.TextType.Body2
      } // Label

      RowLayout
      {
        Layout.alignment: Qt.AlignHCenter
        spacing: 0

        Row
        {
          property int checked: 0

          Qaterial.ToolButton
          {
            icon.source: "qrc:/QaterialGallery/images/icons/format-align-left.svg"
            onClicked: parent.checked = 0
            checked: parent.checked === 0
          } // ToolButton

          Qaterial.ToolButton
          {
            icon.source: "qrc:/QaterialGallery/images/icons/format-align-center.svg"
            onClicked: parent.checked = 1
            checked: parent.checked === 1
          } // ToolButton

          Qaterial.ToolButton
          {
            icon.source: "qrc:/QaterialGallery/images/icons/format-align-right.svg"
            onClicked: parent.checked = 2
            checked: parent.checked === 2
          } // ToolButton
        } // Row

        Qaterial.ToolSeparator {} // ToggleSeparator

        Row
        {
          property int checked: 0

          Qaterial.ToolButton
          {
            icon.source: "qrc:/QaterialGallery/images/icons/format-bold.svg"
            onClicked: parent.checked = 0
            checked: parent.checked === 0
          } // ToolButton

          Qaterial.ToolButton
          {
            icon.source: "qrc:/QaterialGallery/images/icons/format-italic.svg"
            onClicked: parent.checked = 1
            checked: parent.checked === 1
          } // ToolButton

          Qaterial.ToolButton
          {
            icon.source: "qrc:/QaterialGallery/images/icons/format-underline.svg"
            onClicked: parent.checked = 2
            checked: parent.checked === 2
          } // ToolButton
        } // Row

        Qaterial.ToolSeparator {} // ToggleSeparator

        Qaterial.ToolButton
        {
          icon.source: "qrc:/QaterialGallery/images/icons/pencil.svg"
          enabled: false
        } // ToolButton
      } // RowLayout
    } // ColumnLayout
  } // ScrollablePage
} // Page
