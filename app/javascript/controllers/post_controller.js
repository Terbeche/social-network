import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["postList", "title", "body", "postBlock", "postManipulationBlock", "editButton"  ]


  delete (e) {  
    const element1 = this.postBlockTarget
    const element2 = this.postManipulationBlockTarget
    const text = element1
    const text2 = element2
    element1.remove()
    setTimeout(() => {
        element2.remove()
    }, 1)
  }

  toggle_edit_form (e) {
    e.preventDefault()
    e.stopPropagation()
    const formID = e.params["form"]
    const form = document.getElementById(formID)
    const buttonID = e.params["button"]
    const button = document.getElementById(buttonID )
    form.classList.toggle("hidden")
    button.classList.add("hidden")

  }

  update (e) {
    e.stopPropagation()
    const new_title = this.titleTarget
    const new_body = this.bodyTarget

    const formID = e.params["form"]
    const form = document.getElementById(formID)
    const buttonID = e.params["button"]
    const button = document.getElementById(buttonID )
 
    form.classList.toggle("hidden")
    button.classList.remove("hidden")
   
    const titleID = e.params["title"]
    const title = document.getElementById(titleID)
    const bodyID = e.params["body"]
    const body = document.getElementById(bodyID )
  
    title.innerHTML = new_title.value
    body.innerHTML = new_body.value
 
  }
}
