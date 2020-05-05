import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["editable"]

    doubleClick(event) {
        event.preventDefault()
        
        let editor = document.createElement("input")
        editor.value = event.target.innerText
    
        let style = window.getComputedStyle(event.target)
        editor.style.cssText = style.cssText
        editor.addEventListener('keypress', function(event) {
            var key = event.which || event.keyCode;
            if (key === 13 // 13 is enter
              || key == 27) { // 27 is escape
              this.editableTarget.innerText = editor.value
              this.editableTarget.classList.remove("editable--hidden")
              editor.remove()
            }
          }.bind(this));

          let selection = window.getSelection()
          editor.setSelectionRange(selection.anchorOffset, selection.anchorOffset)
          
          this.editableTarget.insertAdjacentElement('afterend', editor)
          this.editableTarget.classList.add("editable--hidden")
        }
      }

