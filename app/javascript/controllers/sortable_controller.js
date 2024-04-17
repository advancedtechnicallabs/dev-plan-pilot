import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs';
//import { get, post, put, patch, destroy } from '@rails/request.js'
import { put } from '@rails/request.js'


// Connects to data-controller="sortable"
export default class extends Controller {

  static values = {
    group: String
  }

  connect() {
    Sortable.create(this.element, {
      onEnd: this.onEnd.bind(this),
      group: this.groupValue
    })
  }

  onEnd(event) {
    var sortableUpdateUrl = event.item.dataset.sortableUpdateUrl
    var sortableMilestoneId = event.to.dataset.sortableMilestoneId
    put(sortableUpdateUrl, {
     body: JSON.stringify({row_order_position: event.newIndex, milestone_id: sortableMilestoneId})
    })
  }
  
}
