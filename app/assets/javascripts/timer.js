$( document ).on('turbolinks:load', function() {
  // milliseconds from ruby (Time.now.to_f)

  var startTime = new Date()
  var endTime = $('#duration').text()* 1000

  var listingID = $('.listing-id').text()
  //
  // console.log($('.listing-id').text())
  // console.log($('#duration').text())

  initializeClock(startTime, endTime, listingID)

  function initializeClock (startTime, endTime, listingID) {
    var timeinterval = setInterval(function(){
      var t = getTimeRemaining(startTime, endTime)
      // console.log(t.total)
      if (t.hours < 10) {
        hours = '0' + t.hours
      } else {
        hours = t.hours
      }

      if (t.minutes <10) {
        minutes = '0' + t.minutes
      } else {
        minutes = t.minutes
      }

      if (t.seconds <10) {
        seconds = '0' + t.seconds
      } else {
        seconds = t.seconds
      }

      $('.bidtime').text(hours + ' : ' + minutes + ' : ' + seconds)

      if (t.total <= 0) {
        clearInterval(timeinterval)
        $('.bidtime').text('Bid has ended')
        $('.submit-button' + listingID).prop('disabled', true)
        $('#bid-message').remove()
      }

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
