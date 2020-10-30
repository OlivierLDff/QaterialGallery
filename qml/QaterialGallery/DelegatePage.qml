/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

// Qaterial
import Qaterial 1.0 as Qaterial

Qaterial.Page
{
  id: _page

  header: Qaterial.ToolBar
  {
    ColumnLayout
    {
      anchors.fill: parent

      AppBarContent { title: "Delegate" } // AppBarContent
      spacing: 0

      Qaterial.SwitchDelegate
      {
        id: _enabledSwitch
        text: "Enabled"
        checked: true
        Layout.fillWidth: true
        onPrimary: true
      } // SwitchDelegate

      Qaterial.SwitchDelegate
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
    } // ListElement

    ListElement
    {
      text: "Two-line item";
      info: "Secondary text"
    } // ListElement

    ListElement
    {
      text: "Three-line item";
      info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
    } // ListElement

    ListElement
    {
      text: "Single-line item longer text";
    } // ListElement

    ListElement
    {
      text: "Two-line item longer text";
      overline: "overline"
    } // ListElement

    ListElement
    {
      text: "Three-line item longer text";
      overline: "overline"
      info: "Etiam rhoncus eros ac posuere aliquet."
    } // ListElement

    ListElement
    {
      source: "qrc:/QaterialGallery/images/icons/airplane.svg";
      text: "Single-line item";
      highlighted: true
    } // ListElement

    ListElement
    {
      source: "qrc:/QaterialGallery/images/icons/album.svg";
      text: "Two-line item";
      info: "Secondary text"
      highlighted: true
    } // ListElement

    ListElement
    {
      source: "qrc:/QaterialGallery/images/icons/compass.svg";
      text: "Three-line item";
      info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
      highlighted: true
    } // ListElement

    ListElement
    {
      source: "qrc:/QaterialGallery/images/icons/music-note.svg";
      text: "Single-line item";
      outlined: true
      highlighted: true
    } // ListElement

    ListElement
    {
      source: "qrc:/QaterialGallery/images/icons/thumb-up.svg";
      text: "Two-line item";
      info: "Secondary text"
      outlined: true
      highlighted: true
    } // ListElement

    ListElement
    {
      source: "qrc:/QaterialGallery/images/icons/textbox.svg";
      text: "Three-line item";
      info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
      outlined: true
      highlighted: true
    } // ListElement

    ListElement
    {
      source: "qrc:/QaterialGallery/images/icons/music-note.svg";
      text: "Single-line item";
      fill: true
    } // ListElement

    ListElement
    {
      source: "qrc:/QaterialGallery/images/icons/thumb-up.svg";
      text: "Two-line item";
      info: "Secondary text"
      fill: true
    } // ListElement

    ListElement
    {
      source: "qrc:/QaterialGallery/images/icons/textbox.svg";
      text: "Three-line item";
      info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
      fill: true
    } // ListElement

    ListElement
    {
      source: "qrc:/QaterialGallery/images/icons/music-note.svg";
      text: "Single-line item";
      fill: true
      highlighted: true
      reverseHighlight: true
    } // ListElement

    ListElement
    {
      source: "qrc:/QaterialGallery/images/icons/thumb-up.svg";
      text: "Two-line item";
      info: "Secondary text"
      fill: true
      highlighted: true
      reverseHighlight: true
    } // ListElement

    ListElement
    {
      source: "qrc:/QaterialGallery/images/icons/textbox.svg";
      text: "Three-line item";
      info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
      fill: true
      highlighted: true
      reverseHighlight: true
    } // ListElement

    ListElement
    {
      roundImage: "qrc:/QaterialGallery/images/card80x80_1.png";
      text: "Single-line item";
    } // ListElement

    ListElement
    {
      roundImage: "qrc:/QaterialGallery/images/card80x80_2.png";
      text: "Two-line item";
      info: "Secondary text"
    } // ListElement

    ListElement
    {
      roundImage: "qrc:/QaterialGallery/images/card168x168_1.png";
      text: "Three-line item";
      info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
    } // ListElement

    ListElement
    {
      roundImage: "qrc:/QaterialGallery/images/card168x168_5.png";
      text: "Single-line item";
      large: true
    } // ListElement

    ListElement
    {
      roundImage: "qrc:/QaterialGallery/images/card168x168_4.png";
      text: "Two-line item";
      info: "Secondary text"
      large: true
    } // ListElement

    ListElement
    {
      roundImage: "qrc:/QaterialGallery/images/card168x168_1.png";
      text: "Three-line item";
      info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
      large: true
    } // ListElement

    ListElement
    {
      squareImage: "qrc:/QaterialGallery/images/card168x168_2.png";
      text: "Single-line item";
    } // ListElement

    ListElement
    {
      squareImage: "qrc:/QaterialGallery/images/card168x168_3.png";
      text: "Two-line item";
      info: "Secondary text"
    } // ListElement

    ListElement
    {
      squareImage: "qrc:/QaterialGallery/images/card168x168_4.png";
      text: "Three-line item";
      info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
    } // ListElement

    ListElement
    {
      squareImage: "qrc:/QaterialGallery/images/card80x80_1.png";
      text: "Single-line item";
      large: true
    } // ListElement

    ListElement
    {
      squareImage: "qrc:/QaterialGallery/images/card80x80_2.png";
      text: "Two-line item";
      info: "Secondary text"
      large: true
    } // ListElement

    ListElement
    {
      squareImage: "qrc:/QaterialGallery/images/card344x194_3.png";
      text: "Three-line item";
      info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
      large: true
    } // ListElement

    ListElement
    {
      largeImage: "qrc:/QaterialGallery/images/card344x194_1.png";
      text: "Single-line item";
    } // ListElement

    ListElement
    {
      largeImage: "qrc:/QaterialGallery/images/card344x194_2.png";
      text: "Two-line item";
      info: "Secondary text"
    } // ListElement

    ListElement
    {
      largeImage: "qrc:/QaterialGallery/images/card344x194_3.png";
      text: "Three-line item";
      info: "Etiam rhoncus eros ac posuere aliquet. Donec sed lorem eu urna elementum gravida eget a elit."
    } // ListElement
  } // ListModel

  Qaterial.SwipeView
  {
    id: _swipeView
    anchors.fill: parent
    currentIndex: _tabBar.currentIndex
    interactive: false

    Qaterial.Page
    {
      width: _swipeView.width
      height: _swipeView.height

      ListView
      {
        anchors.fill: parent
        currentIndex: -1
        ScrollIndicator.vertical: ScrollIndicator {}
        model: _dummyModel

        delegate: Qaterial.ItemDelegate
        {
          width: _page.width
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
        } // ItemDelegate
      } // ListView
    } // Page

    Qaterial.Page
    {
      width: _swipeView.width
      height: _swipeView.height

      ListView
      {
        anchors.fill: parent
        currentIndex: -1
        ScrollIndicator.vertical: ScrollIndicator {}
        model: _dummyModel

        delegate: Qaterial.SwitchDelegate
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
        } // SwitchDelegate
      } // ListView
    } // Page

    Qaterial.Page
    {
      width: _swipeView.width
      height: _swipeView.height

      ListView
      {
        anchors.fill: parent
        currentIndex: -1
        ScrollIndicator.vertical: ScrollIndicator {}
        model: _dummyModel

        delegate: Qaterial.CheckDelegate
        {
          width: _page.width
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
        } // CheckDelegate
      } // ListView
    } // Page

    Qaterial.Page
    {
      width: _swipeView.width
      height: _swipeView.height

      ListView
      {
        anchors.fill: parent
        currentIndex: -1
        ScrollIndicator.vertical: ScrollIndicator {}
        model: _dummyModel

        delegate: Qaterial.RadioDelegate
        {
          width: _page.width
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
        } // RadioDelegate
      } // ListView
    } // Page

    Qaterial.Page
    {
      width: _swipeView.width
      height: _swipeView.height

      ListView
      {
        anchors.fill: parent
        currentIndex: -1
        ScrollIndicator.vertical: Qaterial.ScrollIndicator {}
        model: _dummyModel

        delegate: Qaterial.SwipeDelegate
        {
          width: _page.width
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

              Qaterial.Label
              {
                text: "Remove"
                onPrimary: true
                anchors.centerIn: parent
              } // Label
            } // Rectangle
          } // Component
          swipe.right: removeComponent
        } // SwipeDelegate
      } // ListView
    } // Page
  } // SwipeView

  footer: Qaterial.ScrollableTabBar
  {
    id: _tabBar
    elevation: 20
    currentIndex: _swipeView.currentIndex

    model: ListModel
    {
      ListElement { text: "Item" }
      ListElement { text: "Switch" }
      ListElement { text: "Check" }
      ListElement { text: "Radio" }
      ListElement { text: "Swipe" }
    } // ListModel
  } // ScrollableTabBar
} // Page
