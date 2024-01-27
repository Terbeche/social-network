import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["memberGroups", "createdByMeGroups", "allGroups" ]

  toggle_groups_category (e) { 
    e.preventDefault()
    e.stopPropagation()
    const displayButton = e.target.innerHTML
    const allGroups = document.getElementById("all-groups")
    const createdGroups = document.getElementById("created-groups")
    const memberGroups = document.getElementById("member-groups")


     if ( displayButton == "Created by me"){
            allGroups.classList.remove("hidden")
            createdGroups.classList.remove("hidden")
            memberGroups.classList.remove("hidden")
            allGroups.classList.add("hidden")
            memberGroups.classList.add("hidden")
     } else if(displayButton ==  "Where I'm member"){
        allGroups.classList.remove("hidden")
        createdGroups.classList.remove("hidden")
        memberGroups.classList.remove("hidden")
        allGroups.classList.add("hidden")
        createdGroups.classList.add("hidden")
     }else{
        allGroups.classList.remove("hidden")
        createdGroups.classList.remove("hidden")
        memberGroups.classList.remove("hidden")
        createdGroups.classList.add("hidden")
        memberGroups.classList.add("hidden")
     }
    


    
        
}

}