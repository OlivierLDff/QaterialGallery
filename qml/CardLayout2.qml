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
    property alias button3: _button3
    property alias button4: _button4

    property bool drawline: Style.debug.drawDebugButton

    contentItem: ColumnLayout
    {
        id: _column
        width: parent.width
        spacing: Style.card.horizontalPadding

        CardRoundThumbnailTitle
        {
            headerText: control.headerText
            subHeaderText: control.subHeaderText
            thumbnail: control.thumbnail
            Layout.topMargin: Style.card.horizontalPadding
            Layout.leftMargin: Style.card.horizontalPadding
            Layout.rightMargin: Style.card.horizontalPadding
            Layout.fillWidth: true
        }

        CardMedia
        {
            source: control.media
            Layout.fillWidth: true
        }

        CardSupportingText
        {
            supportingText: control.supportingText
            Layout.leftMargin: Style.card.horizontalPadding
            Layout.rightMargin: Style.card.horizontalPadding
            Layout.topMargin: 2
            Layout.bottomMargin: 2
            Layout.fillWidth: true
        }

        Item
        {
            Layout.leftMargin: Style.card.horizontalPadding
            Layout.rightMargin: Style.card.verticalPadding
            Layout.fillWidth: true
            implicitHeight: _button1.implicitHeight
            implicitWidth: 200

            FlatButton
            {
                id: _button1
                visible: text != ""
                anchors.left: parent.left
            } // FlatButton

            FlatButton
            {
                id: _button2
                visible: text != ""
                anchors.left: _button1.right
            } // FlatButton

            SquareButton
            {
                id: _button3
                foregroundColor: Style.secondaryTextColor()
                visible: icon.source != ""
                anchors.right: _button4.left
            } // SquareButton

            SquareButton
            {
                id: _button4
                visible: icon.source != ""
                foregroundColor: Style.secondaryTextColor()
                anchors.right: parent.right
            } // SquareButton
        } // Item
    } // ColumnLayout
}