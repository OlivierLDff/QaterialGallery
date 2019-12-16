/** Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12
import QtQuick.Layouts 1.12

import Qaterial 1.0

Card
{
    id: control

    contentItem: ColumnLayout
    {
        id: _column
        width: parent.width
        spacing: 0

        CardMedia
        {
            height: Style.dense ? 134 : 168
            width: Style.dense ? 134 : 168
            //sourceSize.width: Style.dense ? 134 : 168
            //sourceSize.height: Style.dense ? 134 : 168
            source: control.media
            clipTop: true
            Layout.fillWidth: true
            Layout.maximumWidth: Style.dense ? 134 : 168
        }

        RowLayout
        {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            SquareButton
            {
                foregroundColor: Style.secondaryTextColor()
                Layout.alignment: Qt.AlignHCenter
                icon.source: "qrc:/QaterialGallery/images/icons/heart.svg"
            } // SquareButton

            SquareButton
            {
                foregroundColor: Style.secondaryTextColor()
                Layout.alignment: Qt.AlignHCenter
                icon.source: "qrc:/QaterialGallery/images/icons/pencil.svg"
            } // SquareButton

            SquareButton
            {
                foregroundColor: Style.secondaryTextColor()
                Layout.alignment: Qt.AlignHCenter
                icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
            } // SquareButton
        } // RowLayout
    } // ColumnLayout
}