#!/bin/bash

# Pull Database
#
# Pull staging database down from a remote and restore it to local
#
# @author    nystudio107
# @copyright Copyright (c) 2017 nystudio107
# @link      https://nystudio107.com/
# @package   craft-scripts
# @since     1.2.2
# @license   MIT

# Get the directory of the currently executing script
DIR="$(dirname "${BASH_SOURCE[0]}")"

# Include files
INCLUDE_FILES=(
            "common/defaults.sh"
            ".env.sh"
            "common/common_env.sh"
            "common/common_db.sh"
            )
for INCLUDE_FILE in "${INCLUDE_FILES[@]}"
do
    if [[ ! -f "${DIR}/${INCLUDE_FILE}" ]] ; then
        echo "File ${DIR}/${INCLUDE_FILE} is missing, aborting."
        exit 1
    fi
    source "${DIR}/${INCLUDE_FILE}"
done

# Temporary db dump path (staging & local)
TMP_DB_PATH="/tmp/${STAGING_DB_NAME}-db-dump-$(date '+%Y%m%d').sql"
BACKUP_DB_PATH="/tmp/${LOCAL_DB_NAME}-db-backup-$(date '+%Y%m%d').sql"

# Functions
function copy_db_dump_locally() {
    # If the database dump was done remotely, copy it down locally
    scp -P $STAGING_SSH_PORT -- $STAGING_SSH_LOGIN:"${TMP_DB_PATH}.gz" "${TMP_DB_PATH}.gz"
}
function pull_mysql_direct() {
    # Connect to the database server directly
    $STAGING_MYSQLDUMP_CMD $STAGING_DB_CREDS $MYSQLDUMP_SCHEMA_ARGS > "${TMP_DB_PATH}"
    $STAGING_MYSQLDUMP_CMD $STAGING_DB_CREDS $STAGING_IGNORED_DB_TABLES_STRING $MYSQLDUMP_DATA_ARGS >> "${TMP_DB_PATH}"
    gzip -f "${TMP_DB_PATH}"
}
function pull_mysql_ssh() {
    # The database server requires ssh'ing in to connect to it
    ssh $STAGING_SSH_LOGIN -p $STAGING_SSH_PORT "$STAGING_MYSQLDUMP_CMD $STAGING_DB_CREDS $MYSQLDUMP_SCHEMA_ARGS > '$TMP_DB_PATH' ; $STAGING_MYSQLDUMP_CMD $STAGING_DB_CREDS $STAGING_IGNORED_DB_TABLES_STRING $MYSQLDUMP_DATA_ARGS >> '$TMP_DB_PATH' ; gzip -f '$TMP_DB_PATH'"
    copy_db_dump_locally
}
function pull_pgsql_direct() {
    # Connect to the database server directly
    echo ${STAGING_DB_HOST}:${STAGING_DB_PORT}:${STAGING_DB_NAME}:${STAGING_DB_USER}:${STAGING_DB_PASSWORD} > "${TMP_DB_DUMP_CREDS_PATH}"
    chmod 600 "${TMP_DB_DUMP_CREDS_PATH}"
    PGPASSFILE="${TMP_DB_DUMP_CREDS_PATH}" $STAGING_PG_DUMP_CMD $STAGING_DB_CREDS $STAGING_IGNORED_DB_TABLES_STRING $PG_DUMP_ARGS --schema="${STAGING_DB_SCHEMA}" --file="${TMP_DB_PATH}"
    rm "${TMP_DB_DUMP_CREDS_PATH}"
    gzip -f "${TMP_DB_PATH}"
}
function pull_pgsql_ssh() {
    # The database server requires ssh'ing in to connect to it
    ssh $STAGING_SSH_LOGIN -p $STAGING_SSH_PORT "echo ${STAGING_DB_HOST}:${STAGING_DB_PORT}:${STAGING_DB_NAME}:${STAGING_DB_USER}:${STAGING_DB_PASSWORD} > '$TMP_DB_DUMP_CREDS_PATH' ; chmod 600 '$TMP_DB_DUMP_CREDS_PATH' ; PGPASSFILE='$TMP_DB_DUMP_CREDS_PATH' $STAGING_PG_DUMP_CMD $STAGING_DB_CREDS $STAGING_IGNORED_DB_TABLES_STRING $PG_DUMP_ARGS --schema='$STAGING_DB_SCHEMA' --file='$TMP_DB_PATH' ; rm '$TMP_DB_DUMP_CREDS_PATH' ; gzip -f '$TMP_DB_PATH'"
    copy_db_dump_locally
}
function backup_local_mysql() {
    $LOCAL_MYSQLDUMP_CMD $LOCAL_DB_CREDS $MYSQLDUMP_SCHEMA_ARGS > "$BACKUP_DB_PATH"
    $LOCAL_MYSQLDUMP_CMD $LOCAL_DB_CREDS $LOCAL_IGNORED_DB_TABLES_STRING $MYSQLDUMP_DATA_ARGS >> "$BACKUP_DB_PATH"
    gzip -f "$BACKUP_DB_PATH"
    echo "*** Backed up local database to ${BACKUP_DB_PATH}.gz"
}
function backup_local_pgsql() {
    echo ${LOCAL_DB_HOST}:${LOCAL_DB_PORT}:${LOCAL_DB_NAME}:${LOCAL_DB_USER}:${LOCAL_DB_PASSWORD} > "${TMP_DB_DUMP_CREDS_PATH}"
    chmod 600 "${TMP_DB_DUMP_CREDS_PATH}"
    PGPASSFILE="${TMP_DB_DUMP_CREDS_PATH}" $LOCAL_PG_DUMP_CMD $LOCAL_DB_CREDS $LOCAL_IGNORED_DB_TABLES_STRING $PG_DUMP_ARGS --schema="${LOCAL_DB_SCHEMA}" --file="${BACKUP_DB_PATH}"
    rm "${TMP_DB_DUMP_CREDS_PATH}"
    gzip -f "$BACKUP_DB_PATH"
    echo "*** Backed up local database to ${BACKUP_DB_PATH}.gz"
}
function restore_local_from_staging_mysql() {
    ${DB_ZCAT_CMD} "${TMP_DB_PATH}.gz" | $LOCAL_MYSQL_CMD $LOCAL_DB_CREDS
    echo "*** Restored local database from ${TMP_DB_PATH}.gz"
}
function restore_local_from_staging_pgsql() {
    echo ${LOCAL_DB_HOST}:${LOCAL_DB_PORT}:${LOCAL_DB_NAME}:${LOCAL_DB_USER}:${LOCAL_DB_PASSWORD} > "${TMP_DB_DUMP_CREDS_PATH}"
    chmod 600 "${TMP_DB_DUMP_CREDS_PATH}"
    ${DB_ZCAT_CMD} "${TMP_DB_PATH}.gz" | PGPASSFILE="${TMP_DB_DUMP_CREDS_PATH}" $LOCAL_PSQL_CMD $LOCAL_DB_CREDS --no-password >/dev/null
    rm "${TMP_DB_DUMP_CREDS_PATH}"
    echo "*** Restored local database from ${TMP_DB_PATH}.gz"
}

# Source the correct file for the database driver
case "$GLOBAL_DB_DRIVER" in
    ( 'mysql' )
        source "${DIR}/common/common_mysql.sh"
        if [[ "${STAGING_DB_USING_SSH}" == "yes" ]] ; then
            pull_mysql_ssh
        else
            pull_mysql_direct
        fi
        backup_local_mysql
        restore_local_from_staging_mysql
        ;;
    ( 'pgsql' )
        source "${DIR}/common/common_pgsql.sh"
        if [[ "${STAGING_DB_USING_SSH}" == "yes" ]] ; then
            pull_pgsql_ssh
        else
            pull_pgsql_direct
        fi
        backup_local_pgsql
        restore_local_from_staging_pgsql
        ;;
    ( * )
        echo "Environment variable GLOBAL_DB_DRIVER was neither 'mysql' nor 'pgsql'. Aborting."
        exit 1 ;;
esac

# Normal exit
exit 0
