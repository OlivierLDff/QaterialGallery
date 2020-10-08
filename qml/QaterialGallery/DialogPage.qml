/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

// Qaterial
import Qaterial 1.0 as Qaterial

Qaterial.Page
{

  header: Qaterial.ToolBar
  {
    AppBarContent { anchors.fill: parent; title: "Dialogs" } // AppBarContent
  } // ToolBar

  Qaterial.ScrollablePage
  {
    anchors.fill: parent
    pane.padding: 16

    Column
    {
      width: parent.width
      spacing: Qaterial.Style.card.horizontalPadding

      Qaterial.Label
      {
        width: parent.width
        wrapMode: Label.Wrap
        elide: Text.ElideRight
        text: "A dialog is a type of modal window that appears in front of app content to provide critical information or ask for a decision. Dialogs disable all app functionality when they appear, and remain on screen until confirmed, dismissed, or a required action has been taken.\n" + "  • Dialogs are purposefully interruptive, so they should be used sparingly."
        maximumLineCount: 7
        textType: Qaterial.Style.TextType.Caption
      } // Label

      readonly property double buttonWidth: Math.min(width*0.8, 500)

      Qaterial.Button
      {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Alert"
        width: parent.buttonWidth
        onClicked: Qaterial.DialogManager.openFromComponent(_alertComponent)

        Component
        {
          id: _alertComponent

          Qaterial.AlertDialog
          {
            text: "Discard draft"
            standardButtons: Dialog.Cancel | Dialog.Ok
            onAccepted: console.log("Accept")
            onRejected: console.log("Cancel")
            Component.onCompleted: open()
          } // AlertDialog
        } // Component
      } // Button

      Qaterial.Button
      {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Alert with title"
        width: parent.buttonWidth
        onClicked: Qaterial.DialogManager.openFromComponent(_alertComponentTitle)

        Component
        {
          id: _alertComponentTitle

          Qaterial.AlertDialog
          {
            title: "Use google's location service?"
            text: "Let Google help apps determine location. This means sending anonymous location data to Google, even when no apps are running."
            standardButtons: Dialog.No | Dialog.Ok
            onAccepted: console.log("Accept")
            onRejected: console.log("Cancel")
            Component.onCompleted: open()
          } // AlertDialog
        } // Component
      } // Button

      Qaterial.Button
      {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Alert with icon"
        width: parent.buttonWidth
        onClicked: Qaterial.DialogManager.openWithSettings(
        {
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
        }) // DialogManager.openWithSettings
      } // Button

      Qaterial.Button
      {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Item Delegate Dialog"
        width: parent.buttonWidth
        onClicked: Qaterial.DialogManager.openFromComponent(_simpleComponentTitle)

        Component
        {
          id: _simpleComponentTitle

          Qaterial.ModalDialog
          {
            title: "Set user account"
            horizontalPadding: 0

            contentItem: Column
            {
              Qaterial.ItemDelegate
              {
                width: parent.width
                icon.source: "qrc:/QaterialGallery/images/icons/account.svg"
                text: "username@gmail.com"
                fillIcon: true
                highlightedIcon: true
                reverseHighlightIcon: true
              } // ItemDelegate

              Qaterial.ItemDelegate
              {
                fillIcon: true
                highlightedIcon: true
                reverseHighlightIcon: true
                width: parent.width
                icon.source: "qrc:/QaterialGallery/images/icons/account.svg"
                text: "user02@gmail.com"
              } // ItemDelegate

              Qaterial.ItemDelegate
              {
                fillIcon: true
                highlightedIcon: false
                reverseHighlightIcon: true
                icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
                width: parent.width
                text: "add account"
              } // ItemDelegate
            } // Column
            Component.onCompleted: open()
          } // ModalDialog
        } // Component
      } // Button

      Qaterial.Button
      {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Text Field Dialog"
        width: parent.buttonWidth
        onClicked: Qaterial.DialogManager.openFromComponent(_textFieldDialogComponent)

        Component
        {
          id: _textFieldDialogComponent

          Qaterial.TextFieldDialog
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
            trailingContent: Qaterial.TextFieldAlertIcon { visible: _textFieldDialog.errorState }
            onAccepted: console.log("Accept")
            onRejected: console.log("Cancel")
            Component.onCompleted: open()
          } // TextFieldDialog
        } // Component
      } // Button

      Qaterial.Button
      {
        id: _radioDialog
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Radio Dialog"
        width: parent.buttonWidth
        onClicked: Qaterial.DialogManager.openFromComponent(_radioComponentTitle)
        property int modelIndex: 0

        Component
        {
          id: _radioComponentTitle

          Qaterial.RadioDialog
          {
            title: "Scrollable Radio Dialog"
            onAccepted:
            {
              console.log("Accept " + currentIndex);
              _radioDialog.modelIndex = currentIndex
            }
            onRejected: console.log("Cancel")
            currentIndex: _radioDialog.modelIndex

            model: ListModel
            {
              ListElement{ text: "Element1"; secondaryText: "secondary text 1" }
              ListElement{ text: "Element2"; secondaryText: "secondary text 2" }
            } // ListMOdel
            Component.onCompleted: open()
          } // RadioDialog
        } // Component
      } // Button

      Qaterial.Button
      {
        id: _radioScrollableDialog
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Radio Dialog Scrollable"
        width: parent.buttonWidth
        onClicked: Qaterial.DialogManager.openFromComponent(_scrollableComponentTitle)
        property int modelIndex: 0

        Component
        {
          id: _scrollableComponentTitle

          Qaterial.RadioDialog
          {
            title: "Scrollable Radio Dialog"
            onAccepted:
            {
              console.log("Accept " + currentIndex);
              _radioScrollableDialog.modelIndex = currentIndex
            }
            onRejected: console.log("Cancel")
            currentIndex: _radioScrollableDialog.modelIndex

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
            } // ListModel
            Component.onCompleted: open()
          } // RadioDialog
        } // Component
      } // Button
    } // Column
  } // ScrollablePage
} // Page
