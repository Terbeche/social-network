import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["commentList", "text", "replyText", "commentBlock", "commentManipulationBlock" ,"editButton" ]

  submit () {
    const element = this.textTarget
    const text = element.value
    this.commentListTarget.innerHTML = text + this.commentListTarget.innerHTML
    this.textTarget.value = ''
  }

  delete (e) {  
    const element1 = this.commentBlockTarget
    const element2 = this.commentManipulationBlockTarget
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
    this.textTarget.focus()
  }

  update (e) {
    e.stopPropagation()
    const new_text = this.textTarget

    const formID = e.params["form"]
    const form = document.getElementById(formID)
    const buttonID = e.params["button"]
    const button = document.getElementById(buttonID )
 
    form.classList.toggle("hidden")
    button.classList.remove("hidden")
   
    const textID = e.params["text"]
    const text = document.getElementById(textID)
  
    text.innerHTML = new_text.value
 
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
    e.stopPropagation()
    const element = this.replyTextTarget

    const replyBlock = document.createElement("DIV");
    const user = document.createElement("SPAN");
    const text = document.createElement("SPAN");
    
    user.innerHTML = e.params["user"].name + ": "
    text.innerHTML = element.value
    replyBlock.classList.add("ml-6")


    const formID = e.params["form"]
    const form = document.getElementById(formID)
    const buttonID = e.params["button"]
    const button = document.getElementById(buttonID )
    const blockID = e.params["block"]
    const block = document.getElementById(blockID) 
    form.classList.toggle("hidden")
    button.classList.remove("hidden")
    replyBlock.appendChild(user)
    replyBlock.appendChild(text)
    
    block.parentElement.parentElement.appendChild(replyBlock)
    }
}
