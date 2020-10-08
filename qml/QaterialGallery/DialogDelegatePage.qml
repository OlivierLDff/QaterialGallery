/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Layouts 1.12

// Qaterial
import Qaterial 1.0 as Qaterial

Qaterial.ScrollablePage
{
  header: Qaterial.ToolBar
  {
    AppBarContent { anchors.fill: parent; title: "Dialog Delegates" } // AppBarContent
  } // ToolBar

  pane.padding: 0

  Column
  {
    width: parent.width

    Qaterial.TextFieldDelegate
    {
      id: _textFieldDelegate
      property string dummyText: "Dummy text"
      width: parent.width
      // DELEGATE
      text: "Title of delegate"
      secondaryText: dummyText
      value:dummyText
      icon.source: "qrc:/QaterialGallery/images/icons/account.svg"

      // DIALOG
      selectAllText: true
      title: "Enter some text"

      // TEXT FIELD
      textTitle: "Title"
      placeholderText: "Placeholder"
      helperText: "This a hint"
      validator: RegExpValidator { regExp: /[A-Za-z]+/ }
      inputMethodHints: Qt.ImhSensitiveData
      errorText: length ? ("Don't write more than " + maximumLengthCount + " characters") : "Can't be empty"
      maximumLengthCount: 16
      trailingContent: Qaterial.TextFieldAlertIcon { visible: _textFieldDelegate.errorState } // TextFieldAlertIcon

      onAccepted:
      {
        dummyText = value
      }
      onRejected: console.log("Cancel")
    } // TextFieldDelegate

    Qaterial.TextFieldDelegate
    {
      id: _textFieldDelegate2
      property string dummyText: "Dummy text 2"
      width: parent.width
      // DELEGATE
      text: "Title of delegate"
      secondaryText: dummyText
      value:dummyText
      icon.source: "qrc:/QaterialGallery/images/icons/cake.svg"
      fillIcon: true
      outlinedIcon: true
      highlightedIcon: true
      reverseHighlightIcon: true

      // DIALOG
      selectAllText: true
      title: "Enter some text"

      // TEXT FIELD
      textTitle: "Title"
      placeholderText: "Placeholder"
      helperText: "This a hint"
      validator: RegExpValidator { regExp: /[A-Za-z]+/ }
      inputMethodHints: Qt.ImhSensitiveData
      errorText: length ? ("Don't write more than " + maximumLengthCount + " characters") : "Can't be empty"
      maximumLengthCount: 16
      trailingContent: Qaterial.TextFieldAlertIcon { visible: _textFieldDelegate2.errorState } // TextFieldAlertIcon

      onAccepted:
      {
        dummyText = value
      }
      onRejected: console.log("Cancel")
    } // TextFieldDelegate

    Qaterial.EnumDelegate
    {
      width: parent.width
      property int enumValue: 2
      text: model.get(enumValue).text ? model.get(enumValue).text : ""
      secondaryText: model.get(enumValue).secondaryText ? model.get(enumValue).secondaryText : ""
      icon.source: model.get(enumValue).source ? model.get(enumValue).source : ""
      onAccepted: enumValue = value
      title: "Title"

      model: ListModel
      {
        ListElement{ text: "Choice 1"; secondaryText: "secondary text";source: "qrc:/QaterialGallery/images/icons/cake.svg" }
        ListElement{ text: "Choice 2"; secondaryText: "Neque porro quisquam";source: "qrc:/QaterialGallery/images/icons/music-note.svg" }
        ListElement{ text: "Element 3"; secondaryText: "st qui dolorem ipsum";source: "qrc:/QaterialGallery/images/icons/heart.svg" }
        ListElement{ text: "Choice 4"; secondaryText: "sNam arcu el" }
        ListElement{ text: "Element 5"; secondaryText: "tibulum gra" }
        ListElement{ text: "Element 6"; secondaryText: "sLe Lorem"; source: "qrc:/QaterialGallery/images/icons/phone.svg" }
        ListElement{ secondaryText: "quia dolor" }
        ListElement{ secondaryText: "secondary text";source: "qrc:/QaterialGallery/images/icons/wifi.svg" }
        ListElement{ text: "Element 9"; }
        ListElement{ text: "Element 10"; }
        ListElement{ text: "Element 11";source: "qrc:/QaterialGallery/images/icons/account.svg" }
      } // ListModel

      delegate: Component
      {
        Qaterial.RadioDialogDelegate
        {
          text: model.text ? model.text : ""
          secondaryText: model.secondaryText ? model.secondaryText : ""
          icon.source: model.source ? model.source : ""
        } // RadioDialogDelegate
      } // Component
    } // EnumDelegate
  } // Column
} // ScrollablePage
