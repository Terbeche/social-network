import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["groupMembership" , "memberBlock", "memberManipulationBlock" ]

  change_membership (e) {  
    const element = this.groupMembershipTarget
    const text = element.innerHTML

    if (text == "Join") {
        element.innerHTML = "Leave"
    } else {
        element.innerHTML = "Join"
    }
}

remove_member (e) {
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