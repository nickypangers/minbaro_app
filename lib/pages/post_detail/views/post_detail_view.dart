import 'package:flutter/material.dart';
import 'package:minbaro_app/models/post.dart';

class PostDetailView extends StatelessWidget {
  const PostDetailView({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(post.body),
    );
  }
}
