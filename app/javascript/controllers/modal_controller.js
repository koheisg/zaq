import { Controller } from "stimulus"

/*
 * <div data-controller='modal'>
 *    <div data-target='modal.container'>
 *      <div data-target='modal.items'>
 *      </div>
 *    </div>
 *    <div>
 *      <div>
 *        <buton data-action='click->modal#open' data-modal-content='foo'></botton>
 *      </div>
 *      <template data-modal-target='foo'>
 *        <ul>
 *          <li>Edit</li>
 *          <li>Delete</li>
 *        </ul>
 *      </template>
 *    </div>
 * </div>
 */
export default class extends Controller {
  static targets = [ "container", "items" ]

  open(e) {
    if (this.containerTarget.classList.value.split(' ').includes("hidden")) {
      this.itemsTarget.innerHTML = this.modalContent(e.target.dataset.modalContent)
      this.containerTarget.classList.remove('hidden')
    } else {
      this.itemsTarget.innerHTML = ''
      this.containerTarget.classList.add('hidden')
    }
  }

  modalContent(targetKey) {
    return document.querySelector(`[data-modal-target=${targetKey}]`).innerHTML
  }
}
