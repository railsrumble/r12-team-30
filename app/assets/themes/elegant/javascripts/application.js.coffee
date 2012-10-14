#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require jquery_nested_form
#= require_tree .

# $('a[data-toggle="collapse"]').click (e) ->
#   e.preventDefault

$ ->
  $('a.collapse').click (e) ->
    _this = $(this)
    
    e.preventDefault()
    
    $(_this.attr('href')).slideToggle(->
      if ($(this).css('display') == "none")
        _this.html('<i class="icon-chevron-down"></i>')
      else
        _this.html('<i class="icon-chevron-up"></i>')
      ).toggleClass('collapsed')


  $('#store_gallery').carousel()
