import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurants/firestore/models/gd_user.dart';
import 'package:restaurants/firestore/models/item.dart';
import 'package:restaurants/firestore/models/message.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final String chatsCollectionName = 'Chats';
  final String messagesCollectionName = 'Messages';

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  createUserInFs(GdUser gdUser) async {
    firebaseFirestore.collection('users').doc(gdUser.id).set(gdUser.toMap());
  }

  Future<GdUser> getUserFromFs(String id) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firebaseFirestore.collection('users').doc(id).get();
    Map<String, dynamic> userData = document.data();
    userData['id'] = document.id;
    GdUser gdUser = GdUser.fromMap(userData);
    return gdUser;
  }

  ///////Chat
  ///
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getUsersFromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firebaseFirestore.collection('users').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> query =
        querySnapshot.docs;
    return query;
  }

  sendMessage(Message message) async {
    message.sentTime = FieldValue.serverTimestamp();
    await firebaseFirestore
        .collection(chatsCollectionName)
        .doc(message.chatId)
        .collection(messagesCollectionName)
        .add(message.toMap());
  }

  Future<bool> checkCollectionExists(String chatiD) async {
    DocumentSnapshot<Map<String, dynamic>> doc = await firebaseFirestore
        .collection(chatsCollectionName)
        .doc(chatiD)
        .get();
    if (doc.exists) {
      return true;
    } else {
      return false;
    }
  }

  createChat(String chatId, GdUser myUser, GdUser otherUser) async {
    await firebaseFirestore.collection(chatsCollectionName).doc(chatId).set({
      'membersIds': [myUser.id, otherUser.id],
      'membersNames': [myUser.name, otherUser.name]
    });
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getChats() async {
    String myId = FirebaseAuth.instance.currentUser?.uid;
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebaseFirestore
        .collection(chatsCollectionName)
        .where('membersIds', arrayContains: myId)
        .get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;
    return docs;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatMessages(String chatId) {
    return firebaseFirestore
        .collection(chatsCollectionName)
        .doc(chatId)
        .collection(messagesCollectionName)
        .orderBy('sentTime')
        .snapshots();
  }

  //// admin

  addNewProduct(ItemModel product) async {
    DocumentReference<Map<String, dynamic>> doc = await firebaseFirestore
        .collection('products')
        .add(product.itemModelToJson(product));
    log(doc.id);
  }

  Future<String> uploadImage(XFile file) async {
    String filePath = file.path;
    String fileName = filePath.split('/').last;
    Reference reference = firebaseStorage.ref('products/$fileName');
    await reference.putFile(File(file.path));
    String imageUrl = await reference.getDownloadURL();
    print("smashh$imageUrl");

    return imageUrl;
  }

  editProduct(ItemModel newProduct) async {
    await firebaseFirestore
        .collection('products')
        .doc(newProduct.id)
        .update(newProduct.itemModelToJson(newProduct));
  }

  deleteProruct(String productId) async {
    await firebaseFirestore.collection('products').doc(productId).delete();
  }

  Future<ItemModel> getOneProduct(String productId) async {
    DocumentSnapshot<Map<String, dynamic>> productSnapshot =
        await firebaseFirestore.collection('products').doc(productId).get();
    Map<String, dynamic> productMap = productSnapshot.data();
    productMap['id'] = productSnapshot.id;
    ItemModel product = ItemModel.itemModelFromJson(productMap);
    return product;
  }

  Future<List<ItemModel>> getAllProducts() async {
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot =
        await firebaseFirestore.collection('products').get();

    List<ItemModel> allProducts = allProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      ItemModel product = ItemModel.itemModelFromJson(documentMap);
      return product;
    }).toList();
    return allProducts;
  }

  addProductToCart(ItemModel product) async {
    String myid = FirebaseAuth.instance.currentUser.uid;
    firebaseFirestore
        .collection('users')
        .doc(myid)
        .collection('cart')
        .add(product.itemModelToJson(product));
  }
}
