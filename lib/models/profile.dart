class Profile {
  final String id;
  final String name;
  final String avt;
  final bool isActive;
  final int role;
  Profile({
    required this.id,
    required this.name,
    required this.avt,
    required this.isActive,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'avt': avt,
      'isActive': isActive,
      'role': role,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as String,
      name: map['name'] as String,
      avt: map['avt'] as String,
      isActive: map['isActive'] as bool,
      role: map['role'] as int,
    );
  }
}
