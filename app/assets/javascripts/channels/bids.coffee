App.bids = App.cable.subscriptions.create "BidsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # console.log(JSON.stringify(data['bid']))
    bidAmount = JSON.stringify(data['bid'])
    $('#bid-amount').text(bidAmount)
    # console.log($('#bid-amount').text())
    bidder = JSON.stringify(data['user'])
    $('#bidder-username').text(bidder)
