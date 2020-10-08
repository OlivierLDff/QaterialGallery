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
    AppBarContent { anchors.fill: parent; title: "Snackbars" } // AppBarContent
  } // ToolBar

  Qaterial.ScrollablePage
  {
    anchors.fill: parent
    pane.padding: 16

    Column
    {
      width: parent.width
      spacing: Qaterial.Style.card.verticalPadding*4

      Qaterial.Label
      {
        width: parent.width
        wrapMode: Label.Wrap
        elide: Text.ElideRight
        text: "Snackbars inform users of a process that an app has performed or will perform. They appear temporarily, towards the bottom of the screen. They shouldn’t interrupt the user experience, and they don’t require user input to disappear.\n" +
        "  • Only one snackbar may be displayed at a time.\n" +
        "  • A snackbar can contain a single action. Because they disappear automatically, the action shouldn’t be “Dismiss” or “Cancel.”"
          //Layout.preferredHeight: 100
          maximumLineCount: 7
          textType: Qaterial.Style.TextType.Caption
      } // Label

      Qaterial.Snackbar
      {
        anchors.horizontalCenter: parent.horizontalCenter
        width: Math.min(parent.width, implicitWidth)
        text: "Single-line message."
      } // SnackBar

      Qaterial.Snackbar
      {
        anchors.horizontalCenter: parent.horizontalCenter
        width: Math.min(parent.width, implicitWidth)
        text: "Single-line message with action."
        action: "Action"
        onActionPressed: console.log("Action!")
      } // SnackBar

      Qaterial.Snackbar
      {
        anchors.horizontalCenter: parent.horizontalCenter
        width: Math.min(parent.width, implicitWidth)
        text: "Two-line message with action. This message is very long."
        action: "Action"
        onActionPressed: console.log("Action!")
      } // SnackBar

      Qaterial.Snackbar
      {
        anchors.horizontalCenter: parent.horizontalCenter
        width: Math.min(parent.width, implicitWidth)
        expandable: true
        text: "Expandable Two-line message with action. This message is very long."
        action: "Action"
        onActionPressed: console.log("Action!")
      } // SnackBar

      Column
      {
        anchors.horizontalCenter: parent.horizontalCenter

        Qaterial.RaisedButton
        {
          anchors.horizontalCenter: parent.horizontalCenter

          text: "Push Default Snackbar"

          onClicked: Qaterial.SnackbarManager.show({
            text: "Default Snackbar",
          })
        } // RaisedButton

        Qaterial.RaisedButton
        {
          anchors.horizontalCenter: parent.horizontalCenter

          text: "Push Non Killable Snackbar"

          onClicked: Qaterial.SnackbarManager.show(
          {
            // Default value : ""
            text: "Non Killable Snackbar",
            timeout: 1000,
            // Default Value : true
            canBeKilled: false
          })
        } // RaisedButton

        Qaterial.RaisedButton
        {
          anchors.horizontalCenter: parent.horizontalCenter

          text: "Push ACtion Snackbar"

          onClicked: Qaterial.SnackbarManager.show(
          {
            // Default value : ""
            text: "Action Snackbar text",
            action: "Action text",
            timeout: Qaterial.Style.snackbar.longDisplayTime,
            // Default Value : true
            canBeKilled: false
          })
        } // RaisedButton

        Qaterial.RaisedButton
        {
          anchors.horizontalCenter: parent.horizontalCenter

          text: "Push Demo Snackbar"

          onClicked: Qaterial.SnackbarManager.show(
          {
            // Default value : ""
            text: "Text",
            // Default value : ""
            action: "Action",
            // Standard values : Qaterial.Style.snackbar.shortDisplayTime (2000ms), Qaterial.Style.snackbar.longDisplayTime (5000ms),
            timeout: 3000,
            // Default value : undefined
            onAccept : function()
            {
              console.log("Function called when action is pressed")
              },
            // Default value : undefined
            onClose: function()
            {
              console.log("Function called when snackbar disappear")
              },
            // Default Value : true
            canBeKilled: true
          }) // SnackBarManager.show
        } // RaisedButton
      } // Column
    } // Column
  } // ScrollablePage
} // Page
