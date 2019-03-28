/** Copyright (C) Olivier Le Doeuff 2019 
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import QQuickMaterialHelper.Components 1.12
import QQuickMaterialHelper.Containers 1.12
import QQuickMaterialHelper.Style 1.12
import QQuickMaterialHelper.Core 1.12

ScrollablePage
{
    header: ToolBar 
    {
        AppBarContent { anchors.fill: parent; title: "Text Fields" }
    } // ToolBar

    Column
    {
        id: _column
        width: Math.min(parent.width, 500)
        //spacing: MaterialStyle.card.verticalPadding
        anchors.horizontalCenter: parent.horizontalCenter

        SwitchButton
        {
            id: _enabled
            text: "Enabled"
            checked: true
        }

        Label 
        {
            width: _column.width
            wrapMode: Label.Wrap
            elide: Text.ElideRight
            text: "Text fields allow users to enter text into a UI. They typically appear in forms and dialogs."
            maximumLineCount: 5
            textType: MaterialStyle.TextType.Caption
        } // Label

        TextField // Name Field // Demonstrate required
        {
            id: _nameInput
            width: _column.width
            title: "Name *"
            placeholderText: "What do people call you?"
            validator: RegExpValidator { regExp: /[A-Za-z]+/ }
            errorText: "Name is required"
            inputMethodHints: Qt.ImhSensitiveData
            leadingIconSource: "qrc:/QQuickMaterialHelperGallery/images/icons/account.svg"
            trailingVisible: true
            //trailingErrorAnimation: true
            enabled: _enabled.checked
            trailingContent: TextFieldButtonContainer 
            {
                TextFieldAlertIcon { visible: _nameInput.errorState }
                TextFieldClearButton { visible: _nameInput.length }
            }
        } // TextField
        Row
        {
            TextField // Phone Field // Demonstrate number keyboard
            {
                id: _phoneField
                width: _column.width*0.7
                title: "Phone Number *"
                placeholderText: "Where can we reach you"
                inputMethodHints: Qt.ImhDialableCharactersOnly
                leadingIconSource: "qrc:/QQuickMaterialHelperGallery/images/icons/phone.svg"
            enabled: _enabled.checked
            } // Area
            ComboBox // Name Field
            {
                width: _column.width*0.3
            model: ["First", "Second", "Third"]
            } // TextField
        }

        TextField // Birthday
        {
            width: _column.width
            enabled: _enabled.checked
            title: "Birthday"
            placeholderText: "How old are you?"
            leadingIconSource: "qrc:/QQuickMaterialHelperGallery/images/icons/cake.svg"
            inputMethodHints: Qt.ImhDate
        } // TextField

        TextField // Hour
        {
            width: _column.width
            enabled: _enabled.checked
            title: "Time"
            placeholderText: "Dummy time?"
            leadingIconSource: "qrc:/QQuickMaterialHelperGallery/images/icons/alarm.svg"
            inputMethodHints: Qt.ImhTime
        } // TextField

        TextField // Email Field // Demonstrate auto completion
        {
            width: _column.width
            enabled: _enabled.checked
            title: "Email"
            placeholderText: "Your Email address"
            leadingIconSource: "qrc:/QQuickMaterialHelperGallery/images/icons/email.svg"
            leadingIconInline: true
            inputMethodHints: Qt.ImhUrlCharactersOnly
            trailingInline: false
            trailingContent: TextFieldButtonContainer 
            {
                TextFieldCopyButton {}
                TextFieldClearButton {}
            }
        } // TextField

        TextField // Address Field // Demonstrate max length
        {
            id: _addressField
            width: _column.width
            enabled: _enabled.checked
            title: "Address"
            placeholderText: "Where do you live?"
            helperText: "No more than 32 characters"
            leadingIconSource: "qrc:/QQuickMaterialHelperGallery/images/icons/map-marker.svg"
            leadingIconInline: true
            text: "Neque porro quisquam est"
            maximumLength: 32
            inputMethodHints: Qt.ImhSensitiveData
            trailingContent: TextFieldButtonContainer 
            {
                TextFieldCopyButton {}
                TextFieldClearButton {}
            }
        } // TextField

        TextField // Country Field // Demonstrate max length where you can write more
        {
            width: _column.width
            enabled: _enabled.checked
            title: "Country"
            placeholderText: "Which country do you live in"
            helperText: "No more than 16 characters"
            maximumLengthCount: 16
            inputMethodHints: Qt.ImhSensitiveData
            trailingVisible: errorState
            trailingContent: TextFieldAlertIcon { }
        } // TextField

        TextField // Salary Field // Demonstrata text prefix
        {
            width: _column.width
            enabled: _enabled.checked
            title: "Salary"
            prefixText: "$"
            suffixText: "USD"
            suffixTextType: MaterialStyle.TextType.Overline
            suffixTextColor: "#8BC34A"
            placeholderText: "Enter your Salary"
            validator: RegExpValidator { regExp: /[0-9]*[.,]?[0-9]{0,2}/ }
            inputMethodHints: Qt.ImhFormattedNumbersOnly
        } // TextField

        TextField // Password Field // Demonstrate show hidden
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
            trailingContent: TextFieldPasswordButton { }
        } // TextField

        TextField // Password Confirm // Demonstrate error
        {
            id: _confirmPassword
            enabled: _enabled.checked
            title: "Retype password"
            readonly property string password: _password.text //WARNING : SHOULD BE SANITIZE WITH \ to avoid any pbs
            error: text !== _password.text//RegExpValidator { regExp: RegExp("^" + _confirmPassword.password + "$") }
            errorText: "Password not matching"
            width: _column.width
            echoMode: TextInput.Password
            inputMethodHints: Qt.ImhSensitiveData
            trailingContent: TextFieldPasswordButton { }
        } // TextField

        ComboBox
        {            
            enabled: _enabled.checked
            width: _column.width
            editable: true
            model: ListModel {
                id: model
                ListElement { text: "Banana" }
                ListElement { text: "Apple" }
                ListElement { text: "Coconut" }
            }
            onAccepted: {
                if (find(editText) === -1)
                    model.append({text: editText})
            }
        }

        TextArea
        {
            enabled: _enabled.checked
            leadingIconSource: "qrc:/QQuickMaterialHelperGallery/images/icons/account.svg"
            placeholderText: "Tell us about yourself (eg, write down what do you or what bobbies you have)"
            width: _column.width
            //implicitBackgroundHeight : 100
            helperText: "Keep it short, this is just a demo"
            title: "Life story (Fix Height)"
            errorText: "No more than 48 characters"
            maximumLengthCount: 48
            trailingVisible: errorState
            trailingContent: TextFieldAlertIcon { }

            height: 150
        }

        TextArea
        {
            id: control
            enabled: _enabled.checked
            leadingIconSource: "qrc:/QQuickMaterialHelperGallery/images/icons/account.svg"
            placeholderText: "Tell us about yourself (eg, write down what do you or what bobbies you have)"
            width: _column.width
            //implicitBackgroundHeight : 100
            helperText: "Keep it short, this is just a demo"
            title: "Life story (Implicit Height)"
            errorText: "No more than 48 characters"
            maximumLengthCount: 48
            trailingVisible: errorState
            trailingContent: TextFieldAlertIcon { }
        }

        ScrollableTextArea
        {
            enabled: _enabled.checked
            leadingIconSource: "qrc:/QQuickMaterialHelperGallery/images/icons/account.svg"
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eu mi nisl. Nulla risus eros, facilisis a libero at, porttitor elementum nibh. Suspendisse ac porttitor tellus. Nulla placerat felis eu euismod molestie. Nullam nec enim non eros porta maximus. Vivamus eget est id dui tristique volutpat vitae nec risus. Phasellus bibendum justo ut tortor cursus scelerisque ut vitae urna. Pellentesque est metus, ultrices eget sem a, ornare malesuada sapien. Suspendisse potenti."
            placeholderText: "Tell us about yourself (eg, write down what do you or what bobbies you have)"
            width: _column.width
            //implicitBackgroundHeight : 100
            helperText: "Keep it short, this is just a demo"
            title: "Life story (Scrollable)"
            errorText: "No more than 48 characters"
            maximumLengthCount: 512
            trailingVisible: errorState
            trailingContent: TextFieldAlertIcon { }

            height: 150
        }

        Button
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
        }

        Label 
        {
            width: _column.width
            horizontalAlignment: Qt.AlignHCenter
            wrapMode: Label.Wrap
            elide: Text.ElideRight
            text: "Field with * are required"
            textType: MaterialStyle.TextType.Caption
        } // Label

    } // Column
} // ScrollablePage