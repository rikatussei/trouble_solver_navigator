// app/javascript/controllers/image_switcher_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["image"];

  connect() {
    console.log("ImageSwitcher controller connected");
  }

  switch(event) {
    const index = event.target.dataset.index;
    const mainImage = document.getElementById("main-event-image");
    if (mainImage && this.imageTargets[index]) {
      mainImage.src = this.imageTargets[index].src;
    }
  }
}
