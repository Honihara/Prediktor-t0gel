#!/bin/bash

##################
##### COLORS #####
##################
clear
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
BOLD=$(tput bold)
RESET=$(tput sgr0)

#####################
##### VARIABLES #####
#####################
choice=""
current_user=$(whoami)

##############################
##### SECURITY / CONTROL #####
##############################
if [ "$current_user" == "www-data" ]; then
    echo -e "${RED}This script should not be run as www-data.${RESET}"
    echo -e "${YELLOW}Please exit with 'exit' and run again as a regular user.${RESET}"
    exit 1
fi

handle_interrupt() {
    echo -n -e "${RESET}"
    echo -e "${BOLD}# ${RED}Interrupt detected${RESET} #${BOLD}\n"
    exit 1
}
trap handle_interrupt SIGINT

########################
##### MENU OPTIONS #####
########################
show_options() {
    echo -e "\n ${BOLD}# ${BLUE}PREDIKTOR TOGEL ALL PASARAN 2D${RESET} ${BOLD}#${RESET}\n"
    echo "  ${YELLOW}1${RESET} - RESULT 0"
    echo "  ${YELLOW}2${RESET} - RESULT 1"
    echo "  ${YELLOW}3${RESET} - RESULT 2"
    echo "  ${YELLOW}4${RESET} - RESULT 3"
    echo "  ${YELLOW}5${RESET} - RESULT 4"
    echo "  ${YELLOW}6${RESET} - RESULT 5"
    echo "  ${YELLOW}7${RESET} - RESULT 6"
    echo "  ${YELLOW}8${RESET} - RESULT 7"
    echo "  ${YELLOW}9${RESET} - RESULT 8"
    echo "  ${YELLOW}10${RESET}- RESULT 9"
    echo "      ------------"
    echo "  ${YELLOW}0${RESET} - ${RED}Exit${RESET}"
}

############################
##### COMMON FUNCTIONS #####
############################

run_as_www_data() {
    # For commands that need to be run as www-data (e.g., web server actions)
    chown -R www-data:www-data /var/www/
    sudo -u www-data bash -c "$1"
}

############################
##### ACTION FUNCTIONS #####
############################

action_1() {
    echo "${GREEN}[Action 1 executed]${RESET}"
}

action_2() {
    echo "${GREEN}[Action 2 executed]${RESET}"
}

action_3() {
    echo "${GREEN}[Action 3 executed]${RESET}"
}

##########################
##### MAIN MENU LOOP #####
##########################
main_menu() {
    while true; do
        show_options
        read -p "$(echo -e ${GREEN}Masukan Result Angka Ke Tiga : ${RESET}${YELLOW})" choice
        echo -n -e "${RESET}"
        echo -e "\n"

        clear
        case "$choice" in
            1) cat herf/0 ;; 
            2) cat herf/1 ;; 
            3) cat herf/2 ;; 
            4) cat herf/3 ;; 
            5) cat herf/4 ;; 
            6) cat herf/5 ;; 
            7) cat herf/6 ;; 
            8) cat herf/7 ;; 
            9) cat herf/8 ;; 
           10) cat herf/9 ;; 
            0)
                echo -e "${GREEN}Script ended. See you soon, ${current_user}.${RESET}"
                exit 0
                ;;
            *) echo -e "${RED}Invalid choice. Please try again.${RESET}" ;;
        esac
        echo ""
    done
}

#########################
##### LAUNCH SCRIPT #####
#########################
main_menu