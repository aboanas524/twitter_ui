import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:twitter_ui/Providers/TweetProvider.dart';
import 'package:twitter_ui/UI/Screens/Add_comment.dart';
import 'package:twitter_ui/UI/Screens/ShowComment.dart';
import 'package:twitter_ui/UI/Widget/iconWidget.dart';
import 'package:twitter_ui/models/tweet.dart';

class PostUi extends StatefulWidget {
  final TweetData tweetData;
  final String postId;
  const PostUi({
    Key? key,required this.tweetData, required this.postId,
  }):super(key: key);

  @override
  State<PostUi> createState() => _PostUiState();
}

class _PostUiState extends State<PostUi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (c) =>
            ShowComment(
              profileData: Provider
                  .of<TweetProvider>(context, listen: false)
                  .myProfile,
              tweetData: widget.tweetData,
              postId: widget.postId,
            ),
        ),
        );
      },
      child: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
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
                            Text(widget.tweetData.personName,
                              style: TextStyle(fontSize: 15,
                                  color: Colors.black),),
                            Expanded(
                              child: Text(
                                '${widget.tweetData.personUsername} . ${DateFormat('hh').format(
                                DateTime.now()).compareTo((DateFormat('hh').format((widget.tweetData.datePost).toDate())))}h',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey),),
                            ),
                            IconButton(
                                onPressed: () {}, icon: const Icon(
                              CupertinoIcons.ellipsis_vertical, size: 20,
                              color: Colors.grey,))
                          ],
                        ),
                        Text(widget.tweetData.title),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconWidget(
                                imageUrl: 'Icons_image/message.png',
                                number:'${widget.tweetData.retweetsCount}',
                                onTap: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (c) =>
                                      AddComment(
                                        postId: widget.postId,
                                        name: widget.tweetData
                                            .personUsername,)));
                                }),
                            IconWidget(imageUrl: 'Icons_image/refresh.png',
                                number: '23'),
                            IconWidget(imageUrl: 'Icons_image/favorite.png',
                                number: '261'),
                            IconWidget(imageUrl: 'Icons_image/share.png',
                                number: ''),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Divider(
                  color: Colors.grey,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
