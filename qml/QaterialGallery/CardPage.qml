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
    AppBarContent
    {
      anchors.fill: parent;
      title: "Cards"
    } // AppBarContent
  } // ToolBar

  Flickable
  {
    //anchors.fill: parent
    width: parent.width
    height: parent.height
    anchors.horizontalCenter: parent.horizontalCenter
    contentHeight: _pane.implicitHeight
    flickableDirection: Flickable.AutoFlickIfNeeded

    Qaterial.Pane
    {
      id: _pane
      width: Math.min(parent.width, 500)
      anchors.horizontalCenter: parent.horizontalCenter
      padding: 16

      ColumnLayout
      {
        anchors.fill: parent
        spacing: _pane.padding

        CardLayout3
        {
          Layout.fillWidth: true
          media: "qrc:/QaterialGallery/images/card80x80_1.png"
          headerText: "Title goes here"
          supportingText: "Cards contain content and actions about a single subject."
          button1.text: "Action 1"
          button2.text: "Action 2"
        } // CardLayout3

        CardLayout1
        {
          Layout.fillWidth: true
          media: "qrc:/QaterialGallery/images/card344x194_2.png"
          headerText: "Our Changing Planet"
          subHeaderText: "by Kurt Wagner"
          supportingText: "Visit ten places on our planet that are undergoing the biggest changes today."
          button1.text: "Read"
          button2.text: "Bookmark"
          button3.icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
          button4.icon.source: "qrc:/QaterialGallery/images/icons/heart.svg"
        } // CardLayout1

        CardLayout2
        {
          Layout.fillWidth: true
          media: "qrc:/QaterialGallery/images/card344x194_3.png"
          thumbnail: "qrc:/QaterialGallery/images/card40x40.png"
          headerText: "Title goes here"
          subHeaderText: "Secondary Text"
          supportingText:
            "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit."
          button1.text: "Action 1"
          button2.text: "Action 2"
        } // CardLayout2

        ListView
        {
          model: 5
          cacheBuffer: 5
          Layout.fillWidth: true
          spacing: Qaterial.Style.card.horizontalPadding
          orientation: ListView.Horizontal
          implicitHeight: 220
          delegate: CardLayout4
          {
            media: "qrc:/QaterialGallery/images/card168x168_" + (5 - index) + ".png"
          } // CardLayout4
        } // ListView

        CardLayout3
        {
          Layout.fillWidth: true
          outlined: true
          media: "qrc:/QaterialGallery/images/card80x80_2.png"
          headerText: "Title goes here"
          supportingText: "Secondary Text Lorem ipsum dolor sit amet"
          button1.text: "Action 1"
          button2.text: "Action 2"
        } // CardLayout3

        CardLayout1
        {
          Layout.fillWidth: true
          outlined: true
          media: "qrc:/QaterialGallery/images/card344x194_1.png"
          headerText: "Our Changing Planet"
          subHeaderText: "by Kurt Wagner"
          supportingText: "Visit ten places on our planet that are undergoing the biggest changes today."
          button1.text: "Read"
          button2.text: "Bookmark"
          button3.icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
          button4.icon.source: "qrc:/QaterialGallery/images/icons/heart.svg"
        } // CardLayout1

        ListView
        {
          model: 5
          cacheBuffer: 5
          Layout.fillWidth: true
          spacing: Qaterial.Style.card.horizontalPadding
          orientation: ListView.Horizontal
          implicitHeight: 220
          delegate: CardLayout4
          {
            media: "qrc:/QaterialGallery/images/card168x168_" + (index + 1) + ".png"
            outlined: true
          } // CardLayout4
        } // ListView
      } // ColumnLayout
    } // Pane
    ScrollIndicator.vertical: Qaterial.ScrollIndicator {}
  } // Flickable
} // Page
