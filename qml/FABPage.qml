/** Copyright (C) Olivier Le Doeuff 2019 
 * Contact: olivier.ldff@gmail.com */

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import QQuickMaterialHelper.Components 1.12
import QQuickMaterialHelper.Containers 1.12
import QQuickMaterialHelper.Style 1.12

Page {
    id: page

    header: ToolBar 
    {
        //anchors.fill: parent
        AppBarContent { anchors.fill: parent; title: "Floating Action Buttons" }
    } // ToolBar

    SwipeView 
    {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        ScrollablePage 
        {
            width: swipeView.width
            height: swipeView.height
            bottomPadding: 0
            Pane
            {
                anchors.fill: parent
                ColumnLayout 
                {
                    width: parent.width
                    spacing: 10

                    Column
                    {
                        Layout.fillWidth: true

                        SwitchDelegate
                        {
                            id: _enabledSwitch
                            text: "Enabled"
                            checked: true
                            width: parent.width
                        } // SwitchDelegate

                        SwitchDelegate
                        {
                            id: _scaleSwitch
                            text: "Scale"
                            checked: true
                            width: parent.width
                        } // SwitchDelegate
                    }

                    Label 
                    {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignTop

                        wrapMode: Label.Wrap
                        text: "A floating action button (FAB) represents the primary action of a screen."
                    }

                    Label
                    {
                        text: "Mini Fab"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    }

                    RowLayout
                    {
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 15
                        MiniFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/plus.svg"
                            Layout.alignment: Qt.AlignHCenter
                            flat: false
                            highlighted: true
                            enabled: _enabledSwitch.checked
                            enabledScale: _scaleSwitch.checked
                        }
                        MiniFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/pencil.svg"
                            Layout.alignment: Qt.AlignHCenter
                            flat: false
                            enabled: _enabledSwitch.checked
                            enabledScale: _scaleSwitch.checked
                        }
                        MiniFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/content-copy.svg"
                            Layout.alignment: Qt.AlignHCenter
                            highlighted: true
                            enabled: _enabledSwitch.checked
                            enabledScale: _scaleSwitch.checked
                        }
                        MiniFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/crosshairs-gps.svg"
                            Layout.alignment: Qt.AlignHCenter
                            enabled: _enabledSwitch.checked
                            enabledScale: _scaleSwitch.checked
                        }
                    } // RowLayout

                    Label
                    {
                        text: "Default Fab"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    }

                    RowLayout
                    {
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 15
                        FabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/plus.svg"
                            text: "Default"
                            Layout.alignment: Qt.AlignHCenter
                            enabled: _enabledSwitch.checked
                            enabledScale: _scaleSwitch.checked
                        }
                        FabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/pencil.svg"
                            Layout.alignment: Qt.AlignHCenter
                            highlighted: false
                            enabled: _enabledSwitch.checked
                            enabledScale: _scaleSwitch.checked
                        }
                        FabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/content-copy.svg"
                            Layout.alignment: Qt.AlignHCenter
                            flat: true
                            enabled: _enabledSwitch.checked
                            enabledScale: _scaleSwitch.checked
                        }
                        FabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/crosshairs-gps.svg"
                            Layout.alignment: Qt.AlignHCenter
                            flat: true
                            highlighted: false
                            enabled: _enabledSwitch.checked
                            enabledScale: _scaleSwitch.checked
                        }
                    } // RowLayout

                    Label
                    {
                        text: "Extended Fab"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    }

                    GridLayout
                    {
                        Layout.alignment: Qt.AlignHCenter
                        rowSpacing: 15
                        columnSpacing: 15
                        columns: 2
                        ExtendedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/plus.svg"
                            text: "Extended"
                            Layout.alignment: Qt.AlignHCenter
                            enabled: _enabledSwitch.checked
                            enabledScale: _scaleSwitch.checked
                        }
                        ExtendedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/pencil.svg"
                            text: "Extended"
                            Layout.alignment: Qt.AlignHCenter
                            highlighted: false
                            enabled: _enabledSwitch.checked
                            enabledScale: _scaleSwitch.checked
                        }
                        ExtendedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/content-copy.svg"
                            text: "Extended"
                            Layout.alignment: Qt.AlignHCenter
                            flat: true
                            enabled: _enabledSwitch.checked
                            enabledScale: _scaleSwitch.checked
                        }
                        ExtendedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/crosshairs-gps.svg"
                            text: "Extended"
                            Layout.alignment: Qt.AlignHCenter
                            flat: true
                            highlighted: false
                            enabled: _enabledSwitch.checked
                            enabledScale: _scaleSwitch.checked
                        }
                    } // GridLayout

                    Label
                    {
                        text: "Default To Fab"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    }
                    ExtendedFabButton
                    {
                        icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/crosshairs-gps.svg"
                        text: "Extended"
                        Layout.alignment: Qt.AlignHCenter
                        enabled: _enabledSwitch.checked
                        extendedOnHovered: true
                    }
                } // ColumnLayout
            } // Page
        } // ScrollablePage

        ScrollablePage 
        {
            width: swipeView.width
            height: swipeView.height
            bottomPadding: 0
            Pane
            {
                anchors.fill: parent
                ColumnLayout 
                {
                    width: parent.width
                    spacing: 5
                    Label
                    {
                        text: "Flat Fab Button"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    } // Label

                    Row
                    {
                        Layout.alignment: Qt.AlignHCenter
                        FlatFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/thumb-up.svg"
                            checkable : true
                        } // FlatFabButton
                        FlatFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/settings.svg"
                        } // FlatFabButton
                        FlatFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/heart.svg"
                            enabled: false
                        } // FlatFabButton
                    } // Row

                    Label
                    {
                        text: "Mini Flat Fab Button"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    } // Label

                    Row
                    {
                        Layout.alignment: Qt.AlignHCenter
                        MiniFlatFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/plus.svg"
                            checkable : true
                        } // MiniFlatFabButton
                        MiniFlatFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/music-note.svg"
                        } // MiniFlatFabButton
                        MiniFlatFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/wifi.svg"
                            enabled: false
                        } // MiniFlatFabButton
                    } // Row

                    Label
                    {
                        text: "Flat Fab Button (No Clip)"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    } // Label

                    Row
                    {
                        Layout.alignment: Qt.AlignHCenter
                        FlatFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/thumb-up.svg"
                            checkable : true
                            rippleClip: false
                        } // FlatFabButton
                        FlatFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/heart.svg"
                            rippleClip: false
                        } // FlatFabButton
                        FlatFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/settings.svg"
                            enabled: false
                            rippleClip: false
                        } // FlatFabButton
                    } // Row

                    Label
                    {
                        text: "Mini Flat Fab Button (No Clip)"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    } // Label

                    Row
                    {
                        Layout.alignment: Qt.AlignHCenter
                        MiniFlatFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/crosshairs-gps.svg"
                            checkable : true
                            rippleClip: false
                        } // MiniFlatFabButton
                        MiniFlatFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/content-copy.svg"
                            rippleClip: false
                        } // MiniFlatFabButton
                        MiniFlatFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/heart.svg"
                            rippleClip: false
                            enabled: false
                        } // MiniFlatFabButton
                    } // Row

                    Label
                    {
                        text: "Scalable Flat Fab Button"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    } // Label

                    Grid
                    {
                        Layout.alignment: Qt.AlignHCenter
                        verticalItemAlignment: Grid.AlignVCenter
                        ScalableFlatFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/content-copy.svg"
                            checkable : true

                        } // MiniFlatFabButton
                        ScalableFlatFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/plus.svg"
                        } // MiniFlatFabButton
                        ScalableFlatFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/heart.svg"
                            enabled: false
                        } // MiniFlatFabButton
                    } // Row

                    Label
                    {
                        text: "Scalable Mini Flat Fab Button"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    } // Label

                    Grid
                    {
                        Layout.alignment: Qt.AlignHCenter
                        verticalItemAlignment: Grid.AlignVCenter
                        ScalableFlatFabButton
                        {
                            type: MaterialStyle.FabType.Mini
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/plus-circle-outline.svg"
                            checkable : true

                        } // MiniFlatFabButton
                        ScalableFlatFabButton
                        {
                            type: MaterialStyle.FabType.Mini
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/settings.svg"
                            rippleClip: true
                        } // MiniFlatFabButton
                        ScalableFlatFabButton
                        {
                            type: MaterialStyle.FabType.Mini
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/heart.svg"
                            enabled: false
                            rippleClip: true
                        } // MiniFlatFabButton
                    } // Row
                } // ColumnLayout
            } // Pane
        } // ScrollablePage

        ScrollablePage 
        {
            width: swipeView.width
            height: swipeView.height
            bottomPadding: 0
            Pane
            {
                anchors.fill: parent
                ColumnLayout 
                {
                    width: parent.width
                    spacing: 5
                    Label
                    {
                        text: "Outlined Fab Button"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    } // Label

                    Row
                    {
                        Layout.alignment: Qt.AlignHCenter
                        OutlinedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/airplane.svg"
                            checkable : true
                        } // OutlinedFabButton
                        OutlinedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/album.svg"
                        } // OutlinedFabButton
                        OutlinedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/compass.svg"
                            enabled: false
                        } // OutlinedFabButton
                    } // Row

                    Label
                    {
                        text: "Mini Outlined Fab Button"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    } // Label

                    Row
                    {
                        Layout.alignment: Qt.AlignHCenter
                        MiniOutlinedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/content-copy.svg"
                            checkable : true
                        } // MiniOutlinedFabButton
                        MiniOutlinedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/crosshairs-gps.svg"
                        } // MiniOutlinedFabButton
                        MiniOutlinedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/format-bold.svg"
                            enabled: false
                        } // MiniOutlinedFabButton
                    } // Row

                    Label
                    {
                        text: "Outlined Fab Button (No Clip)"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    } // Label

                    Row
                    {
                        Layout.alignment: Qt.AlignHCenter
                        OutlinedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/heart.svg"
                            checkable : true
                            rippleClip: false
                        } // OutlinedFabButton
                        OutlinedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/music-note.svg"
                            rippleClip: false
                        } // OutlinedFabButton
                        OutlinedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/palette.svg"
                            enabled: false
                            rippleClip: false
                        } // OutlinedFabButton
                    } // Row

                    Label
                    {
                        text: "Mini Outlined Fab Button (No Clip)"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    } // Label

                    Row
                    {
                        Layout.alignment: Qt.AlignHCenter
                        MiniOutlinedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/pencil.svg"
                            checkable : true
                            rippleClip: false
                        } // MiniOutlinedFabButton
                        MiniOutlinedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/plus.svg"
                            rippleClip: false
                        } // MiniOutlinedFabButton
                        MiniOutlinedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/plus-circle-outline.svg"
                            rippleClip: false
                            enabled: false
                        } // MiniOutlinedFabButton
                    } // Row

                    Label
                    {
                        text: "Scalable Outlined Fab Button"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    } // Label

                    Grid
                    {
                        Layout.alignment: Qt.AlignHCenter
                        verticalItemAlignment: Grid.AlignVCenter
                        ScalableOutlinedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/settings.svg"
                            checkable : true

                        } // MiniOutlinedFabButton
                        ScalableOutlinedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/wifi.svg"
                            rippleClip: true
                        } // MiniOutlinedFabButton
                        ScalableOutlinedFabButton
                        {
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/thumb-up.svg"
                            enabled: false
                            rippleClip: true
                        } // MiniOutlinedFabButton
                    } // Row

                    Label
                    {
                        text: "Scalable Mini Outlined Fab Button"
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        textType: MaterialStyle.TextType.Body2
                    } // Label

                    Grid
                    {
                        Layout.alignment: Qt.AlignHCenter
                        verticalItemAlignment: Grid.AlignVCenter
                        ScalableOutlinedFabButton
                        {
                            type: MaterialStyle.FabType.Mini
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/heart.svg"
                            checkable : true

                        } // MiniOutlinedFabButton
                        ScalableOutlinedFabButton
                        {
                            type: MaterialStyle.FabType.Mini
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/album.svg"
                            rippleClip: true
                        } // MiniOutlinedFabButton
                        ScalableOutlinedFabButton
                        {
                            type: MaterialStyle.FabType.Mini
                            icon.source: "qrc:/QQuickMaterialHelperGallery/images/icons/thumb-up.svg"
                            enabled: false
                            rippleClip: true
                        } // MiniOutlinedFabButton
                    } // Row
                } // ColumnLayout
            } // Pane
        } // ScrollablePage

        Page 
        {
            width: swipeView.width
            height: swipeView.height

            Label
            {
                text: "Fab Stack"
                anchors.centerIn: parent
            }
        }
    } // SwipeView

    footer: ScrollableTabBar 
    {
        id: tabBar
        elevation: 20
        currentIndex: swipeView.currentIndex

        model: ListModel
        {
            ListElement{ text: "Fab" }
            ListElement{ text: "Flat" }
            ListElement{ text: "Outlined" }
            ListElement{ text: "Stack" }
        }
    }
}
