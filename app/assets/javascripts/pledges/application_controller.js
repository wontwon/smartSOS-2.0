var ApplicationController = function(requestedItemsController, pledgedItemsController) {
    this.requestedItemsController = requestedItemsController;
    this.pledgedItemsController = pledgedItemsController;
};

ApplicationController.prototype = {

  listenForPledge: function() {
    var self = this;
    $('.item-div').on('click', function(e) {
      e.preventDefault();
      self.pledgedItemsController.addItem(this);
      self.pledgedItemsController.pledgedItemsView.render(self.pledgedItemsController.pledgedItemsList.items);

      self.requestedItemsController.updateQuantity(this);
       // this.requestedItemsView.render(this,request)
    });
  }

}
