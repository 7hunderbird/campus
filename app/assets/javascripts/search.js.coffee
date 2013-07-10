$(document).ready ->
  delay = (->
    timer = 0
    (callback, ms) ->
      clearTimeout timer
      timer = setTimeout(callback, ms)
  )()

  $("#search").keyup (e) ->
    if e.which <= 90 and e.which >= 48 or e.which == 8
      query = $(this).val()
      $(this).addClass("spinner")
      delay (->
        $.get "/search",
          query: query,
          dataType: "script"
      ), 300
      if query is ""
        $(this).removeClass("spinner")
        $("#search_results").remove()

   $("#search").blur ->
     $(this).removeClass("spinner")
     $(document.body).on "click", (e) ->
      unless $(e.target).is('li.search-item')
        $("#search_results").hide()

  $("#search").keypress (e) ->
    code = ((if e.keyCode then e.keyCode else e.which))
    window.location.href = $("#search_results > ul > li.active").data("url") if code is 13

  $(document.body).on "click", "li.search-item", ->
    window.location.href = $(this).data("url")

  $(document.body).on "mouseover", "li.search-item", ->
    $("li.search-item").removeClass("active")
    $(this).addClass("active")

  $(document.body).on "keydown keyup keypress", "#search", (e) ->
    code = ((if e.keyCode then e.keyCode else e.which))
    if code is 9
      e.preventDefault()
      val = $("#search_results > ul > li.active").data('name')
      $(this).val(val)


  $(document.body).on "focus keydown", "#search", (e) ->
    code = ((if e.keyCode then e.keyCode else e.which))
    if code is 40
      e.preventDefault()
      $("#search_results").show()
      active = $("#search_results > ul > li.active")
      active.removeClass('active')
      if active.next().hasClass('search-heading') then active.next().next().addClass('active') else active.next().addClass('active')
      if active.length is 0
        $("#search_results > ul > li.search-item:first").addClass('active')
    if code is 38
      e.preventDefault()
      $("#search_results").show()
      active = $("#search_results > ul > li.active")
      active.removeClass('active')
      if active.prev().hasClass('search-heading') then active.prevAll(':eq(1)').addClass('active') else active.prev("li").addClass('active')
      if active.length is 0
        $("#search_results > ul > li.search-item:last").addClass('active')
