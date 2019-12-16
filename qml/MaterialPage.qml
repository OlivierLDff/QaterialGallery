import QtQuick 2.12
import QtQuick.Layouts 1.12

import Qaterial 1.0

Page
{
    header: ToolBar
    {
        AppBarContent { anchors.fill: parent; title: "Qaterial Gallery" }
    } // ToolBar

    ListModel
    {
        id: galleryModel
        ListElement
        {
            title: "App Bars: top";
            text: "Information and actions relating to the current screen."
            icon: "qrc:/QaterialGallery/images/icons/topApp.svg"
            source: "qrc:/QaterialGallery/qml/AppBarTopPage.qml"
        } // ListElement
        ListElement
        {
            title: "Menu Bar";
            text: "MenuBar, MenuBarItem, Menu, MenuItem, ..."
            icon: "qrc:/QaterialGallery/images/icons/menu.svg"
            source: "qrc:/QaterialGallery/qml/MenuBarPage.qml"
        } // ListElement
        ListElement
        {
            title: "App Bars: bottom";
            text: "Navigation and key actions at the bottom of mobile screens."
            icon: "qrc:/QaterialGallery/images/icons/bottomApp.svg"
            source: "qrc:/QaterialGallery/qml/AppBarBottomPage.qml"
        } // ListElement
        ListElement
        {
            title: "Button";
            text: "Buttons allow users to take actions, and make choices, with a single tap."
            icon: "qrc:/QaterialGallery/images/icons/button.svg"
            source: "qrc:/QaterialGallery/qml/ButtonPage.qml"
        } // ListElement
        ListElement
        {
            title: "Icon Button";
            text: "Round, Square and tool"
            icon: "qrc:/QaterialGallery/images/icons/thumb-up.svg"
            source: "qrc:/QaterialGallery/qml/IconButtonPage.qml"
        } // ListElement
        ListElement
        {
            title: "FAB";
            text: "A floating action button (FAB) represents the primary action of a screen."
            icon: "qrc:/QaterialGallery/images/icons/plus-circle-outline.svg"
            source: "qrc:/QaterialGallery/qml/FABPage.qml"
        } // ListElement
        ListElement
        {
            title: "Selection controls";
            text: "Selection controls allow the user to select options."
            icon: "qrc:/QaterialGallery/images/icons/checkbox-marked.svg"
            source: "qrc:/QaterialGallery/qml/ControlButtonPage.qml"
        } // ListElement
       /* ListElement
        {
            title: "Elevation";
            text: "Display card with elevations"
            icon: "qrc:/QaterialGallery/images/icons/format-letter-case.svg"
            source: "qrc:/QaterialGallery/qml/TypoPage.qml"
        } // ListElement*/
        ListElement
        {
            title: "Typography";
            text: "Display, Header, Title, Content, ..."
            icon: "qrc:/QaterialGallery/images/icons/format-letter-case.svg"
            source: "qrc:/QaterialGallery/qml/TypoPage.qml"
        } // ListElement
        ListElement
        {
            title: "Text Field";
            text: "Text fields let users enter and edit text."
            icon: "qrc:/QaterialGallery/images/icons/textbox.svg"
            source: "qrc:/QaterialGallery/qml/TextFieldPage.qml"
        } // ListElement
        ListElement
        {
            title: "Tabs";
            text: "Tabs organize content across different screens, data sets, and other interactions."
            icon: "qrc:/QaterialGallery/images/icons/tab.svg"
            source: "qrc:/QaterialGallery/qml/TabBarPage.qml"
        } // ListElement
        ListElement
        {
            title: "Cards";
            text: "Cards contain content and actions about a single subject."
            icon: "qrc:/QaterialGallery/images/icons/pane.svg"
            source: "qrc:/QaterialGallery/qml/CardPage.qml"
        } // ListElement
        ListElement
        {
            title: "Frame";
            text: "Visual frame for a logical group of controls."
            icon: "qrc:/QaterialGallery/images/icons/frame.svg"
            source: "qrc:/QaterialGallery/qml/FramePage.qml"
        } // ListElement
        ListElement
        {
            title: "Group Box";
            text: "Visual frame and title for a logical group of controls."
            icon: "qrc:/QaterialGallery/images/icons/groupBox.svg"
            source: "qrc:/QaterialGallery/qml/GroupBoxPage.qml"
        } // ListElement
        ListElement
        {
            title: "SnackBars";
            text: "Snackbars provide brief messages about app processes."
            icon: "qrc:/QaterialGallery/images/icons/snackbar.svg"
            source: "qrc:/QaterialGallery/qml/SnackbarPage.qml"
        } // ListElement
        ListElement
        {
            title: "Banners";
            text: "A banner displays a prominent message and related optional actions."
            icon: "qrc:/QaterialGallery/images/icons/banner.svg"
            source: "qrc:/QaterialGallery/qml/BannerPage.qml"
        } // ListElement
        ListElement
        {
            title: "Dialog";
            text: "Dialogs inform users about a task and can contain critical information, require decisions, or involve multiple tasks."
            icon: "qrc:/QaterialGallery/images/icons/dialog.svg"
            source: "qrc:/QaterialGallery/qml/DialogPage.qml"
        } // ListElement
        ListElement
        {
            title: "Sliders";
            text: "Dialogs inform users about a task and can contain critical information, require decisions, or involve multiple tasks."
            icon: "qrc:/QaterialGallery/images/icons/dialog.svg"
            source: "qrc:/QaterialGallery/qml/DialogPage.qml"
        } // ListElement
        ListElement
        {
            title: "Lists";
            text: "Lists are continuous, vertical indexes of text or images."
            icon: "qrc:/QaterialGallery/images/icons/delegate.svg"
            source: "qrc:/QaterialGallery/qml/DelegatePage.qml"
        } // ListElement
        ListElement
        {
            title: "Dialog Delegates";
            text: "Item delegate than call a dialog"
            icon: "qrc:/QaterialGallery/images/icons/delegate.svg"
            source: "qrc:/QaterialGallery/qml/DialogDelegatePage.qml"
        }
         ListElement
        {
            title: "Fader";
            text: "An Item that can have a value between 0 and 100"
            icon: "qrc:/QaterialGallery/images/icons/fader.svg"
            source: "qrc:/QaterialGallery/qml/FaderPage.qml"
        } // ListElement
        /*ListElement
        {
            title: "Progress Indicator";
            text: "Linear, circular, indeterminate"
            icon: "qrc:/QaterialGallery/images/icons/delegate.svg"
            source: "qrc:/QaterialGallery/qml/DelegatePage.qml"
        } // ListElement*/
    } // ListModel

    Component
    {
        id: galleryModelDelegate
        ItemDelegate
        {
            width: parent.width
            text: model.title
            secondaryText: model.text ? model.text : ""
            highlighted: ListView.isCurrentItem
            icon.source: model.icon
            fillIcon: Style.theme !== Style.Theme.Light
            outlinedIcon: Style.theme === Style.Theme.Light
            highlightedIcon: true
            reverseHighlightIcon: false

            onClicked:
            {
                ListView.currentIndex = index
                stackView.push(model.source)
            }
        }
    }

    ListView
    {
        id: listView

        focus: true
        currentIndex: -1
        anchors.fill: parent

        delegate: galleryModelDelegate
        model: galleryModel

        ScrollIndicator.vertical: ScrollIndicator { }
    }
}