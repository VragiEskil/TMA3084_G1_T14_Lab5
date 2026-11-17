// Class declarations & field
class Student {
  final String name;
  final String matricNum;
  final String programme;
  final String email;
  final double cgpa;
  final String status;

  // Declare a constructor
  // -> to initialize new Student instance
  Student({
    required this.name,
    required this.matricNum,
    required this.programme,
    required this.email,
    required this.cgpa,
    this.status = 'Active',
  });

  // Factory constructor
  // -> convert a Map into a Student object
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'] ?? '',
      matricNum: map['matric'] ?? '',
      programme: map['programme'] ?? '',
      email: map['email'] ?? '',
      cgpa: double.tryParse(map['cgpa'].toString()) ?? 0.0,
      status: map['status'] ?? 'Active',
    );
  }

  // Instance method
  // -> convert a Student object back into a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'matric': matricNum,
      'programme': programme,
      'email': email,
      'cgpa': cgpa.toString(),
      'status': status,
    };
  }
}
