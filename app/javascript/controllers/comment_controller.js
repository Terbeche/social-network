import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["commentList", "text", "commentBlock", "commentManipulationBlock"  ]

    connect() { 
        console.log("Hello, Stimulus!", this.element)
        
    }
    
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
}
