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
      'big-shoulders':['Big Shoulders Display', 'cursive']
    },
    extend:{
      animation:{
        bounce: 'bounce 2.5s infinite'
      }
    }
  },
  variants: {
  
  },
  plugins: [],
}
