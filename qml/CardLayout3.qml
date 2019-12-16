/** Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12
import QtQuick.Layouts 1.12

import Qaterial 1.0

Card
{
    id: control
    property alias button1: _button1
    property alias button2: _button2

    property bool drawline: Style.debug.drawDebugButton

    contentItem: ColumnLayout
    {
        id: _column
        width: parent.width
        spacing: Style.card.verticalPadding

        RowLayout
        {
            Layout.topMargin: Style.card.horizontalPadding
            ColumnLayout
            {
                Layout.fillWidth: true
                Label
                {
                    text: control.headerText
                    elide: Text.ElideRight
                    textType: Style.TextType.Heading
                    //padding: Style.card.horizontalPadding
                    Layout.leftMargin: Style.card.horizontalPadding
                    Layout.rightMargin: Style.card.horizontalPadding
                    Layout.fillWidth: true
                } // Label

                CardSupportingText
                {
                    supportingText: control.supportingText
                    Layout.leftMargin: Style.card.horizontalPadding
                    Layout.rightMargin: Style.card.horizontalPadding
                    Layout.topMargin: 2
                    Layout.bottomMargin: 2
                    Layout.fillWidth: true
                } // CardSupportingText
            } // ColumnLayout

            Image
            {
                source: control.media
                Layout.maximumWidth: Style.dense ? 64 : 80
                Layout.maximumHeight: Style.dense ? 64 : 80
                Layout.rightMargin: Style.card.horizontalPadding
            } // Image
        }

        Row
        {
            Layout.leftMargin: Style.card.verticalPadding
            Layout.rightMargin: Style.card.verticalPadding

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