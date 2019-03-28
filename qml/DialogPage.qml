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
        AppBarContent { anchors.fill: parent; title: "Dialogs" }
    } // ToolBar

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
        }

        Button
        {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Alert with title"
            width: parent.buttonWidth
        }

        Button
        {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Simple"
            width: parent.buttonWidth
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