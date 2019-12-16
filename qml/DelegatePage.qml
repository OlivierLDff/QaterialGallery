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

            AppBarContent { title: "Delegate" }
            spacing: 0

            SwitchDelegate
            {
                id: _enabledSwitch
                text: "Enabled"
                checked: true
                Layout.fillWidth: true
                onPrimary: true
            } // SwitchDelegate
            SwitchDelegate
            {
                id: _separatorSwitch
                text: "Separator"
                checked: true
                Layout.fillWidth: true
                onPrimary: true
            } // SwitchDelegate
        } // ColumnLayout
    } // ToolBar

    ListModel
    {
        id: _dummyModel
        ListElement
        {
            text: "Single-line item";
        }
        ListElement
        {
            text: "Two-line item";
            info: "Secondary text"
        }
        ListElement
        {
            text: "Three-line item";
            info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
        }
        ListElement
        {
            text: "Single-line item longer text";
        }
        ListElement
        {
            text: "Two-line item longer text";
            overline: "overline"
        }
        ListElement
        {
            text: "Three-line item longer text";
            overline: "overline"
            info: "Etiam rhoncus eros ac posuere aliquet."
        }
        ListElement
        {
            source: "qrc:/QaterialGallery/images/icons/airplane.svg";
            text: "Single-line item";
            highlighted: true
        }
        ListElement
        {
            source: "qrc:/QaterialGallery/images/icons/album.svg";
            text: "Two-line item";
            info: "Secondary text"
            highlighted: true
        }
        ListElement
        {
            source: "qrc:/QaterialGallery/images/icons/compass.svg";
            text: "Three-line item";
            info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
            highlighted: true
        }
        ListElement
        {
            source: "qrc:/QaterialGallery/images/icons/music-note.svg";
            text: "Single-line item";
            outlined: true
            highlighted: true
        }
        ListElement
        {
            source: "qrc:/QaterialGallery/images/icons/thumb-up.svg";
            text: "Two-line item";
            info: "Secondary text"
            outlined: true
            highlighted: true
        }
        ListElement
        {
            source: "qrc:/QaterialGallery/images/icons/textbox.svg";
            text: "Three-line item";
            info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
            outlined: true
            highlighted: true
        }
        ListElement
        {
            source: "qrc:/QaterialGallery/images/icons/music-note.svg";
            text: "Single-line item";
            fill: true
        }
        ListElement
        {
            source: "qrc:/QaterialGallery/images/icons/thumb-up.svg";
            text: "Two-line item";
            info: "Secondary text"
            fill: true
        }
        ListElement
        {
            source: "qrc:/QaterialGallery/images/icons/textbox.svg";
            text: "Three-line item";
            info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
            fill: true
        }
        ListElement
        {
            source: "qrc:/QaterialGallery/images/icons/music-note.svg";
            text: "Single-line item";
            fill: true
            highlighted: true
            reverseHighlight: true
        }
        ListElement
        {
            source: "qrc:/QaterialGallery/images/icons/thumb-up.svg";
            text: "Two-line item";
            info: "Secondary text"
            fill: true
            highlighted: true
            reverseHighlight: true
        }
        ListElement
        {
            source: "qrc:/QaterialGallery/images/icons/textbox.svg";
            text: "Three-line item";
            info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
            fill: true
            highlighted: true
            reverseHighlight: true
        }
        ListElement
        {
            roundImage: "qrc:/QaterialGallery/images/card80x80_1.png";
            text: "Single-line item";
        }
        ListElement
        {
            roundImage: "qrc:/QaterialGallery/images/card80x80_2.png";
            text: "Two-line item";
            info: "Secondary text"
        }
        ListElement
        {
            roundImage: "qrc:/QaterialGallery/images/card168x168_1.png";
            text: "Three-line item";
            info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
        }
        ListElement
        {
            roundImage: "qrc:/QaterialGallery/images/card168x168_5.png";
            text: "Single-line item";
            large: true
        }
        ListElement
        {
            roundImage: "qrc:/QaterialGallery/images/card168x168_4.png";
            text: "Two-line item";
            info: "Secondary text"
            large: true
        }
        ListElement
        {
            roundImage: "qrc:/QaterialGallery/images/card168x168_1.png";
            text: "Three-line item";
            info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
            large: true
        }
        ListElement
        {
            squareImage: "qrc:/QaterialGallery/images/card168x168_2.png";
            text: "Single-line item";
        }
        ListElement
        {
            squareImage: "qrc:/QaterialGallery/images/card168x168_3.png";
            text: "Two-line item";
            info: "Secondary text"
        }
        ListElement
        {
            squareImage: "qrc:/QaterialGallery/images/card168x168_4.png";
            text: "Three-line item";
            info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
        }
        ListElement
        {
            squareImage: "qrc:/QaterialGallery/images/card80x80_1.png";
            text: "Single-line item";
            large: true
        }
        ListElement
        {
            squareImage: "qrc:/QaterialGallery/images/card80x80_2.png";
            text: "Two-line item";
            info: "Secondary text"
            large: true
        }
        ListElement
        {
            squareImage: "qrc:/QaterialGallery/images/card344x194_3.png";
            text: "Three-line item";
            info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
            large: true
        }
        ListElement
        {
            largeImage: "qrc:/QaterialGallery/images/card344x194_1.png";
            text: "Single-line item";
        }
        ListElement
        {
            largeImage: "qrc:/QaterialGallery/images/card344x194_2.png";
            text: "Two-line item";
            info: "Secondary text"
        }
        ListElement
        {
            largeImage: "qrc:/QaterialGallery/images/card344x194_3.png";
            text: "Three-line item";
            info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
        }
    }

    SwipeView
    {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        interactive: false

        Page
        {
            width: swipeView.width
            height: swipeView.height
            ListView
            {
                anchors.fill: parent
                currentIndex: -1
                ScrollIndicator.vertical: ScrollIndicator { }
                model: _dummyModel
                delegate: ItemDelegate
                {
                    width: parent.width
                    highlighted: ListView.isCurrentItem
                    drawSeparator: _separatorSwitch.checked

                    // TEXT
                    text: model.text
                    secondaryText: model.info ? model.info : ""
                    overlineText: model.overline ? model.overline : ""

                    // ICON
                    icon.source: model.source ? model.source : ""
                    fillIcon: model.fill ? model.fill : false
                    outlinedIcon: model.outlined ? model.outlined : false
                    highlightedIcon: model.highlighted ? model.highlighted : false
                    reverseHighlightIcon: model.reverseHighlight ? model.reverseHighlight : false

                    // THUMBNAIL
                    roundSource: model.roundImage ? model.roundImage : ""
                    squareSource: model.squareImage ? model.squareImage : ""
                    largeSource: model.largeImage ? model.largeImage : ""
                    largeThumbnail: model.large ? model.large : false

                    enabled: _enabledSwitch.checked
                }
            } // ListView
        } // Page

        Page
        {
            width: swipeView.width
            height: swipeView.height
            ListView
            {
                anchors.fill: parent
                currentIndex: -1
                ScrollIndicator.vertical: ScrollIndicator { }
                model: _dummyModel
                delegate: SwitchDelegate
                {
                    width: parent.width
                    highlighted: ListView.isCurrentItem
                    drawSeparator: _separatorSwitch.checked

                    // TEXT
                    text: model.text
                    secondaryText: model.info ? model.info : ""
                    overlineText: model.overline ? model.overline : ""

                    // ICON
                    icon.source: model.source ? model.source : ""
                    fillIcon: model.fill ? model.fill : false
                    outlinedIcon: model.outlined ? model.outlined : false
                    highlightedIcon: model.highlighted ? model.highlighted : false
                    reverseHighlightIcon: model.reverseHighlight ? model.reverseHighlight : false

                    // THUMBNAIL
                    roundSource: model.roundImage ? model.roundImage : ""
                    squareSource: model.squareImage ? model.squareImage : ""
                    largeSource: model.largeImage ? model.largeImage : ""
                    largeThumbnail: model.large ? model.large : false

                    enabled: _enabledSwitch.checked
                }
            } // ListView
        } // Page

        Page
        {
            width: swipeView.width
            height: swipeView.height
            ListView
            {
                anchors.fill: parent
                currentIndex: -1
                ScrollIndicator.vertical: ScrollIndicator { }
                model: _dummyModel
                delegate: CheckDelegate
                {
                    width: parent.width
                    highlighted: ListView.isCurrentItem
                    drawSeparator: _separatorSwitch.checked

                    // TEXT
                    text: model.text
                    secondaryText: model.info ? model.info : ""
                    overlineText: model.overline ? model.overline : ""

                    // ICON
                    icon.source: model.source ? model.source : ""
                    fillIcon: model.fill ? model.fill : false
                    outlinedIcon: model.outlined ? model.outlined : false
                    highlightedIcon: model.highlighted ? model.highlighted : false
                    reverseHighlightIcon: model.reverseHighlight ? model.reverseHighlight : false

                    // THUMBNAIL
                    roundSource: model.roundImage ? model.roundImage : ""
                    squareSource: model.squareImage ? model.squareImage : ""
                    largeSource: model.largeImage ? model.largeImage : ""
                    largeThumbnail: model.large ? model.large : false

                    enabled: _enabledSwitch.checked
                }
            } // ListView
        } // Page

        Page
        {
            width: swipeView.width
            height: swipeView.height
            ListView
            {
                anchors.fill: parent
                currentIndex: -1
                ScrollIndicator.vertical: ScrollIndicator { }
                model: _dummyModel
                delegate: RadioDelegate
                {
                    width: parent.width
                    highlighted: ListView.isCurrentItem
                    drawSeparator: _separatorSwitch.checked

                    // TEXT
                    text: model.text
                    secondaryText: model.info ? model.info : ""
                    overlineText: model.overline ? model.overline : ""

                    // ICON
                    icon.source: model.source ? model.source : ""
                    fillIcon: model.fill ? model.fill : false
                    outlinedIcon: model.outlined ? model.outlined : false
                    highlightedIcon: model.highlighted ? model.highlighted : false
                    reverseHighlightIcon: model.reverseHighlight ? model.reverseHighlight : false

                    // THUMBNAIL
                    roundSource: model.roundImage ? model.roundImage : ""
                    squareSource: model.squareImage ? model.squareImage : ""
                    largeSource: model.largeImage ? model.largeImage : ""
                    largeThumbnail: model.large ? model.large : false

                    enabled: _enabledSwitch.checked
                }
            } // ListView
        } // Page

        Page
        {
            width: swipeView.width
            height: swipeView.height
            ListView
            {
                anchors.fill: parent
                currentIndex: -1
                ScrollIndicator.vertical: ScrollIndicator { }
                model: _dummyModel
                delegate: SwipeDelegate
                {
                    width: parent.width
                    highlighted: ListView.isCurrentItem
                    drawSeparator: _separatorSwitch.checked

                    // TEXT
                    text: model.text
                    secondaryText: model.info ? model.info : ""
                    overlineText: model.overline ? model.overline : ""

                    // ICON
                    icon.source: model.source ? model.source : ""
                    fillIcon: model.fill ? model.fill : false
                    outlinedIcon: model.outlined ? model.outlined : false
                    highlightedIcon: model.highlighted ? model.highlighted : false
                    reverseHighlightIcon: model.reverseHighlight ? model.reverseHighlight : false

                    // THUMBNAIL
                    roundSource: model.roundImage ? model.roundImage : ""
                    squareSource: model.squareImage ? model.squareImage : ""
                    largeSource: model.largeImage ? model.largeImage : ""
                    largeThumbnail: model.large ? model.large : false

                    enabled: _enabledSwitch.checked

                    Component
                    {
                        id: removeComponent

                        Rectangle
                        {
                            color: "red"
                            width: parent.width
                            height: parent.height
                            clip: true
                            anchors.left: parent.background.right

                            Label
                            {
                                text: "Remove"
                                onPrimary: true
                                anchors.centerIn: parent
                            }
                        }
                    }

                    //swipe.left: removeComponent
                    swipe.right: removeComponent
                }
            } // ListView
        } // Page
    } // SwipeView

    footer: ScrollableTabBar
    {
        id: tabBar
        elevation: 20
        currentIndex: swipeView.currentIndex

        model: ListModel
        {
            ListElement{ text: "Item" }
            ListElement{ text: "Switch" }
            ListElement{ text: "Check" }
            ListElement{ text: "Radio" }
            ListElement{ text: "Swipe" }
        }
    }
} // Page