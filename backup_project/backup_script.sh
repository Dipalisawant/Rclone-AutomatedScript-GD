#!/bin/bash
set -euo pipefail

# ==========================
# CONFIGURATION
# ==========================
PROJECT_DIR="$HOME/my-github-project"
PROJECT_NAME="MyProject"
BACKUP_ROOT="$HOME/backups/$PROJECT_NAME"
LOG_FILE="$BACKUP_ROOT/backup.log"

GDRIVE_REMOTE="gdrive:ProjectBackups"
WEBHOOK_URL="https://github.com/Dipalisawant/my-github-project/settings/hooks"

DAILY_RETENTION=7
WEEKLY_RETENTION=4
MONTHLY_RETENTION=3

NOTIFY=true
[[ "${1:-}" == "--no-notify" ]] && NOTIFY=false

DATE=$(date +%Y%m%d_%H%M%S)
YEAR=$(date +%Y)
MONTH=$(date +%m)
DAY=$(date +%d)
DOW=$(date +%u)   # 7 = Sunday

# ==========================
# DIRECTORIES
# ==========================
DAILY_DIR="$BACKUP_ROOT/daily/$YEAR/$MONTH/$DAY"
WEEKLY_DIR="$BACKUP_ROOT/weekly/$YEAR/$MONTH/$DAY"
MONTHLY_DIR="$BACKUP_ROOT/monthly/$YEAR/$MONTH/$DAY"

mkdir -p "$DAILY_DIR" "$WEEKLY_DIR" "$MONTHLY_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

ARCHIVE_NAME="${PROJECT_NAME}_${DATE}.zip"
ARCHIVE_PATH="$DAILY_DIR/$ARCHIVE_NAME"

log() {
  echo "$(date '+%F %T') - $1" | tee -a "$LOG_FILE"
}

log "Backup started"

# ==========================
# CREATE ZIP BACKUP
# ==========================
zip -r "$ARCHIVE_PATH" "$PROJECT_DIR" >/dev/null
log "Backup created: $ARCHIVE_NAME"

# ==========================
# WEEKLY / MONTHLY COPIES
# ==========================
# Weekly backup on Sunday
if [[ "$DOW" == "7" ]]; then
  cp "$ARCHIVE_PATH" "$WEEKLY_DIR/"
  log "Weekly backup saved"
fi

# Monthly backup on 1st
if [[ "$DAY" == "01" ]]; then
  cp "$ARCHIVE_PATH" "$MONTHLY_DIR/"
  log "Monthly backup saved"
fi

# ==========================
# UPLOAD TO GOOGLE DRIVE
# ==========================
rclone copy "$ARCHIVE_PATH" "$GDRIVE_REMOTE/daily/$YEAR/$MONTH/$DAY"
log "Uploaded daily backup to Google Drive"

if [[ "$DOW" == "7" ]]; then
  rclone copy "$WEEKLY_DIR/$ARCHIVE_NAME" "$GDRIVE_REMOTE/weekly/$YEAR/$MONTH/$DAY"
  log "Uploaded weekly backup to Google Drive"
fi

if [[ "$DAY" == "01" ]]; then
  rclone copy "$MONTHLY_DIR/$ARCHIVE_NAME" "$GDRIVE_REMOTE/monthly/$YEAR/$MONTH/$DAY"
  log "Uploaded monthly backup to Google Drive"
fi

# ==========================
# ROTATION POLICY
# ==========================
log "Applying retention policy"

find "$BACKUP_ROOT/daily" -type f -name "*.zip" -mtime +$DAILY_RETENTION -delete
find "$BACKUP_ROOT/weekly" -type f -name "*.zip" -mtime +$((7*WEEKLY_RETENTION)) -delete
find "$BACKUP_ROOT/monthly" -type f -name "*.zip" -mtime +$((30*MONTHLY_RETENTION)) -delete

log "Old backups cleaned"

# ==========================
# WEBHOOK NOTIFICATION
# ==========================
if $NOTIFY; then
  curl -s -X POST -H "Content-Type: application/json" \
    -d "{\"project\":\"$PROJECT_NAME\",\"date\":\"$DATE\",\"status\":\"BackupSuccessful\"}" \
    "$WEBHOOK_URL"
  log "Webhook notification sent"
else
  log "Notification skipped (--no-notify)"
fi

log "Backup completed successfully"

