import "controllers"

import flatpickr from 'flatpickr'
require('flatpickr/dist/flatpickr.min.css')


document.addEventListener("turbolinks:load", () => {
    flatpickr("[data-behavior='flatpickr']", {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
    })
  })


console.log("custom js file loaded");



