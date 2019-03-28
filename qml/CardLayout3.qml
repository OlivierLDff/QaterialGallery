/** Copyright (C) Olivier Le Doeuff 2019 
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import QQuickMaterialHelper.Components 1.12
import QQuickMaterialHelper.Core 1.12
import QQuickMaterialHelper.Style 1.12

Card
{
    id: control
    property alias button1: _button1
    property alias button2: _button2

    property bool drawline: MaterialStyle.debug.drawDebugButton

    contentItem: ColumnLayout
    {
        id: _column
        width: parent.width
        spacing: MaterialStyle.card.verticalPadding

        RowLayout
        {
            Layout.topMargin: MaterialStyle.card.horizontalPadding
            ColumnLayout
            {
                Layout.fillWidth: true
                Label
                {
                    text: control.headerText
                    elide: Text.ElideRight
                    textType: MaterialStyle.TextType.Heading
                    //padding: MaterialStyle.card.horizontalPadding
                    Layout.leftMargin: MaterialStyle.card.horizontalPadding
                    Layout.rightMargin: MaterialStyle.card.horizontalPadding
                    Layout.fillWidth: true
                } // Label

                CardSupportingText
                {
                    supportingText: control.supportingText
                    Layout.leftMargin: MaterialStyle.card.horizontalPadding
                    Layout.rightMargin: MaterialStyle.card.horizontalPadding
                    Layout.topMargin: 2
                    Layout.bottomMargin: 2
                    Layout.fillWidth: true                
                } // CardSupportingText
            } // ColumnLayout

            Image
            {
                source: control.media
                Layout.maximumWidth: MaterialStyle.dense ? 64 : 80
                Layout.maximumHeight: MaterialStyle.dense ? 64 : 80
                Layout.rightMargin: MaterialStyle.card.horizontalPadding
            } // Image
        }

        Row
        {
            Layout.leftMargin: MaterialStyle.card.verticalPadding
            Layout.rightMargin: MaterialStyle.card.verticalPadding

            FlatButton
            {
                id: _button1
                visible: text != ""
            } // FlatButton

            FlatButton
            {
                id: _button2
                visible: text != ""
            } // FlatButton
        } // Row
    } // ColumnLayout
}