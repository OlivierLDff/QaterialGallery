/** Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12
import QtQuick.Layouts 1.12

import Qaterial 1.0

Page
{

    header: ToolBar
    {
        AppBarContent { anchors.fill: parent; title: "Dialogs" }
    } // ToolBar

    DialogManager
    {
        id: dialogManager
    }

    Loader
    {
        id: _dialogLoader
        onLoaded: item.open()
    }
    ScrollablePage
    {
        anchors.fill: parent
        //width: parent.width
        Column
        {
            width: parent.width
            spacing: Style.card.horizontalPadding

            Label
            {
                width: parent.width
                wrapMode: Label.Wrap
                elide: Text.ElideRight
                text: "A dialog is a type of modal window that appears in front of app content to provide critical information or ask for a decision. Dialogs disable all app functionality when they appear, and remain on screen until confirmed, dismissed, or a required action has been taken.\n" + "  • Dialogs are purposefully interruptive, so they should be used sparingly."
                maximumLineCount: 7
                textType: Style.TextType.Caption
            } // Label

            readonly property double buttonWidth: Math.min(width*0.8, 500)

            Button
            {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Alert"
                width: parent.buttonWidth
                onClicked: _dialogLoader.sourceComponent = _alertComponent
                Component
                {
                    id: _alertComponent
                    AlertDialog
                    {
                        text: "Discard draft"
                        standardButtons: Dialog.Cancel | Dialog.Ok
                        onAccepted: console.log("Accept")
                        onRejected: console.log("Cancel")
                        onClosed: _dialogLoader.sourceComponent = undefined
                    }
                }
            }

            Button
            {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Alert with title"
                width: parent.buttonWidth
                onClicked: _dialogLoader.sourceComponent = _alertComponentTitle
                Component
                {
                    id: _alertComponentTitle
                    AlertDialog
                    {
                        title: "Use google's location service?"
                        text: "Let Google help apps determine location. This means sending anonymous location data to Google, even when no apps are running."
                        standardButtons: Dialog.No | Dialog.Ok
                        onAccepted: console.log("Accept")
                        onRejected: console.log("Cancel")
                        onClosed: _dialogLoader.sourceComponent = undefined
                    }
                }
            }

            Button
            {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Alert with icon"
                width: parent.buttonWidth
                onClicked: dialogManager.openWithSettings({
                    acceptedCallback: function()
                    {
                        console.log("accept")
                    },
                    rejectedCallback: function()
                    {
                        console.log("reject")
                    },
                    text: "Let Google help apps determine location. This means sending anonymous location data to Google, even when no apps are running.",
                    title: qsTr("Send data?"),
                    iconSource: "qrc:/QaterialGallery/images/icons/account.svg",
                    standardButtons: Dialog.Cancel | Dialog.Yes
                } )
            }

            Button
            {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Simple"
                width: parent.buttonWidth
                onClicked: _dialogLoader.sourceComponent = _simpleComponentTitle
                Component
                {
                    id: _simpleComponentTitle
                    ModalDialog
                    {
                        title: "Set user account"
                        onClosed: _dialogLoader.sourceComponent = undefined
                        horizontalPadding: 0

                        contentItem: Column
                        {
                            ItemDelegate
                            {
                                width: parent.width
                                icon.source: "qrc:/QaterialGallery/images/icons/account.svg"
                                text: "username@gmail.com"
                                fillIcon: true
                                highlightedIcon: true
                                reverseHighlightIcon: true
                            }
                            ItemDelegate
                            {
                                fillIcon: true
                                highlightedIcon: true
                                reverseHighlightIcon: true
                                width: parent.width
                                icon.source: "qrc:/QaterialGallery/images/icons/account.svg"
                                text: "user02@gmail.com"
                            }
                            ItemDelegate
                            {
                                fillIcon: true
                                highlightedIcon: false
                                reverseHighlightIcon: true
                                icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
                                width: parent.width
                                text: "add account"
                            }
                        }
                    } // Dialog
                }
            }

            Button
            {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Text Field Dialog"
                width: parent.buttonWidth
                onClicked: _dialogLoader.sourceComponent = _textFieldDialogComponent
                Component
                {
                    id: _textFieldDialogComponent
                    TextFieldDialog
                    {
                        id: _textFieldDialog
                        title: "Enter some text"
                        textTitle: "Title"
                        placeholderText: "Placeholder"
                        helperText: "This a hint"
                        validator: RegExpValidator { regExp: /[A-Za-z]+/ }
                        inputMethodHints: Qt.ImhSensitiveData
                        errorText: length ? ("Don't write more than " + maximumLengthCount + " characters") : "Can't be empty"
                        maximumLengthCount: 16
                        trailingContent: TextFieldAlertIcon { visible: _textFieldDialog.errorState }
                        onAccepted: console.log("Accept")
                        onRejected: console.log("Cancel")
                        onClosed: _dialogLoader.sourceComponent = undefined
                    }
                }
            }

            Button
            {
                id: _radioDialog
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Radio Dialog"
                width: parent.buttonWidth
                onClicked: _dialogLoader.sourceComponent = _radioComponentTitle
                property int modelIndex: 0
                Component
                {
                    id: _radioComponentTitle
                    RadioDialog
                    {
                        title: "Scrollable Radio Dialog"
                        onAccepted:
                        {
                             console.log("Accept " + currentIndex);
                             _radioDialog.modelIndex = currentIndex
                        }
                        onRejected: console.log("Cancel")
                        currentIndex: _radioDialog.modelIndex
                        onClosed: _dialogLoader.sourceComponent = undefined
                        model: ListModel
                        {
                            ListElement{ text: "Element1"; secondaryText: "secondary text" }
                            ListElement{ text: "Element2"; secondaryText: "secondary text" }
                        }
                    }
                }
            }

            Button
            {
                id: _radioScrollableDialog
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Radio Dialog Scrollable"
                width: parent.buttonWidth
                onClicked: _dialogLoader.sourceComponent = _scrollableComponentTitle
                property int modelIndex: 0
                Component
                {
                    id: _scrollableComponentTitle
                    RadioDialog
                    {
                        title: "Scrollable Radio Dialog"
                        onAccepted:
                        {
                             console.log("Accept " + currentIndex);
                             _radioScrollableDialog.modelIndex = currentIndex
                        }
                        onRejected: console.log("Cancel")
                        currentIndex: _radioScrollableDialog.modelIndex
                        onClosed: _dialogLoader.sourceComponent = undefined
                        model: ListModel
                        {
                            ListElement{ text: "Element1"; secondaryText: "secondary text" }
                            ListElement{ text: "Element2"; secondaryText: "secondary text" }
                            ListElement{ text: "Element3"; secondaryText: "secondary text" }
                            ListElement{ text: "Element4"; secondaryText: "secondary text" }
                            ListElement{ text: "Element5"; secondaryText: "secondary text" }
                            ListElement{ text: "Element6"; secondaryText: "secondary text" }
                            ListElement{ text: "Element7"; secondaryText: "secondary text" }
                            ListElement{ text: "Element8"; secondaryText: "secondary text" }
                            ListElement{ text: "Element9"; secondaryText: "secondary text" }
                            ListElement{ text: "Element10"; secondaryText: "secondary text" }
                            ListElement{ text: "Element11"; secondaryText: "secondary text" }
                        }
                    }
                }
            }
        } // Column
    } // ScrollablePage
}
