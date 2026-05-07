import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Pipewire

import "../"

BarBlock {
   id: root

   property var sink: Pipewire.defaultAudioSink

   content: BarText {
      symbolText: `${root.sink?.audio?.muted ? "󰖁" : "󰕾"}  ${Math.round(root.sink?.audio?.volume * 100)}%`
   }

   PwObjectTracker {
      objects: [Pipewire.defaultAudioSink]
      onObjectsChanged: {
         sink = Pipewire.defaultAudioSink;
         if (root.sink?.audio) {
            root.sink.audio.volumeChanged.connect(root.updateVolume);
         }
      }
   }

   function updateVolume() {
      if (sink?.audio) {
         const icon = sink.audio.muted ? "󰖁" : "󰕾";
         root.content.symbolText = `${icon} ${Math.round(sink.audio.volume * 100)}%`;
      }
   }

   PopupWindow {
      id: menuWindow
      width: 100
      height: 100
      visible: false

      anchor {
         window: root.QsWindow?.window
         edges: Edges.Bottom
         gravity: Edges.Top
      }
   }

   onClicked: function () {
      if (root.QsWindow?.window?.contentItem) {
         menuWindow.anchor.rect = root.QsWindow.window.contentItem.mapFromItem(root, root.width, root.height);
         menuWindow.visible = !menuWindow.visible;
      }
   }
}
