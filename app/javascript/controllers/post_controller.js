import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["postList", "title", "body", "postBlock", "postManipulationBlock"  ]

    connect() { 
        console.log("Hello, Delete!", this.element)
    }
    
//   submit () {
//     console.log("submit")
//     const element = this.textTarget
//     const text = element.value
//     console.log(this.commentListTarget.innerHTML)
//     this.commentListTarget.innerHTML = text + this.commentListTarget.innerHTML
//     this.textTarget.value = ''
//   }

  delete (e) {  
    console.log("delete")
    const element1 = this.postBlockTarget
    const element2 = this.postManipulationBlockTarget
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
