# Multi-Stage Threat Hunting Report

## GraySentinel Cyber Command Center

**Author:** Harsha
**Report Version:** 1.0
**Classification:** Defensive Security Training
**Environment:** GraySentinel Cyber Range

---

# Executive Summary

This report documents a multi-stage threat hunting exercise conducted throughout the GraySentinel Cyber Range. The objective was to correlate network telemetry, endpoint logs, Linux audit records, IDS alerts, and packet captures to understand the progression of suspicious activity within a controlled laboratory environment.

The investigation follows the sequence of activities completed during training, beginning with reconnaissance and ending with threat hunting and log correlation.

---

# Hunt Objectives

The objectives of this hunt were to:

* Identify reconnaissance activity
* Validate exposed services
* Review endpoint telemetry
* Monitor Linux security events
* Analyze network traffic
* Correlate IDS alerts
* Identify Indicators of Compromise (IOCs)
* Document investigative findings

---

# Lab Environment

| Component    | Purpose                         |
| ------------ | ------------------------------- |
| Kali Linux   | Security Operations Workstation |
| Windows VM   | Monitored Endpoint              |
| Suricata IDS | Network Detection               |
| Sysmon       | Windows Endpoint Telemetry      |
| Auditd       | Linux Security Auditing         |
| rsyslog      | Centralized Logging             |

---

# Stage 1 – Reconnaissance

## Objective

Identify live systems and exposed network services.

### Activities Performed

* Host discovery
* TCP SYN scan
* Full TCP port scan
* Service version detection
* Operating system detection

### Tool

* Nmap

### Evidence

* Active hosts
* Open TCP ports
* Service banners
* Operating system information

---

# Stage 2 – Service Enumeration

## Objective

Identify accessible services and resources.

### Activities Performed

* SMB enumeration
* HTTP enumeration
* Directory discovery
* Web technology identification

### Tools

* smbclient
* WhatWeb
* Wappalyzer
* Gobuster
* Dirb
* FFUF

### Findings

Examples observed during enumeration:

* `.git/HEAD`
* `.htaccess`
* `.htpasswd`

---

# Stage 3 – Vulnerability Verification

## Objective

Assess discovered services for known vulnerabilities.

### Activities Performed

* MS17-010 verification
* SMB exposure assessment
* Service security review

### Tool

* Nmap NSE scripts

### Outcome

The assessment confirmed the presence of services requiring further security evaluation within the lab environment.

---

# Stage 4 – Credential Security Review

## Objective

Study authentication-related attack concepts.

### Activities Performed

* Password attack simulations
* Password auditing

### Tools

* Hydra
* John the Ripper

### Focus

* Authentication events
* Password security awareness
* Defensive monitoring concepts

---

# Stage 5 – Endpoint Monitoring

## Objective

Collect endpoint telemetry for investigation.

### Monitoring Enabled

* Sysmon
* PowerShell Script Block Logging

### Events Reviewed

| Event ID | Description                     |
| -------- | ------------------------------- |
| 1        | Process Creation                |
| 3        | Network Connections             |
| 11       | File Creation                   |
| 12–14    | Registry Activity               |
| 4104     | PowerShell Script Block Logging |

---

# Stage 6 – Linux Security Monitoring

## Objective

Monitor changes to critical Linux resources.

### Activities Performed

* Auditd configuration
* Authentication log review
* Sensitive file monitoring

### Files Monitored

* /etc/passwd
* /etc/shadow
* /etc/sudoers
* /etc/ssh/sshd_config
* /etc/crontab

### Tools

* auditctl
* ausearch
* journalctl

---

# Stage 7 – Centralized Logging

## Objective

Collect security logs from multiple systems.

### Activities Performed

* Configure rsyslog
* Verify remote log forwarding
* Review centralized log files

### Result

Windows event logs were successfully forwarded to the Linux logging server for analysis.

---

# Stage 8 – Network Detection

## Objective

Detect suspicious network activity.

