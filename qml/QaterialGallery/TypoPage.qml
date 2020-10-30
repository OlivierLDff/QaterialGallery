/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
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
      spacing: 0

      AppBarContent { title: "Typography" } // AppBarContent

      Qaterial.SwitchDelegate
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
    id: _typoModel

    Component.onCompleted:
    {
      append({ type: "Display 3", textType: Qaterial.Style.TextType.Display3 });
      append({ type: "Display 2", textType: Qaterial.Style.TextType.Display2 });
      append({ type: "Display 1", textType: Qaterial.Style.TextType.Display1 });
      append({ type: "Heading", textType: Qaterial.Style.TextType.Heading });
      append({ type: "Title", textType: Qaterial.Style.TextType.Title });
      append({ type: "Subheading", textType: Qaterial.Style.TextType.Subheading });
      append({ type: "List Text", textType: Qaterial.Style.TextType.ListText });
      append({ type: "List Sec Text", textType: Qaterial.Style.TextType.ListSecText });
      append({ type: "Overline", textType: Qaterial.Style.TextType.Overline });
      append({ type: "Body 2", textType: Qaterial.Style.TextType.Body2 });
      append({ type: "Body 1", textType: Qaterial.Style.TextType.Body1 });
      append({ type: "Caption", textType: Qaterial.Style.TextType.Caption });
      append({ type: "Hint", textType: Qaterial.Style.TextType.Hint });
      append({ type: "Button", textType: Qaterial.Style.TextType.Button });
      append({ type: "Menu", textType: Qaterial.Style.TextType.Menu });
    } // Component
  } // ListModel

  Qaterial.SwipeView
  {
    id: _swipeView
    anchors.fill: parent
    currentIndex: _tabBar.currentIndex

    Qaterial.ScrollablePage
    {
      width: _swipeView.width
      height: _swipeView.height

      ColumnLayout
      {
        spacing: 20

        Repeater
        {
          model: _typoModel

          delegate: RowLayout
          {
            Qaterial.Label
            {
              Layout.preferredWidth: 65
              text: model.type
              textType: Qaterial.Style.TextType.Caption
              usePixelSize: false
            } // Label

            Qaterial.Label
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

    Qaterial.ScrollablePage
    {
      width: _swipeView.width
      height: _swipeView.height

      ColumnLayout
      {
        spacing: 20

        Repeater
        {
          model: _typoModel

          delegate: RowLayout
          {
            Qaterial.Label
            {
              Layout.preferredWidth: 65
              text: model.type
              textType: Qaterial.Style.TextType.Caption
            } // Label

            Qaterial.Label
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

  footer: Qaterial.FixedTabBar
  {
    id: _tabBar
    elevation: 20
    currentIndex: _swipeView.currentIndex

    model: ListModel
    {
      ListElement { text: "Point" }
      ListElement { text: "Pixel" }
    } // ListModel
  } // FixedTabBar
} // Page
