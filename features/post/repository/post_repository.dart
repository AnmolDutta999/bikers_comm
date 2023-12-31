import 'package:bike_comm/core/constants/firebase_constants.dart';
import 'package:bike_comm/core/failure.dart';
import 'package:bike_comm/core/type_def.dart';
import 'package:bike_comm/models/community_model.dart';
import 'package:bike_comm/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/providers/firebase_providers.dart';

final postRepositoryProvider = Provider((ref){
  return PostRepository(firestore: ref.watch(firestoreProvider));
});


class PostRepository {
  final FirebaseFirestore _firestore;
    PostRepository({
    required FirebaseFirestore firestore
  }) : _firestore = firestore;

  CollectionReference get _posts => _firestore.collection(FirebaseConstants.postsCollection);

    FutureVoid addPost(Post post) async {
        try {
          return right(
             _posts.doc(post.id).set(post.toMap()));
        } on FirebaseException catch (e) {
          throw e.message!;
        } catch (e) {
          return left(Failure(e.toString()));
        }
  }
    Stream<List<Post>> fetchUserPosts(List<Community> communities) {
    return _posts
        .where('communityName', whereIn: communities.map((e) => e.name).toList())
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (e) => Post.fromMap(
                  e.data() as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }
  FutureVoid deletePost(Post post) async {
    try {
      return right(_posts.doc(post.id).delete());
    } on FirebaseException catch(e) {
       throw e.message!;
    } catch(e){
       return left(Failure(e.toString()));
    }
  }

  void upvote(Post post, String userId) async{
     if(post.downvotes.contains(userId)) {
       _posts.doc(post.id).update({
          'downvotes': FieldValue.arrayRemove([userId])
       });
     }

     if(post.upvotes.contains(userId)) {
      _posts.doc(post.id).update({
          'upvotes': FieldValue.arrayRemove([userId])
       });
     } else {
       _posts.doc(post.id).update({
          'upvotes': FieldValue.arrayUnion([userId])
       });
     }
  }

  void downvote(Post post, String userId) async{
     if(post.upvotes.contains(userId)) {
       _posts.doc(post.id).update({
          'upvotes': FieldValue.arrayRemove([userId])
       });
     }

     if(post.downvotes.contains(userId)) {
      _posts.doc(post.id).update({
          'downvotes': FieldValue.arrayRemove([userId])
       });
     } else {
       _posts.doc(post.id).update({
          'downvotes': FieldValue.arrayUnion([userId])
       });
     }
  }
}