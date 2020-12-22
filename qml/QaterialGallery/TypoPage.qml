/**
 * Copyright (C) Olivier Le Doeuff 2019
 * Contact: olivier.ldff@gmail.com
 */

// Qt
import QtQuick 2.12
import QtQuick.Layouts 1.12

// Qaterial
import Qaterial 1.0 as Qaterial

Qaterial.ScrollablePage
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

  Column
  {
    TypoPageEntry
    {
      font: Qaterial.Style.textTheme.headline1
      enabled: _enabledSwitch.checked
      text: "headline1"
    }

    TypoPageEntry
    {
      font: Qaterial.Style.textTheme.headline2
      enabled: _enabledSwitch.checked
      text: "headline2"
    }

    TypoPageEntry
    {
      font: Qaterial.Style.textTheme.headline3
      enabled: _enabledSwitch.checked
      text: "headline3"
    }

    TypoPageEntry
    {
      font: Qaterial.Style.textTheme.headline4
      enabled: _enabledSwitch.checked
      text: "headline4"
    }

    TypoPageEntry
    {
      font: Qaterial.Style.textTheme.headline5
      enabled: _enabledSwitch.checked
      text: "headline5"
    }

    TypoPageEntry
    {
      font: Qaterial.Style.textTheme.headline6
      enabled: _enabledSwitch.checked
      text: "headline6"
    }

    TypoPageEntry
    {
      font: Qaterial.Style.textTheme.subtitle1
      enabled: _enabledSwitch.checked
      text: "subtitle1"
    }

    TypoPageEntry
    {
      font: Qaterial.Style.textTheme.subtitle2
      enabled: _enabledSwitch.checked
      text: "subtitle2"
    }

    TypoPageEntry
    {
      font: Qaterial.Style.textTheme.body1
      enabled: _enabledSwitch.checked
      text: "body1"
    }

    TypoPageEntry
    {
      font: Qaterial.Style.textTheme.body2
      enabled: _enabledSwitch.checked
      text: "body2"
    }

    TypoPageEntry
    {
      font: Qaterial.Style.textTheme.button
      enabled: _enabledSwitch.checked
      text: "button"
    }

    TypoPageEntry
    {
      font: Qaterial.Style.textTheme.overline
      enabled: _enabledSwitch.checked
      text: "overline"
    }

    TypoPageEntry
    {
      font: Qaterial.Style.textTheme.caption
      enabled: _enabledSwitch.checked
      text: "caption"
    }

    TypoPageEntry
    {
      font: Qaterial.Style.textTheme.hint1
      enabled: _enabledSwitch.checked
      text: "hint1"
    }

    TypoPageEntry
    {
      font: Qaterial.Style.textTheme.hint2
      enabled: _enabledSwitch.checked
      text: "hint2"
    }
  }
} // Page
