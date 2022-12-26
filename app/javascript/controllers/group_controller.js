import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["memberGroups", "createdByMeGroups", "allGroups" ]


    connect(){
        console.log("hello groups contoller")
    }
  toggle_groups_category (e) { 
    console.log("tooooooooooooolge")

    e.preventDefault()
    e.stopPropagation()
    const displayButton = e.target.innerHTML
console.log(displayButton)
    const allGroups = document.getElementById("all-groups")
    const createdGroups = document.getElementById("created-groups")
    const memberGroups = document.getElementById("member-groups")
    console.log(allGroups)
    console.log(createdGroups)
    console.log(memberGroups)

    // const [element1,element2, element3  ]= this.displayGroupsButtonTargets
    // const text1 = element1.innerHTML
    // const text2 = element2.innerHTML

    // const text3 = element3.innerHTML

//     const element2 = this.createdByMeGroupsTarget
//      const text2 = element2.innerHTML

//      const element3 = this.allGroupsTarget
//      const text3 = element3.innerHTML

//     const element1 = this.memberGroupsTarget
//      const text1 = element1.innerHTML
    
    
//  console.log(text1)
//  console.log(text2)
//  console.log(text3)
        console.log(displayButton)

     if ( displayButton == "Created by me"){
        console.log("created by me")
            allGroups.classList.remove("hidden")
            createdGroups.classList.remove("hidden")
            memberGroups.classList.remove("hidden")
            allGroups.classList.add("hidden")
            memberGroups.classList.add("hidden")
     } else if(displayButton ==  "Where I'm member"){
        console.log("where I'm member")
        allGroups.classList.remove("hidden")
        createdGroups.classList.remove("hidden")
        memberGroups.classList.remove("hidden")
        allGroups.classList.add("hidden")
        createdGroups.classList.add("hidden")
     }else{
        console.log("All groups")
        allGroups.classList.remove("hidden")
        createdGroups.classList.remove("hidden")
        memberGroups.classList.remove("hidden")
        createdGroups.classList.add("hidden")
        memberGroups.classList.add("hidden")
     }
    


    
        
}

}