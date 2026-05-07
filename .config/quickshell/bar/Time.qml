import Quickshell
import QtQuick

import "../"

BarBlock {
   id: text

   SystemClock {
      id: clock
      precision: SystemClock.Minutes
   }

   content: BarText {
      symbolText: Qt.formatDateTime(clock.date, "dddd hh:mm A")
   }
}
