require("dotenv").config();
const mix = require("laravel-mix");
const tailwindcss = require("tailwindcss");
require("laravel-mix-versionhash");

mix.js(["assets/javascript/app.js"], "public/assets/app.js").extract();

mix
	.sass("assets/sass/app.scss", "assets/app.css")
	.setPublicPath("public")
	.options({
		processCssUrls: false,
		postCss: [tailwindcss("./tailwind.config.js")]
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

// Only run in Production
if (mix.inProduction()) {
	mix.versionHash();
}
