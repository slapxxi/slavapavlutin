$ ->
  $.activate_links = ->
    $('a').each ->
      console.log $(location).attr('href')
      console.log $(@).attr('href')
      $(@).addClass 'active' if $(@).attr('href') == $(location).attr('pathname')

  $.activate_links()
