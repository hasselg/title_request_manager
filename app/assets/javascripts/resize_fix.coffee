
onResize = () ->
  # Pad the body after a resize
  $("body").css("padding-top", $(".navbar-fixed-top").height() + 60)

$(window).resize(onResize)

$ ->
  onResize()
