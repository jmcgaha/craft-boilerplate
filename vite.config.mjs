import { defineConfig } from 'vite';
import tailwindcss from '@tailwindcss/vite';
import ViteRestart from 'vite-plugin-restart';

// https://vitejs.dev/config/
export default defineConfig(({ command }) => ({
	base: command === 'serve' ? '' : '/dist/',

	build: {
		emptyOutDir: true,
		manifest: true,
		assetsDir: '',
		outDir: 'public/dist/',
		rollupOptions: {
			input: {
				app: 'src/js/app.js',
			},
		},
	},

	plugins: [
		// The restart plugin allows Vite to refresh pages when Twig files change
		// TODO: Not working yet
		ViteRestart({
			reload: ['templates/**/*'],
		}),
		tailwindcss(),
	],

	// Anything in publicDir will be copied into public/dist during `npm run build`
	publicDir: './src/public',

	// https://nystudio107.com/docs/vite/#specifying-the-dev-server-port
	server: {
		// Allow cross-origin requests -- https://github.com/vitejs/vite/security/advisories/GHSA-vg6x-rcgg-rjx6
		allowedHosts: true,
		cors: {
			origin: /https?:\/\/([A-Za-z0-9\-\.]+)?(localhost|\.local|\.test|\.site)(?::\d+)?$/,
		},
		headers: {
			'Access-Control-Allow-Private-Network': 'true',
		},
		host: '127.0.0.1',
		port: 5173,
		strictPort: true,
		hmr: {
			host: 'localhost',
		},
	},
}));
