$ ->
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
