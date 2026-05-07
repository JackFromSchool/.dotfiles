ocdprog() {
   INTERFACE=$(find /usr/share/openocd/scripts/interface -type f -name "*.cfg" | fzf --prompt="Select Interface: ")
   TARGET=$(find /usr/share/openocd/scripts/target -type f -name "*.cfg" | fzf --prompt="Select Target: ")
   ELF=$(find . -type f -name "*.elf" | fzf --prompt="Select ELF: ")
   
   INTERFACE_NAME=$(basename "$INTERFACE")
   TARGET_NAME=$(basename "$TARGET")

   COMMANDS="source [find interface/$INTERFACE_NAME]\nsource [find target/$TARGET]\ninit\nreset halt\nprogram $ELF\nreset run\n"

   SCRIPT=$(mktemp) || exit 1
   trap 'rm -f "$SCRIPT"' EXIT SIGINT SIGTERM

   printf "$COMMANDS" > mktemp

   openocd -f "$SCRIPT"
}
