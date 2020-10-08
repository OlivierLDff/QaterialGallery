/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Layouts 1.12

// Qaterial
import Qaterial 1.0 as Qaterial

Qaterial.Page
{
	id : _page

  header: Qaterial.ToolBar
  {
    ColumnLayout
    {
      anchors.fill: parent
      spacing: 0
      AppBarContent { title: "Fader" }

      Qaterial.SwitchDelegate
      {
        id: _highlightedSwitch
        text: "Highlight"
        checked: true
        Layout.fillWidth: true
        onPrimary: true
      } // SwitchDelegate
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
          text: "normal fader"
        } // Label

        GridLayout
        {
          Qaterial.Fader
          {
            Layout.fillWidth: true
            Layout.fillHeight: true
            id:_testSlider
            from : 0
            to: Qaterial.Style.rawButton.minHeight/2
            value: Qaterial.Style.rawButton.cornerRadius
            stepSize: 1
            faderWidth : 14
            orientation: Qt.Vertical
            enabled : _highlightedSwitch.checked
          } // Fader

          Qaterial.Fader
          {
            Layout.fillWidth: true
            Layout.fillHeight: true
            id:_testSlider2
            from : 0
            to: Qaterial.Style.rawButton.minHeight/2
            value: Qaterial.Style.rawButton.cornerRadius
            stepSize: 1
            faderWidth : 14
            orientation: Qt.Vertical
            enabled : _highlightedSwitch.checked
          } // Fader
        } // GridLayout
      } // ColumnLayout
    } // Pane

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
          text: "osc fader "
        } // Label

        GridLayout
        {
          Qaterial.Fader
          {
            Layout.fillWidth: true
            Layout.fillHeight: true
            id:_testSlider3
            osc : true
            from : 0
            to: Qaterial.Style.rawButton.minHeight/2
            value: Qaterial.Style.rawButton.cornerRadius

            faderColor : Qaterial.Style.red
            stepSize: 1
            faderWidth : 40
            orientation: Qt.Vertical
            enabled : _highlightedSwitch.checked
          } // Fader

          Qaterial.Fader
          {
            Layout.fillWidth: true
            Layout.fillHeight: true
            id:_testSlider4
            osc : true
            from : 0
            to: Qaterial.Style.rawButton.minHeight/2
            value: Qaterial.Style.rawButton.cornerRadius

            faderColor : Qaterial.Style.red
            stepSize: 1
            faderWidth : 40
            orientation: Qt.Vertical
            enabled : _highlightedSwitch.checked
          } // Fader
        } // GridLayout
      } // ColumnLayout
    } // Pane

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
          text: "small fader"
        } // Label

        GridLayout
        {
          Qaterial.Fader
          {
            Layout.fillWidth: true
            Layout.fillHeight: true
            id:_testSlider5
            from : 0
            to: Qaterial.Style.rawButton.minHeight/2
            value: Qaterial.Style.rawButton.cornerRadius
            stepSize: 1
            faderWidth : 3
            orientation: Qt.Vertical
            enabled : _highlightedSwitch.checked
            faderColor : Qaterial.Style.green
          } // Fader

          Qaterial.Fader
          {
            Layout.fillWidth: true
            Layout.fillHeight: true
            id:_testSlider6
            from : 0
            to: Qaterial.Style.rawButton.minHeight/2
            value: Qaterial.Style.rawButton.cornerRadius
            stepSize: 1
            faderWidth : 3
            orientation: Qt.Vertical
            enabled : _highlightedSwitch.checked
            faderColor : Qaterial.Style.green
          } // Fader
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
      ListElement{ text: "Normal Fader" }
      ListElement{ text: "Osc" }
      ListElement{ text: "Small Fader" }
    } // ListModel
  } // FixedTabBar
} // Page
