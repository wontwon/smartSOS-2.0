function RequestedItemsView() {};

RequestedItemsView.prototype = {
  render: function(requestedItemsList) {
    var requestedItems = requestedItemsList.requests

    $('.requested-items-total').text(requestedItemsList.total.toFixed(2));

    $('.requested-items-list').empty();

    for(var i=0; i < requestedItems.length; i++) {
      var requestedItemFormat = '<div class="requested-item" data-id="';
      requestedItemFormat += requestedItems[i].id;
      requestedItemFormat += '">';
      requestedItemFormat += '<div class="requested-item-name">';
      requestedItemFormat += requestedItems[i].name;
      requestedItemFormat += '</div>';
      requestedItemFormat += '<div class="requested-item-quantity">';
      requestedItemFormat += requestedItems[i].quantity;
      requestedItemFormat += '</div>';
      requestedItemFormat += '<div class="requested-item-price">$';
      requestedItemFormat += requestedItems[i].price;
      requestedItemFormat += '</div></div>';
      $('.requested-items-list').append(requestedItemFormat);
    }
  }
}
