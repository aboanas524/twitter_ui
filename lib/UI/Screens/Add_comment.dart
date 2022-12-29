
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_ui/Providers/TweetProvider.dart';
import 'package:twitter_ui/UI/Screens/Home_screen.dart';
import 'package:twitter_ui/UI/Widget/image_post.dart';
import 'package:twitter_ui/UI/Widget/rounded_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_ui/models/tweet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddComment extends StatefulWidget {
  final String postId;
  final String name;
  const AddComment({
    Key? key,
    required this.postId,
    required this.name}) : super(key: key);

  @override
  State<AddComment> createState() => _AddCommentState();
}
class _AddCommentState extends State<AddComment> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController textCommentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: const Icon(Icons.close, color: Colors.black,)),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  height: 60,
                  width: 100,
                  child: RoundedButton(
                    width: 200,
                    height: 50,
                    color: textCommentController.text.isEmpty ? Colors.blue.shade200 : Colors.lightBlue,
                    widget: const Text('Reply',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      if(form.currentState!.validate()) {
                        Provider.of<TweetProvider>(context, listen: false).addCommentTweet(
                            CommentTweet: TweetData(
                                parentPostId: widget.postId,
                                title: textCommentController.text,
                                datePost: Timestamp.fromDate(DateTime.now()),
                                imageProfileUrl: Provider.of<TweetProvider>(context, listen: false).myProfile!.imagePersonUrl,
                                personName: Provider.of<TweetProvider>(context, listen: false).myProfile!.name,
                                personUsername: Provider.of<TweetProvider>(context, listen: false).myProfile!.userName
                            ),
                            tweetId: widget.postId
                        );

                        Navigator.push(context, MaterialPageRoute(builder:(c) => HomeScreen()));
                      }
                    },
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Row(
                    children: [
                      Container(
                        color: Colors.grey,
                        width: 1,
                        height: 70,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Row(
                        children: [
                          Text('Replying to ',style: TextStyle(color: Colors.grey),),
                          Text(widget.name,style: TextStyle(color: Colors.lightBlue),)
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 48,right: 10),
                      child: ClipOval(child: Image.asset(Provider.of<TweetProvider>(context, listen: false).myProfile!.imagePersonUrl,width: 45,height: 45,)),
                    ),
                    Expanded(
                      child: Form(
                        key: form,
                        child: TextFormField(
                          validator: (val){
                            if(val == null||val.isEmpty)
                              return 'you can\'t share post empty';
                            return null;
                          },
                          controller: textCommentController,
                          autofocus: true,
                          style: const TextStyle(fontSize: 20),
                          cursorColor: Colors.lightBlue,
                          cursorHeight: 20,
                          mouseCursor: MouseCursor.defer,
                          decoration: const InputDecoration(
                              hintText: 'What\'s happening?',
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    width: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Icon(
                          Icons.camera_alt_outlined, color: Colors.lightBlue,
                          size: 40,)),
                  ),
                ),
                const ImageForPost(imageUrl: 'images/1.png'),
                const ImageForPost(imageUrl: 'images/2.jpg'),
                const ImageForPost(imageUrl: 'images/3.jpg'),
                const ImageForPost(imageUrl: 'images/4.jpg'),
                const ImageForPost(imageUrl: 'images/5.jpg'),
                const ImageForPost(imageUrl: 'images/6.jpg'),

              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            height: 2,
            color: Colors.grey.shade400,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5),
                  child: SvgPicture.asset(
                    'Icons_image/picture.svg', color: Colors.lightBlue,
                    width: 25,
                    height: 25,)),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 5),
                child: SvgPicture.asset('Icons_image/gif.svg', width: 30,
                  height: 30,
                  color: Colors.lightBlue,),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 5),
                  child: Image.asset(
                    'Icons_image/poll.jpg', width: 35, height: 35,)),
              Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 5),
                  child: SvgPicture.asset(
                    'Icons_image/location.svg', color: Colors.lightBlue,
                    width: 25,
                    height: 25,)),
              Padding(
                padding: const EdgeInsets.only(left: 140),
                child: SvgPicture.asset(
                  'Icons_image/circle.svg', color: Colors.grey.shade400,
                  width: 30,
                  height: 30,),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}


