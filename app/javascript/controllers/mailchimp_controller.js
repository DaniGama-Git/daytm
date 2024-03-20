import { Controller } from "@hotwired/stimulus"
import swal from 'sweetalert';

// Connects to data-controller="mailchimp"
export default class extends Controller {
  static targets = ['input']
  static values = { apiKey: String }

  send(event) {
    event.preventDefault();
    console.log(this.inputTarget.value)

    fetch('https://us22.api.mailchimp.com/3.0/lists/members', {
      method: 'POST',
      headers: {'Content-Type': 'application/json', 'api-key': this.apiKeyValue },
      body: JSON.stringify({ 'email_address': this.inputTarget.value})
    })
      .then((response) => {
        if (response.status === 201) {
          swal({
            title: 'Signed up! 💌',
            text: 'You have successfully subscribed to our newsletter and will now stay up to date. We would love to welcome you into our community!',
            button: 'Lots of love!'
          })
        } else if (response.status === 400) {
          swal({
            title: 'Something went wrong! 🚫',
            text: 'You are already in our waiting list with this email address. Why not sign up to Quouch and become part of this special community already? 😏',
            button: 'Lots of love!'
          })
        } else {
          swal({
            title: 'Something went wrong! 🚫',
            text: 'Huh? Please try again or contact the Quouch support to further inquire the issue.',
            button: 'Lots of love!'
          })
        }
      })
  }
}
