const defaultTheme = require('tailwindcss/defaultTheme');

function rem(num, base = 16) {
	let parsedNum = num;

	// remove mesurment unit
	if (typeof num == 'string') {
		parsedNum = Number(num.replace(/(\d.)(.*)/, '$1'));
	}

	parsedNum = `${parsedNum / base}rem`;

	return parsedNum;
}

module.exports = {
	mode: 'jit',
	purge: [
		'./templates/**/*.twig',
		'./assets/javascript/**/*.js',
	],
	theme: {
		container: {
			center: true
		},
		extend: {
			colors: {
			},
			fontFamily: {
				sans: [
					"Nunito Sans",
					...defaultTheme.fontFamily.sans
				]
			},
			maxWidth: theme => ({
				...theme('spacing'),
			}),
			spacing: {
				px: rem(1), // 1px
				'-0.5': rem(-2),
				'0': rem(0),
				'.5': rem(2), // '0.125rem',
				'1': rem(4), // '0.25rem',
				'1.25': rem(5), // '0.3125rem',
				'1.5': rem(6), // '0.375rem',
				'1.75': rem(7), // '0.4375rem',
				'2': rem(8), // '0.5rem',
				'2.25': rem(9), // '0.5625rem'
				'2.5': rem(10), // '0.625rem',
				'2.75': rem(11), // '0.6875rem',
				'3': rem(12), // '0.75rem',
				'3.25': rem(13), // '0.8125rem',
				'3.5': rem(14), // '0.875rem',
				'4': rem(16), // '1rem',
				'4.5': rem(18), // '1.125rem',
				'5': rem(20), // '1.25rem',
				'5.5': rem(22), // '1.375rem',
				'6': rem(24), // '1.5rem',
				'6.5': rem(26), // '1.625rem',
				'7': rem(28), // '1.75rem',
				'7.5': rem(30), // '1.875rem',
				'8': rem(32), // '2rem',
				'8.25': rem(33), // '2.0625rem',
				'8.5': rem(34), // '2.125rem',
				'9': rem(36), // '2.25rem',
				'9.5': rem(38), // '2.375rem',
				'10': rem(40), // '2.5rem',
				'10.5': rem(42), // '2.625rem',
				'11': rem(44), // '2.75rem',
				'11.5': rem(46), // '2.875rem',
				'12': rem(48), // '3rem',
				'12.5': rem(50), // '3.125rem',
				'13': rem(52), // '3.25rem',
				'13.5': rem(54), // '3.375rem',
				'14': rem(56), // '3.5rem'
				'14.5': rem(58), // '3.625',
				'15': rem(60), // '3.75rem',
				'15.5': rem(62), // '3.875rem',
				'16': rem(64), // '4rem',
				'16.5': rem(66), // '4.125rem',
				'17': rem(68), // '4.25rem',
				'17.5': rem(70), // '4.375rem',
				'18': rem(72), // '4.5rem',
				'18.5': rem(74), // '4.625rem',
				'19': rem(76), // '4.75rem',
				'19.5': rem(78), // '4.875rem',
				'20': rem(80), // '5rem',
				'20.5': rem(82), // '5.125rem',
				'21': rem(84), // '5.25rem'
				'21.5': rem(86), // '5.375rem',
				'22': rem(88), // '5.5rem',
				'22.5': rem(90), // '5.625rem',
				'23.5': rem(94), // '5.875rem',
				'24': rem(96), // '6rem',
				'24.5': rem(98), // '6.125rem',
				'25': rem(100), // '6.25rem',
				'25.5': rem(102), // '6.375rem',
				'26': rem(104), // '6.5rem',
				'26.5': rem(106), // '6.625rem',
				'27': rem(108), // '6.75rem',
				'27.5': rem(110), // '6.875rem',
				'28': rem(112), // '7rem',
				'28.5': rem(114), // '7.125rem',
				'29': rem(116), // '7.25rem',
				'29.5': rem(118), // '7.375rem',
				'30': rem(120), // '7.5rem',
				'30.5': rem(122), // '7.625rem',
				'32': rem(128), // '8rem',
				'32.5': rem(130), // '8.125rem',
				'33': rem(132), // '8.25rem',
				'33.5': rem(134), // '8.375rem',
				'34': rem(136), // '8.5rem',
				'34.5': rem(138), // '8.625rem',
				'35': rem(140), // '8.75rem',
				'35.5': rem(142), // '8.875rem',
				'36': rem(144), // '9rem',
				'36.5': rem(146), // '9.125rem',
				'37': rem(148), // '9.25rem',
				'39': rem(156), // '9.75rem',
				'40': rem(160), // '10rem',
				'41': rem(164), // '10.25rem',
				'42': rem(168), // '10.5rem',
				'44': rem(176), // '11rem'
				'45': rem(180), // '11.25rem',
				'48': rem(192), // '12rem',
				'49': rem(196), // '12.5',
				'50': rem(200), // '12.5rem',
				'51': rem(204), // '12.75rem',
				'52': rem(208), // '13rem',
				'56': rem(224), // '14rem',
				'58': rem(232), // '14.5rem',
				'59': rem(236), // '14.75rem',
				'60': rem(240), // '15rem',
				'62': rem(248), // '15.5rem',
				'64': rem(256), // '16rem',
				'80': rem(320), // '20rem',
				'96' : rem(384), // '24rem',
				'68': rem(272), // '17rem',
				'70': rem(280), // '17.5rem',
				'72': rem(288), // '18rem',
				'73': rem(292), // '18rem',
				'75': rem(300), // '18rem',
				'100': rem(400), // '25rem',
				'106': rem(424), // '26.5rem',
				'120': rem(480), // '30rem',
				'135': rem(540), // '33.75rem',
				'150': rem(600), // '37.5rem',
				'170': rem(680), // '42.5rem',
				'175': rem(700), // '43.75rem',
				'195': rem(780), // '48.75rem',
				'235': rem(940), // '58.25rem',
				'240': rem(960), // '60rem',
				'256': rem(1024), // '64rem',
				'270': rem(1080), // '67.5rem',
				'300': rem(1200), // '75rem',
				'400': rem(1600), // '100rem'
			},
		}
	},
	variants: {
		extend: {
			display: ['hover', 'focus']
		}
	},
	plugins: [],
};
