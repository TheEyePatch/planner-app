module.exports = {
  purge: [
    './app/views/**/*.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    fontFamily: {
      'rubik':['Rubik', 'sans-serif'],
      'big-shoulders':['Big Shoulders Display', 'cursive'],
      'roboto': ['Roboto', 'sans-serif']
    },
    extend:{
      animation:{
        bounce: 'bounce 2.5s infinite',
        wiggle: 'wiggle 1s infinite',
      },
      height: {
        '95v': '95vh',
        '45rem' : '45rem',
        '35rem': '35rem'
      },
      keyframes: {

        wiggle: {
          '0%, 100%': { transform: 'translateX(-2px)' },
          '50%': { transform: 'translateX(2px)' },
        }
      }
    }
  },
  variants: {
  
  },
  plugins: [],
}
