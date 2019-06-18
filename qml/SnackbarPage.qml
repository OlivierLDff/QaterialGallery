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
        AppBarContent { anchors.fill: parent; title: "Snackbars" }
    } // ToolBar

    SnackbarManager
    {
        id: _snackbarManager
        anchors.fill: parent
        anchors.bottomMargin : 20
    }
    ScrollablePage
{


    anchors.fill: parent


    Column
    {
        width: parent.width
        spacing: MaterialStyle.card.verticalPadding*4

        Label 
        {
            width: parent.width
            wrapMode: Label.Wrap
            elide: Text.ElideRight
            text: "Snackbars inform users of a process that an app has performed or will perform. They appear temporarily, towards the bottom of the screen. They shouldn’t interrupt the user experience, and they don’t require user input to disappear.\n" +
            "  • Only one snackbar may be displayed at a time.\n" + 
            "  • A snackbar can contain a single action. Because they disappear automatically, the action shouldn’t be “Dismiss” or “Cancel.”" 
            //Layout.preferredHeight: 100
            maximumLineCount: 7
            textType: MaterialStyle.TextType.Caption
        } // Label

        Snackbar
        {
            anchors.horizontalCenter: parent.horizontalCenter
            width: Math.min(parent.width, implicitWidth)
            text: "Single-line message."
        }

        Snackbar
        {
            anchors.horizontalCenter: parent.horizontalCenter
            width: Math.min(parent.width, implicitWidth)
            text: "Single-line message with action."
            action: "Action"
            onActionPressed: console.log("Action!")
        }

        Snackbar
        {
            anchors.horizontalCenter: parent.horizontalCenter
            width: Math.min(parent.width, implicitWidth)
            text: "Two-line message with action. This message is very long."
            action: "Action"
            onActionPressed: console.log("Action!")
        }

        Snackbar
        {
            anchors.horizontalCenter: parent.horizontalCenter
            width: Math.min(parent.width, implicitWidth)
            expandable: true
            text: "Expandable Two-line message with action. This message is very long."
            action: "Action"
            onActionPressed: console.log("Action!")
        }

        Button
        {
            id :test
            anchors.horizontalCenter: parent.horizontalCenter
        
            text: "Push Snackbar"
            onClicked: _snackbarManager.show({
                text : "Snackbar text",
                action : "",
                timeout: "",
                onAccept : function()
                   {
                     console.log("accept snackbar")
                    },
                onClose: function()
                      {
                    console.log("close snackbar with time")
                      }

                })
        }



       
    } // Column
} // ScrollablePage
}
 
