# Reconnaissance Report

## GraySentinel Cyber Command Center

**Author:** Harsha
**Report Version:** 1.0
**Classification:** Defensive Security Training
**Environment:** GraySentinel Cyber Range

---

# Executive Summary

This report documents the reconnaissance activities completed during the GraySentinel Cyber Range. The objective was to identify active hosts, discover exposed services, enumerate web technologies, assess the attack surface, and document findings before moving to later phases of the security assessment.

All activities were performed in an isolated laboratory environment for educational and defensive security purposes.

---

# Objectives

The reconnaissance phase focused on:

* Discovering live hosts
* Identifying open ports
* Enumerating network services
* Detecting operating systems
* Enumerating SMB services
* Identifying web technologies
* Discovering hidden web resources
* Gathering open-source intelligence (OSINT)
* Documenting the attack surface

---

# Lab Environment

| Component         | Purpose                         |
| ----------------- | ------------------------------- |
| Kali Linux        | Security Assessment Workstation |
| Windows VM        | Target System                   |
| Local Lab Network | Controlled Testing Environment  |

---

# Network Reconnaissance

Network discovery was performed to identify accessible systems and exposed services.

Activities completed:

* Host discovery
* TCP SYN scanning
* Full TCP port scanning
* Service version detection
* Operating system detection
* Aggressive service enumeration

Tool used:

* Nmap

Typical services identified included:

* SMB (TCP 445)
* HTTP (TCP 80)
* RPC
* NetBIOS
* Remote Desktop Protocol (RDP)

---

# SMB Enumeration

SMB enumeration was performed to identify available shares and gather information about Windows file-sharing services.

Activities completed:

* SMB share enumeration
* SMB service identification
* Windows service discovery

Tools used:

* smbclient
* Nmap SMB NSE scripts

---

# Web Reconnaissance

Web applications were examined to identify technologies and exposed resources.

Activities completed:

* Web technology fingerprinting
* Directory enumeration
* Hidden resource discovery
* HTTP header inspection

Tools used:

* WhatWeb
* Wappalyzer
* Gobuster
* Dirb
* FFUF

Observed examples included:

* `.git/HEAD`
* `.htaccess`
* `.htpasswd`

---

# Open Source Intelligence (OSINT)

Information gathering techniques were practiced using publicly available sources.

Tools used:

* theHarvester
* Recon-ng

Information collected included:

* Public infrastructure information
* Domain-related information
* Open-source intelligence concepts
* External attack surface observations

---

# Vulnerability Verification

Reconnaissance findings were used to identify systems requiring additional investigation.

Activities completed:

* MS17-010 vulnerability verification
* Service exposure assessment
* Identification of potentially vulnerable services

Tool used:

* Nmap NSE vulnerability scripts

---

# Network Mapping

Information gathered during reconnaissance was organized into a logical network map.

The mapping process included:

* Host identification
* IP address documentation
* Open service identification
* Network relationship visualization

This information supported subsequent assessment activities.

---

# Information Collected

## Host Information

* Live systems
* IP addresses
* Operating system characteristics

## Service Information

* Open TCP ports
* Service versions
* Running network services

## Web Information

* Web technologies
* Directory structure
* Hidden resources

## SMB Information

* File-sharing services
* Accessible shares

---

# Tools Used

| Tool         | Purpose                                |
| ------------ | -------------------------------------- |
| Nmap         | Host Discovery and Service Enumeration |
| smbclient    | SMB Enumeration                        |
| WhatWeb      | Web Technology Detection               |
| Wappalyzer   | Technology Fingerprinting              |
| Gobuster     | Directory Enumeration                  |
| Dirb         | Content Discovery                      |
| FFUF         | Web Fuzzing                            |
| theHarvester | OSINT Collection                       |
| Recon-ng     | Information Gathering                  |

---

# Key Findings

* Live hosts were successfully identified.
* Network services were enumerated.
* SMB services were discovered and analyzed.
* Web technologies were identified.
* Hidden web resources were discovered.
* Open-source intelligence supported attack surface analysis.
* Vulnerability verification identified systems requiring further investigation.

---

# Skills Developed

* Network Reconnaissance
* Service Enumeration
* Web Reconnaissance
* SMB Enumeration
* OSINT Collection
* Network Mapping
* Attack Surface Analysis
* Vulnerability Identification
* Technical Documentation

---

# Lessons Learned

The reconnaissance phase demonstrated that systematic information gathering is essential before any security assessment.

Combining network scanning, web enumeration, SMB analysis, and OSINT provides a comprehensive understanding of the environment while supporting later stages such as vulnerability assessment, detection engineering, and threat hunting.

---

# Conclusion

The reconnaissance activities completed during the GraySentinel Cyber Range established a structured methodology for identifying hosts, enumerating services, discovering web technologies, and documenting the attack surface.

The information collected throughout this phase formed the foundation for later exercises involving vulnerability analysis, endpoint monitoring, intrusion detection, and threat hunting.

---

**GraySentinel Cyber Command Center**

**Discover • Enumerate • Analyze • Document**

