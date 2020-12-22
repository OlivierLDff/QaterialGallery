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

          Qaterial.LabelHeadline6
          {
            id: _titleLabel

            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            onPrimary: true
            Layout.topMargin: (Qaterial.Style.toolbar.implicitHeight - implicitHeight) / 2
            Layout.bottomMargin: (Qaterial.Style.toolbar.implicitHeight - implicitHeight) / 2
            text: "Footer Tab Bar"
            elide: Label.ElideRight
          } // Label

          Qaterial.SwitchDelegate
          {
            id: _displaySwitch
            Layout.fillWidth: true
            onPrimary: true
            text: "Hint Text"
            checked: true
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

          Qaterial.LabelHeadline4
          {
            anchors.centerIn: parent
            text: "Favorites View"
            color: "#FFF44336"
          } // Label
        } // Item

        Item
        {
          width: _swipeView.width
          height: _swipeView.height

          Qaterial.LabelHeadline4
          {
            anchors.centerIn: parent
            text: "Music View"
            color: "#FFE91E63"
          } // Label
        } // Item

        Item
        {
          width: _swipeView.width
          height: _swipeView.height

          Qaterial.LabelHeadline4
          {
            anchors.centerIn: parent
            text: "Album View"
            color: "#FF9C27B0"
          } // Label
        } // Item

        Item
        {
          width: _swipeView.width
          height: _swipeView.height

          Qaterial.LabelHeadline4
          {
            anchors.centerIn: parent
            text: "Settings View"
            color: "#FF673AB7"
          } // Label
        } // Item
      } // SwipeView

      footer: Qaterial.TabBar
      {
        id: _tabBar
        width: parent.width
        currentIndex: _swipeView.currentIndex
        enabled: _root.enabled


        Repeater
        {
          id: _repeater

          model: ListModel
          {
            ListElement { text: "Favorites";source: "qrc:/QaterialGallery/images/icons/heart.svg" }
            ListElement { text: "Music";source: "qrc:/QaterialGallery/images/icons/music-note.svg" }
            ListElement { text: "Albums";source: "qrc:/QaterialGallery/images/icons/album.svg" }
            ListElement { text: "Settings";source: "qrc:/QaterialGallery/images/icons/settings.svg" }
          } // ListModel

          delegate: Qaterial.TabButton
          {
            width: _tabBar.width / model.count
            implicitWidth: width
            text: model.text ? model.text : ""
            icon.source: model.source ? model.source : ""
            spacing: 4
            enabled: _root.enabled
            display: (index === _tabBar.currentIndex || !_displaySwitch.checked) ? AbstractButton.TextUnderIcon : AbstractButton.IconOnly
            font: Qaterial.Style.textTheme.overline
          } // TabButton
        } // Repeater

      } // FixedTabBar
    } // Page
  } // Pane
} // Page
