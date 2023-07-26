import 'package:bike_comm/core/common/error_text.dart';
import 'package:bike_comm/core/common/loader.dart';
import 'package:bike_comm/core/common/post_card.dart';
import 'package:bike_comm/features/auth/community/controller/community_controller.dart';
import 'package:bike_comm/features/post/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userCommunitiesProvider).when(
      data: (data) => ref.watch(userPostsProvider(data)).when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final post = data[index];
              return PostCard(post: post);
            },
            );
        }, 
        error: (error, StackTrace)  =>ErrorText(
                error: error.toString(),
              ), 
              loading: () => const Loader(),
        ), 
      error: (error, StackTrace)=>ErrorText(
                error: error.toString(),
              ), 
              loading: () => const Loader(),
      );
  }
}