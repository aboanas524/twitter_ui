
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:twitter_ui/Providers/TweetProvider.dart';
import 'package:twitter_ui/UI/Screens/Add_post.dart';
import 'package:twitter_ui/UI/Screens/drawer.dart';
import 'package:twitter_ui/UI/Widget/Post.dart';
import 'package:twitter_ui/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final scaffoldState = GlobalKey<ScaffoldState>();
  void initState(){
    // TODO: implement initState
    super.initState();
    Provider.of<TweetProvider>(context, listen: false).init();
    Provider.of<TweetProvider>(context, listen: false).getUser(FirebaseAuth.instance.currentUser!.email);
  }
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldState,
        drawer: const DrawerScreen(),
        drawerEdgeDragWidth: MediaQuery
            .of(context)
            .size
            .width,
        //TODO: floatingActionButton
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimeColor,
          elevation: 5,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (c) => AddPost()));
          },
          child: const Icon(Icons.add),
        ),
        //TODO : AppBar
        appBar: AppBar(
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              color: Colors.grey,
              height: 1,
            ),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  scaffoldState.currentState?.openDrawer();
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(Provider.of<TweetProvider>(context).myProfile.imagePersonUrl, width: 40, height: 40,)),
              ),
              FaIcon(
                  FontAwesomeIcons.twitter, color:kPrimeColor, size: 32),
              Image.asset('Icons_image/star.png', height: 32, width: 32,),
            ],
          ),
        ),

        body: StreamBuilder(
            stream: Provider.of<TweetProvider>(context).stream,
            builder: (context, snapshot) {
              return FutureBuilder(
                builder: (c,i) {
                return !snapshot.hasData?
                Center(child: CircularProgressIndicator()):
                ListView.builder(
                    itemCount: Provider.of<TweetProvider>(context).tweets.length,
                    itemBuilder: (context, i) {
                      return PostUi(
                        tweetData: Provider.of<TweetProvider>(context).tweets[Provider.of<TweetProvider>(context).tweets.keys.toList()[i]]!,
                        postId: Provider.of<TweetProvider>(context).tweets.keys.toList()[i],);
                    });
              },
              );
            })
    );
  }
}
