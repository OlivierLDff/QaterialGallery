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
      AppBarContent { title: "Tab Bar" }

      Qaterial.SwitchDelegate
      {
        Layout.fillWidth: true
        text: checked ? "Enabled" : "Disabled"
        checked: true
        id: _enabledSwitch
        onPrimary: true
      } // SxitchDelegate
    } // ColumnLayout
  } // ToolBar

  Qaterial.SwipeView
  {
    id: _swipeView
    anchors.fill: parent
    currentIndex: _tabBar.currentIndex

    FixedTabBarPage
    {
      width: _swipeView.width
      height: _swipeView.height
      enabled: _enabledSwitch.checked
    } // FixedTabBarPage

    FooterTabBarPage
    {
      width: _swipeView.width
      height: _swipeView.height
      enabled: _enabledSwitch.checked
    } // FooterTabBarPage

    ScrollableTabBarPage
    {
      width: _swipeView.width
      height: _swipeView.height
      enabled: _enabledSwitch.checked
    } // ScrollableTabBarPage

    ClusteredTabBarPage
    {
      width: _swipeView.width
      height: _swipeView.height
      enabled: _enabledSwitch.checked
    } // ClusteredTabBarPage
  } // SwipeView

  footer: Qaterial.FixedTabBar
  {
    id: _tabBar
    elevation: 20
    currentIndex: _swipeView.currentIndex

    model: ListModel
    {
      ListElement { text: "Fixed" }
      ListElement { text: "Footer" }
      ListElement { text: "Scrollable" }
      ListElement { text: "Clustered" }
    } // ListModel
  } // FixedTabBar
} // Page
