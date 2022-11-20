part of '../../navigation_hub.dart';

NumberTrivia parseNumberModel(responseBody) {
  final parsed = jsonDecode(responseBody);
  return NumberTrivia.fromJson(parsed);
}

class NumberTrivia extends Equatable {
  final String text;
  final int number;

  const NumberTrivia({
    required this.text,
    this.number = 0,
  });

  @override
  List<Object> get props => [
        text,
        number,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'number': number,
    };
  }

  factory NumberTrivia.fromMap(Map<String, dynamic> map) {
    return NumberTrivia(
      text: map['text'] as String,
      number: map['number'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory NumberTrivia.fromJson(String source) =>
      NumberTrivia.fromMap(json.decode(source) as Map<String, dynamic>);
}
