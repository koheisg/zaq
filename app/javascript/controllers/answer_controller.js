import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form" ]

  reply() {
    if (this.formTarget.classList.value.split(' ').includes("hidden")) {
      this.formTarget.classList.remove('hidden')
    } else {
      this.formTarget.classList.add('hidden')
    }
  }
}
