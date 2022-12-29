
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:twitter_ui/Providers/TweetProvider.dart';
import 'package:twitter_ui/UI/Screens/Add_post.dart';
import 'package:twitter_ui/constants.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: kPrimeColor,
            elevation: 5,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => AddPost()));
            },
            child: const Icon(Icons.add),
          ),
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 140,
                    color: kPrimeColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        iconWidget(icon: Icons.arrow_back, onTap: () {
                          Navigator.pop(context);
                        }),
                        SizedBox(
                          width: 260,
                        ),
                        iconWidget(icon: Icons.search, onTap: () {}),
                        iconWidget(
                            icon: CupertinoIcons.ellipsis_vertical,
                            onTap: () {}),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 105, left: 15),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Hero(
                        tag: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            width: 60,
                            height: 60,
                            child: Image.asset(Provider.of<TweetProvider>(context).myProfile.imagePersonUrl),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 290, top: 150),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 115,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Center(
                            child: Text('Edit profile', style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16))),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Provider
                        .of<TweetProvider>(context)
                        .myProfile
                        .name, style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(Provider
                          .of<TweetProvider>(context)
                          .myProfile
                          .userName,
                        style: TextStyle(fontSize: 15, color: kTextColor),),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'Icons_image/balloon.svg',
                          width: 20, height: 20,
                        ),
                        Text(' Born ${DateFormat
                          ('MMM d, yyyy').format((Provider
                            .of<TweetProvider>(context)
                            .myProfile
                            .birthday).toDate())}',
                            style: kStyleText
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 15),
                      child: Row(
                        children: [
                          Icon(Icons.date_range, size: 20,),
                          Text(' Joined December 2022',
                              style: kStyleText
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          Text('8 ', style: TextStyle(color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),),
                          Text('Following', style: kStyleText,),
                          Text('    0 ', style: TextStyle(color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),),
                          Text('Followers', style: kStyleText,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                isScrollable: true,
                indicatorColor: kPrimeColor,
                labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),
                labelColor: Colors.black,
                indicatorSize:TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                
                tabs: [
                  Tab(text: 'Tweets'),
                  Tab(text: 'Tweets & replies'),
                  Tab(text: 'Media'),
                  Tab(text: 'Likes'),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 344,
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: TabBarView(
                    controller: _tabController,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(bottom: 10, top: 10),
                                child: Text('Who to follow',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
                            SizedBox(
                              height: 250,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  buildContainer(),
                                  buildContainer(),
                                  buildContainer(),
                                  buildContainer(),
                                  buildContainer(),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text('Show more',style: TextStyle(color:kPrimeColor,fontSize: 15),),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(bottom: 10, top: 10),
                                child: Text('Who to follow',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
                            SizedBox(
                              height: 250,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  buildContainer(),
                                  buildContainer(),
                                  buildContainer(),
                                  buildContainer(),
                                  buildContainer(),

                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text('Show more',style: TextStyle(color:kPrimeColor,fontSize: 15),))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 50,left: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('images/media.jpg',width: MediaQuery.of(context).size.width-100,height: 200,),
                              SizedBox(
                                height: 30,
                              ),
                              Text('Lights, camera...\nattachments!',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                              Text('Your photo and video Tweets will show\nup here',style: TextStyle(color: Colors.grey),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50,top: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Like some Tweets',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                              Text('Tap the heart on any Tweet to show it\nsome love. When you do, it\'ll show up\nhere.',style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                        )
                      ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget buildContainer() {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          width: 160,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5, top: 5),
                    child: Icon(Icons.close, size: 20, color: Colors.grey),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'images/nader.jpg', width: 90, height: 90,),
                ),
              ),
              Text('nader', style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text('nader', style: kStyleText,),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black,
                  ),
                  child: Center(child: Text('Follow',
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget iconWidget({required IconData? icon, required Function() onTap}) {
      return InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 15, 80, 119),
                borderRadius: BorderRadius.circular(50)
            ),
            width: 32,
            height: 32,
            child: Icon(icon, color: Colors.white,),
          ),
        ),
      );
    }
  }

