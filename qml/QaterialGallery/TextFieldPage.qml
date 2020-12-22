/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

// Qaterial
import Qaterial 1.0 as Qaterial

Qaterial.ScrollablePage
{
  header: Qaterial.ToolBar
  {
    AppBarContent
    {
      anchors.fill: parent;
      title: "Text Fields"
    } // AppBarContent
  } // ToolBar

  pane.padding: 16

  Column
  {
    id: _column
    width: Math.min(parent.width, 500)
    //spacing: Qaterial.Style.card.verticalPadding
    anchors.horizontalCenter: parent.horizontalCenter

    Qaterial.SwitchButton
    {
      id: _enabled
      text: "Enabled"
      checked: true
    } // SwitchButton

    Qaterial.LabelCaption
    {
      width: _column.width
      wrapMode: Label.Wrap
      elide: Text.ElideRight
      text: "Text fields allow users to enter text into a UI. They typically appear in forms and dialogs."
      maximumLineCount: 5
    } // Label

    Qaterial.TextField // Name Field // Demonstrate required
    {
      id: _nameInput
      width: _column.width
      title: "Name *"
      placeholderText: "What do people call you?"
      validator: RegExpValidator { regExp: /[A-Za-z]+/ }
      errorText: "Name is required"
      inputMethodHints: Qt.ImhSensitiveData
      leadingIconSource: "qrc:/QaterialGallery/images/icons/account.svg"
      trailingVisible: true
      //trailingErrorAnimation: true
      enabled: _enabled.checked
      trailingContent: Qaterial.TextFieldButtonContainer
      {
        Qaterial.TextFieldAlertIcon { visible: _nameInput.errorState } // TextFieldAlerticon
        Qaterial.TextFieldClearButton { visible: _nameInput.length } // TextFieldClearButton
      } // TextFieldButtonContainer
    } // TextField

    Row
    {
      Qaterial.TextField // Phone Field // Demonstrate number keyboard
      {
        id: _phoneField
        width: _column.width * 0.7
        title: "Phone Number *"
        placeholderText: "Where can we reach you"
        inputMethodHints: Qt.ImhDialableCharactersOnly
        leadingIconSource: "qrc:/QaterialGallery/images/icons/phone.svg"
        enabled: _enabled.checked
      } // TextField

      Qaterial.ComboBox // Position
      {
        width: _column.width * 0.3
        model: ["First", "Second", "Third"]
      } // ComboBox
    } // Row

    Qaterial.TextField // Birthday
    {
      width: _column.width
      enabled: _enabled.checked
      title: "Birthday"
      placeholderText: "How old are you?"
      leadingIconSource: "qrc:/QaterialGallery/images/icons/cake.svg"
      inputMethodHints: Qt.ImhDate
    } // TextField

    Qaterial.TextField // Hour
    {
      width: _column.width
      enabled: _enabled.checked
      title: "Time"
      placeholderText: "Dummy time?"
      leadingIconSource: "qrc:/QaterialGallery/images/icons/alarm.svg"
      inputMethodHints: Qt.ImhTime
    } // TextField

    Qaterial.TextField // Email Field // Demonstrate auto completion
    {
      width: _column.width
      enabled: _enabled.checked
      title: "Email"
      placeholderText: "Your Email address"
      leadingIconSource: "qrc:/QaterialGallery/images/icons/email.svg"
      leadingIconInline: true
      inputMethodHints: Qt.ImhUrlCharactersOnly
      trailingInline: false
      trailingContent: Qaterial.TextFieldButtonContainer
      {
        Qaterial.TextFieldCopyButton {} // TextFieldCopyButton
        Qaterial.TextFieldClearButton {} // TextFieldClearButton
      } // TextFieldButtonContainer
    } // TextField

    Qaterial.TextField // Address Field // Demonstrate max length
    {
      id: _addressField
      width: _column.width
      enabled: _enabled.checked
      title: "Address"
      placeholderText: "Where do you live?"
      helperText: "No more than 32 characters"
      leadingIconSource: "qrc:/QaterialGallery/images/icons/map-marker.svg"
      leadingIconInline: true
      text: "Neque porro quisquam est"
      maximumLength: 32
      inputMethodHints: Qt.ImhSensitiveData
      trailingContent: Qaterial.TextFieldButtonContainer
      {
        Qaterial.TextFieldCopyButton {} // TextFieldCopyButton
        Qaterial.TextFieldClearButton {} // TextFieldClearButton
      } // TextFieldButtonContainer
    } // TextField

    Qaterial.TextField // Country Field // Demonstrate max length where you can write more
    {
      width: _column.width
      enabled: _enabled.checked
      title: "Country"
      placeholderText: "Which country do you live in"
      helperText: "No more than 16 characters"
      maximumLengthCount: 16
      inputMethodHints: Qt.ImhSensitiveData
      trailingVisible: errorState
      trailingContent: Qaterial.TextFieldAlertIcon {} // TextFieldAlertIcon
    } // TextField

    Qaterial.TextField // Salary Field // Demonstrata text prefix
    {
      width: _column.width
      enabled: _enabled.checked
      title: "Salary"
      prefixText: "$"
      suffixText: "USD"
      suffixTextColor: "#8BC34A"
      placeholderText: "Enter your Salary"
      validator: RegExpValidator { regExp: /[0-9]*[.,]?[0-9]{0,2}/ }
      inputMethodHints: Qt.ImhFormattedNumbersOnly
    } // TextField

    Qaterial.TextField // Password Field // Demonstrate show hidden
    {
      id: _password
      width: _column.width
      enabled: _enabled.checked
      title: "Password *"
      placeholderText: "Enter your password"
      helperText: "Please input more than 8 characters"
      validator: RegExpValidator { regExp: /.{8,}/ }
      echoMode: TextInput.Password
      inputMethodHints: Qt.ImhSensitiveData
      trailingContent: Qaterial.TextFieldPasswordButton {} // TextFieldPasswordButton
    } // TextField

    Qaterial.TextField // Password Confirm // Demonstrate error
    {
      id: _confirmPassword
      enabled: _enabled.checked
      title: "Retype password"
      readonly property string password: _password.text //WARNING : SHOULD BE SANITIZE WITH \ to avoid any pbs
      error: text !== _password.text //RegExpValidator { regExp: RegExp("^" + _confirmPassword.password + "$") }
      errorText: "Password not matching"
      width: _column.width
      echoMode: TextInput.Password
      inputMethodHints: Qt.ImhSensitiveData
      trailingContent: Qaterial.TextFieldPasswordButton {} // TextFieldPasswordButton
    } // TextField

    Qaterial.ComboBox
    {
      enabled: _enabled.checked
      width: _column.width
      editable: true

      model: ListModel
      {
        id: model
        ListElement { text: "Banana" }
        ListElement { text: "Apple" }
        ListElement { text: "Coconut" }
      } // ListModel

      onAccepted:
      {
        if(find(editText) === -1)
          model.append({ text: editText })
      }
    } // ComboBox

    Qaterial.TextArea
    {
      enabled: _enabled.checked
      leadingIconSource: "qrc:/QaterialGallery/images/icons/account.svg"
      placeholderText: "Tell us about yourself (eg, write down what do you or what bobbies you have)"
      width: _column.width
      //implicitBackgroundHeight : 100
      helperText: "Keep it short, this is just a demo"
      title: "Life story (Fix Height)"
      errorText: "No more than 48 characters"
      maximumLengthCount: 48
      trailingVisible: errorState
      trailingContent: Qaterial.TextFieldAlertIcon {} // TextFieldAlerticon
      height: 150
    } // TextArea

    Qaterial.TextArea
    {
      id: control
      enabled: _enabled.checked
      leadingIconSource: "qrc:/QaterialGallery/images/icons/account.svg"
      placeholderText: "Tell us about yourself (eg, write down what do you or what bobbies you have)"
      width: _column.width
      //implicitBackgroundHeight : 100
      helperText: "Keep it short, this is just a demo"
      title: "Life story (Implicit Height)"
      errorText: "No more than 48 characters"
      maximumLengthCount: 48
      trailingVisible: errorState
      trailingContent: Qaterial.TextFieldAlertIcon {} // TextFieldAlerticon
    } // TextArea

    Qaterial.ScrollableTextArea
    {
      enabled: _enabled.checked
      leadingIconSource: "qrc:/QaterialGallery/images/icons/account.svg"
      text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eu mi nisl. Nulla risus eros, facilisis a libero at, porttitor elementum nibh. Suspendisse ac porttitor tellus. Nulla placerat felis eu euismod molestie. Nullam nec enim non eros porta maximus. Vivamus eget est id dui tristique volutpat vitae nec risus. Phasellus bibendum justo ut tortor cursus scelerisque ut vitae urna. Pellentesque est metus, ultrices eget sem a, ornare malesuada sapien. Suspendisse potenti."
      placeholderText: "Tell us about yourself (eg, write down what do you or what bobbies you have)"
      width: _column.width
      //implicitBackgroundHeight : 100
      helperText: "Keep it short, this is just a demo"
      title: "Life story (Scrollable)"
      errorText: "No more than 48 characters"
      maximumLengthCount: 512
      trailingVisible: errorState
      trailingContent: Qaterial.TextFieldAlertIcon {} // TextFieldAlertIcon
      height: 150
    } // ScrollableTextArea

    Qaterial.Button
    {
      enabled: _enabled.checked
      anchors.horizontalCenter: parent.horizontalCenter
      text: "Submit"
      onClicked:
      {
        _nameInput.submitInput()
        _phoneField.submitInput()
        _addressField.submitInput()
        _password.submitInput()
        _confirmPassword.submitInput()
      }
    } // Button

    Qaterial.LabelCaption
    {
      width: _column.width
      horizontalAlignment: Qt.AlignHCenter
      wrapMode: Label.Wrap
      elide: Text.ElideRight
      text: "Field with * are required"
    } // Label
  } // Column
} // ScrollablePage
