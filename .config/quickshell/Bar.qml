import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland

import "bar" as Bar

PanelWindow {
   anchors.top: true
   anchors.left: true
   anchors.right: true
   implicitHeight: 35
   color: "transparent"
   WlrLayershell.namespace: "quickshell_blur"

   RowLayout {
      anchors.fill: parent
      anchors.leftMargin: 5
      anchors.rightMargin: 5
      anchors.topMargin: 5

      BarSection {
         Bar.Home {}

         Bar.Workspaces {}

         Bar.Media {}
      }

      Item {
         Layout.fillWidth: true
      }

      BarSection {
         Bar.Time {}
      }

      Item {
         Layout.fillWidth: true
      }

      BarSection {

         Bar.Volume {}

         Bar.Battery {}
      }
   }
}
