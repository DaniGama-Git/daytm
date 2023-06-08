import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-comment"
export default class extends Controller {
  static targets = ["comments", "form"]

  connect() {
    console.log(this.element)
    console.log(this.commentsTarget)
    console.log(this.formTarget)
  }

  send(event) {
    event.preventDefault();

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.commentsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })
    }
}
