
class Student {
  final int id;
  final String name;
  bool isPresent;

  Student({
    required this.id,
    required this.name,
    this.isPresent = false,
  });

  
  Student copyWith({
    int? id,
    String? name,
    bool? isPresent,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      isPresent: isPresent ?? this.isPresent,
    );
  }

  @override
  String toString() => 'Student(id: $id, name: $name, isPresent: $isPresent)';
}
