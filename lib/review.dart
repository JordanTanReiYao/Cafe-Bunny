class SingleReview {
  String date, review, username;
  double rating;
  SingleReview(this.date, this.review, this.username, this.rating);
  toJson() {
    return {
      'date': date,
      'rating': rating,
      'review': review,
      'username': username,
    };
  }
}
