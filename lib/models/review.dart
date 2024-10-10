class Review {
  int reviewId;
  String customerName;
  String reviewBody;
  String reviewStatus;

  Review({
    required this.reviewId,
    required this.customerName,
    required this.reviewBody,
    required this.reviewStatus
  });

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      reviewId: map['id'],
      customerName: map['name'],
      reviewBody: map['review'],
      reviewStatus: map['status'],
    );
  }

}
