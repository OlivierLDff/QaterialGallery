/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Controls 2.12

// Qaterial
import Qaterial 1.0 as Qaterial

Qaterial.ScrollablePage
{
  id: _page

  header: Qaterial.ToolBar
  {
    AppBarContent { anchors.fill: parent; title: "Group Box" } // AppBarContent
  } // ToolBar

  pane.padding: 16

  property alias button: _group1.button

  readonly property int itemWidth: Math.max(button.implicitWidth, Math.min(button.implicitWidth * 3, _page.availableWidth / 3 * 2))

  Column
  {
    spacing: 20
    width: parent.width

    Qaterial.Label
    {
      width: parent.width
      wrapMode: Label.Wrap
      horizontalAlignment: Qt.AlignHCenter
      text: "A GroupBox provides a frame, a title on top of it, and a logical group of controls within that frame."
    } // Label

    GroupBoxLayout
    {
      id: _group1
      title: "Inline Title"
      columnWidth: _page.itemWidth
      anchors.horizontalCenter: parent.horizontalCenter
      inlineTitle: true
    } // GroupBoxLayout

    GroupBoxLayout
    {
      title: "Default Title"
      columnWidth: _page.itemWidth
      anchors.horizontalCenter: parent.horizontalCenter
    } // GroupBoxLayout

    GroupBoxLayout
    {
      title: "Caption Inline Title"
      columnWidth: _page.itemWidth
      anchors.horizontalCenter: parent.horizontalCenter
      textType: Qaterial.Style.TextType.Caption
      inlineTitle: true
    } // GroupBoxLayout

    GroupBoxLayout
    {
      title: "Caption Default Title"
      columnWidth: _page.itemWidth
      anchors.horizontalCenter: parent.horizontalCenter
      textType: Qaterial.Style.TextType.Caption
    } // GroupBoxLayout
  } // Column
} // ScrollablePage
