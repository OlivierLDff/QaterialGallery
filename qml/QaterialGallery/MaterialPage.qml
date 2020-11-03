/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

// Qaterial
import Qaterial 1.0 as Qaterial

Qaterial.Page
{
  id: _page
  header: Qaterial.ToolBar
  {
    AppBarContent
    {
      anchors.fill: parent;
      title: "Qaterial Gallery " + Qaterial.Version.readable
    } // AppBarContent
  } // ToolBar

  ListModel
  {
    id: _galleryModel

    ListElement
    {
      title: "App Bars: top"
      text: "Information and actions relating to the current screen."
      icon: "qrc:/QaterialGallery/images/icons/topApp.svg"
      source: "qrc:/QaterialGallery/AppBarTopPage.qml"
    } // ListElement

    ListElement
    {
      title: "ToolTip"
      text: "Display informative text when users hover over, focus on, or tap an element."
      icon: "qrc:/Qaterial/Icons/tooltip-text-outline.svg"
      source: "qrc:/QaterialGallery/ToolTipPage.qml"
    } // ListElement

    ListElement
    {
      title: "Date / Time Picker"
      text: "Date pickers and Time pickers provide a simple way to select a single value from a pre-determined set."
      icon: "qrc:/Qaterial/Icons/clock-outline.svg"
      source: "qrc:/QaterialGallery/DateTimePickersPage.qml"
    } // ListElement

    ListElement
    {
      title: "Menu Bar"
      text: "MenuBar, MenuBarItem, Menu, MenuItem, ..."
      icon: "qrc:/QaterialGallery/images/icons/menu.svg"
      source: "qrc:/QaterialGallery/MenuBarPage.qml"
    } // ListElement

    ListElement
    {
      title: "App Bars: bottom"
      text: "Navigation and key actions at the bottom of mobile screens."
      icon: "qrc:/QaterialGallery/images/icons/bottomApp.svg"
      source: "qrc:/QaterialGallery/AppBarBottomPage.qml"
    } // ListElement

    ListElement
    {
      title: "Button"
      text: "Buttons allow users to take actions, and make choices, with a single tap."
      icon: "qrc:/QaterialGallery/images/icons/button.svg"
      source: "qrc:/QaterialGallery/ButtonPage.qml"
    } // ListElement

    ListElement
    {
      title: "Icon Button"
      text: "Round, Square and tool"
      icon: "qrc:/QaterialGallery/images/icons/thumb-up.svg"
      source: "qrc:/QaterialGallery/IconButtonPage.qml"
    } // ListElement

    ListElement
    {
      title: "FAB"
      text: "A floating action button (FAB) represents the primary action of a screen."
      icon: "qrc:/QaterialGallery/images/icons/plus-circle-outline.svg"
      source: "qrc:/QaterialGallery/FABPage.qml"
    } // ListElement

    ListElement
    {
      title: "Selection controls"
      text: "Selection controls allow the user to select options."
      icon: "qrc:/QaterialGallery/images/icons/checkbox-marked.svg"
      source: "qrc:/QaterialGallery/ControlButtonPage.qml"
    } // ListElement

    ListElement
    {
      title: "Typography"
      text: "Display, Header, Title, Content, ..."
      icon: "qrc:/QaterialGallery/images/icons/format-letter-case.svg"
      source: "qrc:/QaterialGallery/TypoPage.qml"
    } // ListElement

    ListElement
    {
      title: "Text Field"
      text: "Text fields let users enter and edit text."
      icon: "qrc:/QaterialGallery/images/icons/textbox.svg"
      source: "qrc:/QaterialGallery/TextFieldPage.qml"
    } // ListElement

    ListElement
    {
      title: "Tabs"
      text: "Tabs organize content across different screens, data sets, and other interactions."
      icon: "qrc:/QaterialGallery/images/icons/tab.svg"
      source: "qrc:/QaterialGallery/TabBarPage.qml"
    } // ListElement

    ListElement
    {
      title: "Cards"
      text: "Cards contain content and actions about a single subject."
      icon: "qrc:/QaterialGallery/images/icons/pane.svg"
      source: "qrc:/QaterialGallery/CardPage.qml"
    } // ListElement

    ListElement
    {
      title: "Frame";
      text: "Visual frame for a logical group of controls."
      icon: "qrc:/QaterialGallery/images/icons/frame.svg"
      source: "qrc:/QaterialGallery/FramePage.qml"
    } // ListElement

    ListElement
    {
      title: "Group Box"
      text: "Visual frame and title for a logical group of controls."
      icon: "qrc:/QaterialGallery/images/icons/groupBox.svg"
      source: "qrc:/QaterialGallery/GroupBoxPage.qml"
    } // ListElement

    ListElement
    {
      title: "SnackBars"
      text: "Snackbars provide brief messages about app processes."
      icon: "qrc:/QaterialGallery/images/icons/snackbar.svg"
      source: "qrc:/QaterialGallery/SnackbarPage.qml"
    } // ListElement

    ListElement
    {
      title: "Banners"
      text: "A banner displays a prominent message and related optional actions."
      icon: "qrc:/QaterialGallery/images/icons/banner.svg"
      source: "qrc:/QaterialGallery/BannerPage.qml"
    } // ListElement

    ListElement
    {
      title: "Dialog"
      text: "Dialogs inform users about a task and can contain critical information, require decisions, or involve multiple tasks."
      icon: "qrc:/QaterialGallery/images/icons/dialog.svg"
      source: "qrc:/QaterialGallery/DialogPage.qml"
    } // ListElement

    ListElement
    {
      title: "Sliders"
      text: "Sliders are used to select values by sliding a handle along a track. "
      icon: "qrc:/QaterialGallery/images/icons/sliders.svg"
      source: "qrc:/QaterialGallery/SlidersPage.qml"
    } // ListElement

    ListElement
    {
      title: "Steppers"
      text: "Steppers are Navigation Components used to display progress through a sequence of logical and numbered steps."
      icon: "qrc:/QaterialGallery/images/icons/format-list-checks.svg"
      source: "qrc:/QaterialGallery/StepperPage.qml"
    } // ListElement

    ListElement
    {
      title: "Dialog Delegates"
      text: "Item delegate than call a dialog"
      icon: "qrc:/QaterialGallery/images/icons/delegate.svg"
      source: "qrc:/QaterialGallery/DialogDelegatePage.qml"
    } //ListElement

    /*ListElement
    {
      title: "Fader"
      text: "An Item that can have a value between 0 and 100"
      icon: "qrc:/QaterialGallery/images/icons/fader.svg"
      source: "qrc:/QaterialGallery/FaderPage.qml"
    } // ListElement*/
  } // ListModel

  Component
  {
    id: _galleryModelDelegate

    Qaterial.ItemDelegate
    {
      width: _page.width
      text: model.title
      secondaryText: model.text ? model.text : ""
      highlighted: ListView.isCurrentItem
      icon.source: model.icon
      fillIcon: Qaterial.Style.theme !== Qaterial.Style.Theme.Light
      outlinedIcon: Qaterial.Style.theme === Qaterial.Style.Theme.Light
      highlightedIcon: true
      reverseHighlightIcon: false

      onClicked:
      {
        ListView.currentIndex = index
        stackView.push(model.source)
      }
    } // ItemDelegate
  } // Component

  ListView
  {
    id: _listView

    focus: true
    currentIndex: -1
    anchors.fill: parent

    delegate: _galleryModelDelegate
    model: _galleryModel

    ScrollIndicator.vertical: Qaterial.ScrollIndicator {} // ScrollIndicator
  } // ListView
} // Page
