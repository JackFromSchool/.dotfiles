import QtQuick
import Quickshell.Services.Mpris
import "../"

BarBlock {
   id: mediaPlayer

   visible: Mpris.players.length > 0
   property MprisPlayer player: Mpris.players.length > 0 ? Mpris.players[0] : null

   content: BarText {
      symbolText: mediaPlayer.updateText()
   }

   function updateText() {
      if (!mediaPlayer.player || !player.metadata)
         return "No Media";
      const icon = mediaPlayer.player && mediaPlayer.player.playbackState == MprisPlaybackState.Playing ? "󰏤" : "󰐊";
      const title = mediaPlayer.player.trackTitle;
      const artist = mediaPlayer.player.trackArtist;

      if (title && artist) {
         const combined = icon + " " + artist + " - " + title;
         return combined.length > 30 ? combined.substring(0, 30) + "..." : combined;
      }
      if (title) {
         const combined = icon + " " + title;
         return combined.length > 30 ? combined.substring(0, 30) + "..." : combined;
      }
      return "No Media";
   }
}
