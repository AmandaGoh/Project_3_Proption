$( document ).on('turbolinks:load', function() {
  // milliseconds from ruby (Time.now.to_f)

  var startTime = new Date()
  var endTime = $('#duration').text()* 1000

  var listingID = $('.listing-id').text()

  // console.log($('#listed-status').text())
  //
  if ($('#listed-status').text() == 1) {
    initializeClock(startTime, endTime, listingID)
  }
  else if ($('#listed-status').text() == 2) {
    disableBidding()
  }
  else if ($('#listed-status').text() == 3) {
    disableBidding()
  }
  // console.log($('#duration').text())

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

      $('.bidtime' + listingID).text(hours + ' : ' + minutes + ' : ' + seconds)


      if (t.total <= 0 ) {
        clearInterval(timeinterval)
        disableBidding()
        // trigger submit of invisible form
        if ($('#listed-status').text() == 1){
          $('#listed-status-form' +listingID).submit()
          $('#listed-status').text(2)
        }
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

  function disableBidding(){
    $('.bidtime' + listingID).text('Bidding has ended')
    $('.submit-button' + listingID).prop('disabled', true)
    $('.modal-content').addClass('listing-greyed-out')
    $('#bid-message').remove()
    $('.bid-input' + listingID).remove()
  }

})
