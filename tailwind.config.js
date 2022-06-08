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
  plugins: [],
}
