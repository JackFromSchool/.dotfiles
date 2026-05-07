import QtQuick
import Quickshell
import QtQuick.Layouts

Rectangle {
   id: root
   radius: 15
   antialiasing: true

   Layout.preferredWidth: contentContainer.implicitWidth + 30
   Layout.preferredHeight: 30

   property Item content
   property Item mouseArea: mouseArea

   property var onClicked: function () {}

   MouseArea {
      id: mouseArea
      anchors.fill: root
      hoverEnabled: true
      acceptedButtons: Qt.LeftButton
      onClicked: root.onClicked()
   }

   color: {
      if (root.mouseArea.containsMouse)
         return "transparent";
      return "transparent";
   }

   states: [
      State {
         when: root.mouseArea.containsMouse
         PropertyChanges {
            target: root
         }
      }
   ]

   Behavior on color {
      ColorAnimation {
         duration: 200
      }
   }

   Item {
      id: contentContainer
      implicitWidth: content.implicitWidth
      implicitHeight: content.implicitHeight
      anchors.centerIn: parent
      children: content
   }
}
