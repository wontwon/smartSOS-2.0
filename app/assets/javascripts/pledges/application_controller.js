var ApplicationController = function(requestedItemsList, pledgedItemsList) {
    this.requestedItemsList = requestedItemsList;
    this.pledgedItemsList = pledgedItemsList;
};

ApplicationController.prototype = {

  listenForPledge: function() {
    var self = this;
    $('.item-div').on('click', function(e) {
      self.pledgedItemsList.addItem(this);
    });
  }

}
