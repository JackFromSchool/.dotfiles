import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland

Rectangle {
   id: root
   radius: 15
   antialiasing: true
   border.color: Colors.primary
   border.width: 1.5

   color: Qt.alpha(Colors.primary_container, 0.6)

   Layout.preferredWidth: contentContainer.implicitWidth
   Layout.preferredHeight: 30

   default property alias data: contentContainer.children

   RowLayout {
      id: contentContainer
      anchors.fill: parent
      anchors.topMargin: 0
      anchors.leftMargin: 0
      anchors.rightMargin: 0
   }
}
