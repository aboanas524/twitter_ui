import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:twitter_ui/Providers/TweetProvider.dart';
import 'package:twitter_ui/UI/Screens/Add_comment.dart';
import 'package:twitter_ui/UI/Widget/Post.dart';
import 'package:twitter_ui/UI/Widget/iconWidget.dart';
import 'package:twitter_ui/models/tweet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitter_ui/models/user.dart';

class ShowComment extends StatefulWidget {
  final TweetData tweetData;
  final String postId;
  final ProfileData profileData;
  ShowComment({
    Key? key,
    required this.tweetData,
    required this.postId,
    required this.profileData,
  }) : super(key: key);

  @override
  State<ShowComment> createState() => _ShowCommentState();
}

class _ShowCommentState extends State<ShowComment> {
  TextEditingController tweetController = TextEditingController();

  @override
  void initState() {
    Provider.of<TweetProvider>(context, listen: false).getTweetChildren(
        widget.postId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            color: Colors.black26,
            height: 1,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Tweet',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      widget.tweetData.imageProfileUrl,
                      height: 60,
                      width: 60,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.tweetData.personName,
                              style:
                              TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.ellipsis_vertical,
                                size: 20,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                      Text(
                        '${widget.tweetData.personUsername}',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(widget.tweetData.title,
                          style: const TextStyle(fontSize: 25)),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              'Translate Tweet',
              style: TextStyle(color: Colors.lightBlue),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${DateFormat('hh:mm a . d MMM yy').format(
                  widget.tweetData.datePost.toDate())}',
              style: TextStyle(color: Colors.grey),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Divider(
                color: Colors.grey,
                height: 1,
              ),
            ),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${widget.tweetData.retweetsCount}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Retweets',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '0',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Quote Tweets',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '0',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Likes',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
              color: Colors.grey,
            ),
            SizedBox(
              height: 40,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconWidget(
                      imageUrl: 'Icons_image/message.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (c) =>
                                AddComment(
                                  postId: widget.postId,
                                  name: widget.tweetData.personUsername,
                                ),
                          ),
                        );
                      }),
                  IconWidget(
                    imageUrl: 'Icons_image/refresh.png',
                    onTap: () {},
                  ),
                  IconWidget(
                    imageUrl: 'Icons_image/favorite.png',
                    onTap: () {},
                  ),
                  IconWidget(
                    imageUrl: 'Icons_image/share.png',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            Expanded(
              child: FutureBuilder<Map<String, TweetData>>(
                  future: Provider
                      .of<TweetProvider>(context)
                      .getTweetChildren(widget.postId),
                  builder: (context, snapshot) {
                    return snapshot.hasData? ListView.builder(
                        itemCount: snapshot.data!.values.length,
                        itemBuilder: (context, i) {
                          return PostUi(
                            tweetData: snapshot.data!.values.toList()[i],
                            postId: snapshot.data!.keys.toList()[i],
                          );
                        }):Center(child: CircularProgressIndicator(),);
                  }),
            ),
            Divider(
              color: Colors.grey,
            ),
            TextField(
              controller: tweetController,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    Provider.of<TweetProvider>(context, listen: false)
                        .addCommentTweet(
                      CommentTweet: TweetData(
                          title: tweetController.text,
                          datePost: Timestamp.fromDate(DateTime.now()),
                          imageProfileUrl:
                          Provider
                              .of<TweetProvider>(context, listen: false)
                              .myProfile!
                              .imagePersonUrl,
                          personName:
                          Provider
                              .of<TweetProvider>(context, listen: false)
                              .myProfile!
                              .name,
                          personUsername:
                          Provider
                              .of<TweetProvider>(context, listen: false)
                              .myProfile!
                              .userName),
                      tweetId: widget.postId,
                    );
                    tweetController.clear();
                  });
                }
              },
              decoration: InputDecoration(
                  hintText: 'Tweet your reply',
                  suffixIcon: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.lightBlue,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
