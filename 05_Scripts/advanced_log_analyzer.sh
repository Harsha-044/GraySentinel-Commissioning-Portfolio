#!/bin/bash

###############################################################################
# GraySentinel - Advanced Log Analyzer
#
# Author  : Harsha
# Version : 1.0
#
# Purpose:
# Automated security log analysis for GraySentinel Cyber Range
#
# Environment:
# Kali Linux / Linux Security Monitoring Lab
#
# Analyzes:
# - Authentication logs
# - SSH activity
# - Auditd events
# - Rsyslog logs
# - Suricata alerts
#
###############################################################################


############################
# Colors
############################

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
RESET="\033[0m"


############################
# Check Root Permission
############################

if [ "$EUID" -ne 0 ]; then

    echo -e "${RED}[!] Run script as root${RESET}"

    echo "Example:"
    echo "sudo ./advanced_log_analyzer.sh"

    exit 1

fi


############################
# Banner
############################

echo "================================================="
echo " GraySentinel Advanced Log Analyzer"
echo "================================================="

DATE=$(date)

echo "Analysis Time : $DATE"

echo ""


############################
# Authentication Log Analysis
############################

echo -e "${GREEN}[+] Checking Authentication Failures${RESET}"


AUTH_LOG="/var/log/auth.log"


if [ -f "$AUTH_LOG" ]; then


echo "--- Failed Login Attempts ---"

grep "Failed password" "$AUTH_LOG" | tail -20


echo ""

echo "--- Successful SSH Logins ---"

grep "Accepted" "$AUTH_LOG" | tail -20


else

echo "Authentication log not found"

fi


echo ""


############################
# SSH Investigation
############################

echo -e "${GREEN}[+] SSH Activity Analysis${RESET}"


journalctl -u ssh --no-pager | tail -50


echo ""


############################
# Auditd Analysis
############################

echo -e "${GREEN}[+] Auditd Security Events${RESET}"


if systemctl is-active --quiet auditd
then


echo "--- Recent Audit Events ---"

ausearch -ts recent 2>/dev/null | tail -50


else

echo "Auditd service not running"

fi


echo ""


############################
# Critical File Monitoring
############################

echo -e "${GREEN}[+] Checking Sensitive File Access${RESET}"


echo "Monitoring files:"


FILES=(

"/etc/passwd"

"/etc/shadow"

"/etc/sudoers"

"/etc/ssh/sshd_config"

"/etc/crontab"

)


for FILE in "${FILES[@]}"
do

echo ""

echo "File: $FILE"


ausearch -f "$FILE" 2>/dev/null | tail -5


done


echo ""


############################
# Rsyslog Analysis
############################

echo -e "${GREEN}[+] Checking Remote Logs${RESET}"


REMOTE_LOG="/var/log/remote"


if [ -d "$REMOTE_LOG" ]
then


echo "Remote log files:"


ls -lh "$REMOTE_LOG"


echo ""

echo "Recent Remote Events:"


find "$REMOTE_LOG" -type f -exec tail -5 {} \;


else


echo "No remote logging directory found"


fi


echo ""


############################
# Suricata Analysis
############################

echo -e "${GREEN}[+] Suricata IDS Analysis${RESET}"


SURICATA_DIR="/var/log/suricata"


if [ -d "$SURICATA_DIR" ]
then


echo ""

echo "--- Suricata Alerts ---"


if [ -f "$SURICATA_DIR/fast.log" ]
then

tail -20 "$SURICATA_DIR/fast.log"

fi


echo ""

echo "--- Eve JSON Events ---"


if [ -f "$SURICATA_DIR/eve.json" ]
then

tail -20 "$SURICATA_DIR/eve.json"

fi


echo ""

echo "--- Suricata Statistics ---"


if [ -f "$SURICATA_DIR/stats.log" ]
then

tail -20 "$SURICATA_DIR/stats.log"

fi


else

echo "Suricata logs not found"

fi


echo ""


############################
# Network Security Checks
############################

echo -e "${GREEN}[+] Network Connection Review${RESET}"


echo "--- Active Connections ---"


ss -tulnp


echo ""


############################
# Suspicious Keyword Hunting
############################

echo -e "${GREEN}[+] Threat Hunting Keywords${RESET}"


KEYWORDS=(

"failed"

"error"

"sudo"

"root"

"powershell"

"cmd"

"wget"

"curl"

"ssh"

)


for KEY in "${KEYWORDS[@]}"
do


echo ""

echo "Searching: $KEY"


grep -Ri "$KEY" /var/log 2>/dev/null | head -5


done


echo ""


############################
# Summary
############################

echo "================================================="
echo " GraySentinel Log Analysis Completed"
echo "================================================="


echo ""

echo "Reviewed:"

echo "[+] Authentication Logs"

echo "[+] SSH Logs"

echo "[+] Auditd Events"

echo "[+] Remote Logs"

echo "[+] Suricata Alerts"

echo "[+] Network Connections"

echo "[+] Threat Indicators"


echo ""

echo "Report generated successfully."

###############################################################################
# End of Script
###############################################################################
