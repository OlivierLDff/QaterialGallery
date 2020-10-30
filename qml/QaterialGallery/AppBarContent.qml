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
  Layout.fillWidth: true
  Layout.preferredHeight: Qaterial.Style.toolbar.implicitHeight
  property alias title: _titleLabel.text

  Qaterial.AppBarButton
  {
    id: _backButton
    icon.source: "qrc:/QaterialGallery/images/icons/arrow-left.svg"
    onClicked: stackView.pop()
    visible: stackView.depth > 1
    onPrimary: true
  } // AppBarButton

  Qaterial.Label
  {
    id: _titleLabel

    Layout.fillWidth: true
    Layout.leftMargin: !_backButton.visible ? 20 : undefined
    onPrimary: true

    text: "Default text"
    textType: Qaterial.Style.TextType.Title
    elide: Qaterial.Label.ElideRight
  } // Label

  Qaterial.AppBarButton
  {
    icon.source: "qrc:/QaterialGallery/images/icons/palette.svg"
    onPrimary: true
    onClicked: themeDialog.open()
  } // AppBarButton
} // RowLayout
