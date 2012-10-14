$ ->
  updatesteps = (dom) ->
    $(".floater .step").slideUp()
    $('#'+ $(dom).data('nextdiv')).slideDown()
    window.cycleend = false
    $('.list li').each ->
      $(this).removeClass('active')
      $(this).removeClass('done')
      console.log($(this).data('nextdiv'))
      if window.cycleend == false
        if $(this).data('nextdiv') == $(dom).data('nextdiv')
          $('.'+ $(dom).data('nextdiv')).addClass('active')
          window.cycleend = true
        else
          $(this).addClass('done')
  $(".floater .tab").click ->
    updatesteps(this)
  $(".list li").click ->
    updatesteps(this)
  

    