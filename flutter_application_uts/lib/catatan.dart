import 'package:flutter/material.dart';

class CatatanPage extends StatefulWidget {
  @override
  _CatatanPageState createState() => _CatatanPageState();
}

class _CatatanPageState extends State<CatatanPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _catatan = '';
  DateTime _tglCatatan = DateTime.now();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(context, {
        'catatan': _catatan,
        'tglCatatan': _tglCatatan,
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _tglCatatan,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _tglCatatan)
      setState(() {
        _tglCatatan = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Catatan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Catatan'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Catatan harus diisi';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _catatan = value!;
                    },
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Tanggal Catatan:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () => _selectDate(context),
                        child: Text('Pilih Tanggal'),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "${_tglCatatan.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 16),
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
