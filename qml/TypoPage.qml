/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

import QtQuick 2.12
import QtQuick.Layouts 1.12

import Qaterial 1.0

Page
{
    id: page

    header: ToolBar
    {
        ColumnLayout
        {
            anchors.fill: parent
            spacing: 0

            AppBarContent { title: "Typography" }

            SwitchDelegate
            {
                id: _enabledSwitch
                text: "Enabled"
                checked: true
                onPrimary: true
                Layout.fillWidth: true
            } // SwitchDelegate
        } // ColumnLayout
    } // ToolBar

    ListModel
    {
        id: typoModel
        ListElement
        {
            type: "Display 3";
            textType: Style.TextType.Display3
        } // ListElement
        ListElement
        {
            type: "Display 2";
            textType: Style.TextType.Display2
        } // ListElement
        ListElement
        {
            type: "Display 1";
            textType: Style.TextType.Display1
        } // ListElement
        ListElement
        {
            type: "Heading";
            textType: Style.TextType.Heading
        } // ListElement
        ListElement
        {
            type: "Title";
            textType: Style.TextType.Title
        } // ListElement
        ListElement
        {
            type: "Subheading";
            textType: Style.TextType.Subheading
        } // ListElement
        ListElement
        {
            type: "List Text";
            textType: Style.TextType.ListText
        } // ListElement
        ListElement
        {
            type: "List Sec Text";
            textType: Style.TextType.ListSecText
        } // ListElement
        ListElement
        {
            type: "Overline";
            textType: Style.TextType.Overline
        } // ListElement
        ListElement
        {
            type: "Body 2";
            textType: Style.TextType.Body2
        } // ListElement
        ListElement
        {
            type: "Body 1";
            textType: Style.TextType.Body1
        } // ListElement
        ListElement
        {
            type: "Caption";
            textType: Style.TextType.Caption
        } // ListElement
        ListElement
        {
            type: "Hint";
            textType: Style.TextType.Hint
        } // ListElement
        ListElement
        {
            type: "Button";
            textType: Style.TextType.Button
        } // ListElement
        ListElement
        {
            type: "Menu";
            textType: Style.TextType.Menu
        } // ListElement
    } // ListModel

    SwipeView
    {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        ScrollablePage
        {
            width: swipeView.width
            height: swipeView.height
            ColumnLayout
            {
                spacing: 20
                Repeater
                {
                    model: typoModel
                    delegate: RowLayout
                    {
                        Label
                        {
                            Layout.preferredWidth: 65

                            text: model.type
                            textType: Style.TextType.Caption
                            usePixelSize: false
                        } // Label
                        Label
                        {
                            text: font.styleName + " " + font.pixelSize + "sp"
                            textType: model.textType
                            enabled: _enabledSwitch.checked
                            usePixelSize: false
                        } // Label
                    } // RowLayout
                } // Repeater
            } // ColumnLayout
        } // ScrollablePage

        ScrollablePage
        {
            width: swipeView.width
            height: swipeView.height
            ColumnLayout
            {
                spacing: 20
                Repeater
                {
                    model: typoModel
                    delegate: RowLayout
                    {
                        Label
                        {
                            Layout.preferredWidth: 65

                            text: model.type
                            textType: Style.TextType.Caption
                        } // Label
                        Label
                        {
                            text: font.styleName + " " + font.pixelSize + "sp"
                            textType: model.textType
                            enabled: _enabledSwitch.checked
                        } // Label
                    } // RowLayout
                } // Repeater
            } // ColumnLayout
        } // ScrollablePage
    } // SwipeView

    footer: FixedTabBar
    {
        id: tabBar
        elevation: 20
        currentIndex: swipeView.currentIndex

        model: ListModel
        {
            ListElement{ text: "Point" }
            ListElement{ text: "Pixel" }
        }
    }
} // Page
