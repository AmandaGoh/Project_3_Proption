$( document ).on('turbolinks:load', function() {
  // milliseconds from ruby (Time.now.to_f)

  var startTime = new Date()
  var endTime = 1479138831.112253 * 1000

  initializeClock(startTime, endTime)

  function initializeClock (startTime, endTime) {
    var timeinterval = setInterval(function(){
      var t = getTimeRemaining(startTime, endTime)
      $('.bidtime').html(t.hours + ':' + t.minutes + ':' + t.seconds)
    }, 1000)
  }

  function getTimeRemaining(startTime, endTime){
    startTime = new Date()
    var auctionDate = startTime
    var expiryDate = new Date(endTime)

    var t = expiryDate - auctionDate

    var seconds = Math.floor( (t/1000) % 60 )
    var minutes = Math.floor( (t/1000/60) % 60 )
    var hours = Math.floor( (t/(1000*60*60)) % 24 )
    var days = Math.floor( t/(1000*60*60*24) )

        return {
          'total': t,
          'days': days,
          'hours': hours,
          'minutes': minutes,
          'seconds': seconds
        }
  }

})
