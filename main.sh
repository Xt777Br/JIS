#JIS (Jar In Shell)
#Created by Xt777Br

version="0.1.0"

#Jis Functions
function help(){
  case $1 in
    "add"|"-a"|"-add")
    ;;
    "remove"|"-r"|"-remove")
    ;;
    "list"|"-l"|"-list")
    ;;
    "edit"|"-e"|"-edit")
    ;;
    "uninstall"|"-u"|"-uninstall")
    ;;
    "replace"|"-rc"|"-replace")
    ;;
  exit
}
function add(){
  [ $1 == "-h" || $1 == "-help" ] && help "-a"
  [ $1 == "" ] && { echo "Error: Empty parameter!\nUse jis add -h/help to see more.\nStopping..."; exit 1; }
  [ ! -f "$1" ] && { echo "Error: Jar File don't found!\nUse jis add -h/help to see more.\nStopping..."; exit 1; }
  echo "JIS (Jar In Shell)\n\nAdding $1..."
  [ ! -f "$JIS_PATH/jar/$1" ] mv "$1" "$JIS_PATH/jar/" || { read -p "Warning: That's Jar File already is in Jis Directory!\nSolutions for this: (r) Rename, (d) Delete.\nType (r/d): " option; [ $option != "r" || $option != "d" ] && { echo "Error: $option is not valid input!\nStopping..."; exit 1 }; [ $option == "r" ] && mv "$1" "$JIS_PATH/jar/copy_$1"; [ $option == "d" ] && { rm "JIS_PATH/jar/$1"; mv "$1" "$JIS_PATH/jar/"; } }; echo "Moved Jar file to Jis Directory."
  read -p "Now we need a command name for that's Jar, Examples: cheesebread, cheese-bread. Type the command name: " commandname; [ commandname == "" ] && { echo "Error: Empty Command Name is not allowed\nStopping..."; exit 1; } || [  ]
  ait="$"; ait += "@"; echo """
  function $commandname(){ command='java -jar $JIS_PATH/jar/$1'\nfor param in $ait\ndo
  command+=param
  done
  
  """"
  
}