List<Map<String, dynamic>> items = [
  {"name": "Product 1", "Price": "\$20.0", "count": 0},
  {"name": "Product 2", "Price": "\$20.0", "count": 0},
  {"name": "Product 3", "Price": "\$20.0", "count": 0},
  {"name": "Product 4", "Price": "\$20.0", "count": 0},
  {"name": "Product 5", "Price": "\$30.0", "count": 0},
  {"name": "Product 6", "Price": "\$30.0", "count": 0},
  {"name": "Product 7", "Price": "\$30.0", "count": 0},
];

int getTotalItemCount() {
  return items.where((item) => item['count'] > 0).length;
}
