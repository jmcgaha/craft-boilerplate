# Craft 3 Scripts Environment
#
# Local environmental config for nystudio107 Craft scripts
#
# @author    nystudio107
# @copyright Copyright (c) 2017 nystudio107
# @link      https://nystudio107.com/
# @package   craft-scripts
# @since     1.2.4
# @license   MIT
#
# This file should be renamed to '.env.sh' and it should reside in the
# `scripts` directory.  Add '.env.sh' to your .gitignore.

# -- GLOBAL settings --

# What to prefix the database table names with
GLOBAL_DB_TABLE_PREFIX=""

# The path of the `craft` folder, relative to the root path; paths should always have a trailing /
GLOBAL_CRAFT_PATH="./"

# The database driver for this Craft install ('mysql' or 'pgsql')
GLOBAL_DB_DRIVER="mysql"

# -- LOCAL settings --

# Local path constants; paths should always have a trailing /
LOCAL_ROOT_PATH="/Users/your-name-probably-goes-here/Sites/name-of-site/"
LOCAL_ASSETS_PATH=${LOCAL_ROOT_PATH}"public/uploads/"

# Local user & group that should own the Craft CMS install
LOCAL_CHOWN_USER="admin"
LOCAL_CHOWN_GROUP="apache"

# Local directories relative to LOCAL_ROOT_PATH that should be writeable by the $CHOWN_GROUP
LOCAL_WRITEABLE_DIRS=(
                "${GLOBAL_CRAFT_PATH}storage"
                "public/cpresources"
                "public/uploads"
                )

# Local asset directories relative to LOCAL_ASSETS_PATH that should be synched with remote assets
LOCAL_ASSETS_DIRS=(
                ""
                )

# Craft-specific file directories relative to GLOBAL_CRAFT_PATH that should be synched with remote files
LOCAL_CRAFT_FILE_DIRS=(
                "rebrand"
                )


# Local database constants; default port for mysql is 3306, default port for postgres is 5432
# This pulls values from your local .env file
LOCAL_DB_NAME=$(grep DB_DATABASE .env | cut -d '"' -f2)
LOCAL_DB_PASSWORD=$(grep DB_PASSWORD .env | cut -d '"' -f2)
LOCAL_DB_USER=$(grep DB_USER .env | cut -d '"' -f2)
LOCAL_DB_HOST=$(grep DB_SERVER .env | cut -d '"' -f2)
LOCAL_DB_PORT=$(grep DB_PORT .env | cut -d '"' -f2)
LOCAL_DB_SCHEMA=$(grep DB_SCHEMA .env | cut -d '"' -f2)

# The `mysql` and `mysqldump` commands to run locally
LOCAL_MYSQL_CMD="mysql"
# MAMP users: /Applications/MAMP/library/bin/mysql
LOCAL_MYSQLDUMP_CMD="mysqldump"
# MAMP users: /Applications/MAMP/library/bin/mysqldump

# Local backups path; paths should always have a trailing /
LOCAL_BACKUPS_PATH=${LOCAL_ROOT_PATH}"backups/"

# -- REMOTE (Production) settings --

# Remote ssh credentials, user@domain.com and Remote SSH Port
REMOTE_SSH_LOGIN="REPLACE_ME"
REMOTE_SSH_PORT="22"

# Remote path constants; paths should always have a trailing /
REMOTE_ROOT_PATH="REPLACE_ME"
REMOTE_ASSETS_PATH=${REMOTE_ROOT_PATH}"public/uploads/"

# Remote database constants; default port for mysql is 3306, default port for postgres is 5432
REMOTE_DB_NAME="REPLACE_ME"
REMOTE_DB_PASSWORD="REPLACE_ME"
REMOTE_DB_USER="REPLACE_ME"
REMOTE_DB_HOST="localhost"
REMOTE_DB_PORT="3306"
REMOTE_DB_SCHEMA="public"

# Remote backups path; paths should always have a trailing /
REMOTE_BACKUPS_PATH=${REMOTE_ROOT_PATH}"backups/"

# -- STAGING settings --

# Staging ssh credentials, user@domain.com and Staging SSH Port
STAGING_SSH_LOGIN="REPLACE_ME"
STAGING_SSH_PORT="22"

# Remote path constants; paths should always have a trailing /
STAGING_ROOT_PATH="REPLACE_ME"
STAGING_ASSETS_PATH=${STAGING_ROOT_PATH}"public/uploads/"

# Remote database constants; default port for mysql is 3306, default port for postgres is 5432
STAGING_DB_NAME="REPLACE_ME"
STAGING_DB_PASSWORD="REPLACE_ME"
STAGING_DB_USER="REPLACE_ME"
STAGING_DB_HOST="localhost"
STAGING_DB_PORT="3306"
STAGING_DB_SCHEMA="public"

# Remote backups path; paths should always have a trailing /
STAGING_BACKUPS_PATH=${STAGING_ROOT_PATH}"backups/"
