import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-item"
export default class extends Controller {
  static targets = ["card", "form"]
  connect() {
    console.log(this.cardTarget, this.formTarget)
  }

  revealForm() {
    console.log("TODO")
    this.cardTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }

  // update(event) {
  //   event.preventDefault()

  //   const url = this.formTarget.action;
  //   fetch(url, {
  //     headers: { "Accept": "text/plain" },
  //     method: "PATCH",
  //     body: new FormData(this.formTarget)
  //   })
  //     .then(response => response.text())
  //     .then(data => {
  //       this.containerTarget.outerHTML = data;
  //     })
  // }
}
