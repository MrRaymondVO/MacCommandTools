#!/bin/sh

#  MacCommandToolsCLT.command
#  MacCommandTools
#
#  Created by Ramon Valdes on 2020-03-14.
#  Copyright © 2020 Ramon Valdes. All rights reserved.

RED='\033[0;31m'
GRN='\033[0;32m'
BLU='\033[0;34m'
NC='\033[0m'
YLL='\033[01;33m'
PRP='\033[01;35m'
CY='\033[01;36m'
WT='\033[01;37m'
B='\033[1m'
UL='\033[4m'

bldblk='\033[1;30m' # Black - Bold
bldred='\033[1;31m' # Red
bldgrn='\033[1;32m' # Green
bldylw='\033[1;33m' # Yellow
bldblu='\033[1;34m' # Blue
bldpur='\033[1;35m' # Purple
bldcyn='\033[1;36m' # Cyan
bldwht='\033[1;37m' # White

unkblk='\033[4;30m' # Black - Underline
undred='\033[4;31m' # Red
undgrn='\033[4;32m' # Green
undylw='\033[4;33m' # Yellow
undblu='\033[4;34m' # Blue
undpur='\033[4;35m' # Purple
undcyn='\033[4;36m' # Cyan
undwht='\033[4;37m' # White


echo ""
echo "███╗   ███╗ ██████╗████████╗ ██████╗  ██████╗ ██╗     ███████╗"
echo "████╗ ████║██╔════╝╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝"
echo "██╔████╔██║██║        ██║   ██║   ██║██║   ██║██║     ███████╗"
echo "██║╚██╔╝██║██║        ██║   ██║   ██║██║   ██║██║     ╚════██║"
echo "██║ ╚═╝ ██║╚██████╗   ██║   ╚██████╔╝╚██████╔╝███████╗███████║"
echo "╚═╝     ╚═╝ ╚═════╝   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝"
echo ""

echo "*************************************"
echo "*                                   *"
echo "*  ${B}MacCommandTools by ${RED}@MrRaymondVO${NC}  *"
echo "*                                   *"
echo "*************************************"
echo ""

flag=False

printHelpEn () {
    echo "${bldgrn}"
    echo "--------------------------------------------------------------------------------"
    echo "${bldgrn}Help${NC}"
    echo ""
    echo "${undcyn}Disable GateKeeper${NC}"
    echo "Gatekeeper is a security feature of the macOS operating system by Apple."
    echo "It enforces code signing and verifies downloaded applications before allowing"
    echo "them to run, thereby reducing the likelihood of inadvertently executing malware."
    echo "By disabling it will allow you to install apps from developers not certified"
    echo "by Apple."
    echo ""
    echo "${undcyn}Hiden Files${NC}"
    echo "It allows to show and hide hidden files"
    echo ""
    echo "${undcyn}Reindex Spotligth${NC}"
    echo "Reindex the spotlight database for everything on the mac, including external"
    echo "drives, mounted disk images, etc"
    echo ""
    echo "${undcyn}Blank Space on the Dock${NC}"
    echo "Adds a blank space on the Dock for organize apps on it"
    echo "${bldgrn}"
    echo "--------------------------------------------------------------------------------"
    echo "${NC}"
    echo "Press ${bldgrn}1${NC} to ${undgrn}continue${NC}, ${bldcyn}2${NC} para ${undcyn}cambiar de idioma${NC}, or any other key for ${bldred}Quit: ${NC}"
    read next
    if [ $next = 1 ]; then
        listToolsEn
    elif [ $next = 2 ]; then
        main
    else
        exit
    fi
}

printHelpEs () {
    echo ""
    echo "--------------------------------------------------------------------------------"
    echo "${bldgrn}Ayuda${NC}"
    echo ""
    echo "${undcyn}Disable GateKeeper${NC}"
    echo "Gatekeeper is a security feature of the macOS operating system by Apple."
    echo "It enforces code signing and verifies downloaded applications before allowing"
    echo "them to run, thereby reducing the likelihood of inadvertently executing malware."
    echo "By disabling it will allow you to install apps from developers not certified"
    echo "by Apple."
    echo ""
    echo "${undcyn}Hiden Files${NC}"
    echo "It allows to show and hide hidden files"
    echo ""
    echo "${undcyn}Reindex Spotligth${NC}"
    echo "Reindex the spotlight database for everything on the mac, including external"
    echo "drives, mounted disk images, etc"
    echo ""
    echo "${undcyn}Blank Space on the Dock${NC}"
    echo "Adds a blank space on the Dock for organize apps on it"
    echo "${bldgrn}"
    echo "--------------------------------------------------------------------------------"
    echo "${NC}"
    echo "Presiona ${bldgrn}1${NC} para ${undgrn}continuar${NC}, ${bldcyn}2${NC} to ${undcyn}change Languaje${NC}, o cualquier otro para ${bldred}Salir: ${NC}"
    read next
    if [ $next = 1 ]; then
        listToolsEn
    elif [ $next = 2 ]; then
        main
    else
        exit
    fi
}

