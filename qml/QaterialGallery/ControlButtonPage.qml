/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

// Qaterial
import Qaterial 1.0 as Qaterial

Qaterial.Page
{
  id: _page

  header: Qaterial.ToolBar
  {
      AppBarContent { anchors.fill: parent; title: "Control Buttons" } // AppBarContent
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
      padding: 16

      ColumnLayout
      {
        anchors.fill: parent

        Qaterial.Label
        {
          Layout.fillWidth: true
          Layout.alignment: Qt.AlignTop

          wrapMode: Label.Wrap
          text: "Use switches to: \n" +
          "- Toggle a single option on or off, on mobile and tablet\n" +
          "- Immediately activate or deactivate something"
        } // Label

        ColumnLayout
        {
          spacing: 0
          Layout.fillHeight: true
          Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
          Layout.fillWidth: true

          Qaterial.SwitchButton
          {
            text: "Switch Button 1"
            checked: true
            Layout.alignment: Qt.AlignLeft
          } // SwitchButton

          Qaterial.SwitchButton
          {
            text: "Switch Button 2"
            Layout.alignment: Qt.AlignLeft
          } // SwitchButton

          Qaterial.SwitchButton
          {
            text: "Switch Button Disabled"
            enabled: false
            Layout.alignment: Qt.AlignLeft
          } // SwitchButton
        } // ColumnLayout
      } // ColumnLayout
    } // Pane

    Qaterial.Pane
    {
      width: _swipeView.width
      height: _swipeView.height
      bottomPadding: 0
      padding: 16

      ColumnLayout
      {
        anchors.fill: parent

        Qaterial.Label
        {
          Layout.fillWidth: true
          Layout.alignment: Qt.AlignTop

          wrapMode: Label.Wrap
          text: "Use checkboxes to: \n" +
              "- Select one or multiple items from a list\n" +
              "- Present a list containing sub-selections\n" +
              "- Turn an option on or off in desktop environment"
        } // Label

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
          } // ButtonGroup

          Qaterial.CheckButton
          {
            id: parentBox
            text: qsTr("Parent")
            checkState: childGroup.checkState
          } // CheckButton

          Qaterial.CheckButton
          {
            checked: true
            text: qsTr("Child 1")
            leftPadding: indicator.width
            ButtonGroup.group: childGroup
          } // CheckButton

          Qaterial.CheckButton
          {
            text: qsTr("Child 2")
            leftPadding: indicator.width
            ButtonGroup.group: childGroup
          } // CheckButton

          Qaterial.CheckButton
          {
            text: qsTr("Child 3")
            leftPadding: indicator.width
            ButtonGroup.group: childGroup
            checked: true
            enabled: false
          } // CheckButton
        } // ColumnLayout
      } // ColumnLayout
    } // Pane

    Qaterial.Pane
    {
      width: _swipeView.width
      height: _swipeView.height
      bottomPadding: 0
      padding: 16

      ColumnLayout
      {
        anchors.fill: parent

        Qaterial.Label
        {
          Layout.fillWidth: true
          Layout.alignment: Qt.AlignTop

          wrapMode: Label.Wrap
          text: "Use radio buttons to:\n" +
          "- Select a single option from a list\n" +
          "- Expose all available options\n" +
          "- If available options can be collapsed, consider using a dropdown menu instead, as it uses less space."

        } // Label

        ColumnLayout
        {
          Layout.fillHeight: true
          Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
          Layout.fillWidth: true
          spacing: 0

          Qaterial.RadioButton
          {
            checked: true
            text: qsTr("Child 1")
          }  // RadioButton

          Qaterial.RadioButton
          {
            text: qsTr("Child 2")
          } // RadioButton

          Qaterial.RadioButton
          {
            text: qsTr("Child 3")
            enabled: false
          } // RadioButton
        } // ColumnLayout
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
      ListElement{ text: "Switch" }
      ListElement{ text: "Check" }
      ListElement{ text: "Radio" }
    } // ListModel
  } // FixedTabBar
} // Page
