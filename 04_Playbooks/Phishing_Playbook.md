# Phishing Detection & Investigation Playbook

## GraySentinel Cyber Command Center

**Author:** Harsha  
**Playbook Version:** 1.0  
**Classification:** Defensive Security Training  
**Environment:** GraySentinel Cyber Range

---

# 1. Overview

This playbook documents the phishing investigation and detection workflow
developed during the GraySentinel Cyber Range.

The objective was to understand:

- How phishing campaigns are investigated
- How reconnaissance data can support threat analysis
- How credential theft attempts are detected
- How endpoint and network logs help identify malicious activity
- How security teams respond to phishing incidents

---

# 2. Scope

This playbook focuses on defensive activities:

- Phishing identification
- Email threat analysis
- Credential theft investigation
- User activity monitoring
- Endpoint investigation
- Threat hunting

No real-world phishing campaigns were performed.

All activities were conducted inside an isolated cybersecurity lab.

---

# 3. Related GraySentinel Activities

During training, the following concepts were practiced:

## Reconnaissance

Tools studied:

- theHarvester
- Recon-ng
- WHOIS
- DNS enumeration

Purpose:

- Understand attacker information gathering
- Identify publicly available information
- Support threat intelligence analysis


---

## Credential Security Analysis

Tools studied:

- Hydra
- John the Ripper

Purpose:

- Understand credential attack methods
- Analyze password security
- Improve defensive controls

---

# 4. Phishing Attack Lifecycle Understanding

A phishing incident generally follows:

```
Reconnaissance
        |
        v
Target Identification
        |
        v
Social Engineering Attempt
        |
        v
User Interaction
        |
        v
Credential Theft / Malware Delivery
        |
        v
Detection & Response
```

---

# 5. Phishing Investigation Workflow

## Step 1 - Initial Alert

Sources:

- User report
- Email security alert
- SIEM alert
- Endpoint detection alert

Collect:

- Sender information
- Email subject
- Timestamp
- Attachments
- URLs

---

# 6. Email Analysis

Investigate:

## Sender Information

Check:

- Sender address
- Domain reputation
- Domain age
- Suspicious spelling


## Email Headers

Review:

- Received headers
- Sending server
- Authentication results

Look for:

- SPF failures
- DKIM failures
- DMARC failures

---

# 7. URL Investigation

Suspicious links should be analyzed for:

- Unknown domains
- Redirect behavior
- Suspicious file downloads
- Credential collection pages


Related security concepts:

- OSINT investigation
- Domain analysis
- Threat intelligence

---

# 8. Attachment Investigation

Suspicious attachments should be checked for:

- File type
- File hash
- Unexpected executables
- Script files
- Macro-enabled documents


Potential indicators:

```
.exe
.js
.vbs
.ps1
.docm
```

---

# 9. Endpoint Investigation

During GraySentinel training, endpoint visibility was improved using:

## Sysmon

Monitored:

- Process creation
- Network connections
- File creation
- Registry modifications


## PowerShell Logging

Monitored:

- Script execution
- Suspicious commands
- Encoded PowerShell activity


Important event:

```
Event ID 4104
PowerShell Script Block Logging
```

---

# 10. Network Investigation

Network monitoring performed using:

## Suricata IDS

Detection areas:

- Suspicious HTTP traffic
- Data transfers
- Malicious communication patterns


## Packet Analysis

Tools:

- Tcpdump
- Tshark

Used for:

- Capturing traffic
- Reviewing suspicious connections
- Investigating indicators

---

# 11. Indicators of Phishing Activity

## Email Indicators

- Urgent requests
- Unknown sender
- Suspicious attachments
- Fake login pages


## Network Indicators

- Unknown domains
- Suspicious downloads
- Unusual connections


## Endpoint Indicators

- Unexpected processes
- PowerShell execution
- New files
- Registry modifications

---

# 12. Threat Hunting Approach

Hunting activities:

## Process Hunting

Look for:

- Suspicious child processes
- Office applications spawning scripts
- Unknown executables


## Network Hunting

Look for:

- New outbound connections
- Suspicious DNS queries
- Unknown destinations


## File Hunting

Look for:

- Recently created files
- Temporary directory activity
- Downloaded executables

---

# 13. Response Procedure

## Step 1 - Identify

Collect:

- Email details
- URLs
- Attachments
- User reports


## Step 2 - Analyze

Review:

- Network logs
- Endpoint logs
- Security events


## Step 3 - Contain

Actions:

- Block malicious domains
- Remove suspicious emails
- Isolate affected endpoint


## Step 4 - Recover

Actions:

- Reset compromised credentials
- Review persistence mechanisms
- Monitor affected systems

---

# 14. Defensive Controls

Recommended controls:

- Email filtering
- Multi-factor authentication
- User awareness training
- Endpoint detection
- Logging and monitoring
- Regular security assessments

---

# 15. Tools Used During Training

| Tool | Purpose |
|------|---------|
| theHarvester | OSINT Reconnaissance |
| Recon-ng | Information Gathering |
| Hydra | Credential Testing Concepts |
| John the Ripper | Password Analysis |
| Suricata | Network Detection |
| Sysmon | Endpoint Monitoring |
| Tcpdump | Packet Capture |
| Tshark | Traffic Analysis |

---

# 16. Lessons Learned

This exercise demonstrated:

- Reconnaissance helps understand attacker preparation
- Credential attacks require strong authentication controls
- Endpoint logging improves investigation capability
- Network monitoring provides additional visibility
- Threat hunting connects multiple security events

---

# Conclusion

The GraySentinel Phishing Investigation Playbook documents the defensive
process for identifying, analyzing, and responding to phishing-related
security events.

The focus was on:

- Detection
- Investigation
- Monitoring
- Threat hunting
- Incident response

inside a controlled cybersecurity training environment.

---

**GraySentinel Cyber Command Center**

**Detect • Investigate • Respond**
