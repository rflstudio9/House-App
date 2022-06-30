
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube/home_page.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: NetworkImage("https://cdn.decoist.com/wp-content/uploads/2014/10/18.36.54-House-by-Daniel-Libeskind.jpg"),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(height: 25,),
              Text("Discover dream house \n from smartphone",style: GoogleFonts.workSans(fontWeight: FontWeight.w700, fontSize: 26),textAlign: TextAlign.center),
              SizedBox(height: 13,),
              Text("The No. 1 App for searching and finding \nthe most suitable house with you",textAlign: TextAlign.center,style: GoogleFonts.manrope(color: Colors.grey.shade400),),
              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: Container(
                  width: 270,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(
                    child: Text("Get Started",style: GoogleFonts.workSans(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",style: GoogleFonts.manrope(color: Colors.grey.shade600,fontWeight: FontWeight.w500),),
                  Text(" Log In",style: GoogleFonts.manrope(fontWeight: FontWeight.w800),)
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}









