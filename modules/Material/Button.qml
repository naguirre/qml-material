/*
 * QML Material - An application framework implementing Material Design.
 * Copyright (C) 2014 Michael Spencer
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 2.1 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.0
import Material 0.1

View {
    id: button

    height:(type != buttonType.floating) ? units.dp(36) : units.dp(56)
    width: (type != buttonType.floating) ? Math.max(units.dp(64), label.width + units.dp(16)) : height

    radius: (type != buttonType.floating) ? units.dp(2) : units.dp(56)
    property int type: buttonType.raised
    property alias buttonType: buttonType
    property string text
    property string iconName
    property color textColor: Theme.lightDark(backgroundColor, Theme.light.textColor,
                                                                  Theme.dark.textColor)
    elevation: (type == buttonType.flat) ? 0 : 1
    signal triggered

    tintColor: mouseArea.pressed ? Qt.rgba(0,0,0, 0.1) : "transparent"

    backgroundColor: {
        if (type == buttonType.flat)
            Theme.backgroundColor
        else if (type == buttonType.raised)
            Theme.primaryColor
        else
            Theme.accentColor
    }

    Ink {
        id: mouseArea
        anchors.fill: parent

        onClicked: {
            button.triggered()
        }
    }

    Row {
        id: row
        anchors.centerIn: parent
        spacing: units.dp(10)

        Icon {
            anchors.verticalCenter: parent.verticalCenter
            name: button.iconName
            color: "white"
            visible: name != ""
        }

        Label {
            id: label

            anchors.verticalCenter: parent.verticalCenter
            text: button.text.toUpperCase()

            color: button.textColor

            style: "button"
        }
    }

    QtObject {
        id: buttonType
        property int floating: 1
        property int raised: 2
        property int flat: 3
    }
}
