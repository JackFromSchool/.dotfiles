PATH="~/Documents/.tasks/"

task() {
   
   add() {
      echo "adding task"
   }

   case "$1" in;
      "add")
         add()
         ;;
      "remove")
         echo "removing task"
         ;;
   esac
}
