#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require jquery_nested_form
#= require_tree .
#= require ../../../javascripts/gmaps.js
#= require ../../../javascripts/shopping

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

  map_lat = $('#store_map').attr('data-lat')
  map_lng = $('#store_map').attr('data-lng')
  url = GMaps.staticMapURL({
    size: [288, 296],
    lat: map_lat,
    lng: map_lng,
    markers: [
      {lat: map_lat, lng: map_lng},
    ]
  });

  $('<img/>').attr('src', url).appendTo('#store_map a')
