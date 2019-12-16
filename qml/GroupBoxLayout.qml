/** Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12

import Qaterial 1.0

GroupBox
{
    title: "Title"

    property alias columnWidth: _column.width
    property alias button: _button

    Column
    {
        id: _column
        spacing: 0

        RadioButton
        {
            text: "Neque porro quisquam"
            checked: true
            width: parent.width
        }
        RadioButton
        {
            id: _button
            text: "Dolorem"
            width: parent.width
        }
        RadioButton
        {
            text: "Sit amet, consectetur"
            width: parent.width
        }
    }
}