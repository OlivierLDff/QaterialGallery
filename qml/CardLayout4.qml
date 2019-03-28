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

    contentItem: ColumnLayout
    {
        id: _column
        width: parent.width
        spacing: 0

        CardMedia
        {
            height: MaterialStyle.dense ? 134 : 168
            width: MaterialStyle.dense ? 134 : 168
            //sourceSize.width: MaterialStyle.dense ? 134 : 168
            //sourceSize.height: MaterialStyle.dense ? 134 : 168
            source: control.media
            clipTop: true
            Layout.fillWidth: true
            Layout.maximumWidth: MaterialStyle.dense ? 134 : 168
        }

        RowLayout
        {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            SquareButton
            {
                foregroundColor: MaterialStyle.secondaryTextColor()
                Layout.alignment: Qt.AlignHCenter
                icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/heart.svg"
            } // SquareButton

            SquareButton
            {
                foregroundColor: MaterialStyle.secondaryTextColor()
                Layout.alignment: Qt.AlignHCenter
                icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/pencil.svg"
            } // SquareButton

            SquareButton
            {
                foregroundColor: MaterialStyle.secondaryTextColor()
                Layout.alignment: Qt.AlignHCenter
                icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/plus.svg"
            } // SquareButton
        } // RowLayout
    } // ColumnLayout
}