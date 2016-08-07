$ ->
  $('#find-email').on 'click', (event) ->
    event.preventDefault()
    email = $("input[name='email']").val()
    $("input[name='email']").val('')
    success = () ->
      console.log "success"
    $.ajax(
      type: "POST",
      url: '/',
      data: { data: email },
      success: success,
      dataType: 'json'
    )
