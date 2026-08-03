# Threat Intelligence Report

## GraySentinel Cyber Command Center

**Author:** Harsha
**Report Version:** 1.0
**Classification:** Defensive Security Training
**Environment:** GraySentinel Cyber Range

---

# Executive Summary

This report summarizes the threat intelligence activities completed during the GraySentinel Cyber Range. The objective was to collect, analyze, and correlate intelligence from network, endpoint, and open-source information to improve defensive security monitoring and incident investigation.

The exercises emphasized intelligence collection, indicator analysis, vulnerability assessment, and threat hunting in a controlled laboratory environment.

---

# Objectives

The threat intelligence exercise focused on:

* Collecting open-source intelligence (OSINT)
* Discovering network assets
* Enumerating exposed services
* Identifying vulnerable systems
* Monitoring endpoint activity
* Detecting suspicious network behavior
* Correlating security events
* Documenting Indicators of Compromise (IOCs)

---

# Intelligence Collection Sources

## Open-Source Intelligence (OSINT)

Tools used:

* theHarvester
* Recon-ng

Activities completed:

* Domain information gathering
* Public infrastructure research
* Attack surface identification
* Intelligence collection from publicly available sources

---

## Network Intelligence

Network intelligence was collected through active reconnaissance.

Activities completed:

* Host discovery
* TCP port scanning
* Service enumeration
* Operating system detection

Tool used:

* Nmap

Common services identified:

* SMB (TCP 445)
* HTTP
* RPC
* NetBIOS
* RDP

---

## Web Intelligence

Web applications were analyzed to identify technologies and exposed resources.

Tools used:

* WhatWeb
* Wappalyzer
* Gobuster
* Dirb
* FFUF

Findings included:

* Web server technologies
* Hidden directories
* Exposed configuration files
* Accessible resources

Examples observed:

* `.git/HEAD`
* `.htaccess`
* `.htpasswd`

---

# Vulnerability Intelligence

Vulnerability assessment focused on identifying exposed services requiring further investigation.

Activities completed:

* MS17-010 (EternalBlue) verification
* SMB exposure analysis
* Service risk assessment

Tool used:

* Nmap NSE vulnerability scripts

Purpose:

* Identify vulnerable services
* Understand associated security risks
* Support remediation planning

---

# Credential Intelligence

Credential security concepts were studied using laboratory exercises.

Tools used:

* Hydra
* John the Ripper

Topics explored:

* Authentication attack patterns
* Password auditing
* Credential security best practices

These exercises were conducted within the lab environment for defensive learning.

---

# Endpoint Intelligence

Endpoint telemetry was collected from Windows systems.

## Sysmon

Configured monitoring included:

* Process creation
* Network connections
* File creation
* Registry activity

Relevant Event IDs:

| Event ID | Description        |
| -------- | ------------------ |
| 1        | Process Creation   |
| 3        | Network Connection |
| 11       | File Creation      |
| 12–14    | Registry Activity  |

---

## PowerShell Logging

PowerShell Script Block Logging was enabled.

Observed event:

* Event ID 4104

Purpose:

* Monitor PowerShell execution
* Improve visibility during investigations
* Support threat hunting

---

# Linux Intelligence

Linux security monitoring was performed using:

* Auditd
* journalctl
* ausearch
* rsyslog

Critical files monitored:

* /etc/passwd
* /etc/shadow
* /etc/sudoers
* /etc/ssh/sshd_config
* /etc/crontab

Centralized logging was configured to collect remote security events.

---

# Network Detection Intelligence

Suricata IDS was deployed for network monitoring.

Custom detections included:

* ICMP Echo Requests
* Nmap SYN scans
* SMB activity
* Directory enumeration
* HTTP executable downloads
* IP fragmentation
* Suspicious HTTP traffic

Logs analyzed:

* fast.log
* eve.json
* stats.log

---

# Packet Capture Intelligence

Network traffic was captured and analyzed.

Tools used:

* tcpdump
* Tshark

Observed activity included:

* HTTP requests
* SMB communication
* ICMP traffic
* Network sessions

One investigation included an HTTP request for:

```
/malware.exe
```

The traffic was correlated with Suricata alerts and endpoint telemetry.

---

# Indicators of Compromise (IOCs)

## Network Indicators

* Port scanning activity
* SMB exposure
* HTTP executable downloads
* ICMP reconnaissance
* Suspicious HTTP requests

## Host Indicators

* PowerShell execution
* Process creation events
* Registry modifications
* File creation activity
* Authentication events

---

# Threat Hunting

Threat hunting activities included:

* Authentication analysis
* Endpoint telemetry review
* Network traffic investigation
* Suricata alert analysis
* Auditd event review
* Log correlation across multiple sources

Data sources:

* Windows Security Logs
* Sysmon Operational Log
* PowerShell Operational Log
* Auditd
* journalctl
* Suricata logs
* Packet captures

---

# MITRE ATT&CK Mapping

| Tactic              | Activity                 |
| ------------------- | ------------------------ |
| Reconnaissance      | Information Gathering    |
| Discovery           | Service Enumeration      |
| Credential Access   | Password Attack Concepts |
| Collection          | Endpoint Monitoring      |
| Command and Control | Network Traffic Analysis |

---

# Tools Used

| Tool            | Purpose                     |
| --------------- | --------------------------- |
| theHarvester    | OSINT Collection            |
| Recon-ng        | Intelligence Gathering      |
| Nmap            | Network Reconnaissance      |
| WhatWeb         | Technology Detection        |
| Wappalyzer      | Web Fingerprinting          |
| Gobuster        | Directory Enumeration       |
| Dirb            | Content Discovery           |
| FFUF            | Web Fuzzing                 |
| Hydra           | Credential Testing Concepts |
| John the Ripper | Password Auditing           |
| Suricata        | Network Detection           |
| Sysmon          | Endpoint Monitoring         |
| Auditd          | Linux Auditing              |
| tcpdump         | Packet Capture              |
| Tshark          | Packet Analysis             |

---

# Key Findings

* Open-source intelligence improved understanding of the attack surface.
* Network reconnaissance successfully identified exposed services.
* SMB enumeration assisted in vulnerability assessment.
* Sysmon provided detailed endpoint visibility.
* PowerShell logging enhanced investigation capabilities.
* Auditd monitored access to critical Linux files.
* Suricata effectively detected reconnaissance and suspicious network activity.
* Correlating endpoint and network telemetry improved threat hunting.

---

# Skills Developed

* Threat Intelligence Collection
* OSINT
* Network Reconnaissance
* Vulnerability Assessment
* Endpoint Monitoring
* IDS Analysis
* Packet Analysis
* IOC Identification
* Threat Hunting
* Incident Investigation
* Log Correlation

---

# Conclusion

The threat intelligence activities completed during the GraySentinel Cyber Range demonstrated how information gathered from OSINT, network reconnaissance, endpoint monitoring, and intrusion detection can be combined to support proactive security operations.

By correlating indicators from Windows logs, Linux audit records, Suricata alerts, and packet captures, a structured intelligence workflow was established for identifying suspicious behavior and supporting incident investigations.

---

**GraySentinel Cyber Command Center**

**Collect • Analyze • Correlate • Defend**

