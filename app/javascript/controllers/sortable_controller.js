import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs';
//import { get, post, put, patch, destroy } from '@rails/request.js'
import { put } from '@rails/request.js'


// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    Sortable.create(this.element, {
      onEnd: this.onEnd.bind(this)
    })
  }

  onEnd(event) {
    //console.log(event.newIndex)
    console.log(event.item.dataset.sortableId)
    put(`/milestones/${event.item.dataset.sortableId}/sort`,{
      body: JSON.stringify({row_order_position: event.newIndex})
    })
  }
  
}
