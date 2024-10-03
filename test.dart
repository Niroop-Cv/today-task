import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final members;

  DetailsPage({required this.members});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Details'),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(members[index]['name']!),
            subtitle: Text('Age: ${members[index]['age']}'),
          );
        },
      ),
    );
  }
}
