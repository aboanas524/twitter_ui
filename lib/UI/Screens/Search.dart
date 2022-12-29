import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twitter_ui/Providers/TweetProvider.dart';
import 'package:twitter_ui/UI/Screens/Add_post.dart';
import 'package:twitter_ui/UI/Screens/drawer.dart';
import 'package:twitter_ui/constants.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search>  with TickerProviderStateMixin{
  final scaffoldState = GlobalKey<ScaffoldState>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
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
      drawer: const DrawerScreen(),
      drawerEdgeDragWidth: MediaQuery
          .of(context)
          .size
          .width,
      //TODO : AppBar
      appBar: AppBar(
        bottom:TabBar(
          isScrollable: true,
          indicatorColor: kPrimeColor,
          labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),
          labelColor: Colors.black,
          indicatorSize:TabBarIndicatorSize.label,
          unselectedLabelColor: Colors.grey,
          controller: _tabController,

          tabs: [
            Tab(text: 'For you'),
            Tab(text: 'Trending'),
            Tab(text: 'News'),
            Tab(text: 'Sports'),
            Tab(text: 'Entertainment'),
          ],
        ),
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
                  child: Image.asset(Provider.of<TweetProvider>(context).myProfile.imagePersonUrl,
                    width: 40,
                    height: 40,
                  ),
              ),
            ),
            SizedBox(
              width: 280,
              height: 35,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Twitter',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                style: TextStyle(),
              ),
            ),
            SvgPicture.asset('Icons_image/setting.svg', height: 25, width: 25,color: Colors.black),
          ],
        ),
      ),
    );
  }
}
