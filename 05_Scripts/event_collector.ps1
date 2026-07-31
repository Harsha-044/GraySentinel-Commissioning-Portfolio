<#
===============================================================================
GraySentinel - Windows Event Collector

Author  : Harsha
Version : 1.0

Purpose:
Collect Windows security telemetry for threat hunting and investigation.

Environment:
Windows 11 Lab Endpoint

Collected Sources:
- Security Events
- PowerShell Logs
- Sysmon Logs
- System Events
- Application Events

Related Training:
- Endpoint Logging
- Threat Hunting
- EDR Monitoring
- Incident Investigation

===============================================================================
#>


#==============================================================================
# Configuration
#==============================================================================


$OutputDirectory = "C:\GraySentinel\Event_Reports"

$TimeRange = (Get-Date).AddHours(-24)


# Create output directory

if (!(Test-Path $OutputDirectory)) {

    New-Item -Path $OutputDirectory -ItemType Directory

}


Write-Host "=============================================="
Write-Host " GraySentinel Event Collector"
Write-Host "=============================================="

Write-Host "Collecting events from:"
Write-Host $TimeRange


#==============================================================================
# Security Event Logs
#
# Used during:
# Authentication monitoring
# Brute force investigation
#==============================================================================


Write-Host "[+] Collecting Security Events"


Get-WinEvent `
-FilterHashtable @{
    LogName='Security'
    StartTime=$TimeRange
} `
-ErrorAction SilentlyContinue |
Select-Object TimeCreated,Id,LevelDisplayName,ProviderName,Message |
Out-File "$OutputDirectory\Security_Events.txt"



#==============================================================================
# Failed Login Detection
#
# Event ID:
# 4625 Failed Authentication
#
# Used for:
# RDP/SSH brute force analysis
#==============================================================================


Write-Host "[+] Collecting Failed Logins"


Get-WinEvent `
-FilterHashtable @{
    LogName='Security'
    Id=4625
    StartTime=$TimeRange
} `
-ErrorAction SilentlyContinue |
Select-Object TimeCreated,Id,Message |
Out-File "$OutputDirectory\Failed_Logins.txt"



#==============================================================================
# Successful Login Detection
#
# Event ID:
# 4624
#
# Used for:
# Authentication investigation
#==============================================================================


Write-Host "[+] Collecting Successful Logins"


Get-WinEvent `
-FilterHashtable @{
    LogName='Security'
    Id=4624
    StartTime=$TimeRange
} `
-ErrorAction SilentlyContinue |
Select-Object TimeCreated,Id,Message |
Out-File "$OutputDirectory\Successful_Logins.txt"



#==============================================================================
# PowerShell Script Block Logging
#
# Event ID:
# 4104
#
# Used during:
# PowerShell threat hunting
#==============================================================================


Write-Host "[+] Collecting PowerShell Logs"


Get-WinEvent `
-FilterHashtable @{
    LogName='Microsoft-Windows-PowerShell/Operational'
    Id=4104
    StartTime=$TimeRange
} `
-ErrorAction SilentlyContinue |
Select-Object TimeCreated,Id,Message |
Out-File "$OutputDirectory\PowerShell_4104_Events.txt"



#==============================================================================
# Sysmon Process Monitoring
#
# Event ID:
# 1 Process Creation
#
# Used for:
# Endpoint visibility
# Threat hunting
#==============================================================================


Write-Host "[+] Collecting Sysmon Process Events"


Get-WinEvent `
-FilterHashtable @{
    LogName='Microsoft-Windows-Sysmon/Operational'
    Id=1
    StartTime=$TimeRange
} `
-ErrorAction SilentlyContinue |
Select-Object TimeCreated,Id,Message |
Out-File "$OutputDirectory\Sysmon_Process_Creation.txt"



#==============================================================================
# Sysmon Network Monitoring
#
# Event ID:
# 3 Network Connection
#==============================================================================


Write-Host "[+] Collecting Sysmon Network Events"


Get-WinEvent `
-FilterHashtable @{
    LogName='Microsoft-Windows-Sysmon/Operational'
    Id=3
    StartTime=$TimeRange
} `
-ErrorAction SilentlyContinue |
Select-Object TimeCreated,Id,Message |
Out-File "$OutputDirectory\Sysmon_Network_Connections.txt"



#==============================================================================
# Sysmon Registry Monitoring
#
# Event ID:
# 12,13,14
#
# Used for:
# Persistence investigation
#==============================================================================


Write-Host "[+] Collecting Registry Events"


Get-WinEvent `
-FilterHashtable @{
    LogName='Microsoft-Windows-Sysmon/Operational'
    Id=12,13,14
    StartTime=$TimeRange
} `
-ErrorAction SilentlyContinue |
Select-Object TimeCreated,Id,Message |
Out-File "$OutputDirectory\Sysmon_Registry_Events.txt"



#==============================================================================
# Running Processes
#
# Supporting investigation data
#==============================================================================


Write-Host "[+] Collecting Running Processes"


Get-Process |
Select-Object ProcessName,Id,CPU |
Out-File "$OutputDirectory\Running_Processes.txt"



#==============================================================================
# Network Connections
#
# Supporting endpoint investigation
#==============================================================================


Write-Host "[+] Collecting Network Connections"


Get-NetTCPConnection |
Select-Object LocalAddress,
LocalPort,
RemoteAddress,
RemotePort,
State |
Out-File "$OutputDirectory\Network_Connections.txt"



#==============================================================================
# Event Summary
#==============================================================================


Write-Host ""
Write-Host "=============================================="
Write-Host " Collection Completed"
Write-Host "=============================================="


Write-Host ""
Write-Host "Reports saved:"
Write-Host $OutputDirectory


