<?php
/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/GeneralConfig.php.
 *
 * @see \craft\config\GeneralConfig
 */

return [
  // Global settings
  '*' => [
    // Default Week Start Day (0 = Sunday, 1 = Monday...)
    'defaultWeekStartDay' => 0,

    // Whether generated URLs should omit "index.php"
    'omitScriptNameInUrls' => true,

    // Control Panel trigger word
    'cpTrigger' => 'admin',

    // The secure key Craft will use for hashing and encrypting data
    'securityKey' => getenv('SECURITY_KEY'),

    // Whether to save the project config out to config/project.yaml
    // (see https://docs.craftcms.com/v3/project-config.html)
    'useProjectConfigFile' => true,

    // Whether the GraphQL API is enabled
    'enableGql' => false,

    'useEmailAsUsername' => true,
    'generateTransformsBeforePageLoad' => true,

    // Chrome started logging out when switching to responsive mode in devtools
    'requireMatchingUserAgentForSession' => false,

    // By default caches are regenerated daily. This busts cache when content is changed.
    'cacheDuration' => false,

    // Make search work with partial matches and not just full matches
    'defaultSearchTermOptions' => array(
      'subLeft' => true,
      'subRight' => true,
    ),

    'siteUrl' => [
      'en_us' => getenv('DEFAULT_SITE_URL'),
    ],

    'aliases' => [
      '@basePath' => CRAFT_BASE_PATH . '/public/',
      '@baseUrl' => getenv('DEFAULT_SITE_URL'),
    ],

    'resourceBasePath' => '@basePath/cpresources',
  ],

  // Dev environment settings
  'dev' => [
    // Dev Mode (see https://craftcms.com/guides/what-dev-mode-does)
    'devMode' => true,

    'enableTemplateCaching' => false,

    // Use proper MySQL commands for MAMP users only
    'backupCommand' => getenv('BACKUP_COMMAND'),
    'restoreCommand' => getenv('RESTORE_COMMAND'),
  ],

  // Staging environment settings
  'staging' => [
    // Dev Mode (see https://craftcms.com/guides/what-dev-mode-does)
    'devMode' => true,

    // Set this to `false` to prevent administrative changes from being made on staging
    'allowAdminChanges' => false,
  ],

  // Production environment settings
  'production' => [
    // Set this to `false` to prevent administrative changes from being made on production
    'allowAdminChanges' => false,
  ],
];
