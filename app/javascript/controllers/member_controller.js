import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["groupMembership" , "memberBlock", "memberManipulationBlock" ]

    connect() { 
        console.log("Hello, remove!", this.element)
    }
    

  change_membership (e) {  
    console.log("changing membership")
    const element = this.groupMembershipTarget
    const text = element.innerHTML

    if (text == "Join") {
        element.innerHTML = "Leave"
    } else {
        element.innerHTML = "Join"
    }
}

remove_member (e) {
    console.log("removing member")
    const element1 = this.memberBlockTarget
    const element2 = this.memberManipulationBlockTarget
    console.log(element1)
    console.log(element2)
    
    element1.remove()
    setTimeout(() => {
        element2.remove()
    }, 1)
}
}