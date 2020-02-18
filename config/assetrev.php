<?php

return [
  '*' => [
    'strategies' => [
      'manifest' => \club\assetrev\utilities\strategies\ManifestFileStrategy::class,
      'querystring' => \club\assetrev\utilities\strategies\QueryStringStrategy::class,
      'passthrough' => function ($filename, $config) {
        return $filename;
      },
    ],
    'pipeline' => 'manifest|querystring|passthrough',
    'manifestPath' => 'public/mix-manifest.json',
    'assetsBasePath' => '../public/assets',
  ],
];
