class Todo {
  final String title;
  final String description;
  final List<String> sublist1;
  final List<String> sublist2;
  final String property1;
  final String property2;

  Todo({
    required this.title,
    required this.description,
    required this.sublist1,
    required this.sublist2,
    required this.property1,
    required this.property2,
  });

  Todo copyWith({
    String? title,
    String? description,
    List<String>? sublist1,
    List<String>? sublist2,
    String? property1,
    String? property2,
  }) {
    return Todo(
      title: title ?? this.title,
      description: description ?? this.description,
      sublist1: sublist1 ?? this.sublist1,
      sublist2: sublist2 ?? this.sublist2,
      property1: property1 ?? this.property1,
      property2: property2 ?? this.property2,
    );
  }
}
