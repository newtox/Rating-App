class User {
  final int id;
  final String name;
  final String email;
  final bool isGlobalAdmin;
  final List<int> adminRoomIds;
  final String? avatarUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.isGlobalAdmin,
    required this.adminRoomIds,
    this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    isGlobalAdmin: json['is_global_admin'] ?? false,
    adminRoomIds: List<int>.from(json['admin_room_ids'] ?? []),
    avatarUrl: json['avatar_url'],
  );
}
