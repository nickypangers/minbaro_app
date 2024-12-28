import 'dart:convert';

import 'package:http/http.dart' as http;

class PostService {
  const PostService({required String baseUrl}) : _baseUrl = baseUrl;

  final String _baseUrl;

  Future<List<dynamic>> getPostOverviews() async =>
      _queryList(Uri.parse('$_baseUrl/posts'));

  Future<List<dynamic>> getPostComments(int postId) async =>
      _queryList(Uri.parse('$_baseUrl/posts/$postId/comments'));

  Future<List<dynamic>> _queryList(Uri uri) async {
    final res = await http.get(uri);
    return jsonDecode(res.body) as List<dynamic>;
  }

  Future<dynamic> addCommentToPost(
      int postId, Map<String, dynamic> data) async {
    final res = await http.post(
      Uri.parse('$_baseUrl/posts/$postId/comments'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return jsonDecode(res.body);
  }
}
