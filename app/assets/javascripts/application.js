// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(document).ready(function () {
  $('#contact_form').validate({
    rules: {
      name: {
        required: true,
        lettersonly: true
      },
      email: {
        required: true,
        email: true
      },
      telephone: {
        digits: true
      },
      message: {
        required: true
      }
    },
    messages: {
      email : {
        email: "Please enter a valid email"
      },
      telephone: {
        digits: "Numbers only please"
      },
      name : {
        lettersonly: "Letters only please"
      }
    },
    submitHandler: function(form){
      $(form).ajaxSubmit({
        url: 'request_contact',
        type: 'post',
        data: $(form).serialize(),
        success: function(response){
          alert('success');
        }
      });
    }
  });
});

jQuery.validator.addMethod("lettersonly", function(value, element) {
return this.optional(element) || /^[a-z]+$/i.test(value);
}, "Letters only please");
