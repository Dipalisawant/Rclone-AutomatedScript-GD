#!/bin/bash

# ---------------- CONFIGURATION ----------------

PROJECT_NAME="MyProject"
SOURCE_DIR="$HOME/my-github-project"
BASE_BACKUP_DIR="$HOME/backups"
GDRIVE_REMOTE="gdrive:Backups/$PROJECT_NAME"
LOG_FILE="$HOME/backup.log"

# Retention Settings
DAILY_RETENTION=7
WEEKLY_RETENTION=28
MONTHLY_RETENTION=90

WEBHOOK_URL="https://webhook.site/#!/view/dacad6fd-9a51-4c00-a903-552ddafee673"s
