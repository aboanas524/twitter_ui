import 'package:cloud_firestore/cloud_firestore.dart';

class TweetData  {
  final String title;
  final Timestamp datePost;
  final String? parentPostId;
  final String imageProfileUrl;
  final String personName;
  final String personUsername;
  final int retweetsCount;

  const TweetData( { this.retweetsCount = 0,
    required this.title,
    required this.datePost,
    this.parentPostId,
    required this.imageProfileUrl,
    required this.personName,
    required this.personUsername});

}