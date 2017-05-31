@datepicker_activation = ->
  window.datepicker_activation_by_item($(document))
@datepicker_activation_by_item = (item)->
  item.find('.datepicker').datetimepicker({locale: 'ru', format: 'DD.MM.YYYY'})
@timepicker_activation = ->
  window.timepicker_activation_by_item($(document))
@timepicker_activation_by_item = (item)->
  item.find('.timepicker input').each () ->
    $(this).timepicker({
      minuteStep: 1,
      showSeconds: true,
      showMeridian: false,
      defaultTime: false
      })

app_ready_f = ->
  window.datepicker_activation()
  window.timepicker_activation()

$(document).ready app_ready_f
# $(document).on 'page:load', app_ready_f
$(document).on 'turbolinks:load', app_ready_f
