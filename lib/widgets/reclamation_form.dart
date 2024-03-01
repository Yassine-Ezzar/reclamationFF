import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/reclamation.dart';

class ReclamationForm extends StatelessWidget {
  final TextEditingController sujetController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void submitReclamation(BuildContext context) {
    FirebaseFirestore.instance.collection('reclamations').add({
      'sujet': sujetController.text,
      'description': descriptionController.text,
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soumettre une réclamation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: sujetController,
              decoration: InputDecoration(labelText: 'Sujet'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => submitReclamation(context),
              child: Text('Soumettre'),
            ),
          ],
        ),
      ),
    );
  }
}
