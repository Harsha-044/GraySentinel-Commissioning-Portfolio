#!/bin/bash

###############################################################################
# GraySentinel - Linux Security Log Analyzer
#
# Author  : Harsha
# Version : 1.0
#
# Purpose:
# Automated Linux security log analysis for GraySentinel Cyber Range
#
# Environment:
# Kali Linux Security Monitoring Lab
#
# Analyzes:
# - Authentication logs
# - SSH activity
# - Auditd events
# - Rsyslog centralized logs
# - Suricata IDS alerts
#
###############################################################################


############################
# Variables
############################

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

REPORT_DIR="GraySentinel_Log_Report_$DATE"

mkdir -p "$REPORT_DIR"


echo "================================================"
echo " GraySentinel Linux Log Analyzer"
echo "================================================"

echo "[+] Report Directory: $REPORT_DIR"

echo ""


############################
# Authentication Log Analysis
############################

echo "[+] Analyzing Authentication Logs"


if [ -f /var/log/auth.log ]
then

    echo "===== Failed Login Attempts =====" \
    > "$REPORT_DIR/authentication_analysis.txt"

    grep "Failed password" /var/log/auth.log \
    | tail -50 \
    >> "$REPORT_DIR/authentication_analysis.txt"


    echo "" >> "$REPORT_DIR/authentication_analysis.txt"


    echo "===== Successful Logins =====" \
    >> "$REPORT_DIR/authentication_analysis.txt"


    grep "Accepted" /var/log/auth.log \
    | tail -50 \
    >> "$REPORT_DIR/authentication_analysis.txt"


else

    echo "auth.log not found"

fi


############################
# SSH Log Analysis
############################

echo "[+] Checking SSH Activity"


journalctl -u ssh --no-pager \
| tail -100 \
> "$REPORT_DIR/ssh_activity.txt"



############################
# Auditd Analysis
############################

echo "[+] Analyzing Auditd Events"


if systemctl is-active --quiet auditd
then


ausearch -ts recent \
> "$REPORT_DIR/auditd_recent_events.txt"


else

echo "Auditd service not running" \
> "$REPORT_DIR/auditd_status.txt"

fi



############################
# Sensitive File Monitoring
############################

echo "[+] Checking Sensitive File Access"


FILES=(

"/etc/passwd"

"/etc/shadow"

"/etc/sudoers"

"/etc/ssh/sshd_config"

"/etc/crontab"

)


for FILE in "${FILES[@]}"
do

echo "===============================" \
>> "$REPORT_DIR/sensitive_file_access.txt"


echo "File: $FILE" \
>> "$REPORT_DIR/sensitive_file_access.txt"


ausearch -f "$FILE" 2>/dev/null \
| tail -20 \
>> "$REPORT_DIR/sensitive_file_access.txt"


done



############################
# Rsyslog Remote Log Analysis
############################

echo "[+] Checking Centralized Logs"


REMOTE_DIR="/var/log/remote"


if [ -d "$REMOTE_DIR" ]
then


ls -lh "$REMOTE_DIR" \
> "$REPORT_DIR/remote_log_files.txt"


find "$REMOTE_DIR" \
-type f \
-exec tail -20 {} \; \
> "$REPORT_DIR/remote_events.txt"


else

echo "Remote logging directory not found" \
> "$REPORT_DIR/remote_log_status.txt"


fi



############################
# Suricata IDS Analysis
############################

echo "[+] Analyzing Suricata Logs"


SURICATA="/var/log/suricata"


if [ -d "$SURICATA" ]
then


if [ -f "$SURICATA/fast.log" ]
then

tail -100 "$SURICATA/fast.log" \
> "$REPORT_DIR/suricata_alerts.txt"

fi



if [ -f "$SURICATA/eve.json" ]
then

tail -100 "$SURICATA/eve.json" \
> "$REPORT_DIR/suricata_events.json"

fi



if [ -f "$SURICATA/stats.log" ]
then

tail -100 "$SURICATA/stats.log" \
> "$REPORT_DIR/suricata_statistics.txt"

fi


else

echo "Suricata logs not found" \
> "$REPORT_DIR/suricata_status.txt"


fi



############################
# Network Connection Review
############################

echo "[+] Collecting Active Connections"


ss -tulnp \
> "$REPORT_DIR/network_connections.txt"



############################
# Threat Hunting Keywords
############################

echo "[+] Searching Suspicious Keywords"


KEYWORDS=(

"failed"

"error"

"sudo"

"root"

"ssh"

"cron"

"wget"

"curl"

"powershell"

)


for KEY in "${KEYWORDS[@]}"
do


echo "==========================" \
>> "$REPORT_DIR/threat_hunting.txt"


echo "Keyword: $KEY" \
>> "$REPORT_DIR/threat_hunting.txt"


grep -Ri "$KEY" /var/log 2>/dev/null \
| head -20 \
>> "$REPORT_DIR/threat_hunting.txt"


done



############################
# Summary
############################

echo ""

echo "================================================"

echo " GraySentinel Log Analysis Completed"

echo "================================================"


echo ""

echo "Generated Reports:"

ls -lh "$REPORT_DIR"


echo ""

echo "Analysis Complete."

###############################################################################
# End of GraySentinel Log Analyzer
###############################################################################
