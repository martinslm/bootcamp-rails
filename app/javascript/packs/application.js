// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

require("jquery")
require("bootstrap")

document.addEventListener('turbolinks:load', () => {
    $('.custom-file-input').on('change',function(){
      const fileName = $(this).val().split('\\');
  
      $(this).next('.custom-file-label').html(fileName[fileName.length - 1]);
    })
  })

Rails.start()
Turbolinks.start()
ActiveStorage.start()

if (!window.cable) {
    window.cable = {}
  }