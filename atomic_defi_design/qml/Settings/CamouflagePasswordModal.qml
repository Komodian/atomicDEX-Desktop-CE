import QtQuick 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import "../Components"
import "../Constants"

BasicModal {
    id: root

    width: 1100

    onClosed: {
        input_password.reset()
    }

    ModalContent {
        title: API.app.settings_pg.empty_string + (qsTr("Setup Camouflage Password"))

        FloatingBackground {
            id: warning_bg
            Layout.alignment: Qt.AlignHCenter
            Layout.bottomMargin: 10

            width: parent.width - 5
            height: warning_texts.height + 20

            Column {
                id: warning_texts
                anchors.centerIn: parent
                width: parent.width
                spacing: 10

                DefaultText {
                    width: parent.width - 40
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter

                    text_value: API.app.settings_pg.empty_string + (qsTr("Camouflage Password is a secret password for emergency situations."))
                    font.pixelSize: Style.textSize2
                }

                DefaultText {
                    width: parent.width - 40
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter

                    text_value: API.app.settings_pg.empty_string + (qsTr("Using it to login will display your balance lower than it actually is."))
                }

                DefaultText {
                    width: parent.width - 40
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter

                    text_value: API.app.settings_pg.empty_string + (qsTr("Here you enter the suffix and at login you need to enter {real_password}{suffix}"))
                }
            }
        }

        PasswordForm {
            id: input_password
            Layout.fillWidth: true
            field.placeholderText: API.app.settings_pg.empty_string + (qsTr("Enter a suffix"))
            high_security: false
        }

        // Buttons
        footer: [
            DefaultButton {
                text: API.app.settings_pg.empty_string + (qsTr("Cancel"))
                Layout.fillWidth: true
                onClicked: root.close()
            },

            PrimaryButton {
                text: API.app.settings_pg.empty_string + (qsTr("Save"))
                Layout.fillWidth: true
                enabled: input_password.isValid()
                onClicked: {
                    API.app.set_emergency_password(input_password.field.text)
                    root.close()
                }
            }
        ]
    }
}
