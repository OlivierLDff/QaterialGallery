import QtQuick 2.12
import QtQuick.Layouts 1.12

import Qaterial 1.0

Page
{
	id : page
    header: ToolBar
    {
    ColumnLayout
        {
            anchors.fill: parent
            spacing: 0
            AppBarContent { title: "Fader" }

            SwitchDelegate
            {
                id: _highlightedSwitch
                text: "Highlight"
                checked: true
                Layout.fillWidth: true
                onPrimary: true
            } // SwitchDelegate
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
                    text: "normal fader"
                }

                GridLayout
                {
                    Fader{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        id:_testSlider
                        from : 0
                        to: Style.rawButton.minHeight/2
                        value: Style.rawButton.cornerRadius
                        stepSize: 1
                        faderWidth : 14
                        orientation: Qt.Vertical
                        enabled : _highlightedSwitch.checked


                     } //fader
                    Fader{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        id:_testSlider2
                        from : 0
                        to: Style.rawButton.minHeight/2
                        value: Style.rawButton.cornerRadius
                        stepSize: 1
                        faderWidth : 14
                        orientation: Qt.Vertical
                        enabled : _highlightedSwitch.checked


                     } // fader



                } // Grid Layout
            } // Column
        } // Pane

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
                    text: "osc fader "
                }

                GridLayout
                {

                    Fader{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        id:_testSlider3
                        osc : true
                        from : 0
                        to: Style.rawButton.minHeight/2
                        value: Style.rawButton.cornerRadius

                        faderColor : Style.red
                        stepSize: 1
                        faderWidth : 40
                        orientation: Qt.Vertical
                        enabled : _highlightedSwitch.checked


                     } // fader
                       Fader{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        id:_testSlider4
                        osc : true
                        from : 0
                        to: Style.rawButton.minHeight/2
                        value: Style.rawButton.cornerRadius

                        faderColor : Style.red
                        stepSize: 1
                        faderWidth : 40
                        orientation: Qt.Vertical
                        enabled : _highlightedSwitch.checked


                     } // fader



                } // Grid Layout
            } // Column Layout
} // pane
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
                    text: "small fader"
                }

                GridLayout
                {
                    Fader{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        id:_testSlider5
                        from : 0
                        to: Style.rawButton.minHeight/2
                        value: Style.rawButton.cornerRadius
                        stepSize: 1
                        faderWidth : 3
                        orientation: Qt.Vertical
                        enabled : _highlightedSwitch.checked
                        faderColor : Style.green


                     }
                    Fader{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        id:_testSlider6
                        from : 0
                        to: Style.rawButton.minHeight/2
                        value: Style.rawButton.cornerRadius
                        stepSize: 1
                        faderWidth : 3
                        orientation: Qt.Vertical
                        enabled : _highlightedSwitch.checked
                        faderColor : Style.green

                     }



                } // Grid Layout
            } // Column
        }
}
  footer: FixedTabBar
    {
        id: tabBar
        elevation: 20
        currentIndex: swipeView.currentIndex

        model: ListModel
        {
            ListElement{ text: "Normal Fader" }
            ListElement{ text: "Osc" }
             ListElement{ text: "Small Fader" }
        }
    }
}