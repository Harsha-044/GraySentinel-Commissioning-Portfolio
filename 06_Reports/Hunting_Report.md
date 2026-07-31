# Threat Hunting Report

## GraySentinel Cyber Command Center

**Author:** Harsha  
**Report Version:** 1.0  
**Classification:** Defensive Security Training  
**Lab Environment:** GraySentinel Cyber Range

---

# Executive Summary

This report documents the threat hunting activities completed during the
GraySentinel Cyber Range from Day 1 through Day 30.

The objective was to proactively identify suspicious activity by analyzing
network traffic, endpoint telemetry, authentication events, and system logs
instead of relying solely on security alerts.

The investigation combined multiple telemetry sources to understand attacker
behavior and improve detection capabilities.

---

# Objectives

The threat hunting exercise focused on:

- Network reconnaissance analysis
- Endpoint activity monitoring
- Authentication event investigation
- Process execution analysis
- PowerShell monitoring
- Audit log analysis
- IDS alert investigation
- Network packet analysis
- Indicator of Compromise (IOC) identification

---

# Lab Environment

| Component | Purpose |
|-----------|----------|
| Kali Linux | Security Operations Workstation |
| Windows VM | Endpoint Monitoring |
| Suricata IDS | Network Detection |
| Sysmon | Endpoint Telemetry |
| Auditd | Linux Auditing |
| Rsyslog | Centralized Logging |

---

# Data Sources

The following telemetry sources were investigated.

## Windows

- Security Event Log
- Sysmon Operational Log
- PowerShell Operational Log
- Process Creation Events
- Network Connection Events
- Registry Events

---

## Linux

- journalctl
- auditd
- ausearch
- Authentication Logs
- SSH Logs
- rsyslog

---

## Network

- Suricata fast.log
- Suricata eve.json
- Suricata stats.log
- tcpdump packet captures
- Tshark analysis

---

# Threat Hunting Activities

## 1. Reconnaissance Hunting

Activities completed:

- Host discovery
- TCP port scanning
- Service enumeration
- Operating system detection
- SMB enumeration
- HTTP enumeration

Tools used:

- Nmap
- WhatWeb
- Gobuster
- FFUF
- smbclient

---

## 2. Endpoint Hunting

Windows endpoint telemetry was reviewed to identify suspicious activity.

Collected telemetry included:

- Process Creation
- Network Connections
- Registry Activity
- PowerShell Execution

Relevant Event IDs:

| Event | Description |
|--------|-------------|
| 1 | Sysmon Process Creation |
| 3 | Sysmon Network Connection |
| 11 | File Creation |
| 12–14 | Registry Activity |
| 4104 | PowerShell Script Block Logging |

---

## 3. Authentication Hunting

Authentication events were reviewed for unusual behavior.

Indicators reviewed:

- Failed logins
- Successful logins
- Repeated authentication attempts
- Privileged account usage

Linux sources:

- /var/log/auth.log
- journalctl

Windows sources:

- Security Event Log

---

## 4. Network Hunting

Network traffic was analyzed using packet captures and IDS logs.

Activities:

- HTTP traffic review
- SMB communication analysis
- ICMP monitoring
- DNS observation
- Packet capture analysis

Tools:

- tcpdump
- Tshark
- Suricata

---

## 5. Malware Download Investigation

Packet captures revealed HTTP traffic requesting an executable.

Observed activity:

```
HTTP GET /malware.exe
```

Investigation included:

- Packet inspection
- HTTP request analysis
- Suricata alert correlation
- Endpoint telemetry review

---

## 6. Suricata Alert Investigation

Custom IDS rules were created and tested.

Alert categories included:

- ICMP Echo Requests
- Nmap SYN Scans
- SMB Activity
- Directory Enumeration
- HTTP Executable Downloads
- IP Fragmentation
- HTTP POST Activity

Logs reviewed:

- fast.log
- eve.json
- stats.log

---

## 7. Linux Audit Investigation

Auditd was configured to monitor critical files.

Monitored files:

- /etc/passwd
- /etc/shadow
- /etc/sudoers
- /etc/ssh/sshd_config
- /etc/crontab

Audit tools used:

- auditctl
- ausearch

---

## 8. Centralized Log Investigation

Remote logging was configured using rsyslog.

Activities included:

- Forwarding Windows logs
- Receiving centralized logs
- Reviewing remote log files
- Verifying log collection

---

## 9. Process Investigation

Process relationships were reviewed during threat hunting.

Focus areas:

- Parent-child processes
- PowerShell execution
- Command Prompt activity
- WMI execution
- Suspicious process creation

---

# Indicators of Compromise

## Network Indicators

- HTTP executable download
- Unexpected SMB activity
- Port scanning behavior
- Repeated connection attempts
- Suspicious HTTP requests

---

## Endpoint Indicators

- PowerShell execution
- Registry modifications
- New processes
- Unexpected file creation
- Authentication anomalies

---

# MITRE ATT&CK Techniques Studied

| Tactic | Focus |
|--------|-------|
| Reconnaissance | Information Gathering |
| Discovery | Service Enumeration |
| Credential Access | Password Attack Concepts |
| Persistence | Registry and Scheduled Task Concepts |
| Defense Evasion | PowerShell Monitoring |
| Collection | Endpoint Telemetry |
| Command and Control | Network Traffic Analysis |

---

# Tools Used

| Tool | Purpose |
|------|---------|
| Nmap | Reconnaissance |
| WhatWeb | Technology Detection |
| Gobuster | Directory Enumeration |
| FFUF | Content Discovery |
| smbclient | SMB Enumeration |
| Hydra | Credential Attack Simulation |
| John the Ripper | Password Auditing |
| tcpdump | Packet Capture |
| Tshark | Packet Analysis |
| Suricata | IDS Monitoring |
| Sysmon | Endpoint Telemetry |
| Auditd | Linux Auditing |
| journalctl | Log Analysis |
| ausearch | Audit Investigation |
| rsyslog | Centralized Logging |

---

# Key Findings

- Reconnaissance activities generate identifiable network patterns.
- Endpoint telemetry provides detailed visibility into process execution.
- PowerShell logging improves investigation capabilities.
- Auditd detects changes to critical Linux files.
- Suricata effectively detects common reconnaissance and suspicious network activity.
- Packet captures provide valuable evidence for incident analysis.
- Correlating multiple log sources improves detection accuracy.

---

# Skills Developed

- Threat Hunting
- Network Traffic Analysis
- Endpoint Monitoring
- Log Correlation
- Detection Engineering
- Linux Auditing
- Windows Event Analysis
- IDS Rule Development
- Incident Investigation
- IOC Identification

---

# Conclusion

The GraySentinel Cyber Range provided practical experience in proactive threat hunting using endpoint telemetry, network monitoring, Linux auditing, and intrusion detection.

By correlating data from Windows Event Logs, Sysmon, Auditd, Suricata, packet captures, and network reconnaissance, suspicious behaviors could be identified and investigated effectively.

The activities completed throughout Days 1–30 established a strong foundation in defensive security operations, log analysis, detection engineering, and incident investigation.

---

**GraySentinel Cyber Command Center**

**Observe • Hunt • Detect • Respond**
