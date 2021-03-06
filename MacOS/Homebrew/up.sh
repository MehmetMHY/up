# Title:    Brew Update, Upgrade, Cleanup, & Doctor In One Command
# By:       Mehmet Yilmaz
# Date:     4-12-2022

# get start time of script's execution
exec_start=$(date +%s.$N)

echo "    "$(date +'%m/%d/%Y, %r')
echo "๐ณ MacOS HomeBrew UP Command ๐"
echo

echo "๐ Pinned Packages:"
brew list --pinned
echo 'โ Listed'
echo

echo '๐ป Updating:'
brew update
echo 'โ Updated'
echo

echo '๐ป Upgrading:'
brew upgrade
echo 'โ Upgraded'
echo

echo '๐งน Cleaning:'
brew cleanup
echo 'โ Cleaned'
echo

echo '๐ฅ Doctor:'
brew doctor
echo 'โ Checked'
echo

# print total execution time for script
exec_end=$(date +%s.$N)
runtime=$( echo "$exec_end - $exec_start" | bc -l )
echo "โฑ๏ธ  Runtime: "$runtime" sec"
echo


