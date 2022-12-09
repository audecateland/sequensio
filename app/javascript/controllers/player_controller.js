import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="player"
export default class extends Controller {
  static values = { trackIds: Object }
  static targets = ["tracks"]
  connect() {
    console.log(this.tracksTarget)
    console.dir(this.trackIdsValue)
    Object.keys(this.trackIdsValue).forEach(sequence => {
      this.tracksTarget.insertAdjacentHTML("beforeend", `<h2 class="text-center mb-3">${sequence}</h2>`)
      this.trackIdsValue[sequence].forEach(trackId => {
        const iframe = `<iframe style="border-radius:12px" src="https://open.spotify.com/embed/track/${trackId}?utm_source=generator" width="100%" height="352" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>`
        this.tracksTarget.insertAdjacentHTML("beforeend", iframe)
      });
    });
  }
}
