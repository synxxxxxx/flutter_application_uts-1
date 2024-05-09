import 'package:flutter/material.dart';
import 'inputan.dart'; // Import file inputan.dart
import 'catatan.dart'; // Import file catatan.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Inputan Tugas Kuliah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> _tasks = [];
  List<Map<String, dynamic>> _notes = [];

  void _addTask(Map<String, dynamic> taskData) {
    setState(() {
      _tasks.add(taskData);
    });
  }

  void _addNote(Map<String, dynamic> noteData) {
    setState(() {
      _notes.add(noteData);
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _removeNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
        backgroundColor: Color.fromARGB(255, 101, 219, 101),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("path_to_your_wallpaper_image"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TaskForm(), // Sesuaikan dengan tampilan berikutnya Anda
                          ),
                        ); // Logika navigasi ke tampilan selanjutnya untuk tugas kuliah
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'Gambar/Tugas.jpeg',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Tugas Kuliah',
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 60), // Jarak antara gambar
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CatatanPage(), // Sesuaikan dengan tampilan berikutnya Anda
                          ),
                        ); // Logika navigasi ke tampilan selanjutnya untuk catatan
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'Gambar/cttt1.png',
                            width: 170,
                            height: 160,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Catatan',
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    final task = _tasks[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen[100],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        title: Text('Mata Kuliah: ${task['selectedCourse']}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Deskripsi Tugas: ${task['taskDescription']}'),
                            Text('Deadline: ${task['deadline'].toLocal()}'
                                .split(' ')[0]),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.share),
                              onPressed: () {
                                showMenu(
                                  context: context,
                                  position: RelativeRect.fill,
                                  items: [
                                    PopupMenuItem(
                                      child: ListTile(
                                        leading: Icon(Icons.link),
                                        title: Text('Salin Tugas'),
                                        onTap: () {
                                          // Tambahkan logika salin tugas di sini
                                        },
                                      ),
                                    ),
                                    PopupMenuItem(
                                      child: ListTile(
                                        leading: Icon(Icons.email),
                                        title: Text('Kirim melalui Email'),
                                        onTap: () {
                                          // Tambahkan logika kirim melalui email di sini
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _removeTask(index);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.notifications),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Notifikasi"),
                                      content: Text("Pilih opsi notifikasi:"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            // Tambahkan logika notifikasi di sini
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Pengingat"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Tambahkan logika notifikasi di sini
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Penting"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _notes.length,
                        itemBuilder: (context, index) {
                          final note = _notes[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.lightGreen[100],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              title: Text('Catatan: ${note['catatan']}'),
                              subtitle: Text(
                                  'Tanggal: ${note['tglCatatan'].toLocal()}'
                                      .split(' ')[0]),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  _removeNote(index);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                color: Colors.lightGreen[100],
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text('Tambahkan Tugas'),
                      onTap: () {
                        Navigator.pop(context); // Tutup modal
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskForm(),
                          ),
                        ).then((value) {
                          if (value != null && value is Map<String, dynamic>) {
                            _addTask(value);
                          }
                        });
                      },
                    ),
                    ListTile(
                      title: Text('Tambahkan Catatan'),
                      onTap: () {
                        Navigator.pop(context); // Tutup modal
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CatatanPage(),
                          ),
                        ).then((value) {
                          if (value != null && value is Map<String, dynamic>) {
                            _addNote(value);
                          }
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        tooltip: 'Tambah Tugas/Catatan',
        child: Icon(Icons.add),
      ),
    );
  }
}
