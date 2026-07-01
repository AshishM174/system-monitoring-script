# System Monitoring Script

## Description

This shell script monitors:

- Disk Usage
- Memory Usage
- Top CPU Processes
- Top Memory Processes

It generates alerts when resource usage crosses predefined thresholds.

## Thresholds

Disk Usage : 80%

Memory Usage : 80%

## Usage

Give execute permission

```bash
chmod +x system_monitor.sh
```

Run

```bash
./system_monitor.sh
```

## Log File

Alerts are stored in

```
system_monitor.log
```

## Sample Output

```
Disk Usage : 45%

Memory Usage : 63%

Top CPU Processes
...

Top Memory Processes
...
```
