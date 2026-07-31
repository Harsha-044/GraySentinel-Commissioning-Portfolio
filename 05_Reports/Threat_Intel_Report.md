# Threat Intelligence Report

## GraySentinel Cyber Command Center

**Author:** Harsha  
**Report Version:** 1.0  
**Classification:** Defensive Security Training  
**Environment:** GraySentinel Cyber Range

---

# 1. Executive Summary

This report documents the Threat Intelligence activities performed during
the GraySentinel Cyber Range.

The objective was to collect, analyze, and correlate security information
from multiple sources to identify:

- Network threats
- Vulnerability exposure
- Suspicious activity
- Credential attack indicators
- Malware-related behaviour
- Endpoint security events

All activities were performed inside an isolated cybersecurity laboratory.

---

# 2. Intelligence Objectives

The investigation focused on:

```
Reconnaissance
      |
      v
Information Collection
      |
      v
Threat Identification
      |
      v
Detection Engineering
      |
      v
Threat Hunting
```

---

# 3. Intelligence Collection

## 3.1 Open Source Intelligence (OSINT)

Tools used:

- theHarvester
- Recon-ng


Information gathering areas:

- Domain information
- Public exposure analysis
- Email discovery concepts
- Attack surface understanding


Purpose:

Understand how attackers collect information before an attack.

---

# 4. Network Intelligence

## Tools Used

- Nmap
- Tcpdump
- Tshark
- Wireshark concepts


## Network Discovery

Activities performed:

- Host discovery
- Port scanning
- Service enumeration
- Operating system detection


Example findings:

```
Open Services:

SMB
HTTP
RDP
SSH
```

---

# 5. Service Exposure Analysis

## SMB Intelligence

Observed:

```
TCP/445
```

Investigated:

- SMB shares
- Windows services
- SMB security risks


Related activities:

- SMB enumeration
- EternalBlue vulnerability analysis


---

## Web Intelligence

Tools used:

- WhatWeb
- Wappalyzer
- Gobuster
- Dirb
- FFUF


Collected information:

- Web technologies
- Hidden directories
- Exposed files


Observed examples:

```
.git exposure
.htaccess
.htpasswd
```

---

# 6. Vulnerability Intelligence

## MS17-010 Analysis

Activity:

- Identified vulnerable SMB service
- Verified vulnerability using Nmap scripts
- Studied exploitation impact


Intelligence gained:

- Vulnerability identification
- Patch importance
- SMB security monitoring


---

# 7. Credential Threat Intelligence

Tools studied:

## Hydra

Purpose:

- Understand authentication attack patterns


## John the Ripper

Purpose:

- Password hash auditing concepts


Security observations:

- Weak passwords increase risk
- Authentication monitoring is important
- Strong password policies reduce exposure

---

# 8. Malware Traffic Intelligence

## PCAP Investigation

Tools:

- Tcpdump
- Tshark


Activity:

Captured and analysed suspicious network traffic.

Observed:

```
HTTP GET /malware.exe
```

Investigation areas:

- Source IP
- Destination IP
- Protocol
- File transfer behaviour


---

# 9. Network Detection Intelligence

## Suricata IDS

Version:

```
Suricata v8.0.5
```


Custom detections created:

- ICMP reconnaissance
- Nmap SYN scans
- SMB activity
- HTTP data transfer
- Directory enumeration
- IP fragmentation
- DNS tunneling indicators


Logs analysed:

```
fast.log

eve.json

stats.log
```

---

# 10. Endpoint Intelligence

## Sysmon Monitoring

Configured monitoring for:

- Process creation
- Network connections
- File creation
- Registry changes


Purpose:

Improve endpoint visibility during investigations.


---

## PowerShell Intelligence

Enabled:

```
PowerShell Script Block Logging
```

Important Event:

```
Event ID 4104
```

Used for:

- Script investigation
- Suspicious command detection
- Threat hunting

---

# 11. Threat Indicators Observed

## Network Indicators

```
Suspicious HTTP downloads

SMB exposure

Repeated authentication attempts

Unexpected connections
```


## Endpoint Indicators

```
Suspicious processes

PowerShell activity

Registry modifications

Unexpected files
```

---

# 12. MITRE ATT&CK Mapping

## Reconnaissance

```
TA0043 - Reconnaissance
```


## Credential Access

```
TA0006 - Credential Access
```


## Discovery

```
TA0007 - Discovery
```


## Command and Control Analysis

```
TA0011 - Command and Control
```


## Collection

```
TA0009 - Collection
```

---

# 13. Threat Hunting Approach

The investigation methodology:

```
Collect Data

      |

Identify Indicators

      |

Analyze Behaviour

      |

Create Detection Rules

      |

Monitor Activity
```

---

# 14. Defensive Improvements Identified

Recommendations:

- Enable centralized logging
- Monitor authentication events
- Deploy endpoint monitoring
- Maintain IDS rules
- Patch vulnerable services
- Restrict unnecessary network exposure
- Implement strong authentication

---

# 15. Tools Used

| Tool | Purpose |
|---|---|
| Nmap | Network Reconnaissance |
| Recon-ng | OSINT |
| theHarvester | Information Gathering |
| WhatWeb | Technology Detection |
| Gobuster | Directory Discovery |
| Hydra | Authentication Testing |
| John | Password Auditing |
| Suricata | Network Detection |
| Sysmon | Endpoint Monitoring |
| Tcpdump | Packet Capture |
| Tshark | Traffic Analysis |

---

# 16. Skills Developed

✓ Threat Intelligence Collection

✓ Network Reconnaissance

✓ Vulnerability Analysis

✓ Detection Engineering

✓ IDS Rule Creation

✓ Endpoint Monitoring

✓ PCAP Analysis

✓ Threat Hunting

✓ Incident Investigation


---

# Conclusion

The GraySentinel Threat Intelligence Report documents the complete process
of collecting security intelligence, analysing threats, and creating
defensive detections.

The project combined:

- OSINT
- Network analysis
- Vulnerability research
- Endpoint monitoring
- IDS engineering
- Threat hunting

to build practical cybersecurity investigation skills.

---

**GraySentinel Cyber Command Center**

**Collect • Analyze • Detect • Respond**
