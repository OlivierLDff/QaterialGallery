/** Copyright (C) Olivier Le Doeuff 2019 
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import QQuickMaterialHelper.Components 1.12
import QQuickMaterialHelper.Style 1.12

RowLayout 
{
    Layout.fillWidth: true
    Layout.preferredHeight: MaterialStyle.toolbar.implicitHeight
    property alias title: titleLabel.text

    AppBarButton 
    {
        id: _backButton
        icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/arrow-left.svg"
        onClicked:  stackView.pop()
        visible: stackView.depth > 1
        onPrimary: true
    } // ToolButton

    Label 
    {
        id: titleLabel

        Layout.fillWidth: true
        Layout.leftMargin: !_backButton.visible ? 20 : undefined
        onPrimary: true

        text: "Default text"
        textType: MaterialStyle.TextType.Title
        elide: Label.ElideRight
    } // Label

    AppBarButton 
    {
        icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/palette.svg"
        onPrimary: true
        onClicked:  themeDialog.open()
    } // ToolButton
} // RowLayout
