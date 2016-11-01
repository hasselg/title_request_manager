# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    if !Modernizr.inputtypes.date
      $('.datepicker').datepicker(altFormat: 'yy-mm-dd')      
