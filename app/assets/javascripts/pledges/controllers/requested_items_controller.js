function RequestedItemsController(requestedItemsList, requestedItemsView) {
  this.requestedItemsList = requestedItemsList;
  this.requestedItemsView = requestedItemsView;
}

RequestedItemsController.prototype = {
  init: function() {
    this.requestedItemsList.populate(requestModelData);
    this.requestedItemsView.render(this.requestedItemsList);
  }
}
