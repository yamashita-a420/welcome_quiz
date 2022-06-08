const colors = require('tailwindcss/colors')

module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      // 色の設定を拡張
      colors: {
        gray: colors.gray,
        neutral: colors.neutral,
        amber: colors.amber,
        orange: colors.orange,
      }
    },
  },
  variants: {
    extend: {},
  },
  daisyui: {
    themes: [
      {
        mytheme: {
          "primary": "#D1AE15",
          "secondary": "#E7BE99",
          "accent": "#FF7900",
          "neutral": "#C4C4C4",
          "base-100": "#F5F3F2",
          "info": "#3ABFF8",
          "success": "#36D399",
          "warning": "#FBBD23",
          "error": "#F87272",
        },
      },
    ],
  },
  plugins: [require("daisyui")],
}
