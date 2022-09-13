class SchoolClass {
  final String name;
  final String label;
  final int studentCount;

  const SchoolClass(
      {required this.name, required this.label, required this.studentCount});

  factory SchoolClass.fromJson(Map<String, dynamic> json) {
    return SchoolClass(
      name: json['name'],
      label: json['label'],
      studentCount: json['studentCount'],
    );
  }
}
