<#
===============================================================================
 GraySentinel - Sysmon Event Collector

 Author  : Harsha
 Version : 1.0

 Purpose:
 Collect Sysmon telemetry for endpoint monitoring and threat hunting.

 Environment:
 Windows 11 Lab VM

 Related GraySentinel Tasks:
 - Custom Sysmon Configuration
 - Endpoint Logging
 - Threat Hunting
 - Incident Investigation
===============================================================================
#>

#------------------------------------------------------------------------------
# Configuration
#------------------------------------------------------------------------------

$OutputFolder = "C:\GraySentinel\Sysmon_Reports"

if (!(Test-Path $OutputFolder)) {
    New-Item -ItemType Directory -Path $OutputFolder | Out-Null
}

$StartTime = (Get-Date).AddHours(-24)

Write-Host ""
Write-Host "==========================================="
Write-Host " GraySentinel Sysmon Event Collector"
Write-Host "==========================================="
Write-Host ""

#------------------------------------------------------------------------------
# Function
#------------------------------------------------------------------------------

function Export-SysmonEvents {

    param(

        [int[]]$EventIDs,

        [string]$OutputFile,

        [string]$Description

    )

    Write-Host "[+] $Description"

    Get-WinEvent `
        -FilterHashtable @{
            LogName='Microsoft-Windows-Sysmon/Operational'
            Id=$EventIDs
            StartTime=$StartTime
        } `
        -ErrorAction SilentlyContinue |
        Select-Object TimeCreated,
                      Id,
                      ProviderName,
                      LevelDisplayName,
                      Message |
        Out-File "$OutputFolder\$OutputFile"

}

#------------------------------------------------------------------------------
# Event ID 1
# Process Creation
#------------------------------------------------------------------------------

Export-SysmonEvents `
-EventIDs 1 `
-OutputFile "Process_Creation.txt" `
-Description "Collecting Process Creation Events"

#------------------------------------------------------------------------------
# Event ID 3
# Network Connections
#------------------------------------------------------------------------------

Export-SysmonEvents `
-EventIDs 3 `
-OutputFile "Network_Connections.txt" `
-Description "Collecting Network Connection Events"

#------------------------------------------------------------------------------
# Event ID 11
# File Creation
#------------------------------------------------------------------------------

Export-SysmonEvents `
-EventIDs 11 `
-OutputFile "File_Creation.txt" `
-Description "Collecting File Creation Events"

#------------------------------------------------------------------------------
# Event IDs 12,13,14
# Registry Activity
#------------------------------------------------------------------------------

Export-SysmonEvents `
-EventIDs 12,13,14 `
-OutputFile "Registry_Events.txt" `
-Description "Collecting Registry Events"

#------------------------------------------------------------------------------
# DNS Queries
# Event ID 22
#------------------------------------------------------------------------------

Export-SysmonEvents `
-EventIDs 22 `
-OutputFile "DNS_Queries.txt" `
-Description "Collecting DNS Query Events"

#------------------------------------------------------------------------------
# Image Loads
# Event ID 7
#------------------------------------------------------------------------------

Export-SysmonEvents `
-EventIDs 7 `
-OutputFile "Image_Loads.txt" `
-Description "Collecting Image Load Events"

#------------------------------------------------------------------------------
# Driver Loads
# Event ID 6
#------------------------------------------------------------------------------

Export-SysmonEvents `
-EventIDs 6 `
-OutputFile "Driver_Loads.txt" `
-Description "Collecting Driver Load Events"

#------------------------------------------------------------------------------
# Running Processes
#------------------------------------------------------------------------------

Write-Host "[+] Collecting Running Processes"

Get-Process |
Sort-Object ProcessName |
Select-Object ProcessName,
              Id,
              CPU,
              StartTime `
-ErrorAction SilentlyContinue |
Out-File "$OutputFolder\Running_Processes.txt"

#------------------------------------------------------------------------------
# Active Network Connections
#------------------------------------------------------------------------------

Write-Host "[+] Collecting Active TCP Connections"

Get-NetTCPConnection |
Select-Object LocalAddress,
              LocalPort,
              RemoteAddress,
              RemotePort,
              State |
Out-File "$OutputFolder\Active_TCP_Connections.txt"

#------------------------------------------------------------------------------
# Sysmon Service Status
#------------------------------------------------------------------------------

Write-Host "[+] Collecting Sysmon Service Status"

Get-Service Sysmon* |
Format-Table Name,
             Status,
             StartType -AutoSize |
Out-File "$OutputFolder\Sysmon_Service_Status.txt"

#------------------------------------------------------------------------------
# Summary Report
#------------------------------------------------------------------------------

$Summary = @"

====================================================
GraySentinel Sysmon Collection Summary
====================================================

Collection Time:
$(Get-Date)

Collected:

- Process Creation (ID 1)
- Network Connections (ID 3)
- Driver Loads (ID 6)
- Image Loads (ID 7)
- File Creation (ID 11)
- Registry Events (ID 12/13/14)
- DNS Queries (ID 22)

Additional Information:

- Running Processes
- Active TCP Connections
- Sysmon Service Status

Purpose:

Endpoint Monitoring
Threat Hunting
Incident Investigation
Detection Engineering

====================================================

"@

$Summary | Out-File "$OutputFolder\Collection_Summary.txt"

Write-Host ""
Write-Host "==========================================="
Write-Host " Collection Completed Successfully"
Write-Host "==========================================="
Write-Host ""
Write-Host "Reports saved to:"
Write-Host "$OutputFolder"
Write-Host ""
