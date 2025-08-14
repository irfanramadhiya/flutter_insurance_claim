class Claim {
  final int userId;
  final int id;
  final String title;
  final String body;

  Claim({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Claim.fromJson(Map<String, dynamic> json, {String localPath = ''}) {
    return Claim(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
