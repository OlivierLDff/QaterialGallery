/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Layouts 1.12

// Qaterial
import Qaterial 1.0 as Qaterial

Qaterial.Page
{
  id: _page

  header: Qaterial.ToolBar
  {
    AppBarContent { anchors.fill: parent;
      title: "Menu Tab Bar" } // AppBarContent
  } // ToolBar

  ColumnLayout
  {
    spacing: 0
    width: parent.width

    Qaterial.SwitchDelegate
    {
      text: "Display Menu"
      Layout.fillWidth: true
      onCheckedChanged: window.menuBar.visible = checked
      Component.onCompleted: checked = true
    } // SwitchDelegate

    Qaterial.SwitchDelegate
    {
      text: "onPrimary"
      Layout.fillWidth: true
      onCheckedChanged: window.menuBar.onPrimary = checked
      Component.onCompleted: checked = true
    } // SwitchDelegate
  } // ColumnLayout
} // Page
