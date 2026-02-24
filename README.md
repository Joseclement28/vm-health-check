# VM Health Check Script

## Overview
A comprehensive script designed to monitor the health status of virtual machines (VMs). This script performs various checks and provides insights into the operational state of the VMs.

## Features
- **Resource Utilization Checks**: Monitors CPU, Memory, and Disk usage.
- **Network Status Checks**: Verifies network connectivity and performance.
- **Service Status Checks**: Ensures critical services are running as expected.
- **Alerts and Notifications**: Sends alerts for any anomalies detected.

## Requirements
- Python 3.x
- Required libraries: psutil, requests

## Usage
To run the script, use the following command:
```bash
python vm_health_check.py
```

## Example Output
```
VM: VM_NAME
CPU Usage: XX%
Memory Usage: YY%
Disk Usage: ZZ%
Network Status: OK

Services:
- Service1: Running
- Service2: Stopped
```

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/Joseclement28/vm-health-check.git
   ```
2. Navigate into the project directory:
   ```bash
   cd vm-health-check
   ```
3. Install the required libraries:
   ```bash
   pip install -r requirements.txt
   ```

## Contributing
Contributions are welcome! Please submit a pull request for any enhancements or bug fixes.

## License
This project is licensed under the MIT License.