
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_ui/Providers/TweetProvider.dart';
import 'package:twitter_ui/UI/Screens/Choose_audience.dart';
import 'package:twitter_ui/UI/Screens/Home_screen.dart';
import 'package:twitter_ui/UI/Widget/image_post.dart';
import 'package:twitter_ui/UI/Widget/rounded_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_ui/models/tweet.dart';


class AddPost extends StatefulWidget {
  static String m='Public';
  static String id = 'Add_Post_Screen';
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}
class _AddPostState extends State<AddPost> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  final scaffoldState = GlobalKey<ScaffoldState>();
  TextEditingController textPostController = TextEditingController();
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (c)=>HomeScreen()));
              }, icon: const Icon(Icons.close, color: Colors.black,)),
              Container(
                padding: const EdgeInsets.only(right: 10),
                height: 70,
                width: 100,
                child: RoundedButton(
                  width: 200,
                  height: 50,
                  color: text.isEmpty ? Colors.lightBlue.shade100 : Colors
                      .lightBlue,
                  widget: const Text('Tweet'),
                  onPressed: () {
                    if(form.currentState!.validate())
                      {
                        Provider.of<TweetProvider>(context, listen: false).addTweet(
                          TweetData(
                            title: textPostController.text,
                            datePost: Timestamp.fromDate(DateTime.now()),
                            imageProfileUrl:Provider.of<TweetProvider>(context, listen: false).myProfile!.imagePersonUrl,
                            personName: Provider.of<TweetProvider>(context, listen: false).myProfile!.name,
                            personUsername: Provider.of<TweetProvider>(context, listen: false).myProfile!.userName),
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (c)=>HomeScreen()));
                      }
                  },
                  elevation: 0,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                    child: Image.asset(Provider.of<TweetProvider>(context, listen: false).myProfile!.imagePersonUrl,width: 35,height: 35,)),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: AddPost.m =='Public'? 90 : 130,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      border: Border.all(color: AddPost.m =='Public'
                          ? Colors.lightBlue
                          : Colors.green)
                  ),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return ChooseAudience();
                          });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AddPost.m, style: TextStyle(color: AddPost.m ==
                            'Public' ? Colors.lightBlue : Colors.green),),
                        Icon(Icons.keyboard_arrow_down_rounded,
                            color: AddPost.m =='Public'? Colors.lightBlue : Colors.green),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Form(
                key: form,
                child: TextFormField(
                  validator: (val){
                    if(val == null||val.isEmpty)
                      return 'you can\'t share post empty';
                    return null;
                  },
                  controller: textPostController,
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
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
            child: InkWell(
              child: Row(
                children: [
                  SvgPicture.asset(
                    'Icons_image/earth.svg', color: Colors.lightBlue,
                    width: 20,
                    height: 17,),
                  const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Everyone can reply',
                        style: TextStyle(color: Colors.lightBlue),))
                ],
              ),
            ),
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
              InkWell(
                onTap: (){
                  //uploadImage();
                },
                child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 5),
                    child: SvgPicture.asset(
                      'Icons_image/picture.svg', color: Colors.lightBlue,
                      width: 25,
                      height: 25,)),
              ),
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
                padding: const EdgeInsets.only(left: 100),
                child: SvgPicture.asset(
                  'Icons_image/circle.svg', color: Colors.grey.shade400,
                  width: 30,
                  height: 30,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 13),
                child: Container(
                  width: 1,
                  height: 20,
                  color: Colors.grey.shade200,
                ),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: text.isEmpty ? Colors.lightBlue.shade200 : Colors
                      .lightBlue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 18,),
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


