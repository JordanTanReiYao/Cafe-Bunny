class SingleReview {
  String date, review, username;
  SingleReview(this.date, this.review, this.username);
  toJson() {
    return {
      'date': date,
      'review': review,
      'username': username,
    };
  }
}
