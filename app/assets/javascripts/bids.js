$(document).on('turbolinks:load', function () {
  $('#bid-form')
    .on('ajax:success', function (e, data, status) {
      // console.log(data.status)
      if (data.status === 'fail') {
        $('#bid-message').html('<p>' + data.message + '</p>').removeClass().addClass('fail-bid-message')
      } else if (data.status === 'successful') {
        $('#bid-message').html('<p>' + data.message + '</p>').removeClass().addClass('success-bid-message')
      }
    })
})
