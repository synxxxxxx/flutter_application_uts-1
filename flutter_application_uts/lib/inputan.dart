import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedCourse = '';
  String _taskDescription = '';
  DateTime _deadline = DateTime.now();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(context, {
        'selectedCourse': _selectedCourse,
        'taskDescription': _taskDescription,
        'deadline': _deadline,
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _deadline,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _deadline)
      setState(() {
        _deadline = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Inputan Tugas Kuliah'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Mata Kuliah'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mata Kuliah harus diisi';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _selectedCourse = value!;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Deskripsi Tugas'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi Tugas harus diisi';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _taskDescription = value!;
                    },
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      Text('Deadline Tugas:'),
                      SizedBox(width: 20.0),
                      Text("${_deadline.toLocal()}".split(' ')[0]),
                      SizedBox(width: 20.0),
                      Expanded(
                        // Tambahkan Expanded di sini
                        child: ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: Text('Pilih Tanggal'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Simpan'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
