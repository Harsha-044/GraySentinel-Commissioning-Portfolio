# Attack Timeline

## GraySentinel Cyber Command Center

**Author:** Harsha
**Document Version:** 1.0
**Classification:** Defensive Security Training
**Environment:** GraySentinel Cyber Range

---

# Overview

This document reconstructs the sequence of activities observed and investigated throughout the GraySentinel Cyber Range. The timeline is based on network reconnaissance, endpoint monitoring, packet capture analysis, intrusion detection, log correlation, and threat hunting exercises completed during the training.

The purpose of this timeline is to demonstrate how multiple telemetry sources can be correlated to understand attacker behavior in a controlled lab environment.

---

# Attack Timeline

## Phase 1 – Reconnaissance

### Activity

Initial network reconnaissance was performed to identify systems and exposed services.

### Actions Performed

* Host discovery
* TCP port scanning
* Service version detection
* Operating system detection

### Tools Used

* Nmap

### Evidence Collected

* Live host identification
* Open TCP ports
* Service banners
* Operating system information

---

## Phase 2 – Service Enumeration

### Activity

Discovered services were enumerated to identify available resources.

### Actions Performed

* SMB enumeration
* HTTP enumeration
* Web technology fingerprinting
* Directory discovery

### Tools Used

* smbclient
* WhatWeb
* Wappalyzer
* Gobuster
* Dirb
* FFUF

### Evidence Collected

* SMB shares
* Web technologies
* Hidden directories
* Exposed files

Examples observed:

* `.git/HEAD`
* `.htaccess`
* `.htpasswd`

---

## Phase 3 – Vulnerability Assessment

### Activity

Identified services were assessed for known vulnerabilities.

### Actions Performed

* MS17-010 verification
* SMB security assessment
* Service exposure analysis

### Tools Used

* Nmap NSE scripts

### Evidence Collected

* SMB vulnerability assessment results
* Service information
* Security observations

---

## Phase 4 – Credential Security Investigation

### Activity

Credential attack concepts were explored in the laboratory.

### Actions Performed

* Password attack simulations
* Password auditing exercises

### Tools Used

* Hydra
* John the Ripper

### Investigation Focus

* Authentication behavior
* Password security
* Defensive monitoring concepts

---

## Phase 5 – Endpoint Monitoring

### Activity

Windows endpoint telemetry was collected and reviewed.

### Monitoring Enabled

* Sysmon
* PowerShell Script Block Logging

### Important Events

| Event ID | Description                     |
| -------- | ------------------------------- |
| 1        | Process Creation                |
| 3        | Network Connection              |
| 11       | File Creation                   |
| 12–14    | Registry Activity               |
| 4104     | PowerShell Script Block Logging |

---

## Phase 6 – Linux Security Monitoring

### Activity

Linux audit logging was configured and analyzed.

### Actions Performed

* Auditd configuration
* Sensitive file monitoring
* Authentication log review

### Monitored Files

* /etc/passwd
* /etc/shadow
* /etc/sudoers
* /etc/ssh/sshd_config
* /etc/crontab

### Tools Used

* auditctl
* ausearch
* journalctl

---

## Phase 7 – Centralized Logging

### Activity

Remote logging infrastructure was configured.

### Actions Performed

* Configure rsyslog
* Forward Windows event logs
* Verify remote log collection

### Evidence

* Remote log files
* Successful log forwarding
* Collected Windows security events

---

## Phase 8 – Network Detection

### Activity

Network traffic was monitored using Suricata IDS.

### Detection Rules

* ICMP Echo Request
* Nmap SYN Scan
* SMB Activity
* Directory Enumeration
* HTTP Executable Download
* IP Fragmentation

### Logs Reviewed

* fast.log
* eve.json
* stats.log

---

## Phase 9 – Packet Capture Investigation

### Activity

Network traffic was captured and analyzed.

### Tools Used

* tcpdump
* Tshark

### Investigation

Packet captures identified HTTP traffic requesting:

```text
/malware.exe
```

The captured traffic was correlated with Suricata alerts and endpoint telemetry.

---

## Phase 10 – Threat Hunting

### Activity

Multiple log sources were correlated to identify suspicious behavior.

### Data Sources

* Windows Security Log
* Sysmon
* PowerShell Operational Log
* Auditd
* journalctl
* Suricata
* Packet captures

### Hunting Focus

* Authentication events
* Process creation
* PowerShell activity
* Network connections
* SMB communication
* IDS alerts

---

# Investigation Timeline

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
Credential Security Analysis
        │
        ▼
Endpoint Monitoring
        │
        ▼
Linux Audit Monitoring
        │
        ▼
Centralized Logging
        │
        ▼
Suricata Detection
        │
        ▼
Packet Capture Analysis
        │
        ▼
Threat Hunting
        │
        ▼
Incident Investigation
```

---

# Indicators Reviewed

## Network Indicators

* Port scanning activity
* SMB communication
* HTTP executable download
* ICMP activity
* Directory enumeration

## Endpoint Indicators

* Process creation
* PowerShell execution
* Registry activity
* File creation
* Authentication events

---

# Tools Used

| Tool            | Purpose                     |
| --------------- | --------------------------- |
| Nmap            | Reconnaissance              |
| smbclient       | SMB Enumeration             |
| WhatWeb         | Web Technology Detection    |
| Wappalyzer      | Technology Fingerprinting   |
| Gobuster        | Directory Enumeration       |
| Dirb            | Content Discovery           |
| FFUF            | Web Resource Discovery      |
| Hydra           | Credential Testing Concepts |
| John the Ripper | Password Auditing           |
| Sysmon          | Endpoint Monitoring         |
| Auditd          | Linux Auditing              |
| Suricata        | Network Detection           |
| tcpdump         | Packet Capture              |
| Tshark          | Packet Analysis             |
| rsyslog         | Centralized Logging         |

---

# Lessons Learned

* Effective threat hunting requires data from multiple sources.
* Reconnaissance provides valuable context for later investigations.
* Endpoint telemetry complements network monitoring.
* IDS alerts should be validated using packet captures and endpoint logs.
* Centralized logging improves incident investigation and event correlation.

---

# Conclusion

The reconstructed timeline demonstrates the progression from reconnaissance through vulnerability assessment, monitoring, detection, packet analysis, and threat hunting performed during the GraySentinel Cyber Range.

The exercises developed practical skills in defensive security operations, log correlation, incident investigation, and threat hunting while maintaining accurate documentation of observed events within the laboratory environment.

---

**GraySentinel Cyber Command Center**

**Observe • Correlate • Hunt • Respond**

