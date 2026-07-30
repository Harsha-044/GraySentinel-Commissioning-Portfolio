# Reconnaissance Report

**Operation:** GraySentinel – Reconnaissance Phase  
**Analyst:** Harsha  
**Date:** July 2026

---

# Objective

The objective of this reconnaissance exercise was to gather information about the target environment without performing exploitation. The assessment focused on identifying active hosts, open ports, running services, web technologies, shared resources, and potential attack surfaces.

---

# Scope

Target Environment

- Kali Linux (Attacker)
- Windows 10 Virtual Machine
- DVWA Web Server
- Internal Host-Only Network

---

# Tools Used

| Tool | Purpose |
|-------|---------|
| Nmap | Host discovery and port scanning |
| WhatWeb | Web technology fingerprinting |
| Gobuster | Directory enumeration |
| smbclient | SMB share enumeration |
| Netcat | Connectivity verification |
| Curl | HTTP response inspection |
| Browser | Manual verification |

---

# Methodology

The reconnaissance process followed the standard penetration testing methodology.

1. Host Discovery
2. Port Scanning
3. Service Enumeration
4. Version Detection
5. Web Fingerprinting
6. Directory Enumeration
7. SMB Enumeration
8. Attack Surface Identification
9. Documentation of Findings

---

# Host Discovery

The target host was identified on the internal network.

Example discovery:

```
Host is up
```

The discovered host was selected for detailed enumeration.

---

# Port Scan Results

A TCP SYN scan was performed to identify exposed services.

Open services discovered included:

| Port | Service |
|------|----------|
| 80 | HTTP |
| 135 | MSRPC |
| 139 | NetBIOS |
| 445 | SMB |
| 3389 | Remote Desktop (when enabled) |

---

# Service Enumeration

Nmap version detection identified multiple Microsoft services.

Observed services included:

- Microsoft RPC
- NetBIOS Session Service
- SMB File Sharing
- IIS / Apache HTTP Server
- Remote Desktop Protocol

These services indicate a typical Windows system hosting network services together with a web application.

---

# Web Application Enumeration

The target web server was fingerprinted using WhatWeb.

Technologies identified included:

- Apache HTTP Server
- PHP
- DVWA
- HTML5

The application responded correctly to HTTP requests and exposed multiple accessible directories.

---

# Directory Enumeration

Directory brute forcing identified multiple accessible resources.

Examples:

```
/dvwa/
/index.php
/.git/
/robots.txt
```

Protected resources were also discovered.

Examples:

```
.htaccess (403)
.htpasswd (403)
```

The presence of a publicly accessible `.git` directory represented a potential information disclosure risk.

---

# SMB Enumeration

SMB enumeration identified available shared resources.

Using smbclient:

```
Anonymous share enumeration attempted

Available administrative shares identified

IPC$
ADMIN$
```

SMB enumeration confirmed that Windows file-sharing services were active.

---

# Attack Surface Summary

The following attack surfaces were identified.

- HTTP Web Server
- SMB File Sharing
- Microsoft RPC
- NetBIOS
- Remote Desktop
- DVWA Web Application

Potential attack vectors included:

- Directory enumeration
- SMB enumeration
- Web application testing
- Authentication attacks
- Vulnerability scanning

---

# Findings

## Finding 1

**Open HTTP Service**

Risk: Low

Description

The target exposes a web application accessible over HTTP.

Potential Impact

- Information disclosure
- Web application attack surface

---

## Finding 2

**SMB Enabled**

Risk: Medium

Description

SMB services are exposed internally.

Potential Impact

- Share enumeration
- Lateral movement
- Authentication attacks

---

## Finding 3

**Public Git Directory**

Risk: Medium

Description

A publicly accessible `.git` directory was discovered.

Potential Impact

- Source code exposure
- Credential leakage
- Configuration disclosure

---

## Finding 4

**DVWA Application Detected**

Risk: Informational

Description

DVWA was identified during technology fingerprinting.

Impact

This application intentionally contains vulnerabilities and is suitable for penetration testing exercises.

---

# Security Recommendations

- Disable unnecessary network services.
- Restrict SMB access to trusted hosts.
- Remove exposed Git repositories from production systems.
- Implement proper authentication mechanisms.
- Keep operating systems and applications fully patched.
- Disable directory listing.
- Limit publicly accessible services using firewall rules.
- Perform periodic vulnerability assessments.

---

# Skills Demonstrated

- Network Reconnaissance
- Host Discovery
- TCP Port Scanning
- Service Enumeration
- Version Detection
- Web Fingerprinting
- SMB Enumeration
- Directory Enumeration
- Attack Surface Analysis
- Documentation

---

# MITRE ATT&CK Mapping

| Technique | ID |
|-----------|----|
| Active Scanning | T1595 |
| Gather Victim Network Information | T1590 |
| Network Service Discovery | T1046 |
| Software Discovery | T1518 |

---

# Outcome

The reconnaissance phase successfully identified the target's exposed services, web technologies, shared resources, and overall attack surface without performing exploitation. The collected information provides the foundation for vulnerability assessment, exploitation, privilege escalation, and post-exploitation activities conducted in later phases of the engagement.

---

# Lessons Learned

- Enumeration is one of the most important phases of penetration testing.
- Small pieces of information can reveal significant attack opportunities.
- Combining multiple reconnaissance tools provides a more complete understanding of the target.
- Proper documentation during reconnaissance greatly improves later stages of an assessment.
