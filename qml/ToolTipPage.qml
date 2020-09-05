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
  id: root

  header: Qaterial.ToolBar
  {
    AppBarContent { anchors.fill: parent; title: "ToolTips" } // AppBarContent
  } // ToolBar

  Qaterial.SwipeView
  {
    id: _swipeView
    anchors.fill: parent
    currentIndex: _tabBar.currentIndex

    Qaterial.ScrollablePage
    {
      width: _swipeView.width
      height: _swipeView.height
      bottomPadding: 0

      ColumnLayout
      {
        width: parent.width

        Qaterial.Label
        {
          Layout.fillWidth: true
          Layout.bottomMargin: 50
          Layout.alignment: Qt.AlignTop

          wrapMode: Text.Wrap
          horizontalAlignment: Text.AlignHCenter
          elide: Text.ElideRight
          maximumLineCount: 3

          text: "When activated (often hen hovered), Tooltips display an element such as a description of its function."
        } // Label

        Qaterial.Label
        {
          Layout.fillWidth: true
          Layout.alignment: Qt.AlignTop
          horizontalAlignment: Text.AlignHCenter

          text: "Simple ToolTip On Button"
          textType: Qaterial.Style.TextType.Body2
        } // Label
        Qaterial.FlatButton
        {
          id: simpleToolTip
          Layout.bottomMargin: 50
          Layout.alignment: Qt.AlignHCenter
          text: "Simple ToolTip"

          Qaterial.ToolTip
          {
            text: "Simple"
            visible: simpleToolTip.hovered
          } // ToolTip
        } // FlatButton

        Qaterial.Label
        {
          Layout.fillWidth: true
          Layout.alignment: Qt.AlignTop
          horizontalAlignment: Text.AlignHCenter

          text: "Apparition Time Customized ToolTip"
          textType: Qaterial.Style.TextType.Body2
        } // Label
        Qaterial.FlatButton
        {
          id: timeToolTip
          Layout.bottomMargin: 50
          Layout.alignment: Qt.AlignHCenter
          text: "delay + timeout"
          Qaterial.ToolTip
          {
            text: "Simple ToolTip"
            visible: timeToolTip.hovered
            delay: 300
            timeout: 800
          } // ToolTip
        } // FlatButton

        Qaterial.Label
        {
          Layout.fillWidth: true
          Layout.alignment: Qt.AlignTop
          horizontalAlignment: Text.AlignHCenter

          text: "Customized ToolTip"
          textType: Qaterial.Style.TextType.Body2
        } // Label
        Qaterial.FlatButton
        {
          id: customizedToolTip
          Layout.alignment: Qt.AlignHCenter
          text: "Big ToolTip"

          Qaterial.ToolTip
          {
            text: "textType + radius"
            visible: customizedToolTip.hovered
            backgroundRadius: height/2
            textType: Qaterial.Style.TextType.Display1
          } // ToolTip
        } // FlatButton
      } // ColumnLayout
    } // ScrollablePage
    Qaterial.Page
    {
      id: zoifb
      width: _swipeView.width
      height: _swipeView.height
      bottomPadding: 0

      Item
      {
        x: (parent.width - width)/2
        y: (parent.height - height)/2
        width: 350
        height: 150

        Qaterial.Label
        {
          anchors.horizontalCenter: parent.horizontalCenter
          y: - (parent.height/2 + 80)
          width: rectangle.width

          wrapMode: Text.Wrap
          horizontalAlignment: Text.AlignHCenter
          elide: Text.ElideRight
          maximumLineCount: 3

          text: "ToolTip position is automatically update if it can't be displayed on the page. So please resize the app if ToolTips don't appear where they are supposed to."
        }

        Rectangle
        {
          id: rectangle
          anchors.fill: parent
          color: "transparent"
          border.color: Qaterial.Style.accentColor

          Qaterial.Label
          {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 20
            width: parent.width - 32
            textType: Qaterial.Style.TextType.Hint

            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            elide: Text.ElideRight
            maximumLineCount: 3

            text: "To get a better view of ToolTip Position you can check \"Debug Buttons\" in Settings on the top left corner."
          }

          Qaterial.FlatButton
          {
            id: topLeft
            x: -width
            y: -height
            text: "TopLeft"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "TopLeft"
              visible: topLeft.hovered || topLeft.pressed
              position: Qaterial.Style.Position.TopLeft
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: topStart
            x: 0
            y: -height
            text: "TopStart"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "TopStart"
              visible: topStart.hovered || topStart.pressed
              position: Qaterial.Style.Position.TopStart
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: top
            x: (parent.width - width)/2
            y: -height
            text: "Top"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "Top"
              visible: top.hovered || top.pressed
              position: Qaterial.Style.Position.Top
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: topEnd
            x: parent.width - width
            y: -height
            text: "TopEnd"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "TopEnd"
              visible: topEnd.hovered || topEnd.pressed
              position: Qaterial.Style.Position.TopEnd
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: topRight
            x: parent.width
            y: -height
            text: "TopRight"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "TopRight"
              visible: topRight.hovered || topRight.pressed
              position: Qaterial.Style.Position.TopRight
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: rightStart
            x: parent.width
            y: 0
            text: "RightStart"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "RightStart"
              visible: rightStart.hovered || rightStart.pressed
              position: Qaterial.Style.Position.RightStart
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: right
            x: parent.width
            y: (parent.height - height)/2
            text: "Right"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "Right"
              visible: right.hovered || right.pressed
              position: Qaterial.Style.Position.Right
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: rightEnd
            x: parent.width
            y: parent.height - height
            text: "RightEnd"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "RightEnd"
              visible: rightEnd.hovered || rightEnd.pressed
              position: Qaterial.Style.Position.RightEnd
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: bottomRight
            x: parent.width
            y: parent.height
            text: "BottomRight"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "BottomRight"
              visible: bottomRight.hovered || bottomRight.pressed
              position: Qaterial.Style.Position.BottomRight
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: bottomEnd
            x: parent.width - width
            y: parent.height
            text: "BottomEnd"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "BottomEnd"
              visible: bottomEnd.hovered || bottomEnd.pressed
              position: Qaterial.Style.Position.BottomEnd
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: bottom
            x: (parent.width - width)/2
            y: parent.height
            text: "Bottom"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "Bottom"
              visible: bottom.hovered || bottom.pressed
              position: Qaterial.Style.Position.Bottom
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: bottomStart
            x: 0
            y: parent.height
            text: "BottomStart"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "BottomStart"
              visible: bottomStart.hovered || bottomStart.pressed
              position: Qaterial.Style.Position.BottomStart
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: bottomLeft
            x: -width
            y: parent.height
            text: "BottomLeft"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "BottomLeft"
              visible: bottomLeft.hovered || bottomLeft.pressed
              position: Qaterial.Style.Position.BottomLeft
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: leftEnd
            x: -width
            y: parent.height - height
            text: "LeftEnd"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "LeftEnd"
              visible: leftEnd.hovered || leftEnd.pressed
              position: Qaterial.Style.Position.LeftEnd
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: left
            x: -width
            y: (parent.height - height)/2
            text: "Left"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "Left"
              visible: left.hovered || left.pressed
              position: Qaterial.Style.Position.Left
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: leftStart
            x: -width
            y: 0
            text: "LeftStart"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "LeftStart"
              visible: leftStart.hovered || leftStart.pressed
              position: Qaterial.Style.Position.LeftStart
            } // ToolTip
          } // FlatButton

          Qaterial.FlatButton
          {
            id: center
            x: (parent.width - width)/2
            y: (parent.height - height)/2
            text: "Center"
            highlighted: false

            Qaterial.ToolTip
            {
              text: "Center"
              visible: center.hovered || center.pressed
              position: Qaterial.Style.Position.Center
            } // ToolTip
          } // FlatButton
        } // Rectangle
      } // Item
    } // ScrollablePage
  } // SwipeView

  footer: Qaterial.FixedTabBar
  {
    id: _tabBar
    elevation: 20
    currentIndex: _swipeView.currentIndex

    model: ListModel
    {
      ListElement{ text: "Classic" }
      ListElement{ text: "Position" }
    } // ListModel
  } // ScrollableTabBar
} // Page