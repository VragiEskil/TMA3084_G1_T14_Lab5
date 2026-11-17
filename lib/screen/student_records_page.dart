import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/student.dart';
import '../state/app_state.dart';

class StudentRecords extends StatefulWidget {
  const StudentRecords({super.key});

  @override
  State<StudentRecords> createState() => _StudentRecordsState();
}

class _StudentRecordsState extends State<StudentRecords> {
  int? _sortColumnIndex;
  bool _isAscending = true;

  Color _getStatusColor(String status, ColorScheme colorScheme) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green.shade700;
      case 'inactive':
        return colorScheme.error;
      default:
        return colorScheme.primary;
    }
  }

  List<Student> _getSortedStudents(List<Student> source) {
    final sorted = List<Student>.from(source);

    if (_sortColumnIndex == null) return sorted;

    sorted.sort((a, b) {
      int comparison;
      switch (_sortColumnIndex) {
        case 0: // Matric No. (numeric-aware comparison)
          final aNum = int.tryParse(a.matricNum);
          final bNum = int.tryParse(b.matricNum);
          if (aNum != null && bNum != null) {
            comparison = Comparable.compare(aNum, bNum);
          } else {
            comparison = Comparable.compare(a.matricNum, b.matricNum);
          }
          break;
        case 1: // Full Name
          comparison = Comparable.compare(
            a.name.toLowerCase(),
            b.name.toLowerCase(),
          );
          break;
        case 4: // CGPA
          comparison = Comparable.compare(a.cgpa, b.cgpa);
          break;
        default:
          comparison = 0;
      }
      return _isAscending ? comparison : -comparison;
    });

    return sorted;
  }

  void _onSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _isAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final sharedStudents = context.watch<AppState>().students;
    final records = _getSortedStudents(sharedStudents);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Academic Records (${records.length} Students)',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            'Tap Matric No., Full Name, or CGPA headers to sort ascending or descending.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
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
                        onSort: _onSort,
                      ),
                      DataColumn(
                        label: const Text(
                          'Full Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onSort: _onSort,
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
                        onSort: _onSort,
                      ),
                      const DataColumn(
                        label: Text(
                          'Status',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: records.map((student) {
                      final statusColor =
                          _getStatusColor(student.status, colorScheme);
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