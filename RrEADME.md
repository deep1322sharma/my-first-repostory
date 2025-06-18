
## Best practise for linux
Here’s a well-structured `README.md` file based on your troubleshooting checklist. It includes all 20 steps clearly formatted and explained:

---

````markdown
# Linux Server Security & Performance Troubleshooting Guide

This document outlines essential steps to troubleshoot high CPU usage, check for potential malware, and secure your Linux server.

---

## 🔧 Troubleshooting Steps

### 1. **Monitor CPU Usage**
- Use `htop` to identify processes consuming high CPU.
```bash
htop
````

### 2. **Check `/tmp` for Malware**

* Many malware scripts use `/tmp`. Inspect suspicious files or scripts.

```bash
ls -lah /tmp
```

### 3. **Inspect `/var/log` and `/var/tmp`**

* Malware or malicious scripts may use these directories to hide logs or binaries.

```bash
ls -lah /var/log
ls -lah /var/tmp
```

### 4. **Check Cron Jobs**

* Look for unauthorized or malicious cron jobs.

```bash
crontab -l
ls -lah /etc/cron* /var/spool/cron
```

### 5. **Inspect `.bashrc` and Hidden Files**

* Look for suspicious commands or code in `.bashrc` and hidden files in home directories.

```bash
cat ~/.bashrc
ls -lah ~/
```

### 6. **Check `/dev` Directory**

* Malware often creates fake devices or hides scripts here.

```bash
ls -lah /dev
```

### 7. **Run Antivirus Scan**

* Use tools like Bitdefender, ClamAV (`clamav`), or Securite.

```bash
clamscan -r /
```

### 8. **Update and Upgrade System**

* Keep the server updated to patch vulnerabilities.

```bash
sudo apt update && sudo apt upgrade -y
# or for CentOS/RHEL:
sudo yum update -y
```

### 9. **Change Passwords**

* Update passwords for system users and application administrators.

```bash
passwd <username>
```

### 10. **Kill High-Usage Processes**

* Identify and stop processes consuming high resources.

```bash
kill -9 <PID>
```

### 11. *(Note: Step 11 is missing; continues at 12)*

### 12. **Delete Malware Scripts**

* Remove known or suspected malicious scripts.

```bash
rm -f /path/to/script
```

### 13. **Change Database Passwords**

* Ensure database credentials are secure and changed if exposed.

### 14. **Check/Change Network Adapter**

* Use `ip a` to inspect network adapters (e.g., `ens33`). Replace or reconfigure if compromised.

### 15. **Monitor Listening Ports**

* Look for unauthorized services listening on ports.

```bash
netstat -tuln
# or
ss -tuln
```

### 16. **Check Firewall Status**

* Verify firewall rules and ensure it is active.

```bash
sudo ufw status
# or for firewalld
sudo firewall-cmd --state
```

### 17. **List Users**

* Check all users on the system.

```bash
cut -d: -f1 /etc/passwd
```

### 18. **Review Last Login Sessions**

* Identify unauthorized access attempts.

```bash
last
```

### 19. **Review Installed Packages**

* Audit for unusual or unnecessary software.

```bash
dpkg -l
# or
rpm -qa
```

### 20. **Check Hidden Config & Cache Directories**

* Scan `.cache`, `.config`, `.local`, `.profile`, `.ssh`, and other hidden files/directories.

```bash
ls -lah ~/.cache ~/.config ~/.local ~/.ssh ~/.profile
```

---

## ✅ Best Practices

* Regularly update and audit the server.
* Limit user access and monitor login activity.
* Use strong, unique passwords and rotate them periodically.
* Enable firewall and intrusion detection systems.
* Perform regular antivirus scans.

---

*Created for Linux system administrators and DevOps teams handling compromised or overloaded servers.*

```

---

Let me know if you want a downloadable version or specific formatting for GitHub, GitLab, or internal documentation.
```
Absolutely — here are **additional points** to expand your Linux server security and performance troubleshooting checklist, going beyond the original 20 steps. These will help you **harden the system**, **detect intrusions**, and **optimize stability**.

---

## 🔐 Additional Security and Performance Points

### 21. **Audit File Permissions**

* Find world-writable files and incorrect permissions.

```bash
find / -type f -perm -o+w 2>/dev/null
```

### 22. **Check Running Services**

* Disable unnecessary services to reduce attack surface.

```bash
systemctl list-units --type=service
```

### 23. **Enable SELinux or AppArmor**

* Use Mandatory Access Control (MAC) for extra security.

```bash
# Check SELinux status
sestatus

# AppArmor status (Ubuntu/Debian)
sudo apparmor_status
```

### 24. **Check for SSH Brute Force Attempts**

* Scan logs for repeated failed SSH login attempts.

```bash
grep "Failed password" /var/log/auth.log
```

### 25. **Limit SSH Access**

* Allow specific users or IPs and disable root login.

```bash
# In /etc/ssh/sshd_config
PermitRootLogin no
AllowUsers youruser
```

### 26. **Install Fail2Ban**

* Blocks IPs with repeated login failures.

```bash
sudo apt install fail2ban
sudo systemctl enable fail2ban
```

### 27. **Monitor Disk Usage**

* Prevent server crashes due to full partitions.

```bash
df -h
du -sh /*
```

### 28. **Check Open Files and Limits**

* Too many open files can cause performance issues.

```bash
ulimit -a
lsof | wc -l
```

### 29. **Look for Suspicious Network Connections**

* Check for unknown external connections.

```bash
netstat -plant
# or
ss -pant
```

### 30. **Use Auditd for Monitoring**

* Tracks system calls and file access.

```bash
sudo apt install auditd
auditctl -l
```

### 31. **Check for Rootkits**

* Use tools like `chkrootkit` or `rkhunter`.

```bash
sudo apt install chkrootkit
sudo chkrootkit
```

### 32. **Monitor Resource Usage Over Time**

* Use tools like `glances`, `nmon`, or set up Prometheus + Grafana.

### 33. **Review Bash History**

* Look for unexpected or malicious commands.

```bash
cat ~/.bash_history
```

### 34. **Restrict Sudo Access**

* Limit `sudo` to trusted users only.

```bash
cat /etc/sudoers
```

### 35. **Log File Integrity Checking**

* Use `AIDE` (Advanced Intrusion Detection Environment).

```bash
sudo apt install aide
sudo aideinit
```

### 36. **Enable Automatic Security Updates**

```bash
sudo apt install unattended-upgrades
```

### 37. **Use a Centralized Logging System**

* Forward logs to a secure remote server (e.g., ELK stack, Graylog).

### 38. **Restrict Compilers**

* Prevent attackers from compiling code on the server.

```bash
chmod 000 /usr/bin/gcc /usr/bin/make
```

### 39. **Check SSH Key Auth & .ssh Folder**

* Ensure only authorized keys exist in `~/.ssh/authorized_keys`.

### 40. **Scan for Hidden Processes**

* Use tools like `unhide` or `ps -ef` to check for abnormal processes.

---

Would you like me to update the `README.md` file with these extended points, or generate a full security audit checklist document instead (PDF, Markdown, or Word)?
