$ ->
  $.activate_links = ->
    $('a').each ->
      console.log $(location).attr('href')
      console.log $(@).attr('href')
      $(@).addClass 'active' if $(@).attr('href') == $(location).attr('pathname')

  $.activate_confirmations = ->
    $('[data-confirm]').on 'click', ->
      confirm $(@).attr('data-confirm')

  $.activate_links()
  $.activate_confirmations()
