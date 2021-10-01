
import 'package:flutter_test/flutter_test.dart';
import 'package:qms/notifiers/PostsNotifier.dart';

void main() {
  group('Testing App Provider', () {
    var pn = PostsNotifier();

    test('test 1', () {
      expect(pn.getPostList(), []);
    });

  });
  group('Testing App Provider', () {
    var pn = PostsNotifier();


    test('test 2', () {
      expect(pn.getPostList(), true);
    });
  });
}