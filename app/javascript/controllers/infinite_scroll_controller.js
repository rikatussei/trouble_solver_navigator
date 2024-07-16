import { Controller } from "@hotwired/stimulus"
import { useIntersection } from "stimulus-use"

// Connects to data-controller="infinite-scroll"
export default class extends Controller {
  static values = {
    url: String
  }

  connect() {
    console.log("InfiniteScroll controller connected")
    useIntersection(this, { element: this.element, threshold: 1.0 })
  }

  appear(entry) {
    if (entry.isIntersecting) {
      this.loadMore()
    }
  }

  loadMore() {
    fetch(this.urlValue, {
      headers: {
        Accept: "application/json"
      }
    }).then(response => response.text())
      .then(html => {
        this.element.insertAdjacentHTML("beforeend", html)
        this.urlValue = this.nextPageUrl()
      })
  }

  nextPageUrl() {
    const url = new URL(this.urlValue)
    const page = parseInt(url.searchParams.get("page") || "1") + 1
    url.searchParams.set("page", page)
    return url.toString()
  }
}
