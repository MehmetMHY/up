# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ #

# Title:    UP Command
# Date:     5-15-2022
# By:       Mehmet Yilmaz

# Package Managers Supported:
#   APT
#   SNAP

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ #
# Command Options:
#   -a = Enable "Package Checks" during main up command run.
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ #

# exit Completedly if CTRL-C is ever applied
trap "exit" INT

# Some color options for terminal prints
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;96m'
BOLD='\033[1m'
END='\033[0m'

logo () {
    GREEN_HL='\033[0;42m'
    BLUE__HL='\033[0;44m'
    printf "${GREEN_HL}━━━━━━━━━━━${END}\n"
    printf "${BLUE__HL}  ╦ ╦ ╔═╗  ${END}\n"
    printf "${BLUE__HL}  ║ ║ ╠═╝  ${END}\n"
    printf "${BLUE__HL}  ╚═╝ ╩    ${END}\n"
    printf "${GREEN_HL}━━━━━━━━━━━${END}\n"
}

# get start time of execution
exe_start=`date +%s.%N`

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ #
# ┃                    MAIN FUNCTION CALLS - MADE BELOW                                                    ┃
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ #

# print command's title print
logo
echo

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ #

printf "🚀 ${GREEN}APT Update${END} \n"
sudo apt -y update

if [ "$?" -ne 0 ]; then
    echo "E: failed to update apt packages list. Aborting..."
    exit 1
fi

printf "${BLUE}---> Completed${END} \n"
echo

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ #

printf "🔧 ${GREEN}APT Upgrade${END} \n"
sudo apt -y upgrade

if [ "$?" -ne 0 ]; then
    echo "E: failed to upgrade updated apt packages. Aborting..."
    exit 1
fi

printf "${BLUE}---> Completed${END} \n"
echo 

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ #

printf "📜 ${GREEN}APT Check${END} \n"
sudo apt-get check

if [ "$?" -ne 0 ]; then
    echo "E: failed to check apt packages. Aborting..."
    exit 1
fi

printf "${BLUE}---> Completed${END} \n"
echo 

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ #

printf "🔥 ${GREEN}APT Autoremove${END} \n"
sudo apt autoremove

if [ "$?" -ne 0 ]; then
    echo "E: failed to autoremove un-used apt packages. Aborting..."
    exit 1
fi

printf "${BLUE}---> Completed${END} \n"
echo

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ #

printf "🪥  ${GREEN}APT Clean${END} \n"
echo "Running APT-Clean command..."
sudo apt clean

if [ "$?" -ne 0 ]; then
    echo "E: failed to clean out files from apt packages. Aborting..."
    exit 1
fi

echo "Done"
printf "${BLUE}---> Completed${END} \n"
echo

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ #

# only gather and display "Package Checks" feature if desired by user
if [[ "$1" == "-a" ]]; then

    printf "🛫 ${GREEN}Package Checks${END} \n"

    # -------------------------------------------------------------------------- #

    printf "${ORANGE}➤ APT Pkgs INFO:${END}\n"
    ubuntu-security-status | head -n 4
    if [ "$?" -ne 0 ]; then
        echo "E: failed to get information on apt packages. Aborting..."
        exit 1
    fi

    # -------------------------------------------------------------------------- #

    printf "${BLUE}---> Completed${END} \n"
    echo

fi

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ #

# get end time of execution
exe_end=`date +%s.%N`

# get total execution time
# - https://unix.stackexchange.com/questions/52313/how-to-get-execution-time-of-a-script-effectively
exe_time=$(echo "$exe_end - $exe_start" | bc -l)

printf "${GREEN}⌛ Time:${END} ${exe_time} seconds\n"
printf "${BLUE}---> Completed${END} \n"
echo

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ #

