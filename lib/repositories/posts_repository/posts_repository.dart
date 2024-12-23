import 'package:minbaro_app/models/models.dart';
import 'package:minbaro_app/services/post_service.dart';

class PostsRepository {
  static const _baseUrl = 'http://localhost:3000';
  Future<List<Post>> getPostOverviews() async {
    final result = await PostService(baseUrl: _baseUrl).getPostOverviews();

    return result.map((e) => Post.fromJson(e)).toList();
  }

  Future<List<Comment>> getPostComments(int postId) async {
    final result = await PostService(baseUrl: _baseUrl).getPostComments(postId);

    return result.map((e) => Comment.fromJson(e)).toList();
  }
}
