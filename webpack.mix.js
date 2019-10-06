require('dotenv').config();
const mix = require('laravel-mix');
const tailwindcss = require('tailwindcss');
const glob = require('glob-all');
const PurgecssPlugin = require('purgecss-webpack-plugin');
const LaravelMixFileHashVersioning = require('laravel-mix-file-hash-versioning');

// Custom PurgeCSS extractor for Tailwind that allows special characters in class names.
// https://github.com/FullHuman/purgecss#extractor
class TailwindExtractor {
	static extract(content) {
		return content.match(/[A-Za-z0-9-_:\/]+/g) || [];
	}
}

mix.js(['assets/javascript/app.js'], 'public/assets/app.js').extract();

mix.sass('assets/sass/app.scss', 'public/assets/app.css')
	.setPublicPath('public')
	.options({
		processCssUrls: false,
		postCss: [tailwindcss('./tailwind.config.js')],
	});

// Run BrowserSync Locally, off by default
// if (!mix.inProduction()) {
// 	mix.browserSync({
// 		// Set this to a variable in your .env file containing your local development URL:
// 		proxy: process.env.DEFAULT_SITE_URL,
// 		// Watch for any changes in assets/ and templates/ directories:
// 		files: ['assets/**/*', 'templates/**/*'],
// 	});
// }

mix.webpackConfig({
	plugins: [
		new PurgecssPlugin({

			// Specify the locations of any files you want to scan for class names.
			paths: glob.sync([
				path.join(__dirname, 'assets/javascript/*.js'),
				path.join(__dirname, 'templates/**/*.twig'),
			]),
			extractors: [
				{
					extractor: TailwindExtractor,

					// Specify the file extensions to include when scanning for class names.
					extensions: ['html', 'js', 'twig'],
				},
			],
		})
	],
});

// Only run in Production
if (mix.inProduction()) {
	mix.webpackConfig({
		plugins: [
			// Fingerprints compiled assets with a hashed filename instead of query strings
			// example: app.abc123.css
			new LaravelMixFileHashVersioning(['public/assets']),
		],
	});
}
