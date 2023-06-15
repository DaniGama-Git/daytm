import { Controller } from "@hotwired/stimulus"

document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector("[data-behavior='submit-on-enter']");

  if (form) {
    const input = form.querySelector("input");

    input.addEventListener("keydown", (event) => {
      if (event.key === "Enter" && !event.shiftKey) {
        event.preventDefault();
        form.querySelector("button[type='submit']").click();
      }
    });
  }
});
