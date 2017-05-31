timer = () ->
  endTimer = false
  hour   = + $('#hour'  ).html()
  minute = + $('#minute').html()
  second = + $('#second').html()
  if (second > 0)
    second--
  else
    second = 60
    if (minute > 0)
      minute--
    else
      minute = 60
      if (hour > 0)
        hour--
      else
        endTimer = true
  if(endTimer)
    #значит время истекло
    clearInterval(timerInterval)
    console.log('Таймер закончил работу!')
  else
    # время не истекло, поэтому меняем его
    $('#hour'  ).html(hour)
    $('#minute').html(minute)
    $('#second').html(second)

clickPlay = () ->
  if (isTimerRun)
    clearInterval(timerInterval)
  window.timerInterval = setInterval(timer, 1000)
  window.isTimerRun = true

clickRepeat = () ->
  $('#hour'  ).html(initialHour)
  $('#minute').html(initialMinute)
  $('#second').html(initialSecond)
  clearInterval(timerInterval)

clickSet = (e, item) ->
  value = $(item).parent().find('input').val()
  reg = /(\d+):(\d+):(\d+)/g
  match = reg.exec(value)
  window.initialHour   = + match[1]
  window.initialMinute = + match[2]
  window.initialSecond = + match[3]
  clickRepeat()

timerReady = () ->
  # поставленные значения (нужны для кнопки повтора)
  window.initialHour   = + $('#hour'  ).html()
  window.initialMinute = + $('#minute').html()
  window.initialSecond = + $('#second').html()
  window.isTimerRun = false
  # регистрация обработчиков нажатий на кнопки
  $('#timer-play').on 'click', ->
    clickPlay()
  $('#timer-pause').on 'click', ->
    clearInterval(window.timerInterval)
  $('#timer-repeat').on 'click', ->
    clickRepeat()
  $('#timer-set').on 'click', (e, item = this ) ->
    clickSet(e, item)

$(document).on 'ready turbolinks:load', ->
  timerReady()
