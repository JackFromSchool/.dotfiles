import Quickshell.Hyprland
import QtQuick

Repeater {
   id: root
   model: 10

   Workspace {
      num: (index + 1)
   }
}
