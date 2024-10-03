import 'package:flutter/material.dart';

class TheTest extends StatefulWidget {
  const TheTest({super.key});

  @override
  State<TheTest> createState() => _TheTestState();
}

class _TheTestState extends State<TheTest> {
  List members = [];

  void addMember() {
    String name = '';
    String age = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Member'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Age'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  age = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty && age.isNotEmpty) {
                  setState(() {
                    members.add({'name': name, 'age': age});
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Member List"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(members[index]['name']!),
                    subtitle: Text('Age: ${members[index]['age']}'),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addMember,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
