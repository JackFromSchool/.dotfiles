import QtQuick
import Quickshell
import Quickshell.Hyprland

import "../"

BarBlock {
   id: root
   property int num

   property var ws: Hyprland.workspaces.values.find(w => w.id === num)
   property bool isActive: Hyprland.focusedMonitor?.activeWorkspace?.id === num

   visible: ws ? true : false
   content: BarText {
      symbolText: root.isActive ? root.num + "  \uf192" : root.num + "  \uf111"
   }

   onClicked: function () {
      Hyprland.dispatch("workspace " + num);
   }
}
