import { Controller } from "@hotwired/stimulus"

document.addEventListener("DOMContentLoaded", function() {
  var form = document.querySelector("form[data-behavior='submit-on-enter']");

  if (form) {
    form.addEventListener("keydown", function(event) {
      if (event.keyCode === 13) { // Check if the pressed key is Enter (key code 13)
        event.preventDefault(); // Prevent the default form submission
        form.submit(); // Submit the form
      }
    });
  }
});
