function Pledge(id, name, price, url) {
    // below should be 'request_id'
    this.id = id;
    this.name = name;
    this.price = price;
    this.quantity = 1;
    this.url = url;
}