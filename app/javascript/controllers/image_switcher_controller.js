import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["image"];

  switch(event) {
    event.preventDefault();
    const index = event.currentTarget.dataset.index;
    const mainImage = document.getElementById("main-event-image");
    const newImageSrc = this.imageTargets[index].src;

    mainImage.src = newImageSrc;
  }
}
