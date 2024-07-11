import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:HrManagement/data/models/message/message_model.dart';

class ChatService extends ChangeNotifier {
// get instance of auth and firestore
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

// SEND MESSAGE |
  Future<void> sendMessage(String receiverId, String message) async {
// get current user info |
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now(); //to show in order

// create a new message |
    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      timestamp: timestamp,
      message: message,
    );

// construct chat room id from current user id and receiver id (sorted to ensure uniqueness) |
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); //sm = ms
    String chatRoomId = ids.join("_");
    //add new messages to database
    await _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

// GET MESSAGES |
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
// construct chat room id from user ids (sorted to ensure it matches the id sendeinf
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
