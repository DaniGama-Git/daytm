
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.formTarget.addEventListener("keydown", event => {
      if (event.keyCode === 13) { // Check if the pressed key is Enter (key code 13)
        event.preventDefault(); // Prevent the default form submission
        this.formTarget.submit(); // Submit the form
      }
    });
  }

  get formTarget() {
    return this.element.querySelector("form[data-behavior='submit-on-enter']");
  }
}
