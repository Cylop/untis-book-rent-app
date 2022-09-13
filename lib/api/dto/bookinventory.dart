class BookInventory {
  final String isbn;
  final int amount;

  const BookInventory({required this.isbn, required this.amount});

  factory BookInventory.fromJson(Map<String, dynamic> json) {
    return BookInventory(
      isbn: json['isbn'],
      amount: json['amount'],
    );
  }
}
