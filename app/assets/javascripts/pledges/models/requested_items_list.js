function RequestedItemsList() {
  this.items = [];
}

RequestedItemsList.prototype = {
  itemArray: function() {
    return $('.item-div');
  },

  grabItems: function() {
    var items = this.itemArray();
    for(var i=0; i<items.length; i++) {
      var parsedItem = this.htmlParser(items[i]);
      this.items.push(new Item(parsedItem.price, parsedItem.quantity, parsedItem.desc, parsedItem.img, parsedItem.id));
      console.log(this.items);
    }
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

  loadItems: function() {
    this.grabItems();
  }

};
