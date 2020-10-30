/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

// Qtaerial
import Qaterial 1.0 as Qaterial

Qaterial.Page
{

  id: _page

  header: Qaterial.ToolBar
  {
    AppBarContent { anchors.fill: parent;
      title: "Floating Action Buttons" } // AppBarContent
  } // ToolBar

  Qaterial.SwipeView
  {
    id: _swipeView
    anchors.fill: parent
    currentIndex: _tabBar.currentIndex

    Qaterial.ScrollablePage
    {
      width: _swipeView.width
      height: _swipeView.height
      bottomPadding: 0

      Qaterial.Pane
      {
        anchors.fill: parent

        ColumnLayout
        {
          width: parent.width
          spacing: 10

          Column
          {
            Layout.fillWidth: true

            Qaterial.SwitchDelegate
            {
              id: _enabledSwitch
              text: "Enabled"
              checked: true
              width: parent.width
            } // SwitchDelegate

            Qaterial.SwitchDelegate
            {
              id: _scaleSwitch
              text: "Scale"
              checked: true
              width: parent.width
            } // SwitchDelegate
          } // Column

          Qaterial.Label
          {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop

            wrapMode: Label.Wrap
            text: "A floating action button (FAB) represents the primary action of a screen."
            padding: 16
            horizontalAlignment: Text.AlignHCenter
          } // Label

          Qaterial.Label
          {
            text: "Mini Fab"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          RowLayout
          {
            Layout.alignment: Qt.AlignHCenter
            spacing: 15

            Qaterial.MiniFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
              Layout.alignment: Qt.AlignHCenter
              flat: false
              highlighted: true
              enabled: _enabledSwitch.checked
              enabledScale: _scaleSwitch.checked
            } // MiniFabButton

            Qaterial.MiniFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/pencil.svg"
              Layout.alignment: Qt.AlignHCenter
              flat: false
              enabled: _enabledSwitch.checked
              enabledScale: _scaleSwitch.checked
            } // MiniFabButton

            Qaterial.MiniFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/content-copy.svg"
              Layout.alignment: Qt.AlignHCenter
              highlighted: true
              enabled: _enabledSwitch.checked
              enabledScale: _scaleSwitch.checked
            } // MiniFabButton

            Qaterial.MiniFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/crosshairs-gps.svg"
              Layout.alignment: Qt.AlignHCenter
              enabled: _enabledSwitch.checked
              enabledScale: _scaleSwitch.checked
            } // MiniFabButton
          } // RowLayout

          Qaterial.Label
          {
            text: "Default Fab"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          RowLayout
          {
            Layout.alignment: Qt.AlignHCenter
            spacing: 15

            Qaterial.FabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
              text: "Default"
              Layout.alignment: Qt.AlignHCenter
              enabled: _enabledSwitch.checked
              enabledScale: _scaleSwitch.checked
            } // FabButton

            Qaterial.FabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/pencil.svg"
              Layout.alignment: Qt.AlignHCenter
              highlighted: false
              enabled: _enabledSwitch.checked
              enabledScale: _scaleSwitch.checked
            } // FabButton

            Qaterial.FabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/content-copy.svg"
              Layout.alignment: Qt.AlignHCenter
              flat: true
              enabled: _enabledSwitch.checked
              enabledScale: _scaleSwitch.checked
            } // FabButton

            Qaterial.FabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/crosshairs-gps.svg"
              Layout.alignment: Qt.AlignHCenter
              flat: true
              highlighted: false
              enabled: _enabledSwitch.checked
              enabledScale: _scaleSwitch.checked
            } // FabButton
          } // RowLayout

          Qaterial.Label
          {
            text: "Extended Fab"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          GridLayout
          {
            Layout.alignment: Qt.AlignHCenter
            rowSpacing: 15
            columnSpacing: 15
            columns: 2

            Qaterial.ExtendedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
              text: "Extended"
              Layout.alignment: Qt.AlignHCenter
              enabled: _enabledSwitch.checked
              enabledScale: _scaleSwitch.checked
            } // ExtendedFabButton

            Qaterial.ExtendedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/pencil.svg"
              text: "Extended"
              Layout.alignment: Qt.AlignHCenter
              highlighted: false
              enabled: _enabledSwitch.checked
              enabledScale: _scaleSwitch.checked
            } // ExtendedFabButton

            Qaterial.ExtendedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/content-copy.svg"
              text: "Extended"
              Layout.alignment: Qt.AlignHCenter
              flat: true
              enabled: _enabledSwitch.checked
              enabledScale: _scaleSwitch.checked
            } // ExtendedFabButton

            Qaterial.ExtendedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/crosshairs-gps.svg"
              text: "Extended"
              Layout.alignment: Qt.AlignHCenter
              flat: true
              highlighted: false
              enabled: _enabledSwitch.checked
              enabledScale: _scaleSwitch.checked
            } // ExtendedfabButton
          } // GridLayout

          Qaterial.Label
          {
            text: "Default To Fab"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          Qaterial.ExtendedFabButton
          {
            icon.source: "qrc:/QaterialGallery/images/icons/crosshairs-gps.svg"
            text: "Extended"
            Layout.alignment: Qt.AlignHCenter
            enabled: _enabledSwitch.checked
            extendedOnHovered: true
          } // ExtendedFabButton
        } // ColumnLayout
      } // Page
    } // ScrollablePage

    Qaterial.ScrollablePage
    {
      width: _swipeView.width
      height: _swipeView.height
      bottomPadding: 0

      Qaterial.Pane
      {
        anchors.fill: parent
        padding: 16

        ColumnLayout
        {
          width: parent.width
          spacing: 5

          Qaterial.Label
          {
            text: "Flat Fab Button"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          Row
          {
            Layout.alignment: Qt.AlignHCenter

            Qaterial.FlatFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/thumb-up.svg"
              checkable: true
            } // FlatFabButton

            Qaterial.FlatFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/settings.svg"
            } // FlatFabButton

            Qaterial.FlatFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/heart.svg"
              enabled: false
            } // FlatFabButton
          } // Row

          Qaterial.Label
          {
            text: "Mini Flat Fab Button"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          Row
          {
            Layout.alignment: Qt.AlignHCenter

            Qaterial.MiniFlatFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
              checkable: true
            } // MiniFlatFabButton

            Qaterial.MiniFlatFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/music-note.svg"
            } // MiniFlatFabButton

            Qaterial.MiniFlatFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/wifi.svg"
              enabled: false
            } // MiniFlatFabButton
          } // Row

          Qaterial.Label
          {
            text: "Flat Fab Button (No Clip)"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          Row
          {
            Layout.alignment: Qt.AlignHCenter

            Qaterial.FlatFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/thumb-up.svg"
              checkable: true
              rippleClip: false
            } // FlatFabButton

            Qaterial.FlatFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/heart.svg"
              rippleClip: false
            } // FlatFabButton

            Qaterial.FlatFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/settings.svg"
              enabled: false
              rippleClip: false
            } // FlatFabButton
          } // Row

          Qaterial.Label
          {
            text: "Mini Flat Fab Button (No Clip)"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          Row
          {
            Layout.alignment: Qt.AlignHCenter

            Qaterial.MiniFlatFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/crosshairs-gps.svg"
              checkable: true
              rippleClip: false
            } // MiniFlatFabButton

            Qaterial.MiniFlatFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/content-copy.svg"
              rippleClip: false
            } // MiniFlatFabButton

            Qaterial.MiniFlatFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/heart.svg"
              rippleClip: false
              enabled: false
            } // MiniFlatFabButton
          } // Row

          Qaterial.Label
          {
            text: "Scalable Flat Fab Button"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          Grid
          {
            Layout.alignment: Qt.AlignHCenter
            verticalItemAlignment: Grid.AlignVCenter

            Qaterial.ScalableFlatFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/content-copy.svg"
              checkable: true

            } // ScalableFlatFabButton

            Qaterial.ScalableFlatFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
            } // ScalableFlatFabButton

            Qaterial.ScalableFlatFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/heart.svg"
              enabled: false
            } // ScalableFlatFabButton
          } // Grid

          Qaterial.Label
          {
            text: "Scalable Mini Flat Fab Button"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          Grid
          {
            Layout.alignment: Qt.AlignHCenter
            verticalItemAlignment: Grid.AlignVCenter

            Qaterial.ScalableFlatFabButton
            {
              type: Qaterial.Style.FabType.Mini
              icon.source: "qrc:/QaterialGallery/images/icons/plus-circle-outline.svg"
              checkable: true

            } // ScalableFlatFabButton

            Qaterial.ScalableFlatFabButton
            {
              type: Qaterial.Style.FabType.Mini
              icon.source: "qrc:/QaterialGallery/images/icons/settings.svg"
              rippleClip: true
            } // ScalableFlatFabButton

            Qaterial.ScalableFlatFabButton
            {
              type: Qaterial.Style.FabType.Mini
              icon.source: "qrc:/QaterialGallery/images/icons/heart.svg"
              enabled: false
              rippleClip: true
            } // ScalableFlatFabButton
          } // Grid
        } // ColumnLayout
      } // Pane
    } // ScrollablePage

    Qaterial.ScrollablePage
    {
      width: _swipeView.width
      height: _swipeView.height
      bottomPadding: 0

      Qaterial.Pane
      {
        anchors.fill: parent
        padding: 16

        ColumnLayout
        {
          width: parent.width
          spacing: 5

          Qaterial.Label
          {
            text: "Outlined Fab Button"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          Row
          {
            Layout.alignment: Qt.AlignHCenter

            Qaterial.OutlinedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/airplane.svg"
              checkable: true
            } // OutlinedFabButton

            Qaterial.OutlinedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/album.svg"
            } // OutlinedFabButton

            Qaterial.OutlinedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/compass.svg"
              enabled: false
            } // OutlinedFabButton
          } // Row

          Qaterial.Label
          {
            text: "Mini Outlined Fab Button"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          Row
          {
            Layout.alignment: Qt.AlignHCenter

            Qaterial.MiniOutlinedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/content-copy.svg"
              checkable: true
            } // MiniOutlinedFabButton

            Qaterial.MiniOutlinedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/crosshairs-gps.svg"
            } // MiniOutlinedFabButton

            Qaterial.MiniOutlinedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/format-bold.svg"
              enabled: false
            } // MiniOutlinedFabButton
          } // Row

          Qaterial.Label
          {
            text: "Outlined Fab Button (No Clip)"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          Row
          {
            Layout.alignment: Qt.AlignHCenter

            Qaterial.OutlinedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/heart.svg"
              checkable: true
              rippleClip: false
            } // OutlinedFabButton

            Qaterial.OutlinedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/music-note.svg"
              rippleClip: false
            } // OutlinedFabButton

            Qaterial.OutlinedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/palette.svg"
              enabled: false
              rippleClip: false
            } // OutlinedFabButton
          } // Row

          Qaterial.Label
          {
            text: "Mini Outlined Fab Button (No Clip)"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          Row
          {
            Layout.alignment: Qt.AlignHCenter

            Qaterial.MiniOutlinedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/pencil.svg"
              checkable: true
              rippleClip: false
            } // MiniOutlinedFabButton

            Qaterial.MiniOutlinedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
              rippleClip: false
            } // MiniOutlinedFabButton

            Qaterial.MiniOutlinedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/plus-circle-outline.svg"
              rippleClip: false
              enabled: false
            } // MiniOutlinedFabButton
          } // Row

          Qaterial.Label
          {
            text: "Scalable Outlined Fab Button"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          Grid
          {
            Layout.alignment: Qt.AlignHCenter
            verticalItemAlignment: Grid.AlignVCenter

            Qaterial.ScalableOutlinedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/settings.svg"
              checkable: true

            } // ScalableOutlinedFabButton

            Qaterial.ScalableOutlinedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/wifi.svg"
              rippleClip: true
            } // ScalableOutlinedFabButton

            Qaterial.ScalableOutlinedFabButton
            {
              icon.source: "qrc:/QaterialGallery/images/icons/thumb-up.svg"
              enabled: false
              rippleClip: true
            } // ScalableOutlinedFabButton
          } // Grid

          Qaterial.Label
          {
            text: "Scalable Mini Outlined Fab Button"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            textType: Qaterial.Style.TextType.Body2
          } // Label

          Grid
          {
            Layout.alignment: Qt.AlignHCenter
            verticalItemAlignment: Grid.AlignVCenter

            Qaterial.ScalableOutlinedFabButton
            {
              type: Qaterial.Style.FabType.Mini
              icon.source: "qrc:/QaterialGallery/images/icons/heart.svg"
              checkable: true
            } // ScalableOutlinedFabButton

            Qaterial.ScalableOutlinedFabButton
            {
              type: Qaterial.Style.FabType.Mini
              icon.source: "qrc:/QaterialGallery/images/icons/album.svg"
              rippleClip: true
            } // ScalableOutlinedFabButton

            Qaterial.ScalableOutlinedFabButton
            {
              type: Qaterial.Style.FabType.Mini
              icon.source: "qrc:/QaterialGallery/images/icons/thumb-up.svg"
              enabled: false
              rippleClip: true
            } // ScalableOutlinedFabButton
          } // Row
        } // ColumnLayout
      } // Pane
    } // ScrollablePage

    //    Qaterial.Page
    //    {
    //      width: _swipeView.width
    //      height: _swipeView.height

    //      Qaterial.Label
    //      {
    //        text: "Fab Stack"
    //        anchors.centerIn: parent
    //      } // Label
    //    } // Page
  } // SwipeView

  footer: Qaterial.ScrollableTabBar
  {
    id: _tabBar
    elevation: 20
    currentIndex: _swipeView.currentIndex

    model: ListModel
    {
      ListElement { text: "Fab" }
      ListElement { text: "Flat" }
      ListElement { text: "Outlined" }
      //ListElement{ text: "Stack" }
    } // ListModel
  } // ScrollableTabBar
} // Page
