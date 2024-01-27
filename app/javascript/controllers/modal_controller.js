import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = [ "editButton", "closeButton"  ]

  show(e) {
    e.preventDefault()
    e.stopPropagation()
    const formID = e.params["form"]
    const form = document.getElementById(formID)

    form.classList.toggle("hidden")

    const body = document.querySelector("body")
    body.classList.add("overflow-hidden")
    const blur = document.createElement("div");
    blur.setAttribute('id','blur');


    blur.classList.add("z-1")
    blur.classList.add("fixed")
    blur.classList.add("top-0")
    blur.classList.add("left-0")
    blur.classList.add("w-full")
    blur.classList.add("h-full")
    blur.classList.add("overflow-hidden")
    blur.classList.add("bg-gray-500")
    blur.classList.add("backdrop-blur-sm")
    blur.classList.add("backdrop-filter")
    blur.classList.add("transition-opacity")
    blur.classList.add("duration-300")
    blur.classList.add("ease-in-out")
    blur.classList.add("flex")
    blur.classList.add("justify-center")
    blur.classList.add("items-center")
    blur.style.opacity = 0.5;

    body.appendChild(blur)


  }

  close(e) {
     e.preventDefault()
     e.stopPropagation()

    const body = document.querySelector("body")
    body.classList.remove("overflow-hidden")
    body.classList.remove("backdrop-blur-lg")
    body.classList.remove("bg-gray-900")
    const formID = e.params["form"]
    const form = document.getElementById(formID)   
    form.classList.add("hidden")    

    const blur = document.getElementById("blur")
    blur.remove()
  }


}
