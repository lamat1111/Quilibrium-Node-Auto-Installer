#!/bin/bash

set -e

cat << "EOF"

                  QQQQQQQQQ       1111111   
                QQ:::::::::QQ    1::::::1   
              QQ:::::::::::::QQ 1:::::::1   
             Q:::::::QQQ:::::::Q111:::::1   
             Q::::::O   Q::::::Q   1::::1   
             Q:::::O     Q:::::Q   1::::1   
             Q:::::O     Q:::::Q   1::::1   
             Q:::::O     Q:::::Q   1::::l   
             Q:::::O     Q:::::Q   1::::l   
             Q:::::O     Q:::::Q   1::::l   
             Q:::::O  QQQQ:::::Q   1::::l   
             Q::::::O Q::::::::Q   1::::l   
             Q:::::::QQ::::::::Q111::::::111
              QQ::::::::::::::Q 1::::::::::1
                QQ:::::::::::Q  1::::::::::1
                  QQQQQQQQ::::QQ111111111111
                          Q:::::Q           
                           QQQQQQ  QUILIBRIUM.ONE                                                                                                                              


=================================================================================
                    ✨ NODE BALANCE CHECKER INSTALLER ✨
=================================================================================
This installer sets up a script to check your node balance
and then sets up a cronjob to log your balance every hour.

If your node version is not 1.4.19 and your system architecture is not 'amd64',
you will need to manually change this variable at the beginning of the script:
'~/scripts/balance_checker.sh'

Made with 🔥 by LaMat - https://quilibrium.one
=================================================================================

Processing... ⏳

EOF

sleep 7


echo "⚙️ Installing Python 3 and pip3..."
sudo apt install -y python3 python3-pip > /dev/null || { echo "❌ Failed to install Python 3 and pip3."; exit 1; } 
sleep 1


echo "⚙️ Removing existing script if it exists..."
echo
rm -f ~/scripts/qnode_balance_checker.py
sleep 1

echo "⚙️ Creating directory for scripts..."
mkdir -p ~/scripts
sleep 1

echo "⚙️ Downloading new script..."
wget -q -P ~/scripts -O ~/scripts/qnode_balance_checker.sh https://raw.githubusercontent.com/lamat1111/QuilibriumScripts/main/tools/qnode_balance_checker.sh
sleep 1

echo "⚙️ Setting executable permissions for the script..."
chmod +x ~/scripts/qnode_balance_checker.sh
sleep 1

echo "⚙️ Checking if a cronjob exists for qnode_balance_checker.py and deleting it if found..."
crontab -l | grep -v "qnode_balance_checker.sh" | crontab -
sleep 1

echo "⚙️ Setting up cronjob to run the script once every hour..."
(crontab -l ; echo "0 * * * * ~/scripts/qnode_balance_checker.sh") | crontab -
sleep 1

echo
echo "✅ Installer script completed!"
echo "✅ Cronjob set!"
echo
echo "ℹ️ The script will now log your node balance every hour in ~/scripts/balance_log.csv"
echo "ℹ️ To see the log just run 'cat ~/scripts/balance_log.csv'"
echo
echo "ℹ️ If you need to change your node version or sys archiutecture run:"
eho "nano ~/scripts/balance_checker.sh"