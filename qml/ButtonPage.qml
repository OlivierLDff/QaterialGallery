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
    ColumnLayout
    {
      anchors.fill: parent
      spacing: 0
      AppBarContent { title: "Buttons" } // AppBarContent

      Qaterial.SwitchDelegate
      {
        id: _highlightedSwitch
        text: "Highlight"
        checked: true
        Layout.fillWidth: true
        onPrimary: true
      } // SwitchDelegate

      RowLayout
      {
        Layout.fillWidth: true
        Layout.rightMargin: 10
        Layout.leftMargin: 10
        spacing: 10

        Qaterial.Label
        {
          text: "Radius (" + _radiusSlider.value + ")"
          textType: Qaterial.Style.TextType.Body2
          onPrimary: true
        } // Label

        Qaterial.Slider
        {
          id: _radiusSlider
          Layout.fillWidth: true
          from: 0
          to: Qaterial.Style.rawButton.minHeight/2
          value: Qaterial.Style.rawButton.cornerRadius
          stepSize: 1
        } // Slider
      } // RowLayout
    } // ColumnLayout
  } // ToolBar

  Qaterial.SwipeView
  {
    id: _swipeView
    anchors.fill: parent
    currentIndex: _tabBar.currentIndex

    Qaterial.Pane
    {
      width: _swipeView.width
      height: _swipeView.height
      bottomPadding: 0

      ColumnLayout
      {
        anchors.fill: parent

        Qaterial.Label
        {
          Layout.fillWidth: true
          Layout.alignment: Qt.AlignTop

          wrapMode: Label.Wrap
          text: "Raised buttons add dimensions to mostly flat layouts. " +
              "They emphasize functions on busy or wide spaces."
        } // Label

        GridLayout
        {
          Layout.fillHeight: true
          Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
          Layout.fillWidth: true
          columns: 2
          rowSpacing : 40

          Qaterial.RaisedButton
          {
            text: "Raised Button"
            Layout.alignment: Qt.AlignRight
            highlighted: _highlightedSwitch.checked
            radius: _radiusSlider.value
          } // RaisedButton

          Qaterial.RaisedButton
          {
            text: "Disabled"
            enabled: false
            radius: _radiusSlider.value
          } // RaisedButton

          Qaterial.RaisedButton
          {
            text: "Raised Button"
            icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
            Layout.alignment: Qt.AlignRight
            highlighted: _highlightedSwitch.checked
            radius: _radiusSlider.value
          } // RaisedButton

          Qaterial.RaisedButton
          {
            text: "Disabled"
            icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
            enabled: false
            radius: _radiusSlider.value
          } // RaisedButton
        } // GridLayout
      } // ColumnLayout
    } // Pane

    Qaterial.Pane
    {
      width: _swipeView.width
      height: _swipeView.height

      ColumnLayout
      {
        anchors.fill: parent

        Qaterial.Label
        {
          Layout.fillWidth: true
          Layout.alignment: Qt.AlignTop

          wrapMode: Label.Wrap
          text: "A flat button displayes an ink splash on press but does not lift. " +
              "Use flat buttons on toolbars, in dialogs and inline with padding."
        } // Label

        GridLayout
        {
          Layout.fillHeight: true
          Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
          Layout.fillWidth: true
          columns: 2
          rowSpacing : 40

          Qaterial.FlatButton
          {
            text: "Flat Button"
            Layout.alignment: Qt.AlignRight
            highlighted: _highlightedSwitch.checked
            radius: _radiusSlider.value
          } // FlatButton

          Qaterial.FlatButton
          {
            text: "Disabled"
            enabled: false
            radius: _radiusSlider.value
          } // FlatButton

          Qaterial.FlatButton
          {
            text: "Flat Button"
            icon.source: "qrc:/QaterialGallery/images/icons/plus-circle-outline.svg"
            Layout.alignment: Qt.AlignRight
            highlighted: _highlightedSwitch.checked
            radius: _radiusSlider.value
          } // FlatButton

          Qaterial.FlatButton
          {
            text: "Disabled"
            icon.source: "qrc:/QaterialGallery/images/icons/plus-circle-outline.svg"
            enabled: false
            radius: _radiusSlider.value
          } // FlatButton
        } // GridLayout
      } // ColumnLayout
    } // Pane

    Qaterial.Pane
    {
      width: _swipeView.width
      height: _swipeView.height

      ColumnLayout
      {
        anchors.fill: parent

        Qaterial.Label
        {
          Layout.fillWidth: true
          Layout.alignment: Qt.AlignTop

          wrapMode: Label.Wrap
          text: "Outline buttons become opaque and elevate when pressed. " +
              "They are often paired with raised buttons to indicate an alternaive, secondary action."
        } // Label

        GridLayout
        {
          Layout.fillHeight: true
          Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
          Layout.fillWidth: true
          columns: 2
          rowSpacing : 40

          Qaterial.OutlineButton
          {
            text: "Outline Button"
            Layout.alignment: Qt.AlignRight
            highlighted: _highlightedSwitch.checked
            radius: _radiusSlider.value
          } // OutlinedButton

          Qaterial.OutlineButton
          {
            text: "Disabled"
            enabled: false
            radius: _radiusSlider.value
          } // OutlinedButton

          Qaterial.OutlineButton
          {
            text: "Outline Button"
            icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
            Layout.alignment: Qt.AlignRight
            highlighted: _highlightedSwitch.checked
            radius: _radiusSlider.value
          } // OutlinedButton

          Qaterial.OutlineButton
          {
            text: "Disabled"
            icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
            enabled: false
            radius: _radiusSlider.value
          } // OutlinedButton
        } // GridLayout
      } // ColumnLayout
    } // Pane
  } // SwipeView

  footer: Qaterial.FixedTabBar
  {
    id: _tabBar
    elevation: 20
    currentIndex: _swipeView.currentIndex

    model: ListModel
    {
      ListElement{ text: "Raised" }
      ListElement{ text: "Flat" }
      ListElement{ text: "Outline" }
    } // ListModel
  } // FixedTabBar
} // Page
