/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Layouts 1.12

// Qaterial
import Qaterial 1.0 as Qaterial

Qaterial.Card
{
  id: _control
  property alias button1: _button1
  property alias button2: _button2
  property alias button3: _button3
  property alias button4: _button4

  property bool drawline: Qaterial.Style.debug.drawDebugButton

  contentItem: ColumnLayout
  {
    id: _column
    width: parent.width
    spacing: Qaterial.Style.card.horizontalPadding

    Qaterial.CardRoundThumbnailTitle
    {
      headerText: _control.headerText
      subHeaderText: _control.subHeaderText
      thumbnail: _control.thumbnail
      Layout.topMargin: Qaterial.Style.card.horizontalPadding
      Layout.leftMargin: Qaterial.Style.card.horizontalPadding
      Layout.rightMargin: Qaterial.Style.card.horizontalPadding
      Layout.fillWidth: true
    } // CardRoundThumbnailTitle

    Qaterial.CardMedia
    {
      source: _control.media
      Layout.fillWidth: true
    } // CardMedia

    Qaterial.CardSupportingText
    {
      supportingText: _control.supportingText
      Layout.leftMargin: Qaterial.Style.card.horizontalPadding
      Layout.rightMargin: Qaterial.Style.card.horizontalPadding
      Layout.topMargin: 2
      Layout.bottomMargin: 2
      Layout.fillWidth: true
    } // CardSupportingText

    Item
    {
      Layout.leftMargin: Qaterial.Style.card.horizontalPadding
      Layout.rightMargin: Qaterial.Style.card.verticalPadding
      Layout.fillWidth: true
      implicitHeight: _button1.implicitHeight
      implicitWidth: 200

      Qaterial.FlatButton
      {
        id: _button1
        visible: text != ""
        anchors.left: parent.left
      } // FlatButton

      Qaterial.FlatButton
      {
        id: _button2
        visible: text != ""
        anchors.left: _button1.right
      } // FlatButton

      Qaterial.SquareButton
      {
        id: _button3
        foregroundColor: Qaterial.Style.secondaryTextColor()
        visible: icon.source != ""
        anchors.right: _button4.left
      } // SquareButton

      Qaterial.SquareButton
      {
        id: _button4
        visible: icon.source != ""
        foregroundColor: Qaterial.Style.secondaryTextColor()
        anchors.right: parent.right
      } // SquareButton
    } // Item
  } // ColumnLayout
} // Card
