import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  connect() {
    this.loadMore()
  }

  loadMore() {
    if (this.loading || this.endOfResults) return

    this.loading = true

    fetch(this.urlValue)
      .then(response => response.json())
      .then(data => {
        if (data.length === 0) {
          this.endOfResults = true
        } else {
          this.element.insertAdjacentHTML('beforeend', data.map(event => this.renderEvent(event)).join(''))
          this.loading = false
        }
      })
  }

  renderEvent(event) {
    return `
      <div class="card">
        ${event.images.slice(0, 5).map(image => `<img src="${image}" class="card__img" />`).join('')}
        <div class="card__body">
          <a href="/events/${event.id}" class="card__title">イベント名: ${event.title}</a>
          <p class="card__summary">説明 ${event.description}</p>
          <a href="/users/${event.user.id}" class="card__user">投稿者 ${event.user.nickname}</a>
        </div>
      </div>
    `
  }
}
