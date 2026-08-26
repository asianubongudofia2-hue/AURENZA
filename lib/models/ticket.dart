class Ticket {
  final int id;
  final int userId;
  final String title;
  final String body;

  Ticket({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}
