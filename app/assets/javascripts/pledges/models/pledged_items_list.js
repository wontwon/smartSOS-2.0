function PledgedItemsList() {
  this.items = [];
}

PledgedItemsList.prototype = {
  itemExists: function(item_id) {
    for(var i=0; i < this.items.length; i++) {
      if (item_id === this.items[i].id) {
        return this.items[i];
      }
    }
    return false;
  },

  // updateItemQuantity: function(item_id) {

  // }
}
