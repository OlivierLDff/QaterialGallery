/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Layouts 1.12

// Qaterial
import Qaterial 1.0 as Qaterial

RowLayout
{
  id: root

  property alias text: captionLabel.text
  property alias font: label.font
  property bool enabled: true

  Qaterial.LabelCaption
  {
    id: captionLabel
    Layout.preferredWidth: 65
    enabled: root.enabled
  } // Label

  Qaterial.Label
  {
    id: label
    text: root.text + " " + font.pixelSize + "sp"
    enabled: root.enabled
  } // Label
} // RowLayout
