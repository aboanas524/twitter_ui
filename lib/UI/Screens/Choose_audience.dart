import 'package:flutter/material.dart';
import 'package:twitter_ui/UI/Screens/Add_post.dart';

class ChooseAudience extends StatelessWidget {
  const ChooseAudience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: MediaQuery
          .of(context)
          .size
          .width,
      color: const Color(0xff757575),
      child: Container(
          padding: const EdgeInsets.only(top: 5),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(50)
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 20),
                child: Text('Choose audience',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
              ),
              const Divider(
                height: 2,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddPost()));
                    AddPost.m ='Public';
                  },
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,width: 5)
                            ),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255,29,155,240),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  'images/earth.jpg', width: 25, height: 25,),),),
                          ),
                          AddPost.m == 'Public'?Container(
                            width: 23,
                            height: 23,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 24, 190, 96),
                                border: Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: const Icon(
                              Icons.done, color: Colors.white, size: 15,),
                          )
                              :Container(),

                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text('Public', style: TextStyle(fontSize: 15),),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 2,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, right: 15, left: 20, bottom: 15),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddPost()));
                    AddPost.m = 'Twitter Circle';
                  },
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,width: 5)
                            ),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 0, 186, 123),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset(
                                    'images/loved.jpg', width: 20, height: 20,)),
                            ),
                          ),
                          AddPost.m != 'Public'?Container(
                            width: 23,
                            height: 23,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 24, 190, 96),
                                border: Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: const Icon(
                              Icons.done, color: Colors.white, size: 15,),
                          )
                              :Container(),

                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Twitter Circle', style: TextStyle(fontSize: 15),),
                          Text('0 people',
                            style: TextStyle(fontSize: 12, color: Colors.grey,),)
                        ],
                      ),
                      const SizedBox(
                        width: 135,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 60,
                          height: 37,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey, width: 1)
                          ),
                          child: const Center(
                              child: Text('Edit', style: TextStyle(fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),)),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
