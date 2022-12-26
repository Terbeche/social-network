import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["commentList", "text", "replyText", "commentBlock", "commentManipulationBlock"  ]
    
  submit () {
    // e.preventDefault()
    console.log("submit")
    const element = this.textTarget
    const text = element.value
    console.log(this.commentListTarget.innerHTML)
    this.commentListTarget.innerHTML = text + this.commentListTarget.innerHTML
    this.textTarget.value = ''
  }

  delete (e) {  
    const element1 = this.commentBlockTarget
    const element2 = this.commentManipulationBlockTarget
    const text = element1
    console.log(text)
    const text2 = element2
    console.log(text2)
    element1.remove()
    setTimeout(() => {
        element2.remove()
    }, 1)
  }

  toggle_reply_form (e) {
    e.preventDefault()
    e.stopPropagation()
    const formID = e.params["form"]
    const form = document.getElementById(formID)
    const buttonID = e.params["button"]
    const button = document.getElementById(buttonID )
    form.classList.toggle("hidden")
    button.classList.add("hidden")
  }

  reply (e) {
    console.log("reply")
    e.stopPropagation()
    const element = this.replyTextTarget
    const text = document.createElement("SPAN");
    text.innerHTML = element.value
    text.classList.add("ml-4")
    console.log(text)
    const formID = e.params["form"]
    const form = document.getElementById(formID)
    const buttonID = e.params["button"]
    const button = document.getElementById(buttonID )
    const blockID = e.params["block"]
    const block = document.getElementById(blockID)
    console.log(block)
    form.classList.toggle("hidden")
    button.classList.remove("hidden")
    block.appendChild(text)
  }
}
