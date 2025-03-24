# Linux Security Audit

This is a Bash script for auditing Linux system security. It checks for security vulnerabilities, misconfigurations, and outdated packages.

## Features
- Scans open ports
- Detects weak file permissions
- Checks for SUID/SGID binaries
- Reports failed SSH login attempts
- Lists outdated packages

## Installation
```bash
git clone https://github.com/skwidstone/linux-security-audit.git
cd linux-security-audit
chmod +x linux_audit.sh
