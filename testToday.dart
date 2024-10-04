import 'package:flutter/material.dart';

class TheTest extends StatefulWidget {
  const TheTest({super.key});

  @override
  State<TheTest> createState() => _TheTestState();
}

class _TheTestState extends State<TheTest> {
  List members = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void addMember() {
    String name = '';
    String age = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Member'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'Name'),
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Age'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    age = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the age';
                    }
                    return null;
                  },
                ),
              ],
            ),
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
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    members.add({'name': name, 'age': age});
                  });
                  Navigator.of(context).pop();
                }
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