processCompleted(){
    echo "${GRN}"
    echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
    echo "|P r o c e s s   C o m p l e t e d|";
    echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
    echo ""
    echo "${bldwht}What you want to do next? ${bldylw}==>${NC}"
    listToolsEn
}

processCompletedEs(){
    echo "${GRN}"
    echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
    echo "|P r o c e s o   C o m p l e t a d o|";
    echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
    echo ""
    echo "${bldwht}Qué deseas hacer a continuación? ${bldylw}==>${NC}"
    listToolsEs
}

listToolsEn(){
    echo ""
    echo "${GRN}Chose an option${CY}"
    PS3='Enter your choice: '
    options=(
        "Disable GateKeeper"
        "Enable GateKeeper"
        "Allow Single App To ByPass The GateKeeper"
        "Show Hiden Files"
        "Hiden Files"
        "Reindex Spotligth"
        "Reindex Spotligth on a Specific Drive"
        "Add Blank Space on the Dock"
        "Help"
        "Quit"
        )
    select opt in "${options[@]}"
    do
        case $opt in
        
            # GateKeeper
            "Disable GateKeeper")
                echo ""
                echo "${GRN}You Chose To Disable Your GateKeeper${NC}"
                echo ""
                echo "${RED}Plaese Inseret Your Password To Procceed${NC}"
                echo ""
                sudo spctl --master-disable
                processCompleted
                ;;
            "Enable GateKeeper")
                echo ""
                echo "${GRN}You Chose To Enable Your GateKeeper${NC}"
                echo ""
                echo "${RED}Plaese Inseret Your Password To Procceed${NC}"
                echo ""
                sudo spctl --master-enable
                processCompleted
                ;;
            "Allow Single App To ByPass The GateKeeper")
                echo ""
                echo "${GRN}You Chose To Allow Single App To ByPass The GateKeeper${NC}"
                echo ""
                read -e -p "Drag & Drop The App Here Then Hit Return: " FILEPATH
                echo ""
                echo "${RED}Plaese Inseret Your Password To Procceed${NC}"
                echo ""
                sudo xattr -rd com.apple.quarantine "$FILEPATH"
                processCompleted
                ;;
                
            # Hide Files
            "Show Hiden Files")
                echo ""
                echo -e "${GRN}Showing Hiden Files${NC}"
                echo ""
                defaults write com.apple.finder AppleShowAllFiles TRUE
                killall Finder
                processCompleted
                ;;
            "Hide Files")
                echo ""
                echo -e "${GRN}Unshowing Hiden Files${NC}"
                echo ""
                defaults write com.apple.finder AppleShowAllFiles False
                killall Finder
                processCompleted
                ;;
                
            # Reindex
            "Reindex Spotligth")
                echo ""
                echo -e "${GRN}Reindex Spotligth${NC}"
                echo ""
                echo -e "${RED}Plaese Inseret Your Password To Procceed${NC}"
                echo ""
                sudo mdutil -E /
                processCompleted
                ;;
            "Reindex Spotligth on a Specific Drive")
                echo ""
                echo -e "${GRN}Selec The Drive You Want To Reindex${NC}"
                echo ""
                read -e -p "Drag & Drop The Drive Here Then Hit Return: " FILEPATH
                echo ""
                echo -e "${RED}Plaese Inseret Your Password To Procceed${NC}"
                echo ""
                sudo mdutil -E "$FILEPATH"
                processCompleted
                ;;
                
            # Dock
            "Add Blank Space on the Dock")
                defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
                killall Dock
                echo ""
                echo -e "${GRN}Blank Space Added To The Dock${NC}"
                echo ""
                processCompleted
                ;;

            # Help
            "Help")
                printHelpEn
                ;;
                
            #Default
            "Quit")
                flag=TRUE
                banner -w 28 "Bye Bye"
                exit
                ;;
            *) echo "${RED}Invalid Option $REPLY";;
        esac
    done
}

