$(document).on('turbolinks:load', function () {

  // NAVBAR DROPDOWN MENU

  $('.dropdown-toggle').dropdown()

  // SCROLL TO TOP

  $(document).on('scroll', function () {
    if ($(window).scrollTop() > 100) {
      $('.scroll-top-wrapper').addClass('show')
    } else {
      $('.scroll-top-wrapper').removeClass('show')
    }
  })

  $('.scroll-top-wrapper').on('click', scrollToTop)

  function scrollToTop () {
    verticalOffset = typeof (verticalOffset) != 'undefined' ? verticalOffset : 0
    element = $('body')
    offset = element.offset()
    offsetTop = offset.top
    $('html, body').animate({
      scrollTop: offsetTop
    }, 500, 'linear')
  }

  // ALERT MESSAGE

  $('.alertMessage').show()
  // setTimeout(function() { $(".alertMessage").hide(); }, 1500)
  setTimeout(function () {
    // TODO: Fix this code below
    $('.alertMessage').fadeOut(5000)
  })
  // $('.message').show('fast').delay(2000).hide('fast')
  // $('.message').remove()

  // .fadeOut(300, function() { $(this).remove(); })

  // SEARCH/FILTER FUNCTION FOR ALL LISTINGS, MY PROPERTIES, MY BIDS

  var activeSystemClass = $('.list-group-item.active')

  // something is entered in search form
  $('#system-search').keyup(function () {
    var that = this

    // affect all table rows on in systems table
    var tableBody = $('.table-list-search tbody')
    var tableRowsClass = $('.table-list-search tbody tr')
    $('.search-sf').remove()
    tableRowsClass.each(function (i, val) {
      // Lower text for case insensitive
      var rowText = $(val).text().toLowerCase()
      var inputText = $(that).val().toLowerCase()
      if (inputText != '') {
        $('.search-query-sf').remove()
        tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "' + $(that).val() + '"</strong></td></tr>')
      } else {
        $('.search-query-sf').remove()
      }
      if (rowText.indexOf(inputText) == -1) {
        // hide rows
        tableRowsClass.eq(i).hide()
      } else {
        $('.search-sf').remove()
        tableRowsClass.eq(i).show()
      }
    })

    // all tr elements are hidden
    if (tableRowsClass.children(':visible').length == 0) {
      tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>')
    }
  })

  // TOOLTIPS

  // Method 1 - uses 'data-toggle' to initialize
  $('[data-toggle="myToolTip"]').tooltip()

  // Method 2 - uses the id, class or native tag, could use .btn as class
  $('button').tooltip()

  // options set in JS by class
  $('.tip-top').tooltip({
    placement: 'top'
  })

  $('.tip-right').tooltip({
    placement: 'right'
  })

  $('.tip-bottom').tooltip({
    placement: 'bottom'
  })

  $('.tip-left').tooltip({
    placement: 'left',
    html: true
  })

  $('.tip-auto').tooltip({
    placement: 'auto',
    html: true
  })


// SCROLL DOWN

$(function() {
     $('.scroll-down').click(function() {
       $('html, body').animate({scrollTop: $('section.ok').offset().top }, 'slow');
       return false;
     });
});

//CAROUSEL OPTIONS

$('#quote-carousel').carousel({
  pause: true,
  interval: 8000,
});

})
