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

timerReady = () ->
  # поставленные значения (нужны для кнопки повтора)
  initialHour   = + $('#hour'  ).html()
  initialMinute = + $('#minute').html()
  initialSecond = + $('#second').html()
  window.isTimerRun = false
  # обработчики нажатий на кнопки
  $('#timer-play').on 'click', ->
    if (isTimerRun)
      clearInterval(timerInterval)
    window.timerInterval = setInterval(timer, 1000)
    window.isTimerRun = true
  $('#timer-pause').on 'click', ->
    clearInterval(timerInterval)
  $('#timer-repeat').on 'click', ->
    $('#hour'  ).html(initialHour)
    $('#minute').html(initialMinute)
    $('#second').html(initialSecond)
    clearInterval(timerInterval)

$(document).on 'ready turbolinks:load', ->
  timerReady()
