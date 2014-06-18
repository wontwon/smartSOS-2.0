function PledgedItemsController(pledgedItemsList, pledgedItemsView) {
  this.pledgedItemsList = pledgedItemsList;
  this.pledgedItemsView = pledgedItemsView;
}

PledgedItemsController.prototype = {
  addItem: function(item) {
    var parsedItem = this.htmlParser(item);
    var newItem = new Item(parsedItem.price, parsedItem.quantity, parsedItem.desc, parsedItem.img, parsedItem.id);

    var existingItem = this.pledgedItemsList.itemExists(newItem.id)
    if (existingItem.id === newItem.id) {
      existingItem.pledgeQuantity++;
    }
    else {
    this.pledgedItemsList.items.push(newItem);
    }

    this.pledgedItemsView.render(this.pledgedItemsList.items);
  },

  htmlParser: function(item) {
    parsedItemObject = {
      img: item.children[0].children[1].children[0].src,
      desc: item.children[0].children[2].children[0].innerHTML,
      price: item.children[0].children[3].children[0].children[1].innerHTML,
      quantity: item.children[0].children[3].children[1].children[1].innerHTML,
      id: item.children[0].children[3].children[2].children[1].value
    };
    return parsedItemObject;
  },

}
