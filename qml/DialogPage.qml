/** Copyright (C) Olivier Le Doeuff 2019 
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import QQuickMaterialHelper.Components 1.12
import QQuickMaterialHelper.Containers 1.12
import QQuickMaterialHelper.Style 1.12

Page
{

    header: ToolBar 
    {
        AppBarContent { anchors.fill: parent; title: "Dialogs" }
    } // ToolBar 

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
        spacing: MaterialStyle.card.horizontalPadding

        Label 
        {
            width: parent.width
            wrapMode: Label.Wrap
            elide: Text.ElideRight
            text: "A dialog is a type of modal window that appears in front of app content to provide critical information or ask for a decision. Dialogs disable all app functionality when they appear, and remain on screen until confirmed, dismissed, or a required action has been taken.\n" + "  • Dialogs are purposefully interruptive, so they should be used sparingly."
            maximumLineCount: 7
            textType: MaterialStyle.TextType.Caption
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
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/account.svg"
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
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/account.svg"
                            text: "user02@gmail.com"
                        }
                        ItemDelegate
                        {
                            fillIcon: true
                            highlightedIcon: false
                            reverseHighlightIcon: true
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/plus.svg"
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
            text: "Confirmation"
            width: parent.buttonWidth
        }

        Button
        {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Confirmation (Scrolling)"
            width: parent.buttonWidth
        }
    } // Column

} // ScrollablePage

}