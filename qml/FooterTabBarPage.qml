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
  id: _root
  property bool enabled: true

  Qaterial.Pane
  {
    padding: 0

    elevation: 20
    anchors.centerIn: parent
    width: parent.width - 30
    height: parent.height - 40
    implicitHeight: height

    Qaterial.Page
    {
      clip: true
      width: parent.width
      implicitWidth: width
      height: parent.height

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
            text: "Footer Tab Bar"
            textType: Qaterial.Style.TextType.Title
            elide: Label.ElideRight
          } // Label

          Qaterial.SwitchDelegate
          {
            Layout.fillWidth: true
            onPrimary: true
            text: "Hint Text"
            checked: true
            id: _displaySwitch
          } // SwitchDelegate
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
            text: "Favorites View"
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
            text: "Music View"
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
            text: "Album View"
            textType: Qaterial.Style.TextType.Display1
            color: "#FF9C27B0"
          } // Label
        } // Item

        Item
        {
          width: _swipeView.width
          height: _swipeView.height

          Qaterial.Label
          {
            anchors.centerIn: parent
            text: "Settings View"
            textType: Qaterial.Style.TextType.Display1
            color: "#FF673AB7"
          } // Label
        } // Item
      } // SwipeView

      footer: Qaterial.FixedTabBar
      {
        id: _tabBar
        width: parent.width
        currentIndex: _swipeView.currentIndex
        onPrimary: true
        enabled: _root.enabled
        hintText: _displaySwitch.checked
        useSmallFont: true

        model: ListModel
        {
          ListElement{ text: "Favorites"; source: "/QaterialGallery/images/icons/heart.svg" }
          ListElement{ text: "Music"; source: "/QaterialGallery/images/icons/music-note.svg" }
          ListElement{ text: "Albums"; source: "/QaterialGallery/images/icons/album.svg" }
          ListElement{ text: "Settings"; source: "/QaterialGallery/images/icons/settings.svg" }
        } // ListModel
      } // FixedTabBar
    } // Page
  } // Pane
} // Page
