# RDP Brute Force Detection & Response Playbook

## GraySentinel Cyber Command Center

**Author:** Harsha  
**Playbook Version:** 1.0  
**Classification:** Defensive Security Training  
**Environment:** GraySentinel Cyber Range

---

# 1. Overview

This playbook documents the investigation workflow used during the
GraySentinel Cyber Range to understand and detect Remote Desktop Protocol
(RDP) brute-force activity.

The objective was to understand:

- RDP service discovery
- Credential attack patterns
- Authentication failures
- Windows security monitoring
- Detection and response procedures

All activities were performed inside an isolated lab environment.

---

# 2. Lab Environment

| Component | Role |
|-----------|------|
| Kali Linux | Security Testing Machine |
| Windows VM | Target Endpoint |
| Nmap | Service Discovery |
| Hydra | Credential Testing |
| Sysmon | Endpoint Monitoring |
| Windows Event Viewer | Log Analysis |
| Suricata | Network Detection |

Network:

```
192.168.56.0/24
```

Target:

```
Windows VM
```

RDP Service:

```
TCP/3389
```

---

# 3. Attack Lifecycle Understanding

RDP brute-force activity generally follows:

```
Reconnaissance
        |
        v
Service Discovery
        |
        v
Credential Attempts
        |
        v
Successful Authentication
        |
        v
Post Login Activity
        |
        v
Detection & Response
```

---

# 4. Phase 1 - RDP Service Discovery

Before testing authentication, the RDP service was identified.

Nmap scanning was used:

```bash
nmap -sV 192.168.56.105
```

Observed service:

```
3389/tcp open ms-wbt-server
```

This confirmed that Remote Desktop was enabled on the target.

---

# 5. Phase 2 - Credential Testing Simulation

Hydra was studied for credential attack simulations.

Tool:

```
Hydra
```

Purpose:

- Understand password attack behaviour
- Observe authentication patterns
- Study defensive detection methods


The exercise demonstrated how repeated authentication attempts can indicate
possible brute-force activity.

---

# 6. Detection Sources

## Windows Security Logs

Important events:

### Event ID 4625

Failed logon attempt

Used for detecting:

- Multiple failed RDP logins
- Invalid credentials
- Password guessing activity


### Event ID 4624

Successful logon

Used for:

- Identifying successful authentication
- Investigating account compromise


---

# 7. Endpoint Monitoring

## Sysmon Monitoring

Sysmon was configured to provide visibility into:

- Process creation
- Network connections
- Suspicious activity


Important investigation areas:

- New processes after RDP login
- Remote execution behaviour
- Suspicious command execution


---

# 8. Network Detection

Suricata monitoring was used to observe:

- RDP connection attempts
- Suspicious authentication patterns
- Repeated connection attempts


Detection indicators:

```
Multiple connections
        |
        |
        v
Same source IP
        |
        |
        v
Repeated authentication attempts
```

---

# 9. Investigation Workflow

## Step 1 - Identify Source

Collect:

- Source IP address
- Username targeted
- Time of attempts
- Number of failures


---

## Step 2 - Analyze Authentication Logs

Review:

- Windows Security Logs
- Failed login events
- Successful login events


Look for:

- High number of failures
- Login attempts outside normal hours
- Unknown source systems


---

## Step 3 - Endpoint Investigation

Check:

- Running processes
- User activity
- New files
- Network connections


Tools:

- Sysmon
- Event Viewer
- PowerShell logs


---

# 10. Indicators of RDP Brute Force

## Network Indicators

- Multiple TCP connections to port 3389
- Repeated authentication attempts
- Same source targeting multiple accounts


## Host Indicators

- Large number of failed logons
- Unexpected successful login
- New processes after login


---

# 11. Threat Hunting Approach

## Authentication Hunting

Search for:

- Multiple Event ID 4625
- Same source IP
- Same username attempts


---

## Process Hunting

Investigate:

- Suspicious command execution
- Remote administration tools
- Unknown binaries


---

## Network Hunting

Look for:

- Unusual RDP connections
- Unknown external systems
- Abnormal login times


---

# 12. Response Actions

## Immediate Actions

- Confirm whether activity is malicious
- Identify affected accounts
- Block suspicious source


---

## Containment

Actions:

- Disable compromised accounts
- Restrict RDP access
- Apply firewall rules


---

## Recovery

Actions:

- Reset credentials
- Review user activity
- Continue monitoring


---

# 13. Mitigation

Recommended controls:

- Enable Multi-Factor Authentication
- Use strong passwords
- Limit RDP exposure
- Restrict RDP access by firewall
- Monitor authentication logs
- Disable unused accounts
- Apply account lockout policies


---

# 14. Tools Used

| Tool | Purpose |
|------|---------|
| Nmap | RDP Service Discovery |
| Hydra | Credential Testing Simulation |
| Sysmon | Endpoint Monitoring |
| Windows Event Viewer | Authentication Analysis |
| Suricata | Network Monitoring |
| Tcpdump | Traffic Analysis |


---

# 15. Lessons Learned

This exercise demonstrated:

- RDP exposure can create security risks
- Authentication logs are valuable investigation sources
- Network and endpoint monitoring must work together
- Brute-force activity can be detected through patterns
- Strong authentication controls reduce risk


---

# Conclusion

The GraySentinel RDP Brute Force Playbook documents the process of
identifying, monitoring, and responding to suspicious RDP authentication
activity.

The exercise combined:

- Service discovery
- Credential security concepts
- Endpoint monitoring
- Network detection
- Threat hunting

to develop defensive security skills.

---

**GraySentinel Cyber Command Center**

**Detect • Investigate • Respond**
