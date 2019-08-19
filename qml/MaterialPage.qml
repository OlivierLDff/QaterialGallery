import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QQuickMaterialHelper.Fonts 1.12
import QQuickMaterialHelper.Style 1.12

import QQuickMaterialHelper.Components 1.12

Page
{
    header: ToolBar 
    {
        AppBarContent { anchors.fill: parent; title: "Oliv Gallery" }
    } // ToolBar

    ListModel 
    {
        id: galleryModel
        ListElement 
        { 
            title: "App Bars: top";
            text: "Information and actions relating to the current screen."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/topApp.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/AppBarTopPage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "Menu Bar";
            text: "MenuBar, MenuBarItem, Menu, MenuItem, ..."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/menu.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/MenuBarPage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "App Bars: bottom";
            text: "Navigation and key actions at the bottom of mobile screens."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/bottomApp.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/AppBarBottomPage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "Button";
            text: "Buttons allow users to take actions, and make choices, with a single tap."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/button.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/ButtonPage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "Icon Button";
            text: "Round, Square and tool"
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/thumb-up.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/IconButtonPage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "FAB";
            text: "A floating action button (FAB) represents the primary action of a screen."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/plus-circle-outline.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/FABPage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "Selection controls";
            text: "Selection controls allow the user to select options."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/checkbox-marked.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/ControlButtonPage.qml" 
        } // ListElement       
       /* ListElement 
        { 
            title: "Elevation";
            text: "Display card with elevations"
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/format-letter-case.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/TypoPage.qml" 
        } // ListElement*/
        ListElement 
        { 
            title: "Typography";
            text: "Display, Header, Title, Content, ..."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/format-letter-case.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/TypoPage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "Text Field";
            text: "Text fields let users enter and edit text."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/textbox.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/TextFieldPage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "Tabs";
            text: "Tabs organize content across different screens, data sets, and other interactions."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/tab.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/TabBarPage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "Cards";
            text: "Cards contain content and actions about a single subject."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/pane.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/CardPage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "Frame";
            text: "Visual frame for a logical group of controls."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/frame.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/FramePage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "Group Box";
            text: "Visual frame and title for a logical group of controls."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/groupBox.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/GroupBoxPage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "SnackBars";
            text: "Snackbars provide brief messages about app processes."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/snackbar.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/SnackbarPage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "Banners";
            text: "A banner displays a prominent message and related optional actions."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/banner.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/BannerPage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "Dialog";
            text: "Dialogs inform users about a task and can contain critical information, require decisions, or involve multiple tasks."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/dialog.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/DialogPage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "Sliders";
            text: "Dialogs inform users about a task and can contain critical information, require decisions, or involve multiple tasks."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/dialog.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/DialogPage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "Lists";
            text: "Lists are continuous, vertical indexes of text or images."
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/delegate.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/DelegatePage.qml" 
        } // ListElement
        ListElement 
        { 
            title: "Dialog Delegates";
            text: "Item delegate than call a dialog"
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/delegate.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/DialogDelegatePage.qml" 
        }
         ListElement 
        { 
            title: "Fader";
            text: "An Item that can have a value between 0 and 100"
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/fader.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/FaderPage.qml" 
        } // ListElement
        /*ListElement 
        { 
            title: "Progress Indicator";
            text: "Linear, circular, indeterminate"
            icon: "qrc:/QQuickMaterialHelperGallery/images/icons/delegate.svg"
            source: "qrc:/QQuickMaterialHelperGallery/qml/DelegatePage.qml" 
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
            fillIcon: MaterialStyle.theme !== MaterialStyle.Theme.Light
            outlinedIcon: MaterialStyle.theme === MaterialStyle.Theme.Light
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