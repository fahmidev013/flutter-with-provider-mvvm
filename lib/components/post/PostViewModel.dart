import 'package:qms/model/post.dart';

class PostViewModel  {
  late Post _post;

  setPost(Post post) {
    _post = post;
  }

  Post get post => _post;
}