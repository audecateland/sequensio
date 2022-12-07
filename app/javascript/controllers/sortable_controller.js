import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

// Connects to data-controller="sortable"
export default class extends Controller {
  static values = { token: String }

  connect() {
  Sortable.create(this.element, {
    ghostClass: "ghost", //Classe à perso qd on bouge l'objet
    animation: 150,
    onEnd: (event) => {
      console.log(event);
      const children = Array.from(event.from.children)
      children.forEach((child) => {
        const index = children.indexOf(child);
        setTimeout(() => {
          this.updatePosition(child, index + 1)
        }, index * 100);
      })
    }
  })
  }

  updatePosition(el, position) {
    const trackId = el.dataset.trackId
    console.log(position);
    fetch(`/tracks/${trackId}`, {
      method: "PUT",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "X-CSRF-Token": this.tokenValue
      },
      body: JSON.stringify({track: {position: position}})
    })
      .then(response => response.json())
      .then((data) => {
        // console.log(data)
      })
  }
}
