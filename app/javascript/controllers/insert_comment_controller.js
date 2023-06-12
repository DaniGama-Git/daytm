// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="insert-comment"
// export default class extends Controller {
//   static targets = ["comments", "form"]

//   connect() {
//     console.log(this.element)
//     console.log(this.commentsTarget)
//     console.log(this.formTarget)
//     this.element.addEventListener("keydown", this.handleKeyDown.bind(this));
//   }

//   handleKeyDown(event) {
//     console.log(event)
//     if (event.keyCode === 13 && event.target === this.formTarget.querySelector(".test")) {
//       event.preventDefault();
//       this.send();
//       this.clearForm();
//     }
//   }

//   send() {

//     fetch(this.formTarget.action, {
//       method: "POST",
//       headers: { "Accept": "application/json" },
//       body: new FormData(this.formTarget)
//     })
//       .then(response => response.json())
//       .then((data) => {
//         if (data.inserted_item) {
//           this.commentsTarget.insertAdjacentHTML("afterbegin", data.inserted_item)
//         }
//         this.formTarget.outerHTML = data.form
//       })
//     }

//   clearForm() {
//     this.formTarget.reset();
//   }
// }
