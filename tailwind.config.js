const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  theme: {
    extend: {
      // 色の設定を拡張
      colors: {
        gray: colors.zinc,
        neutral: colors.neutral,
        amber: colors.amber,
        orange: colors.orange,
      },
      container: {
        center: true,
        padding: {
          DEFAULT: '1rem',
          sm: '2rem',
          lg: '4rem',
          xl: '5rem',
          '2xl': '6rem',
        },
      },
    },
  },
  daisyui: {
    themes: [
      {
        mytheme: {
          "primary": "#FDE68A",
          "secondary": "#fec7b0",
          "accent": "#fdb293",
          "neutral": "#6e6c66",
          "base-100": "#faf9f8",
          "info": "#87f8a9",
          "success": "#93ddfd",
          "warning": "#b0a060",
          "error": "#ea8095",
        },
      },
    ],
  },
  plugins: [require("daisyui")],
}
