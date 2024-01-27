import { Controller } from "@hotwired/stimulus"


export default class extends Controller {

    static targets = [ "mode"]

    connect() {
        const theme = localStorage.getItem("theme")
        console.log("Theme controller connected")
        const element = this.modeTarget
        if (theme == "dark") {
            element.innerHTML = "Light"
            document.body.classList.add("dark");
            element.classList.add("text-black");
            element.classList.add("bg-white");
            element.classList.remove("text-white");
            element.classList.remove("bg-black");
        }else {
            element.innerHTML = "Dark"
            document.body.classList.remove("dark");
            element.classList.add("text-white");
            element.classList.add("bg-black");  
            element.classList.remove("text-black");
            element.classList.remove("bg-white");  
        }
    }


    change_theme(){
        const element = this.modeTarget
        const text = element.innerHTML
        const theme = localStorage.getItem("theme")

        document.body.classList.toggle("dark");
        if (text == "Dark") {
            localStorage.setItem("theme", "dark");
            element.innerHTML = "Light";
            document.body.classList.add("dark");
            element.classList.add("text-black");
            element.classList.add("bg-white");
            element.classList.remove("text-white");
            element.classList.remove("bg-black");
        }else {
            localStorage.setItem("theme", "light");
            element.innerHTML = "Dark";
            document.body.classList.remove("dark");
            element.classList.add("text-white");
            element.classList.add("bg-black");  
            element.classList.remove("text-black");
            element.classList.remove("bg-white");  
        }

        // if (theme == "dark") {
        //     document.body.classList.remove("dark");
        //     localStorage.setItem("theme", "light");
        //     element.innerHTML = "Dark"
        // }else {
        //     document.body.classList.add("dark");
        //     localStorage.setItem("theme", "dark");
        //     element.innerHTML = "White"
        //     }
    }
    
}


