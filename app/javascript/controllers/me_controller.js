import { Controller } from "stimulus"

/*
 * <div data-controller='me'>
 *    <div data-target='me.container'>
 *      <div data-target='me.items'>
 *      </div>
 *    </div>
 *    <div>
 *      <div>
 *        <buton data-action='click->me#open'></botton>
 *      </div>
 *    </div>
 * </div>
 */
export default class extends Controller {
  static targets = [ "container", "items" ]

  open(e) {
    if (this.containerTarget.classList.value.split(' ').includes("hidden")) {
      this.containerTarget.classList.remove('hidden')
    } else {
      this.containerTarget.classList.add('hidden')
    }
  }

  close() {
    if (! this.containerTarget.classList.value.split(' ').includes("hidden")) {
      this.containerTarget.classList.add('hidden')
    }
  }
}
