import "package:flutter/material.dart";

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Card"),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: size.width * 0.7,
          height: size.height * 0.5,
          decoration: BoxDecoration(color: Colors.red[400], borderRadius: BorderRadius.circular(20)
          ),
          child: Stack(
            children: [
              Positioned(
                left:20,
                top:150,
                child: Text("Full Name",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),  
                ) 
              ),
              Positioned(
                left:20,
                top:200,
                child: Text("email@gmail.com",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),  
                ) 
              ),
              Positioned(
                left:20,
                top:250,
                child: Text("9999999999",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),  
                ) 
              ),
              Positioned(
                top:20, 
                right:20,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/profile_picture_demo.png"),
                )
              )
            ]
          ),
        ),
      ),
    ); 
  }
}