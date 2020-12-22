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

  property bool drawline: Qaterial.Style.debug.drawDebugButton

  contentItem: ColumnLayout
  {
    id: _column
    width: parent.width
    spacing: Qaterial.Style.card.verticalPadding

    RowLayout
    {
      Layout.topMargin: Qaterial.Style.card.horizontalPadding

      ColumnLayout
      {
        Layout.fillWidth: true

        Qaterial.LabelHeadline5
        {
          text: _control.headerText
          elide: Text.ElideRight
          //padding: Qaterial.Style.card.horizontalPadding
          Layout.leftMargin: Qaterial.Style.card.horizontalPadding
          Layout.rightMargin: Qaterial.Style.card.horizontalPadding
          Layout.fillWidth: true
        } // Label

        Qaterial.CardSupportingText
        {
          supportingText: _control.supportingText
          Layout.leftMargin: Qaterial.Style.card.horizontalPadding
          Layout.rightMargin: Qaterial.Style.card.horizontalPadding
          Layout.topMargin: 2
          Layout.bottomMargin: 2
          Layout.fillWidth: true
        } // CardSupportingText
      } // ColumnLayout

      Image
      {
        source: _control.media
        Layout.maximumWidth: Qaterial.Style.dense ? 64 : 80
        Layout.maximumHeight: Qaterial.Style.dense ? 64 : 80
        Layout.rightMargin: Qaterial.Style.card.horizontalPadding
      } // Image
    } // RowLayout

    Row
    {
      Layout.leftMargin: Qaterial.Style.card.verticalPadding
      Layout.rightMargin: Qaterial.Style.card.verticalPadding

      Qaterial.FlatButton
      {
        id: _button1
        visible: text != ""
      } // FlatButton

      Qaterial.FlatButton
      {
        id: _button2
        visible: text != ""
      } // FlatButton
    } // Row
  } // ColumnLayout
} // Card
