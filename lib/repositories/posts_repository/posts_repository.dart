import 'package:minbaro_app/models/models.dart';
import 'package:minbaro_app/services/post_service.dart';

class PostsRepository {
  static const _baseUrl = 'http://localhost:3000';

  final _postService = PostService(baseUrl: _baseUrl);

  Future<List<Post>> getPostOverviews() async {
    final result = await _postService.getPostOverviews();

    return result.map((e) => Post.fromJson(e)).toList();
  }

  Future<List<Comment>> getPostComments(int postId) async {
    final result = await _postService.getPostComments(postId);

    return result.map((e) => Comment.fromJson(e)).toList();
  }

  Future<Comment> addCommentToPost(Map<String, dynamic> comment) async {
    final result =
        await _postService.addCommentToPost(comment['postId'], comment);

    final commentResult = Comment.fromJson(result);

    return commentResult;
  }
}
