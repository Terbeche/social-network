import { Controller } from "@hotwired/stimulus"


export default class extends Controller {

    static targets = [ "mode"]

     connect() { 
        console.log("Hello, theme!", this.element)    
    }

    change_theme(){
        console.log("change_theme")

        const element = this.modeTarget
        const text = element.innerHTML
        const theme = localStorage.getItem("theme")
        console.log(theme)

        if (theme == "dark") {
            document.body.classList.remove("dark");
            localStorage.setItem("theme", "light");
            element.innerHTML = "Dark"
        }else {
            document.body.classList.add("dark");
            localStorage.setItem("theme", "dark");
            element.innerHTML = "White"
            }
            const new_theme = localStorage.getItem("theme")

        console.log("change_theme end" + new_theme)

    }
    
}


