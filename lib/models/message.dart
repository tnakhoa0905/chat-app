// ignore_for_file: public_member_api_docs, sort_constructors_first
class Message {
  /// ID of the message
  final String id;

  /// ID of the user who posted the message
  final String profileId;

  /// Text content of the message
  final String content;

  /// Date and time when the message was created
  final DateTime createdAt;

  /// Whether the message is sent by the user or not.
  final bool isMine;
  final String idChat;
  Message({
    required this.id,
    required this.profileId,
    required this.content,
    required this.createdAt,
    required this.isMine,
    required this.idChat,
  });

  Message.fromMap(
    Map<String, dynamic> map,
    String myUserId,
  )   : id = map['id'],
        profileId = map['profile_id'],
        content = map['content'],
        createdAt = DateTime.parse(map['created_at']),
        isMine = myUserId == map['profile_id'],
        idChat = map['id_chat'];
}
