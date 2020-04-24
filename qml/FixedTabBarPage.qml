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
  id: _root
  property bool enabled: true

  Qaterial.Pane
  {
    padding: 0

    elevation: 20
    anchors.centerIn: parent
    width: parent.width - 30
    height: parent.height - 40

    Qaterial.Page
    {
      clip: true
      //anchors.fill: parent
      width: parent.width
      height: parent.width
      padding: 0

      header: Qaterial.ToolBar
      {
        ColumnLayout
        {
          anchors.fill: parent
          spacing: 0

          Qaterial.Label
          {
            id: _titleLabel

            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            onPrimary: true
            Layout.topMargin: (Qaterial.Style.toolbar.implicitHeight-implicitHeight)/2
            Layout.bottomMargin: (Qaterial.Style.toolbar.implicitHeight-implicitHeight)/2

            text: "Fixed Tab Bar"
            textType: Qaterial.Style.TextType.Title
            elide: Label.ElideRight
          } // Label

          Qaterial.SwitchDelegate
          {
            Layout.fillWidth: true
            onPrimary: true
            text: "Show Text"
            checked: true
            id: _displaySwitch
            onCheckedChanged: if(!checked && !_showIconSwitch.checked) _showIconSwitch.checked = true
          } // SwitchDelegate

          Qaterial.SwitchDelegate
          {
            Layout.fillWidth: true
            onPrimary: true
            text: "Show Icon"
            checked: true
            id: _showIconSwitch
            onCheckedChanged: if(!checked && !_displaySwitch.checked) _displaySwitch.checked = true
          } // SwitchDelegate

          Qaterial.FixedTabBar
          {
            id: _tabBar
            Layout.fillWidth: true
            currentIndex: _swipeView.currentIndex
            onPrimary: true
            enabled: _root.enabled

            display: _displaySwitch.checked && _showIconSwitch.checked ? AbstractButton.TextUnderIcon :
                _showIconSwitch.checked ? AbstractButton.IconOnly : AbstractButton.TextOnly

            model: ListModel
            {
              ListElement { text: "Explore"; source: "/QaterialGallery/images/icons/compass.svg"}
              ListElement { text: "Flights"; source: "/QaterialGallery/images/icons/airplane.svg"}
              ListElement { text: "Trips"; source: "/QaterialGallery/images/icons/briefcase.svg"}
            } // ListModel
          } // TabBar
        } // ColumnLayout
      } // ToolBar

      Qaterial.SwipeView
      {
        id: _swipeView
        anchors.fill: parent
        currentIndex: _tabBar.currentIndex
        interactive: _root.enabled

        Item
        {
          width: _swipeView.width
          height: _swipeView.height

          Qaterial.Label
          {
            anchors.centerIn: parent
            text: "Explore View"
            textType: Qaterial.Style.TextType.Display1
            color: "#FFF44336"
          } // Label
        } // Item

        Item
        {
          width: _swipeView.width
          height: _swipeView.height

          Qaterial.Label
          {
            anchors.centerIn: parent
            text: "Flight View"
            textType: Qaterial.Style.TextType.Display1
            color: "#FFE91E63"
          } // Label
        } // Item

        Item
        {
          width: _swipeView.width
          height: _swipeView.height

          Qaterial.Label
          {
            anchors.centerIn: parent
            text: "Trips View"
            textType: Qaterial.Style.TextType.Display1
            color: "#FF9C27B0"
          } // Label
        } // Item
      } // SwipeView
    } // Page
  } // Pane
} // Page