listToolsEs(){
    echo ""
    echo "${GRN}Chose an option${CY}"
    PS3='Selecciona una Opción: '
    options=(
    "Desabilitar GateKeeper"
    "Habilitar GateKeeper"
    "Permitir una única app saltarse el GateKeeper"
    "Mostrar Archivos Ocultos"
    "Ocultar Archivos"
    "Reindexar Spotligth"
    "Reindex Spotligth en una unidad específica"
    "Agregar espacio en blanco en el Dock"
    "Ayuda"
    "Salir"
    )
    select opt in "${options[@]}"
    do
        case $opt in
        
            # GateKeeper
            "Desabilitar GateKeeper")
                echo ""
                echo -e "${GRN}Desactivar GateKeeper${NC}"
                echo ""
                echo -e "${RED}Por Favor Introduce el Password Para Continuear${NC}"
                echo ""
                sudo spctl --master-disable
                processCompletedEs
                ;;
            "Habilitar GateKeeper")
                echo ""
                echo -e "${GRN}Habilitar GateKeeper${NC}"
                echo ""
                echo -e "${RED}Por Favor Introduce el Password Para Continuear${NC}"
                echo ""
                sudo spctl --master-enable
                processCompletedEs
                ;;
            "Permitir una única app saltarse el GateKeeper")
                echo ""
                echo -e "${GRN}Escogiste permitir una única app saltarse el GateKeeper${NC}"
                echo ""
                read -e -p "Arrastra y suelta la App aquí y pulsa Return: " FILEPATH
                echo ""
                echo -e "${RED}Por favor Introduce la contraseña para continuar${NC}"
                echo ""
                sudo xattr -rd com.apple.quarantine "$FILEPATH"
                processCompletedEs
                ;;
                
            # Hide Files
            "Mostrar Archivos Ocultos")
                echo ""
                echo -e "${GRN}Archivos Ocultos Visible${NC}"
                echo ""
                defaults write com.apple.finder AppleShowAllFiles TRUE
                processCompletedEs
                ;;
            "Ocultar Archivos")
                echo ""
                echo -e "${GRN}Archivos Ocultos No Visible${NC}"
                echo ""
                defaults write com.apple.finder AppleShowAllFiles False
                processCompletedEs
                ;;
                
            # Reindex
            "Reindexar Spotligth")
                echo ""
                echo -e "${GRN}Reindexar Spotligth${NC}"
                echo ""
                echo -e "${RED}Por favor Introduce la contraseña para continuar${NC}"
                echo ""
                sudo mdutil -E /
                processCompletedEs
                ;;
            "Reindex Spotligth en una unidad específica")
                echo ""
                echo -e "${GRN}Selecciona la unidad que deseas Reindexar${NC}"
                echo ""
                read -e -p "Arrastra y suelta la unidad aquí y pulsa Return: " FILEPATH
                echo ""
                echo -e "${RED}Por favor Introduce la contraseña para continuar${NC}"
                echo ""
                sudo mdutil -E "$FILEPATH"
                processCompletedEs
                ;;
                
            # Dock
           "Agregar espacio en blanco en el Dock")
               defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
               killall Dock
               echo ""
               echo -e "${GRN}Espacio en blanco añadido al Dock${NC}"
               echo ""
               processCompletedEs
               ;;
                
            # Help
            "Ayuda")
                printHelpEs
                ;;
                
            "Salir")
                banner -w 28 "Adios"
                exit
                ;;
            *) echo "${RED}Opcion no Valida $REPLY";;
        esac
    done
    break
}
main(){
    PS3='Select your Language: '
    langOptions=(
                "English"
                "Español"
                "Quit"
                )
    select langOpt in "${langOptions[@]}"
    do
        case $langOpt in
            "English")
                echo "\n${YLL}** CAUTION **"
                echo "The tools that you will find below facilitate some tasks \nthat are not very accessible for an average user. \nFor this same reason caution is recommended in their use. \nI am not responsible for any damage that may be \ncaused by the use of these tools.${NC}"
                echo ""
                    listToolsEn
                break
                ;;
                
            "Español")
                echo "\n${YLL}** PRECAUCION **"
                echo "${YLL}Las herramientas que encontrarás a continuación facilitan algunas tareas que no son muy accesibles para un usuario promedio, por esta misma razón se recomienda prudencia en su uso. No me hago responsable de cualquier daño que pudiera ocasionar el uso de estas herramientas.${NC}"
                echo ""
                    listToolsEs
                break
                ;;
                
            "Quit")
                banner -w 28 "Bye Bye"
                exit
                ;;
                
            *) echo "invalid option $REPLY";;
        esac
    done
}

main
