import 'dart:convert';

// modelo de regra de negócio, sobre quais dados serão armazenados

class CardInfo {
  final int id;
  final String text;

  CardInfo({required this.id, required this.text,});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
    };
  }

  factory CardInfo.fromMap(Map<String, dynamic> map) {
    return CardInfo(
      id: map['id']?.toInt() ?? 0,
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CardInfo.fromJson(String source) => CardInfo.fromMap(json.decode(source));

  CardInfo copyWith({
    int? id,
    String? text,
    DateTime? date,
  }) {
    return CardInfo(
      id: id ?? this.id,
      text: text ?? this.text,
    );
  }
}
