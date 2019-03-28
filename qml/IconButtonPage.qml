/** Copyright (C) Olivier Le Doeuff 2019 
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import QQuickMaterialHelper.Components 1.12
import QQuickMaterialHelper.Containers 1.12
import QQuickMaterialHelper.Style 1.12

Page 
{
    id: page

    header: ToolBar 
    {
        ColumnLayout
        {
            anchors.fill: parent
            AppBarContent { title: "Icon Buttons" }
        } // ColumnLayout
    } // ToolBar

    ScrollablePage
    {
        anchors.fill: parent

        ColumnLayout
        {
            width: parent.width
            spacing: 20

            Label 
            {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop

                wrapMode: Label.Wrap
                text: "Blabla."
            } // Label

            Label
            {
                text: "AppBar Button"
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                textType: MaterialStyle.TextType.Body2
            } // Label

            RowLayout
            {
                Layout.alignment: Qt.AlignHCenter
                spacing: 20
                AppBarButton
                {
                    icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/arrow-left.svg"
                } // AppBarButton
                AppBarButton
                {
                    icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/arrow-left.svg"
                    enabled: false
                } // AppBarButton
            } // RowLayout

            Label
            {
                text: "Round Button"
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                textType: MaterialStyle.TextType.Body2
            } // Label

            RowLayout
            {
                Layout.alignment: Qt.AlignHCenter
                spacing: 20
                RoundButton
                {
                    icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/thumb-up.svg"                    
                    checkable : true

                } // RoundButton
                RoundButton
                {
                    icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/thumb-up.svg"
                } // RoundButton
                RoundButton
                {
                    icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/thumb-up.svg"
                    enabled: false
                } // RoundButton
            } // RowLayout

            Label
            {
                text: "Square Button"
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                textType: MaterialStyle.TextType.Body2
            } // Label

            RowLayout
            {
                Layout.alignment: Qt.AlignHCenter
                spacing: 20
                SquareButton
                {
                    icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/heart.svg"
                    checkable : true
                } // SquareButton
                SquareButton
                {
                    icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/heart.svg"
                } // SquareButton
                SquareButton
                {
                    icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/heart.svg"
                    enabled: false
                } // SquareButton
            } // RowLayout

            Label
            {
                text: "Toggle Button"
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                textType: MaterialStyle.TextType.Body2
            } // Label

            RowLayout
            {
                Layout.alignment: Qt.AlignHCenter
                spacing: 0
                Row
                {
                    property int checked: 0
                    ToggleButton
                    {
                        icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/format-align-left.svg"
                        onClicked: parent.checked = 0
                        checked: parent.checked === 0
                    } // ToggleButton          
                    ToggleButton
                    {
                        icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/format-align-center.svg"
                        onClicked: parent.checked = 1
                        checked: parent.checked === 1
                    } // ToggleButton          
                    ToggleButton
                    {
                        icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/format-align-right.svg"
                        onClicked: parent.checked = 2
                        checked: parent.checked === 2
                    } // ToggleButton                    
                }
                ToggleSeparator {}
                Row
                {
                    property int checked: 0
                    ToggleButton
                    {
                        icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/format-bold.svg"
                        onClicked: parent.checked = 0
                        checked: parent.checked === 0
                    } // ToggleButton          
                    ToggleButton
                    {
                        icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/format-italic.svg"
                        onClicked: parent.checked = 1
                        checked: parent.checked === 1
                    } // ToggleButton          
                    ToggleButton
                    {
                        icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/format-underline.svg"
                        onClicked: parent.checked = 2
                        checked: parent.checked === 2
                    } // ToggleButton                    
                }
                ToggleSeparator {}
                ToggleButton
                {
                    icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/pencil.svg"
                    enabled: false
                } // ToggleButton                    
            } // RowLayout

            Label
            {
                text: "Tool Button"
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                textType: MaterialStyle.TextType.Body2
            } // Label

            RowLayout
            {
                Layout.alignment: Qt.AlignHCenter
                spacing: 0
                Row
                {
                    property int checked: 0
                    ToolButton
                    {
                        icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/format-align-left.svg"
                        onClicked: parent.checked = 0
                        checked: parent.checked === 0
                    } // ToolButton          
                    ToolButton
                    {
                        icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/format-align-center.svg"
                        onClicked: parent.checked = 1
                        checked: parent.checked === 1
                    } // ToolButton          
                    ToolButton
                    {
                        icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/format-align-right.svg"
                        onClicked: parent.checked = 2
                        checked: parent.checked === 2
                    } // ToolButton                    
                }
                ToolSeparator {}
                Row
                {
                    property int checked: 0
                    ToolButton
                    {
                        icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/format-bold.svg"
                        onClicked: parent.checked = 0
                        checked: parent.checked === 0
                    } // ToolButton          
                    ToolButton
                    {
                        icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/format-italic.svg"
                        onClicked: parent.checked = 1
                        checked: parent.checked === 1
                    } // ToolButton          
                    ToolButton
                    {
                        icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/format-underline.svg"
                        onClicked: parent.checked = 2
                        checked: parent.checked === 2
                    } // ToolButton                    
                }
                ToolSeparator {}
                ToolButton
                {
                    icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/pencil.svg"
                    enabled: false
                } // ToolButton                    
            } // RowLayout
        } // ColumnLayout
    } // ScrollablePage
} // Page