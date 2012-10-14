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

  $sidebar = $(".cart")
  $window = $(window)
  offset = $sidebar.offset()
  topPadding = 15
  max = $(".main-content").height() - offset.top

  $window.scroll ->
    y = $window.scrollTop()
    if y < max and y > offset.top
      
      # console.log(max);
      # console.log $window.scrollTop()
      # console.log $window.scrollTop() - offset.top
      # console.log ""
      $sidebar.stop().animate
        marginTop: y - offset.top + topPadding
    else
      $sidebar.stop().animate
        marginTop: 0
