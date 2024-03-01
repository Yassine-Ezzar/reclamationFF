import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReclamationsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des réclamations'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('reclamations').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Erreur: ${snapshot.error}');
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['sujet']),
                subtitle: Text(data['description']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
