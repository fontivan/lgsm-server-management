#!/usr/bin/env bash

set -eoux pipefail

WORKING_DIR="{{ user_home_folder }}"
BACKUP_LOG_DIR="{{ backup_log_directory }}"
SCRIPT_PATH="{{ user_home_folder }}/{{ installation_user }}"
DATE_SUFFIX=$(date +%Y-%m-%d_%H-%M-%S_%Z)

cd "${WORKING_DIR}"
mkdir -p "${BACKUP_LOG_DIR}"
eval "${SCRIPT_PATH} backup > ${BACKUP_LOG_DIR}/cron-backup-${DATE_SUFFIX}.log 2>&1"
