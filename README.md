📦 Automated Backup & Rotation Script with Google Drive Integration 🔍 Project Overview

This project implements a fully automated backup solution for a GitHub-hosted project directory using Bash scripting and rclone (Google Drive CLI).

The solution:

Creates timestamped ZIP backups

Stores them in a structured local directory

Uploads backups to Google Drive

Applies daily / weekly / monthly retention policy

Sends webhook notifications on success

Logs all operations for auditing and troubleshooting

This project demonstrates Linux, Bash scripting, automation, cloud integration, and DevOps best practices.

🧰 Technologies Used

Linux (Ubuntu)

Bash Shell Scripting

rclone (Google Drive integration)

zip

cron

curl (Webhook notification)

Git & GitHub

📁 Directory Structure Local Backup Structure ~/backups/ └── MyProject/ └── YYYY/ └── MM/ └── DD/ └── MyProject_YYYYMMDD_HHMMSS.zip

Project Structure backup_project/ ├── backup_script.sh ├── config.json (optional) └── README.md

⚙️ Prerequisites 1️⃣ Install Required Packages sudo apt update sudo apt install -y zip curl

2️⃣ Install rclone curl https://rclone.org/install.sh | sudo bash

Verify:

rclone version

🔐 Google Drive Configuration (rclone) Configure rclone rclone config

Steps:

n → New remote

Name: gdrive

Storage: drive

Client ID / Secret: press Enter

Scope: 1 (Full access)

Auto config: n (for Ubuntu server)

Follow browser authorization

Paste config_token

Save configuration

Verify:

rclone listremotes

Expected output:

gdrive:

📝 Backup Script (backup_script.sh) Key Features

Timestamped ZIP backup

Local structured storage

Google Drive upload

Rotation policy

Webhook notification

Logging

Make Script Executable chmod +x backup_script.sh

Run Manually ./backup_script.sh

Run Without Notification ./backup_script.sh --no-notify

🔁 Retention Policy Type Retention Daily Last 7 backups Weekly Last 4 Sundays Monthly Last 3 months

Automatic deletion is based on mtime.

📜 Logging

Log file:

~/backups/MyProject/backup.log

Log contains:

Backup start & end time

ZIP creation

Google Drive upload status

Rotation summary

Notification status

🌐 Webhook Notification

Triggered on successful backup:

{ "project": "MyProject", "date": "YYYYMMDD_HHMMSS", "status": "BackupSuccessful" }

Uses:

curl -X POST -H "Content-Type: application/json"

⏰ Automation Using Cron Edit Crontab crontab -e

Daily Backup at 2 AM 0 2 * * * /home/ubuntu/backup_project/backup_script.sh >> /home/ubuntu/cron.log 2>&1

🔐 Security Considerations

✔ rclone tokens must never be committed to GitHub ✔ .config/rclone/ should be in .gitignore ✔ Secrets handled outside version control ✔ GitHub Push Protection enforced

🧪 Sample Verification Commands ls ~/backups/MyProject/2026/01/19/ rclone ls gdrive:ProjectBackups/MyProject/2026/01/19/ cat ~/backups/MyProject/backup.log

🎯 Real-World Use Cases

DevOps project backups

EC2 / VM scheduled backups

GitHub repo safety

👩‍💻 Author

Dipali Sawant DevOps Engineer | AWS | Linux | Automation GitHub: https://github.com/Dipalisawant
✅ Project Status: Completed & Production-Ready
