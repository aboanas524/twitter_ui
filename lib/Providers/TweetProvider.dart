

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twitter_ui/models/tweet.dart';
import 'package:twitter_ui/models/user.dart';


class TweetProvider extends ChangeNotifier{

  Stream<QuerySnapshot<Map<String, dynamic>>>? stream;
  CollectionReference<Map<String, dynamic>>? firebase;
  QuerySnapshot<Map<String, dynamic>>? snapshot;

  Map<String ,ProfileData> users={};
  Map<String, TweetData> tweets = {};
  Map<String,TweetData> commentsTweet={};
  var myProfile;
  void init() async {
    firebase = FirebaseFirestore.instance.collection('Tweets');
    stream = firebase!.snapshots();
    stream!.listen((event) async{
      snapshot = event;
      tweets = {};
      for (var m in event.docs) {
        if (m.data()['parentPostId']==null)
          {
           tweets[m.id] = TweetData(
           datePost:m.data()['datePost'],
           imageProfileUrl:m.data()['imageProfileUrl'],
           personName:m.data()['personName'] ,
           personUsername:m.data()['personUsername'] ,
           title:m.data()['title'],
           retweetsCount: (await getTweetChildren(m.id,false)).length,
          );
         }
        }
      notifyListeners();
    });
  }
  Future<Map<String, TweetData>> getTweetChildren(String id,[bool getCount = true]) async {
    var firebase = FirebaseFirestore.instance.collection('Tweets');
    stream = firebase.snapshots();
    var event = await stream!.first;
    Map<String, TweetData> commentsTweet={};
      snapshot = event;
      for (var m in event.docs) {
        if (m.data()['parentPostId']==id){
          commentsTweet[m.id]=
              TweetData(
                title:m.data()['title'],
                personUsername:m.data()['personUsername'],
                personName:m.data()['personName'],
                imageProfileUrl:m.data()['imageProfileUrl'],
                datePost:m.data()['datePost'],
                parentPostId:m.data()['parentPostId'],
                retweetsCount: getCount? (await getTweetChildren(m.id,false)).length:0,

              );
        }
      }
    return commentsTweet;
  }
  void addTweet(TweetData tweet) {
    firebase = FirebaseFirestore.instance.collection('Tweets');
    firebase!.add({
      'datePost':tweet.datePost,
      'personUsername':tweet.personUsername,
      'title':tweet.title,
      'personName':tweet.personName,
      'imageProfileUrl':tweet.imageProfileUrl,
    });
    notifyListeners();
  }
  void addCommentTweet({CommentTweet,tweetId}) {
    firebase = FirebaseFirestore.instance.collection('Tweets');
    firebase!.add({
      'datePost':CommentTweet.datePost,
      'personUsername':CommentTweet.personUsername,
      'title':CommentTweet.title,
      'personName':CommentTweet.personName,
      'imageProfileUrl':CommentTweet.imageProfileUrl,
      'parentPostId':tweetId,
    });
    notifyListeners();
  }
  bool addUser(ProfileData profile)
  {
   var firebase = FirebaseFirestore.instance.collection('Users');
     firebase.add({
      'email':profile.email,
      'password':profile.password,
      'name':profile.name,
      'userName':profile.userName,
      'birthday':profile.birthday,
      'imagePersonUrl':profile.imagePersonUrl,
    });
    notifyListeners();
    return true;
  }
  Future<void> getUser(String? email)async
  {
    var firebase = FirebaseFirestore.instance.collection('Users');
    var stream = firebase.snapshots();
    var even = await stream.first;
      for(var m in even.docs)
        {
          if(m.data()['email']==email)
            {
              myProfile = ProfileData(
                   name: m.data()['name'],
                   userName: m.data()['userName'],
                   email: m.data()['email'],
                   password: m.data()['password'],
                   birthday: m.data()['birthday'],
                   imagePersonUrl:m.data()['imagePersonUrl'],
              );
            }
    }
    notifyListeners();
  }
}