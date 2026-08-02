# Lateral Movement Investigation Report

## GraySentinel Cyber Command Center

**Author:** Harsha
**Report Version:** 1.0
**Classification:** Defensive Security Training
**Environment:** GraySentinel Cyber Range

---

# Executive Summary

This report documents the lateral movement assessment performed during the GraySentinel Cyber Range. The objective was to understand how attackers identify and attempt to move between systems while also learning how defenders detect and investigate these activities.

The work focused on reconnaissance, SMB service enumeration, Windows endpoint monitoring, authentication analysis, and threat hunting within an isolated laboratory environment.

---

# Objectives

The objectives of this exercise were to:

* Identify systems available on the network.
* Enumerate SMB services.
* Validate Windows vulnerabilities.
* Study authentication-based remote access concepts.
* Monitor Windows endpoint activity.
* Collect and correlate security logs.
* Detect indicators associated with lateral movement.

---

# Lab Environment

| Component    | Purpose                       |
| ------------ | ----------------------------- |
| Kali Linux   | Security Analysis Workstation |
| Windows VM   | Target System                 |
| Suricata IDS | Network Monitoring            |
| Sysmon       | Endpoint Monitoring           |
| Auditd       | Linux Auditing                |
| rsyslog      | Centralized Logging           |

---

# Reconnaissance Activities

Network reconnaissance was performed to identify live hosts and exposed services.

Activities completed:

* Host discovery
* TCP port scanning
* Service detection
* Operating system identification

Tools used:

* Nmap

Typical services identified included:

* SMB (TCP 445)
* HTTP
* RDP
* RPC

---

# SMB Enumeration

SMB enumeration was performed to understand Windows file sharing exposure.

Activities included:

* Enumerating available SMB shares
* Reviewing accessible resources
* Identifying exposed Windows services

Tools used:

* smbclient
* Nmap SMB NSE scripts

---

# Vulnerability Assessment

The Windows system was assessed for the MS17-010 (EternalBlue) vulnerability.

Activities completed:

* Verified SMB exposure
* Executed Nmap vulnerability detection scripts
* Reviewed vulnerability status
* Studied the associated security impact

This exercise focused on vulnerability validation within the lab.

---

# Remote Access Investigation

Authentication-based remote administration concepts were explored during the pivoting exercises.

Activities included:

* Reviewing remote authentication methods
* Attempting remote administration using Impacket tools
* Investigating authentication failures

During testing, remote execution attempts were unsuccessful because of authentication issues. The exercise emphasized troubleshooting and defensive analysis rather than successful lateral movement.

---

# Endpoint Monitoring

Windows endpoint telemetry was collected using Sysmon.

Observed event categories included:

* Process Creation
* Network Connections
* Registry Activity
* File Creation

Relevant Event IDs:

| Event ID | Description        |
| -------- | ------------------ |
| 1        | Process Creation   |
| 3        | Network Connection |
| 11       | File Creation      |
| 12–14    | Registry Activity  |

---

# PowerShell Monitoring

PowerShell Script Block Logging was enabled to improve visibility.

Observed event:

* Event ID 4104

This provided additional telemetry for investigating script execution during endpoint analysis.

---

# Network Monitoring

Network traffic was monitored using Suricata IDS.

Detection areas included:

* SMB activity
* Port scanning
* ICMP reconnaissance
* HTTP activity
* Network anomalies

Logs reviewed:

* fast.log
* eve.json
* stats.log

---

# Centralized Logging

Linux rsyslog was configured to collect remote Windows event logs.

Activities completed:

* Configure remote logging
* Verify log forwarding
* Review collected security events
* Confirm successful log reception

---

# Threat Hunting Activities

Threat hunting focused on correlating endpoint and network telemetry.

Areas reviewed:

* Authentication events
* Process execution
* PowerShell activity
* SMB communications
* Network connections
* Suspicious log entries

Log sources included:

* Windows Security Log
* Sysmon Operational Log
* PowerShell Operational Log
* Auditd
* journalctl
* Suricata logs

---

# Indicators Reviewed

## Network Indicators

* SMB communication
* Port scanning activity
* Repeated connection attempts
* Unexpected network traffic

## Endpoint Indicators

* Process creation
* PowerShell execution
* Registry modifications
* Authentication events
* File creation

---

# Tools Used

| Tool         | Purpose                       |
| ------------ | ----------------------------- |
| Nmap         | Network Reconnaissance        |
| smbclient    | SMB Enumeration               |
| Nmap NSE     | Vulnerability Detection       |
| Impacket     | Remote Administration Testing |
| Sysmon       | Endpoint Monitoring           |
| Suricata     | Network Detection             |
| Auditd       | Linux Auditing                |
| rsyslog      | Centralized Logging           |
| Event Viewer | Windows Log Analysis          |

---

# Key Findings

* SMB services were successfully identified and enumerated.
* MS17-010 vulnerability validation demonstrated the importance of patch management.
* Sysmon significantly improved endpoint visibility.
* PowerShell logging enhanced investigation capabilities.
* Correlating endpoint and network telemetry strengthened threat hunting effectiveness.
* Authentication failures during remote administration highlighted the importance of credential management and monitoring.

---

# Skills Developed

* Network Reconnaissance
* SMB Enumeration
* Vulnerability Assessment
* Endpoint Monitoring
* Windows Event Analysis
* Detection Engineering
* Threat Hunting
* Incident Investigation
* Log Correlation

---

# Conclusion

The lateral movement exercise provided practical experience in identifying systems, validating exposed services, monitoring endpoint activity, and correlating security events across multiple telemetry sources.

Although successful lateral movement was not achieved during the lab because of authentication issues, the exercise strengthened skills in reconnaissance, vulnerability assessment, defensive monitoring, and threat hunting. The investigation demonstrated how endpoint logs, network monitoring, and centralized logging can be combined to detect and analyze potential lateral movement within an enterprise environment.

---

**GraySentinel Cyber Command Center**

**Observe • Detect • Investigate • Respond**

