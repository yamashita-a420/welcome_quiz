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
          "primary": "#DDD095",
          "secondary": "#E7BE99",
          "accent": "#FF7900",
          "neutral": "#dec356",
          "base-100": "#F5F3F2",
          "info": "#5DBFF4",
          "success": "#1CB58A",
          "warning": "#B36B14",
          "error": "#EC275C",
        },
      },
    ],
  },
  plugins: [require("daisyui")],
}
