import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-tag"
export default class extends Controller {
  connect() {
    var myModal = document.getElementById('myModal')
    var myInput = document.getElementById('myInput')

    myModal.addEventListener('shown.bs.modal', function () {
      myInput.focus()
    })
  }
}
