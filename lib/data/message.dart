class Message {
  final String text;
  final int count;
  final DateTime date;

  Message(this.text, this.count, this.date);

  Message.fromJson(Map<dynamic, dynamic> json)
      : date = DateTime.parse(json['date'] as String),
        count = json['count'] as int,
        text = json['text'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'date': date.toString(),
        'count': count,
        'text': text
      };
}
