import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-item"
export default class extends Controller {
  static targets = ["infos", "form"]
  connect() {
    console.log(this.infosTarget, this.formTarget)
  }

  revealForm() {
    this.infosTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }
}
