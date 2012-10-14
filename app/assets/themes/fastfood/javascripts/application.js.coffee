#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require jquery_nested_form
#= require_tree .
#= require ../../../javascripts/gmaps
#= require ../../../javascripts/shopping
#= require ../../shared/javascripts/application

$ ->
  left = $('.tubo.span9').height()
  right = $('.sidebar.tubo .span9').height()
  if left > right
    $('.tubo.span9').height(left)
    $('.sidebar.tubo .span9').height(left)
  if right > left
    $('.tubo.span9').height(right)
    $('.sidebar.tubo .span9').height(right)
  