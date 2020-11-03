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

Qaterial.ScrollablePage
{
  id: _page

  header: Qaterial.ToolBar
  {
    AppBarContent
    {
      anchors.fill: parent;
      title: "Frame"
    } // AppBarContent
  } // ToolBar

  readonly property int itemWidth: Math.max(button.implicitWidth, Math.min(button.implicitWidth * 3, _page
    .availableWidth / 3 * 2))

  pane.padding: 16

  Column
  {
    spacing: 40
    width: parent.width

    Qaterial.Label
    {
      width: parent.width
      wrapMode: Label.Wrap
      horizontalAlignment: Qt.AlignHCenter
      text: "Frame is used to layout a logical group of controls together, within a visual frame."
    } // Label

    Qaterial.Frame
    {
      anchors.horizontalCenter: parent.horizontalCenter

      Column
      {
        spacing: 0
        width: _page.itemWidth

        Qaterial.RadioButton
        {
          text: "First"
          checked: true
          width: parent.width
        } // RadioButton

        Qaterial.RadioButton
        {
          id: button
          text: "Second"
          width: parent.width
        } // RadioButton

        Qaterial.RadioButton
        {
          text: "Third"
          width: parent.width
        } // RadioButton
      } // Column
    } // Frame
  } // Column
} // ScrollablePage
