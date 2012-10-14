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

  $window.scroll ->
    y = $window.scrollTop()

    if y > offset.top
      $sidebar.stop().animate
        marginTop: y - offset.top -  + topPadding
    else
      $sidebar.stop().animate
        marginTop: 0

