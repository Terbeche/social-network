import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = [ "mode"]

    connect() { 
        console.log("Hello, theme!", this.element)    
    }
    change_theme (e) {
        const body = document.body
        const element = this.modeTarget
        const text = element.innerHTML

    if (text == "Dark") {
        element.innerHTML = "White"
        body.classList.remove("bg-white")
        body.classList.add("bg-black")
        body.classList.remove("text-black")
        body.classList.add("text-white")
        
    } else {
        element.innerHTML = "Dark"
        body.classList.remove("bg-black")
        body.classList.add("bg-white")
        body.classList.remove("text-white")
        body.classList.add("text-black")
        
    }

    }
}
