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
    AppBarContent { anchors.fill: parent; title: "App Bar Bottom" } // AppBarContent
  } // AppBar

  footer: Qaterial.ToolBar
  {
    Row
    {
      anchors.verticalCenter: parent.verticalCenter
      spacing: 0

      Qaterial.AppBarButton
      {
        icon.source: "qrc:/QaterialGallery/images/icons/menu.svg"
        onPrimary: true
      } // AppBarButton

      Qaterial.AppBarButton
      {
        icon.source: "qrc:/QaterialGallery/images/icons/settings.svg"
        onPrimary: true
      } // AppBarButton
    } // Row
  } // AppBar
} // Page
