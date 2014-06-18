$( document ).ready(function() {

  requestedItemsController = new RequestedItemsController(new RequestedItemsList);

  pledgedItemsController = new PledgedItemsController(new PledgedItemsList, new PledgedItemsView);

  appController = new ApplicationController(requestedItemsController, pledgedItemsController);
  appController.listenForPledge();

});
