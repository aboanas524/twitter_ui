
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:twitter_ui/Providers/TweetProvider.dart';
import 'package:twitter_ui/UI/Screens/Welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter_ui/UI/Screens/Profile.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 50,right: 25,left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>Profile()));
                  },
                  child: Hero(
                    tag: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                        child: Image.asset(Provider.of<TweetProvider>(context, listen: false).myProfile!.imagePersonUrl,width: 60,height: 60,)),
                  ),
                ),
                Icon(CupertinoIcons.ellipsis_vertical_circle),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10,bottom: 5),
              child: Text(Provider.of<TweetProvider>(context, listen: false).myProfile!.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Text(Provider.of<TweetProvider>(context, listen: false).myProfile!.userName),
            Padding(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('0 Following  0 Followers'),
                  IconButton(icon:Icon(Icons.output),
                    onPressed: (){
                      showDialog(context: context, builder:(context){
                        return Dialog(
                          child: Container(
                            padding: EdgeInsets.only(top: 10,right: 18,left: 20,bottom: 10),
                            width: 350,
                            height: 170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Log out',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Logging out will remove all Twitter\ndata from this device.'),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        borderRadius: BorderRadius.circular(7),
                                        onTap: (){
                                          Navigator.pop(context);
                                        },
                                        onLongPress: (){},
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(7),
                                          ),
                                          width: 60,
                                          height: 50,
                                          child: Center(child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold),)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                        borderRadius: BorderRadius.circular(7),
                                        onTap: (){
                                          _auth.signOut();
                                          Navigator.popUntil(context, (route) => false);
                                          Navigator.push(context, MaterialPageRoute(builder: (c)=>WelcomeScreen()));
                                        },
                                        onLongPress: (){},
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(7),
                                          ),
                                          width: 60,
                                          height: 50,
                                          child: Center(child: Text('Log out',style: TextStyle(fontWeight: FontWeight.bold))),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),

                          ),
                        );
                      });

                    },)
                ],
              ),
            ),
            const Divider(
              height: 2,
              color: Colors.grey,
            ),
            //TODO:Column Scroll
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 7),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (c)=>Profile()));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding:const EdgeInsets.only(right: 22),
                            child: Image.asset('Icons_image/profile.jpg',width: 40,height: 50,),
                          ),
                          const Text('Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7,),
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        children: [
                          Padding(
                            padding:const EdgeInsets.only(right: 22),
                            child:  Image.asset('Icons_image/topics.jpg',width: 40,height: 50,),
                          ),
                          const Text('Topics',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7,),
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        children: [
                          Padding(
                            padding:const EdgeInsets.only(right: 22),
                            child:  Image.asset('Icons_image/book marks.jpg',width: 40,height: 50,),
                          ),
                          const Text('Bookmarks',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7,),
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        children: [
                          Padding(
                            padding:const EdgeInsets.only(right: 22),
                            child:  Image.asset('Icons_image/lists.jpg',width: 40,height: 50,),
                          ),
                          const Text('Lists',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        children: [
                          Padding(
                            padding:const EdgeInsets.only(right: 22),
                            child: Image.asset('Icons_image/twitter Circle.jpg',width: 40,height: 50),
                          ),
                          const Text('Twitter Circle',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ExpansionTile(
                    initiallyExpanded: false,
                    maintainState: false,

                    title:const Text('Creator Studio',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 15),
                            child: Image.asset('Icons_image/flash.png',width: 20,height: 20,),
                          ),
                          const Text('Moments')
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    initiallyExpanded: true,

                    title:const Text('Professional Tools',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 13),
                              child: SvgPicture.asset('Icons_image/rocket.svg',width: 20,height: 15,color: Colors.black,),
                            ),
                            const Text('Twitter for Professionals',style: TextStyle(fontSize: 17),)
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Image.asset('Icons_image/flash.png',width: 20,height: 20,color: Colors.black,),
                          ),
                          const Text('Monetization'),
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    initiallyExpanded: true,
                    title:const Text('Settings & Support',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 20),
                            child: SvgPicture.asset('Icons_image/settings.svg',width: 15,height: 15,color: Colors.black),
                          ),
                          const Text('Setting and privacy'),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 20,top: 10),
                            child:Icon(Icons.info_outline,size: 20,)
                          ),
                          const Text('Help Center'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
