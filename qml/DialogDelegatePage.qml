/** Copyright (C) Olivier Le Doeuff 2019 
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import QQuickMaterialHelper.Components 1.12
import QQuickMaterialHelper.Containers 1.12
import QQuickMaterialHelper.Style 1.12

ScrollablePage
{
    header: ToolBar 
    {
        AppBarContent { anchors.fill: parent; title: "Dialog Delegates" }
    } // ToolBar
    pane.padding: 0 
    Column
    {
        width: parent.width
        //spacing: MaterialStyle.card.horizontalPadding

        TextFieldDelegate
        {
            id: _textFieldDelegate
            property string dummyText: "Dummy text"
            width: parent.width
            // DELEGATE
            text: "Title of delegate"
            secondaryText: dummyText
            value:dummyText
            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/account.svg"

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
            trailingContent: TextFieldAlertIcon { visible: _textFieldDelegate.errorState }

            onAccepted:
            {
                dummyText = value
            }
            onRejected: console.log("Cancel")
        }
        
        TextFieldDelegate
        {
            id: _textFieldDelegate2
            property string dummyText: "Dummy text 2"
            width: parent.width
            // DELEGATE
            text: "Title of delegate"
            secondaryText: dummyText
            value:dummyText
            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/cake.svg"
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
            trailingContent: TextFieldAlertIcon { visible: _textFieldDelegate2.errorState }

            onAccepted:
            {
                dummyText = value
            }
            onRejected: console.log("Cancel")
        }

    } // Column
} // ScrollablePage