class Room {
  final int id;
  final String code;
  final String name;
  final List<int> memberIds;
  final int createdByUserId;
  final DateTime createdAt;

  Room({
    required this.id,
    required this.code,
    required this.name,
    required this.memberIds,
    required this.createdByUserId,
    required this.createdAt,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      memberIds: List<int>.from(json['member_ids'] ?? []),
      createdByUserId: json['created_by_user_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'member_ids': memberIds,
      'created_by_user_id': createdByUserId,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
