# Title:    Brew Update, Upgrade, Cleanup, & Doctor In One Command
# By:       Mehmet Yilmaz
# Date:     4-12-2022

# get start time of script's execution
exec_start=$(date +%s.$N)

echo "    "$(date +'%m/%d/%Y, %r')
echo "🌳 MacOS HomeBrew UP Command 🍏"
echo

echo "📌 Pinned Packages:"
brew list --pinned
echo '➜ Listed'
echo

echo '🍻 Updating:'
brew update
echo '➜ Updated'
echo

echo '🍻 Upgrading:'
brew upgrade
echo '➜ Upgraded'
echo

echo '🧹 Cleaning:'
brew cleanup
echo '➜ Cleaned'
echo

echo '🏥 Doctor:'
brew doctor
echo '➜ Checked'
echo

# print total execution time for script
exec_end=$(date +%s.$N)
runtime=$( echo "$exec_end - $exec_start" | bc -l )
echo "⏱️  Runtime: "$runtime" sec"
echo


