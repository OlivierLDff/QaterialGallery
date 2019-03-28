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
        AppBarContent { anchors.fill: parent; title: "Cards" }
    } // ToolBar

    Flickable 
    {
        //anchors.fill: parent
        width: parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        contentHeight: pane.implicitHeight
        flickableDirection: Flickable.AutoFlickIfNeeded

        Pane 
        {
            id: pane
            width: Math.min(parent.width, 500)
            anchors.horizontalCenter: parent.horizontalCenter
            ColumnLayout
            {
                anchors.fill: parent
                spacing: pane.padding

                CardLayout3
                {
                    Layout.fillWidth: true
                    media: "qrc:/QQuickMaterialHelperGallery/images/card80x80_1.png"
                    headerText: "Title goes here"
                    supportingText: "Cards contain content and actions about a single subject."
                    button1.text: "Action 1"
                    button2.text: "Action 2"
                }

                CardLayout1
                {
                    Layout.fillWidth: true
                    media: "qrc:/QQuickMaterialHelperGallery/images/card344x194_2.png"
                    headerText: "Our Changing Planet"
                    subHeaderText: "by Kurt Wagner"
                    supportingText: "Visit ten places on our planet that are undergoing the biggest changes today."
                    button1.text: "Read"
                    button2.text: "Bookmark"
                    button3.icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/plus.svg"
                    button4.icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/heart.svg"
                }

                CardLayout2
                {
                    Layout.fillWidth: true
                    media: "qrc:/QQuickMaterialHelperGallery/images/card344x194_3.png"
                    thumbnail: "qrc:/QQuickMaterialHelperGallery/images/card40x40.png"
                    headerText: "Title goes here"
                    subHeaderText: "Secondary Text"
                    supportingText: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit."
                    button1.text: "Action 1"
                    button2.text: "Action 2"
                }

                ListView
                {
                    model: 5
                    cacheBuffer : 5
                    Layout.fillWidth: true
                    spacing: MaterialStyle.card.horizontalPadding
                    orientation: ListView.Horizontal
                    implicitHeight: 220
                    delegate: CardLayout4
                    {
                        media: "qrc:/QQuickMaterialHelperGallery/images/card168x168_" + (5-index) + ".png"
                    }
                }

                CardLayout3
                {
                    Layout.fillWidth: true
                    outlined: true
                    media: "qrc:/QQuickMaterialHelperGallery/images/card80x80_2.png"
                    headerText: "Title goes here"
                    supportingText: "Secondary Text Lorem ipsum dolor sit amet"
                    button1.text: "Action 1"
                    button2.text: "Action 2"
                }

                CardLayout1
                {
                    Layout.fillWidth: true
                    outlined: true
                    media: "qrc:/QQuickMaterialHelperGallery/images/card344x194_1.png"
                    headerText: "Our Changing Planet"
                    subHeaderText: "by Kurt Wagner"
                    supportingText: "Visit ten places on our planet that are undergoing the biggest changes today."
                    button1.text: "Read"
                    button2.text: "Bookmark"
                    button3.icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/plus.svg"
                    button4.icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/heart.svg"
                }

                ListView
                {
                    model: 5
                    cacheBuffer : 5
                    Layout.fillWidth: true
                    spacing: MaterialStyle.card.horizontalPadding
                    orientation: ListView.Horizontal
                    implicitHeight: 220
                    delegate: CardLayout4
                    {
                        media: "qrc:/QQuickMaterialHelperGallery/images/card168x168_" + (index+1) + ".png"
                        outlined: true
                    }
                }
            }
        }

        ScrollIndicator.vertical: ScrollIndicator { }
    }
}
