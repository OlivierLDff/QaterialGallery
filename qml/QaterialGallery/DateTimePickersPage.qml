/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Layouts 1.12

// Qaterial
import Qaterial 1.0 as Qaterial

Qaterial.Page
{
  id: root

  header: Qaterial.ToolBar
  {
    AppBarContent
    {
      anchors.fill: parent;
      title: "Date / Time Pickers"
    } // AppBarContent
  } // ToolBar

  Qaterial.SwipeView
  {
    id: _swipeView
    anchors.fill: parent
    currentIndex: _tabBar.currentIndex

    Qaterial.ScrollablePage
    {
      width: _swipeView.width
      height: _swipeView.height
      bottomPadding: 0

      ColumnLayout
      {
        width: parent.width

        Qaterial.Label
        {
          Layout.fillWidth: true
          Layout.bottomMargin: 50
          Layout.alignment: Qt.AlignTop

          wrapMode: Text.Wrap
          horizontalAlignment: Text.AlignHCenter
          elide: Text.ElideRight
          maximumLineCount: 3

          text:
            "TextFieldTimePicker allows the user to select an hour by editing the text in the field or by picking an hour in a TimePickerDialog."
        } // Label

        Qaterial.LabelBody1
        {
          Layout.fillWidth: true
          Layout.alignment: Qt.AlignTop
          horizontalAlignment: Text.AlignHCenter

          text: "Simple EU Time Picker Dialog"
        } // Label
        Qaterial.Button
        {
          Layout.alignment: Qt.AlignHCenter
          Layout.bottomMargin: 50
          text: "TimePickerDialog"
          onClicked: Qaterial.DialogManager.openFromComponent(_TimePickerDialog)
          Component
          {
            id: _TimePickerDialog
            Qaterial.TimePickerDialog
            {
              onAccepted: () => Qaterial.SnackbarManager
                .show({ text: `Simple EU Dialog Picker : User picked ${hour}:${minute}` })
              Component.onCompleted: open()
            } // TimePickerDialog
          } // Component
        } // Button

        Qaterial.LabelBody1
        {
          Layout.fillWidth: true
          Layout.alignment: Qt.AlignTop
          horizontalAlignment: Text.AlignHCenter

          text: "AM/PM TextFieldTimePicker"
        } // Label
        Qaterial.TextFieldTimePicker
        {
          Layout.alignment: Qt.AlignHCenter
          Layout.bottomMargin: 50
          Layout.preferredWidth: 250

          onHourAccepted: (hour, minute, am) => Qaterial.SnackbarManager
            .show({ text: `AM Picker : User picked ${hour}:${minute} ${styleAm ? (am ? "AM" : "PM") : ""}` })
        } // TextFieldTimePicker

        Qaterial.LabelBody1
        {
          Layout.fillWidth: true
          Layout.alignment: Qt.AlignTop
          horizontalAlignment: Text.AlignHCenter

          text: "EU TextFieldTimePicker"
        } // Label
        Qaterial.TextFieldTimePicker
        {
          Layout.alignment: Qt.AlignHCenter
          Layout.preferredWidth: 250

          styleAm: false

          onHourAccepted: (hour, minute, am) => Qaterial.SnackbarManager
            .show({ text: `EU Picker : User picked ${hour}:${minute}` })
        } // TextFieldTimePicker
      } // ColumnLayout
    } // ScrollablePage
    Qaterial.ScrollablePage
    {
      width: _swipeView.width
      height: _swipeView.height
      bottomPadding: 0
      ColumnLayout
      {
        width: parent.width

        Qaterial.Label
        {
          Layout.fillWidth: true
          Layout.bottomMargin: 50
          Layout.alignment: Qt.AlignTop

          wrapMode: Text.Wrap
          horizontalAlignment: Text.AlignHCenter
          elide: Text.ElideRight
          maximumLineCount: 3

          text:
            "TextFieldDatePicker allows the user to select a date by editing the text in the field or by picking in a DatePickerDialog."
        } // Label

        Qaterial.LabelBody1
        {
          Layout.fillWidth: true
          Layout.alignment: Qt.AlignTop
          horizontalAlignment: Text.AlignHCenter

          text: "Simple Date Picker Dialog"
        } // Label
        Qaterial.Button
        {
          Layout.alignment: Qt.AlignHCenter
          Layout.bottomMargin: 50
          text: "DatePickerDialog"
          onClicked: Qaterial.DialogManager.openFromComponent(_DatePickerDialog)
          Component
          {
            id: _DatePickerDialog
            Qaterial.DatePickerDialog
            {
              month: Qaterial.Calendar.Month.June
              year: 2020

              onAccepted: (date) => console.log(`Simple Dialog Date Picker : User picked ${date.toString()}`)
              Component.onCompleted: open()
            }
          } // Component
        } // Button

        Qaterial.LabelBody1
        {
          Layout.fillWidth: true
          Layout.alignment: Qt.AlignTop
          horizontalAlignment: Text.AlignHCenter

          text: "TextFieldDatePicker"
        } // Label
        Qaterial.TextFieldDatePicker
        {
          Layout.alignment: Qt.AlignHCenter
          Layout.preferredWidth: 250

          from: new Date(1900, 0, 1)
          to: new Date(2099, 11, 31)
          date: new Date(2020, 6, 6)
        }
      } // ColumnLayout
    } // ScrollablePage
  } // SwipeView

  footer: Qaterial.FixedTabBar
  {
    id: _tabBar
    elevation: 20
    currentIndex: _swipeView.currentIndex

    model: ListModel
    {
      ListElement { text: "Time" }
      ListElement { text: "Date" }
    } // ListModel
  } // ScrollableTabBar
} // Page
