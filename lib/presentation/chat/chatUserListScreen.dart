import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr_app_redo/presentation/common/bottom_navigation_bar.dart';
import 'chatScreen.dart';

class ChatUserListScreen extends StatefulWidget {
  const ChatUserListScreen({super.key});

  @override
  State<ChatUserListScreen> createState() => _ChatUserListScreenState();
}

class _ChatUserListScreenState extends State<ChatUserListScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Users'),
        automaticallyImplyLeading: false,
      ),
      body: _buildUserList(),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }

  // Build a list of users except for the current logged-in user
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('user').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error loading users'));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No users found'));
        }

        List<DocumentSnapshot> userDocs = snapshot.data!.docs;
        String currentUserEmail = _auth.currentUser?.email ?? '';
        return ListView(
          children: userDocs
              .where((doc) => doc['email'] != currentUserEmail)
              .map((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }

  // Build individual user list items
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    if (_auth.currentUser!.email != data['email']) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverUserEmail: data['email'],
                receiverUserId: data['uid'],
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              // BoxShadow(
              //   color: Colors.grey.withOpacity(0.5),
              //   spreadRadius: 2,
              //   blurRadius: 5,
              //   offset: const Offset(0, 3),
              // ),
            ],
          ),
          child: Text(
            data['email'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
