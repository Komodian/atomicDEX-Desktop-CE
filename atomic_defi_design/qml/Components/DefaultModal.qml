import QtQuick 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import "../Constants"

Popup {
    id: root
    anchors.centerIn: Overlay.overlay
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    Overlay.modal: Rectangle {
        color: "#AA000000"
    }

    // Fade in animation
    onVisibleChanged: {
        if(visible) {
            opacity = 0
            fade_animation.start()
        }
    }

    NumberAnimation {
        id: fade_animation
        target: root
        property: "opacity"
        duration: Style.animationDuration
        to: 1
    }

    background: FloatingBackground { }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

