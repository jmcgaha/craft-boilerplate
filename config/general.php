<?php
/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/GeneralConfig.php.
 *
 * @see \craft\config\GeneralConfig
 */

use craft\helpers\App;

return [
  // Global settings
  '*' => [
    // Default Week Start Day (0 = Sunday, 1 = Monday...)
    'defaultWeekStartDay' => 0,

    // Whether generated URLs should omit "index.php"
    'omitScriptNameInUrls' => true,

    // Control panel trigger word
    'cpTrigger' => 'admin',

    // Whether the GraphQL API is enabled
    'enableGql' => false,

    'useEmailAsUsername' => true,
    'generateTransformsBeforePageLoad' => true,

    // By default caches are regenerated daily. This busts cache when content is changed.
    'cacheDuration' => false,

    // Make search work with partial matches and not just full matches
    'defaultSearchTermOptions' => array(
      'subLeft' => true,
      'subRight' => true,
    ),

    // Preload Single entries as Twig variables
    'preloadSingles' => true,

    // Prevent user enumeration attacks
    'preventUserEnumeration' => true,

    'aliases' => [
      '@basePath' => CRAFT_BASE_PATH . '/public/',
      '@baseUrl' => App::env('PRIMARY_SITE_URL'),
      '@webroot' => dirname(__DIR__) . '/public',
    ],

    'resourceBasePath' => '@basePath/cpresources',
  ],

  // Dev environment settings
  'dev' => [
    // Dev Mode (see https://craftcms.com/guides/what-dev-mode-does)
    'devMode' => true,

    // Prevent crawlers from indexing pages and following links
    'disallowRobots' => true,

    'enableTemplateCaching' => false,
  ],

  // Staging environment settings
  'staging' => [
    // Dev Mode (see https://craftcms.com/guides/what-dev-mode-does)
    'devMode' => true,

    // Prevent crawlers from indexing pages and following links
    'disallowRobots' => true,

    // Set this to `false` to prevent administrative changes from being made on Staging
    'allowAdminChanges' => false,

    // Don’t allow updates on Staging
    'allowUpdates' => false,
  ],

  // Production environment settings
  'production' => [
    // Set this to `false` to prevent administrative changes from being made on Production
    'allowAdminChanges' => false,

    // Don’t allow updates on Production
    'allowUpdates' => false,
  ],
];