### IDS Platform

* Suricata

### Custom Detection Rules

* ICMP Echo Requests
* Nmap SYN Scan
* SMB Activity
* Directory Enumeration
* HTTP Executable Downloads
* IP Fragmentation
* HTTP POST Activity

### Logs Reviewed

* fast.log
* eve.json
* stats.log

---

# Stage 9 – Packet Analysis

## Objective

Investigate captured network traffic.

### Tools

* tcpdump
* Tshark

### Observed Activity

Packet captures included:

* HTTP traffic
* SMB communication
* ICMP packets

One capture contained an HTTP request for:

```text
/malware.exe
```

This activity was correlated with IDS alerts and endpoint telemetry.

---

# Stage 10 – Threat Hunting

## Objective

Correlate multiple telemetry sources to identify suspicious behavior.

### Data Sources

* Windows Security Log
* Sysmon Operational Log
* PowerShell Operational Log
* Auditd
* journalctl
* Suricata
* Packet captures

### Investigation Areas

* Process execution
* Authentication activity
* PowerShell execution
* SMB communication
* Network connections
* IDS alerts

---

# Indicators of Compromise (IOCs)

## Network Indicators

* Port scanning
* SMB communication
* ICMP activity
* HTTP executable downloads
* Directory enumeration

## Endpoint Indicators

* Process creation
* PowerShell execution
* Registry modifications
* File creation
* Authentication events

---

# Investigation Workflow

```text
Reconnaissance
        │
        ▼
Service Enumeration
        │
        ▼
Vulnerability Verification
        │
        ▼
Credential Security Review
        │
        ▼
Endpoint Monitoring
        │
        ▼
Linux Auditing
        │
        ▼
Centralized Logging
        │
        ▼
Network Detection
        │
        ▼
Packet Analysis
        │
        ▼
Threat Hunting
        │
        ▼
Investigation Summary
```

---

# Tools Used

| Tool            | Purpose                     |
| --------------- | --------------------------- |
| Nmap            | Reconnaissance              |
| smbclient       | SMB Enumeration             |
| WhatWeb         | Technology Detection        |
| Wappalyzer      | Technology Fingerprinting   |
| Gobuster        | Directory Enumeration       |
| Dirb            | Content Discovery           |
| FFUF            | Resource Discovery          |
| Hydra           | Credential Testing Concepts |
| John the Ripper | Password Auditing           |
| Sysmon          | Endpoint Monitoring         |
| Auditd          | Linux Auditing              |
| Suricata        | Intrusion Detection         |
| tcpdump         | Packet Capture              |
| Tshark          | Packet Analysis             |
| rsyslog         | Centralized Logging         |

---

# Key Findings

* Reconnaissance successfully identified accessible systems and services.
* SMB and web enumeration expanded visibility into the environment.
* MS17-010 verification demonstrated the importance of vulnerability assessment.
* Sysmon and PowerShell logging improved endpoint visibility.
* Auditd monitored access to critical Linux files.
* Suricata detected simulated reconnaissance and suspicious network activity.
* Packet captures supported validation of IDS alerts.
* Correlating logs from multiple sources improved investigation accuracy.

---

# Skills Developed

* Threat Hunting
* Network Reconnaissance
* Service Enumeration
* Vulnerability Assessment
* Endpoint Monitoring
* Linux Auditing
* IDS Analysis
* Packet Analysis
* IOC Identification
* Log Correlation
* Incident Investigation

---

# Conclusion

This multi-stage threat hunting exercise demonstrated a structured investigation process using network reconnaissance, service enumeration, vulnerability verification, endpoint monitoring, Linux auditing, centralized logging, intrusion detection, and packet analysis.

The workflow established during the GraySentinel Cyber Range strengthened practical skills in defensive security operations and highlighted the value of correlating telemetry from multiple sources to investigate suspicious activity in a controlled environment.

---

**GraySentinel Cyber Command Center**

**Observe • Detect • Correlate • Hunt**

