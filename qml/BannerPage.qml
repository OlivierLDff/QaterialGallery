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
    AppBarContent { anchors.fill: parent; title: "Banners" } // AppBarContent
  } // ToolBar

  property string shortText: "One line text string with one action."
  property string medText: "Two line text string with two actions. One to two lines is preferable on mobile and tablet."
  property string longText: "Three line text string example with two actions. One to two lines is preferable. Three lines should be considered the maximum string length on desktop inorder to keep messages short and actionable."

  Qaterial.Banner
  {
    id: _banner
    anchors.top: parent.top
    width: parent.width
    drawSeparator: true
    text: _small.checked ? _page.shortText : (_med.checked ? _page.medText : _page.longText)
    thumbnailSource: _thumb.checked ? "qrc:/QaterialGallery/images/card40x40.png" : ""
    iconSource: _icon.checked ? "qrc:/QaterialGallery/images/icons/wifi.svg" : ""
    fillIcon: _fill.checked
    outlinedIcon: _outlined.checked
    highlightedIcon: _highlighted.checked
    reverseHighlightIcon: _reverse.checked

    action1: _small.checked ? "Action" : "Action 1"
    action2: _small.checked ? "" : "Action 2"

    onActionClicked: if(_small.checked) console.log("Action Clicked")
    onAction1Clicked: if(!_small.checked) console.log("Action 1 Clicked")
    onAction2Clicked: console.log("Action 2 Clicked")

    enabled: _enabled.checked
  } // Banner

  Qaterial.ScrollablePage
  {
    width: parent.width
    anchors.top: _banner.bottom
    anchors.bottom: parent.bottom
    clip: true
    Column
    {
      width: parent.width
      spacing: Qaterial.Style.card.verticalPadding

      Qaterial.Label
      {
        width: parent.width
        wrapMode: Label.Wrap
        elide: Text.ElideRight
        text: "A banner displays an important, succinct message, and provides actions for users to address (or dismiss the banner). It requires a user action to be dismissed.\n" +
        "  • Banners should be displayed at the top of the screen, below a top app bar. They are persistent and nonmodal, allowing the user to either ignore them or interact with them at any time."
        //Layout.preferredHeight: 100
        maximumLineCount: 7
        textType: Qaterial.Style.TextType.Caption
      } // Label

      Qaterial.GroupBox
      {
        title: "Banner selection"
        inlineTitle: true
        width: Math.min(parent.width, 400)
        anchors.horizontalCenter: parent.horizontalCenter

        contentItem: Column
        {
          spacing: 0

          Qaterial.RadioButton
          {
            id: _small
            text: "Small Banner"
            width: parent.width
          } // RadioButton

          Qaterial.RadioButton
          {
            id: _med
            text: "Medium Banner"
            checked: true
            width: parent.width
          } // RadioButton

          Qaterial.RadioButton
          {
            id: _long
            text: "Long Banner"
            width: parent.width
          } // RadioButton
        } // Column
      } // GroupBox

      Qaterial.GroupBox
      {
        title: "Supporting illustration"
        inlineTitle: true
        width: Math.min(parent.width, 400)
        anchors.horizontalCenter: parent.horizontalCenter

        contentItem: Column
        {
          id: _supportBox
          spacing: 0

          Qaterial.RadioButton
          {
            text: "No Thumbnail"
            width: parent.width
          } // RadioButton

          Qaterial.RadioButton
          {
            id: _thumb
            text: "Thumbnail"
            width: parent.width
          } // RadioButton

          Qaterial.RadioButton
          {
            id: _icon
            text: "Icon"
            checked: true
            width: parent.width
          } // RadioButton

          Row
          {
            Qaterial.RadioButton
            {
              id: _outlined
              text: "Outlined"
              width: _supportBox.width/2
              enabled: _icon.checked
            } // RadioButton

            Qaterial.RadioButton
            {
              id: _fill
              text: "Fill"
              checked: true
              width: _supportBox.width/2
              enabled: _icon.checked
            } // RadioButton
          } // Row

          Row
          {
            Qaterial.CheckButton
            {
              id: _highlighted
              text: "Highlighted"
              checked: true
              width: _supportBox.width/2
              enabled: _icon.checked
            } // CheckButton

            Qaterial.CheckButton
            {
              id: _reverse
              text: "Reverse"
              checked: true
              width: _supportBox.width/2
              enabled: _icon.checked
            } // CheckButton
          } // Row

          Qaterial.SwitchButton
          {
            id: _enabled
            text: "Enabled"
            checked: true
            width: parent.width
          } // SwitchButton
        } // Column
      } // GroupBox
    } // Column
  } // ScrollablePage
} // Page
