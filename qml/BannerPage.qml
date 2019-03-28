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
    id: page

    header: ToolBar 
    {
        AppBarContent { anchors.fill: parent; title: "Banners" }
    } // ToolBar

    property string shortText: "One line text string with one action."
    property string medText: "Two line text string with two actions. One to two lines is preferable on mobile and tablet."
    property string longText: "Three line text string example with two actions. One to two lines is preferable. Three lines should be considered the maximum string length on desktop inorder to keep messages short and actionable."

    Banner
    {
        id: _banner
        anchors.top: parent.top
        width: parent.width
        drawSeparator: true
        text: _small.checked ? page.shortText : (_med.checked ? page.medText : page.longText)
        thumbnailSource: _thumb.checked ? "qrc:/QQuickMaterialHelperGallery/images/card40x40.png" : ""
        iconSource: _icon.checked ? "qrc:/QQuickMaterialHelperGallery/images/icons/wifi.svg" : ""
        fillIcon: _fill.checked
        outlinedIcon: _outlined.checked
        highlightedIcon: _highlighted.checked
        reverseHighlightIcon: _reverse.checked

        action1: _small.checked ? "Action" : "Action 1"
        action2: _small.checked ? "" : "Action 2"

        onActionClicked: if(_small.checked) console.log("Action Clicked")
        onAction1Clicked: if(!_small.checked) console.log("Action 1 Clicked")
        onAction2Clicked: console.log("Action 2 Clicked")

        enabled: _enabled.checked
    }

    ScrollablePage
    {
        width: parent.width
        anchors.top: _banner.bottom
        anchors.bottom: parent.bottom
        clip: true
        Column
        {
            width: parent.width
            spacing: MaterialStyle.card.verticalPadding

            Label 
            {
                width: parent.width
                wrapMode: Label.Wrap
                elide: Text.ElideRight
                text: "A banner displays an important, succinct message, and provides actions for users to address (or dismiss the banner). It requires a user action to be dismissed.\n" +
                "  • Banners should be displayed at the top of the screen, below a top app bar. They are persistent and nonmodal, allowing the user to either ignore them or interact with them at any time."
                //Layout.preferredHeight: 100
                maximumLineCount: 7
                textType: MaterialStyle.TextType.Caption
            }

            GroupBox 
            {
                title: "Banner selection"
                inlineTitle: true
                width: Math.min(parent.width, 400)
                anchors.horizontalCenter: parent.horizontalCenter

                contentItem: Column 
                {
                    spacing: 0

                    RadioButton 
                    {
                        id: _small
                        text: "Small Banner"
                        width: parent.width
                    }
                    RadioButton 
                    {
                        id: _med
                        text: "Medium Banner"
                        checked: true
                        width: parent.width
                    }
                    RadioButton 
                    {
                        id: _long
                        text: "Long Banner"
                        width: parent.width
                    }
                }
            } // GroupBox

            GroupBox 
            {
                title: "Supporting illustration"
                inlineTitle: true
                width: Math.min(parent.width, 400)
                anchors.horizontalCenter: parent.horizontalCenter

                contentItem: Column 
                {
                    id: _supportBox
                    spacing: 0

                    RadioButton 
                    {
                        text: "No Thumbnail"
                        width: parent.width
                    }
                    RadioButton 
                    {
                        id: _thumb
                        text: "Thumbnail"
                        width: parent.width
                    }
                    RadioButton 
                    {
                        id: _icon
                        text: "Icon"
                        checked: true
                        width: parent.width
                    }
                    Row
                    {
                        RadioButton 
                        {
                            id: _outlined
                            text: "Outlined"
                            width: _supportBox.width/2
                            enabled: _icon.checked
                        }
                        RadioButton 
                        {
                            id: _fill
                            text: "Fill"
                            checked: true
                            width: _supportBox.width/2
                            enabled: _icon.checked
                        }
                    }
                    Row
                    {
                        CheckButton 
                        {
                            id: _highlighted
                            text: "Highlighted"
                            checked: true
                            width: _supportBox.width/2
                            enabled: _icon.checked
                        }
                        CheckButton 
                        {
                            id: _reverse
                            text: "Reverse"
                            checked: true
                            width: _supportBox.width/2
                            enabled: _icon.checked
                        }
                    }
                    SwitchButton 
                    {
                        id: _enabled
                        text: "Enabled"
                        checked: true
                        width: parent.width
                    }
                }
            } // GroupBox
        } // Column
    } // ScrollablePage
}
