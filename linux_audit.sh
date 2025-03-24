#!/bin/bash

# Linux Security Audit Script
# Author: Your Name
# GitHub: https://github.com/skwidstone/rnlinux-security-audit

LOG_FILE="audit_report.txt"

echo "Starting Linux Security Audit..." | tee $LOG_FILE
echo "---------------------------------" | tee -a $LOG_FILE

# 1. Check for open ports
echo "[*] Checking open ports..." | tee -a $LOG_FILE
netstat -tulnp | tee -a $LOG_FILE

# 2. Check for world-writable files
echo "[*] Checking for world-writable files..." | tee -a $LOG_FILE
find / -type f -perm -o+w 2>/dev/null | tee -a $LOG_FILE

# 3. Check for SUID/SGID binaries
echo "[*] Checking for SUID/SGID binaries..." | tee -a $LOG_FILE
find / -type f \( -perm -4000 -o -perm -2000 \) 2>/dev/null | tee -a $LOG_FILE

# 4. Check for users with UID 0 (root privileges)
echo "[*] Checking for users with UID 0..." | tee -a $LOG_FILE
awk -F: '($3 == 0) {print $1}' /etc/passwd | tee -a $LOG_FILE

# 5. Check for failed SSH login attempts
echo "[*] Checking for failed SSH login attempts..." | tee -a $LOG_FILE
grep "Failed password" /var/log/auth.log | tail -10 | tee -a $LOG_FILE

# 6. Check for outdated packages
echo "[*] Checking for outdated packages..." | tee -a $LOG_FILE
apt list --upgradable 2>/dev/null | tee -a $LOG_FILE

echo "Audit completed. Check the report: $LOG_FILE"
