# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#event_start_at').datepicker
    dateFormat: 'yy-mm-dd'
  $('#event_end_at').datepicker
    dateFormat: 'yy-mm-dd'
  $('#event_end_period').datepicker
    dateFormat: 'yy-mm-dd'