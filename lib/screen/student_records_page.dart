import 'package:flutter/material.dart';

import '../models/student.dart';

class StudentRecordsPage extends StatefulWidget {
  const StudentRecordsPage({super.key});

  @override
  State<StudentRecordsPage> createState() => _StudentRecordsPageState();
}

class _StudentRecordsPageState extends State<StudentRecordsPage> {
  // 10 sample student records using your group's Student model
  final List<Student> _initialStudents = [
    Student(
      name: 'Aiman Hakim',
      matricNum: '83012',
      programme: 'Software Engineering',
      email: '83012@siswa.unimas.my',
      cgpa: 3.65,
      status: 'Active',
    ),
    Student(
      name: 'Nurul Izzah',
      matricNum: '83045',
      programme: 'Network Computing',
      email: '83045@siswa.unimas.my',
      cgpa: 3.82,
      status: 'Active',
    ),
    Student(
      name: 'Darren Tan',
      matricNum: '83108',
      programme: 'Multimedia Computing',
      email: '83108@siswa.unimas.my',
      cgpa: 3.12,
      status: 'Active',
    ),
    Student(
      name: 'Siti Aisyah',
      matricNum: '83154',
      programme: 'Software Engineering',
      email: '83154@siswa.unimas.my',
      cgpa: 3.91,
      status: 'Dean List',
    ),
    Student(
      name: 'Brandon Wong',
      matricNum: '83201',
      programme: 'Information Systems',
      email: '83201@siswa.unimas.my',
      cgpa: 2.78,
      status: 'Probation',
    ),
    Student(
      name: 'Farah Nabilah',
      matricNum: '83267',
      programme: 'Computational Science',
      email: '83267@siswa.unimas.my',
      cgpa: 3.45,
      status: 'Active',
    ),
    Student(
      name: 'Kevin Lim',
      matricNum: '83319',
      programme: 'Software Engineering',
      email: '83319@siswa.unimas.my',
      cgpa: 3.58,
      status: 'Active',
    ),
    Student(
      name: 'Dayangku Sofea',
      matricNum: '83380',
      programme: 'Network Computing',
      email: '83380@siswa.unimas.my',
      cgpa: 3.74,
      status: 'Active',
    ),
    Student(
      name: 'Hafizuddin Rosli',
      matricNum: '83412',
      programme: 'Multimedia Computing',
      email: '83412@siswa.unimas.my',
      cgpa: 2.95,
      status: 'Active',
    ),
    Student(
      name: 'Michelle Chua',
      matricNum: '83499',
      programme: 'Information Systems',
      email: '83499@siswa.unimas.my',
      cgpa: 3.88,
      status: 'Dean List',
    ),
  ];

  late List<Student> _records;
  int? _sortColumnIndex;
  bool _isAscending = true;

  @override
  void initState() {
    super.initState();
    _records = List<Student>.from(_initialStudents);
  }

  void _onSort<T extends Comparable<Object>>(
    T Function(Student student) getField,
    int columnIndex,
    bool ascending,
  ) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _isAscending = ascending;

      _records.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);
        return ascending
            ? Comparable.compare(aValue, bValue)
            : Comparable.compare(bValue, aValue);
      });
    });
  }

  Color _getStatusColor(String status, ColorScheme colorScheme) {
    switch (status) {
      case 'Dean List':
        return Colors.green.shade700;
      case 'Probation':
        return colorScheme.error;
      default:
        return colorScheme.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // NOTE: If your group's MainScreen does NOT provide a Scaffold/AppBar,
    // wrap this Padding in `Scaffold(appBar: AppBar(title: const Text('Student Records')), body: ...)`
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Academic Records (${_records.length} Students)',
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'Tap Matric No., Full Name, or CGPA headers to sort ascending or descending.',
            style: Theme.of(context).textTheme.bodySmall
                ?.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Card(
              elevation: 1,
              clipBehavior: Clip.antiAlias,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    sortColumnIndex: _sortColumnIndex,
                    sortAscending: _isAscending,
                    headingRowColor: WidgetStateProperty.all(
                      colorScheme.surfaceContainerHighest,
                    ),
                    columns: [
                      DataColumn(
                        label: const Text(
                          'Matric No.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onSort: (columnIndex, ascending) => _onSort<String>(
                          (s) => s.matricNum,
                          columnIndex,
                          ascending,
                        ),
                      ),
                      DataColumn(
                        label: const Text(
                          'Full Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onSort: (columnIndex, ascending) => _onSort<String>(
                          (s) => s.name.toLowerCase(),
                          columnIndex,
                          ascending,
                        ),
                      ),
                      const DataColumn(
                        label: Text(
                          'Programme',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const DataColumn(
                        label: Text(
                          'Email',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: const Text(
                          'CGPA',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        numeric: true,
                        onSort: (columnIndex, ascending) =>
                            _onSort<num>((s) => s.cgpa, columnIndex, ascending),
                      ),
                      const DataColumn(
                        label: Text(
                          'Status',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: _records.map((student) {
                      final statusColor = _getStatusColor(
                        student.status,
                        colorScheme,
                      );
                      return DataRow(
                        cells: [
                          DataCell(Text(student.matricNum)),
                          DataCell(Text(student.name)),
                          DataCell(Text(student.programme)),
                          DataCell(Text(student.email)),
                          DataCell(Text(student.cgpa.toStringAsFixed(2))),
                          DataCell(
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: statusColor.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                student.status,
                                style: TextStyle(
                                  color: statusColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
