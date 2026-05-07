import Quickshell
import Quickshell.Io
import QtQuick
import "../"

BarBlock {
   id: root

   property string battery
   property bool hasBattery: false

   content: BarText {
      symbolText: root.battery
   }

   Process {
      id: batteryCheck
      command: ["sh", "-c", "test -d /sys/class/power_supply/BAT*"]
      running: true
      onExited: function (exitcode) {
         root.hasBattery = exitcode == 0;
      }
   }

   Process {
      id: batteryProc
      command: ["sh", "-c", "echo $(cat /sys/class/power_supply/BAT*/capacity),$(cat /sys/class/power_supply/BAT*/status)"]
      running: root.hasBattery

      stdout: SplitParser {
         onRead: function (data) {
            const [capacityStr, status] = data.trim().split(',');
            const capacity = parseInt(capacityStr);
            let batteryIcon = "󰂂";
            if (capacity <= 20)
               batteryIcon = "󰁺";
            else if (capacity <= 40)
               batteryIcon = "󰁽";
            else if (capacity <= 60)
               batteryIcon = "󰁿";
            else if (capacity <= 80)
               batteryIcon = "󰂁";
            else
               batteryIcon = "󰂂";

            const symbol = status === "Charging" ? "\udb85\udc0b" : batteryIcon;
            root.battery = `${symbol} ${capacity}%`;
         }
      }
   }

   Timer {
      interval: 1000
      running: root.hasBattery
      repeat: true
      onTriggered: batteryProc.running = true
   }
}
