import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0
import "../Components"
import "../Constants"

Item {
    ColumnLayout {
        anchors.centerIn: parent
        DefaultText {
            font.pointSize: Style.textSize2
            text: qsTr("Settings")
        }

        Rectangle {
            color: Style.colorTheme7
            radius: Style.rectangleCornerRadius

            width: 400
            height: 200

            RowLayout {
                anchors.centerIn: parent

                Button {
                    text: qsTr("Delete Wallet")
                    onClicked: {
                        API.get().delete_wallet(API.get().wallet_default_name)
                        API.get().disconnect()
                        onDisconnect()
                    }
                }

                Button {
                    text: qsTr("Log out")
                    onClicked: {
                        API.get().disconnect()
                        onDisconnect()
                    }
                }
            }
        }
    }
}