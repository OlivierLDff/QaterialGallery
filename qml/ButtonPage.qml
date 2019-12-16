/** Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com */

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
            AppBarContent { title: "Buttons" }

            SwitchDelegate
            {
                id: _highlightedSwitch
                text: "Highlight"
                checked: true
                Layout.fillWidth: true
                onPrimary: true
            } // SwitchDelegate

            RowLayout
            {
                Layout.fillWidth: true
                Layout.rightMargin: 10
                Layout.leftMargin: 10
                spacing: 10

                Label
                {
                    text: "Radius (" + _radiusSlider.value + ")"
                    textType: Style.TextType.Body2
                    onPrimary: true
                } // Label

                Slider
                {
                    id: _radiusSlider
                    Layout.fillWidth: true
                    from: 0
                    to: Style.rawButton.minHeight/2
                    value: Style.rawButton.cornerRadius
                    stepSize: 1
                } // Slider
            } // RowLayout
        } // ColumnLayout
    } // ToolBar

    SwipeView
    {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Pane
        {
            width: swipeView.width
            height: swipeView.height
            bottomPadding: 0
            ColumnLayout
            {
                anchors.fill: parent

                Label
                {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop

                    wrapMode: Label.Wrap
                    text: "Raised buttons add dimensions to mostly flat layouts. " +
                        "They emphasize functions on busy or wide spaces."
                }

                GridLayout
                {
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    Layout.fillWidth: true
                    columns: 2
                    rowSpacing : 40
                    RaisedButton
                    {
                        text: "Raised Button"
                        Layout.alignment: Qt.AlignRight
                        highlighted: _highlightedSwitch.checked
                        radius: _radiusSlider.value
                    }
                    RaisedButton
                    {
                        text: "Disabled"
                        enabled: false
                        radius: _radiusSlider.value
                    }
                    RaisedButton
                    {
                        text: "Raised Button"
                        icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
                        Layout.alignment: Qt.AlignRight
                        highlighted: _highlightedSwitch.checked
                        radius: _radiusSlider.value
                    }
                    RaisedButton
                    {
                        text: "Disabled"
                        icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
                        enabled: false
                        radius: _radiusSlider.value
                    }
                } // Grid Layout
            } // Column
        } // Pane

        Pane
        {
            width: swipeView.width
            height: swipeView.height

            ColumnLayout
            {
                anchors.fill: parent

                Label
                {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop

                    wrapMode: Label.Wrap
                    text: "A flat button displayes an ink splash on press but does not lift. " +
                        "Use flat buttons on toolbars, in dialogs and inline with padding."
                }

                GridLayout
                {
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    Layout.fillWidth: true
                    columns: 2
                    rowSpacing : 40
                    FlatButton
                    {
                        text: "Flat Button"
                        Layout.alignment: Qt.AlignRight
                        highlighted: _highlightedSwitch.checked
                        radius: _radiusSlider.value
                    }
                    FlatButton
                    {
                        text: "Disabled"
                        enabled: false
                        radius: _radiusSlider.value
                    }
                    FlatButton
                    {
                        text: "Flat Button"
                        icon.source: "qrc:/QaterialGallery/images/icons/plus-circle-outline.svg"
                        Layout.alignment: Qt.AlignRight
                        highlighted: _highlightedSwitch.checked
                        radius: _radiusSlider.value
                    }
                    FlatButton
                    {
                        text: "Disabled"
                        icon.source: "qrc:/QaterialGallery/images/icons/plus-circle-outline.svg"
                        enabled: false
                        radius: _radiusSlider.value
                    }
                }
            } // Column
        } // Pane

        Pane
        {
            width: swipeView.width
            height: swipeView.height

            ColumnLayout
            {
                anchors.fill: parent

                Label
                {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop

                    wrapMode: Label.Wrap
                    text: "Outline buttons become opaque and elevate when pressed. " +
                        "They are often paired with raised buttons to indicate an alternaive, secondary action."
                }

                GridLayout
                {
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    Layout.fillWidth: true
                    columns: 2
                    rowSpacing : 40
                    OutlineButton
                    {
                        text: "Outline Button"
                        Layout.alignment: Qt.AlignRight
                        highlighted: _highlightedSwitch.checked
                        radius: _radiusSlider.value
                    }
                    OutlineButton
                    {
                        text: "Disabled"
                        enabled: false
                        radius: _radiusSlider.value
                    }
                    OutlineButton
                    {
                        text: "Outline Button"
                        icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
                        Layout.alignment: Qt.AlignRight
                        highlighted: _highlightedSwitch.checked
                        radius: _radiusSlider.value
                    }
                    OutlineButton
                    {
                        text: "Disabled"
                        icon.source: "qrc:/QaterialGallery/images/icons/plus.svg"
                        enabled: false
                        radius: _radiusSlider.value
                    }
                }
            } // Column
        } // Pane
    } // SwipeView

    footer: FixedTabBar
    {
        id: tabBar
        elevation: 20
        currentIndex: swipeView.currentIndex

        model: ListModel
        {
            ListElement{ text: "Raised" }
            ListElement{ text: "Flat" }
            ListElement{ text: "Outline" }
        }
    }
}
