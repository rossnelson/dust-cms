jQuery.ajaxSetup beforeSend: (xhr) ->
  xhr.setRequestHeader "Accept", "text/javascript"

$(document).ready ->
  
  #Sub Menu/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  # side menu: show submenu
  $("#nav ul li").hover (->
    $(this).addClass "hover"
  ), ->
    $(this).removeClass "hover"

  #Fade In and Hide Flash Messages/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  $("#flash_notice,#flash_error,#status").fadeIn().delay(2000).fadeOut("slow")

  $(".tip").tipTip
    defaultPosition: "top"
    delay: 600
    fadeOut: 10
    edgeOffset: 8

  $(".slides").cycle
    timeout: 9000
    pause: true
    sync: true

  $("input[placeholder], textarea[placeholder]").placeholder()
