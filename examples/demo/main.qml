import QtQuick 2.2
import Material 0.1

ApplicationWindow {
    initialPage: page
    width: units.dp(480)
    height: units.dp(272)
    Page {
        id: page

        title: "Test Page"

        Column {
            anchors.centerIn: parent
            spacing: units.dp(10)

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: i18n.tr("Demo!")
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                iconName: "content/add"
                type: buttonType.floating
                onTriggered: pageStack.push(Qt.resolvedUrl("SubPage.qml"))
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCente
                text: "Accept"
                type: buttonType.flat
                onTriggered: pageStack.push(Qt.resolvedUrl("SubPage.qml"))
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Open sub page!"
                onTriggered: pageStack.push(Qt.resolvedUrl("SubPage.qml"))
            }
        }
    }
}
