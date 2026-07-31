#!/bin/bash
#
# ============================================================================
# GraySentinel - Nmap Automator
# Author : Harsha
# Purpose: Automated Reconnaissance and Service Enumeration
# Version : 1.0
# Target  : 192.168.56.105
# ============================================================================

# Static Target IP
TARGET="192.168.56.105"

# Output Directory
OUTPUT_DIR="nmap_results"

# Create output directory
mkdir -p "$OUTPUT_DIR"

echo "========================================================="
echo "        GraySentinel Nmap Automation"
echo "========================================================="
echo "Target IP : 192.168.56.105"
echo "Output    : $OUTPUT_DIR"
echo "========================================================="

############################################################
# Step 1 - Host Discovery
############################################################

echo "[+] Step 1: Performing Host Discovery..."

nmap -sn 192.168.56.105 \
-oN "$OUTPUT_DIR/01_host_discovery.txt"

############################################################
# Step 2 - Full TCP Port Scan
############################################################

echo "[+] Step 2: Scanning All TCP Ports..."

nmap -sS -Pn -T4 -p- 192.168.56.105 \
-oN "$OUTPUT_DIR/02_tcp_all_ports.txt"

############################################################
# Step 3 - Service Enumeration
############################################################

echo "[+] Step 3: Detecting Services and Versions..."

nmap -sV -sC 192.168.56.105 \
-oN "$OUTPUT_DIR/03_service_detection.txt"

############################################################
# Step 4 - Operating System Detection
############################################################

echo "[+] Step 4: Detecting Operating System..."

sudo nmap -O 192.168.56.105 \
-oN "$OUTPUT_DIR/04_os_detection.txt"

############################################################
# Step 5 - Aggressive Scan
############################################################

echo "[+] Step 5: Running Aggressive Scan..."

sudo nmap -A 192.168.56.105 \
-oN "$OUTPUT_DIR/05_aggressive_scan.txt"

############################################################
# Step 6 - SMB Enumeration
############################################################

echo "[+] Step 6: Enumerating SMB..."

nmap \
--script smb-os-discovery,smb-enum-shares,smb-enum-users \
-p445 192.168.56.105 \
-oN "$OUTPUT_DIR/06_smb_enum.txt"

############################################################
# Step 7 - HTTP Enumeration
############################################################

echo "[+] Step 7: Enumerating HTTP Services..."

nmap \
--script http-title,http-headers,http-enum \
-p80,443,8080 192.168.56.105 \
-oN "$OUTPUT_DIR/07_http_enum.txt"

############################################################
# Step 8 - Vulnerability Scan
############################################################

echo "[+] Step 8: Running Vulnerability Detection..."

nmap --script vuln 192.168.56.105 \
-oN "$OUTPUT_DIR/08_vulnerability_scan.txt"

############################################################
# Step 9 - XML Report
############################################################

echo "[+] Step 9: Generating XML Report..."

nmap -A 192.168.56.105 \
-oX "$OUTPUT_DIR/final_report.xml"

############################################################
# Step 10 - Grepable Report
############################################################

echo "[+] Step 10: Generating Grepable Report..."

nmap -A 192.168.56.105 \
-oG "$OUTPUT_DIR/final_report.gnmap"

############################################################
# Scan Complete
############################################################

echo ""
echo "========================================================="
echo "      GraySentinel Reconnaissance Completed"
echo "========================================================="
echo "Target Successfully Scanned : 192.168.56.105"
echo ""

echo "Generated Reports:"
echo "---------------------------------------------------------"

ls -lh "$OUTPUT_DIR"

echo ""
echo "Reports Location:"
echo "$OUTPUT_DIR/"
echo ""
echo "Completed Scan Target:"
echo "192.168.56.105"
echo ""
echo "Artifacts Generated:"
echo "  - 01_host_discovery.txt"
echo "  - 02_tcp_all_ports.txt"
echo "  - 03_service_detection.txt"
echo "  - 04_os_detection.txt"
echo "  - 05_aggressive_scan.txt"
echo "  - 06_smb_enum.txt"
echo "  - 07_http_enum.txt"
echo "  - 08_vulnerability_scan.txt"
echo "  - final_report.xml"
echo "  - final_report.gnmap"
echo ""
echo "Mission Status: SUCCESS"
echo "GraySentinel Reconnaissance Complete."
echo "========================================================="
