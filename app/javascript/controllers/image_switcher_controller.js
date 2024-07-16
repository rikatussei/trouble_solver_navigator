import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-switcher"
export default class extends Controller {
  static targets = ["image"]

  connect() {
    console.log("ImageSwitcher controller connected");
  }

  switch(event) {
    const index = event.target.dataset.index;
    const mainImage = document.getElementById("main-event-image");
    const newSrc = this.imageTargets[index].src;
    mainImage.src = newSrc;
  }
}
