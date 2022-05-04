<?php

use craft\helpers\App;

return [

  '*' => [
    'showLabel' => true,
    'labelText' => strtoupper(App::env('CRAFT_ENVIRONMENT')),
    'prefixText' => null,
    'suffixText' => null,
    'textColor' => '#fff',
  ],

  // Dev environment settings
  'dev' => [
    'labelColor' => '#000',
  ],

  // Staging environment settings
  'staging' => [
    'labelColor' => '#fc3',
    'textColor' => '#000',
  ],

  // Production environment settings
  'production' => [
    'labelColor' => '#cc5643',
  ]
];
