$ ->
  $('#add-task').on 'click', (event) ->
    event.preventDefault()
    newTask = {}
    input = $('#new-task').serializeArray()
    newTask[input[0].name] = input[0].value
    newTask[input[1].name] = input[1].value
    success = ->
      console.log "data posted"
    $.ajax(
      type: "POST",
      url: '/tasks',
      data: newTask,
      success: success,
      dataType: 'json'
    )
