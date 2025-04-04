class Rating {
  final int id;
  final int userId;
  final int roomId;
  final String criteria;
  final int score;
  final DateTime submittedAt;

  Rating({
    required this.id,
    required this.userId,
    required this.roomId,
    required this.criteria,
    required this.score,
    required this.submittedAt,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['id'],
      userId: json['user_id'],
      roomId: json['room_id'],
      criteria: json['criteria'],
      score: json['score'],
      submittedAt: DateTime.parse(json['submitted_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'room_id': roomId,
      'criteria': criteria,
      'score': score,
      'submitted_at': submittedAt.toIso8601String(),
    };
  }
}
