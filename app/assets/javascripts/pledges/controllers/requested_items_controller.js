function RequestedItemsController(requestedItemsList, requestedItemsView) {
}

RequestedItemsController.prototype = {
  updateQuantity: function(item) {
    var requestItemId = item.children[0].children[3].children[2].children[1].value
    console.log(requestItemId);
    // this.requestedItemsList.existingItem.requestQuantity--;
  }
}
