module.exports = {
	theme: {
		container: {
			center: true
		},
		extend: {
			colors: {
				black: "#000",
				blue: {
					300: "#3e86ff",
					500: "#182ad5",
					700: "#0a2342"
				},
				gray: {
					100: "#949699",
					300: "#7c098b",
					500: "#6d6d6d",
					700: "#313747",
					900: "#2a2d34"
				}
			},
			fontFamily: {
				body: [
					"Nunito Sans",
					"-apple-system",
					"BlinkMacSystemFont",
					'"Segoe UI"',
					"Roboto",
					'"Helvetica Neue"',
					"Arial",
					'"Noto Sans"',
					"sans-serif",
					'"Apple Color Emoji"',
					'"Segoe UI Emoji"',
					'"Segoe UI Symbol"',
					'"Noto Color Emoji"'
				]
			}
		}
	},
	variants: {
		display: ["responsive", "hover", "focus"]
	},
	plugins: [require("@tailwindcss/custom-forms")],
	experimental: {
		applyComplexClasses: true,
		defaultLineHeights: true,
		extendedFontScale: true,
		extendedSpacingScale: true,
		uniformColorPalette: true,
	},
};
