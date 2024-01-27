// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


const userTheme = localStorage.getItem("theme")

const theme_check =() => {
    if (userTheme == "dark") {
            document.body.classList.add("dark");
    }
}

theme_check()
