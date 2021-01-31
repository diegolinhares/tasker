import { Controller } from "stimulus"
import StimulusReflex from "stimulus_reflex"

export default class extends Controller {
  connect() {
    // This line communicates the client with the server.
    // It gives a cable
    StimulusReflex.register(this)
  }

  destroy(event) {
    event.preventDefault()

    const confirmation = confirm("Are you sure?")

    if (confirmation) {
      this.stimulate("TaskReflex#destroy", event.currentTarget)
    }
  }
}
