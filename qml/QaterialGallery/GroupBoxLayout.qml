/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12

// Qterial
import Qaterial 1.0 as Qaterial

Qaterial.GroupBox
{
  title: "Title"

  property alias columnWidth: _column.width
  property alias button: _button

  Column
  {
    id: _column
    spacing: 0

    Qaterial.RadioButton
    {
      text: "Neque porro quisquam"
      checked: true
      width: parent.width
    } // RadioButton

    Qaterial.RadioButton
    {
      id: _button
      text: "Dolorem"
      width: parent.width
    } // RadioButton

    Qaterial.RadioButton
    {
      text: "Sit amet, consectetur"
      width: parent.width
    } // RadioButton
  } // Column
} // GroupBox
