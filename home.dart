import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final List <Color> color =[
    Colors.red,
    Colors.green,
     Colors.blue,
    Colors.yellow,
   Colors.purple,
   Colors.grey,
   Colors.black,
   Colors.brown,
  Colors.pink,
    Colors.orange,
   ];
   final List <String> mypic =[
 "lib/images/000.png",
 "lib/images/56.png",
 "lib/images/56.png",
 "lib/images/78.png",
 "lib/images/667.png",
 "lib/images/100.png",
 "lib/images/667.png",
 "lib/images/7890.png",
 "lib/images/65748.png",
 "lib/images/1234500.png",




   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Indoor Games",style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.red.shade900,
      ),
      backgroundColor: Colors.black,
         body: Column(
          children: [
            Expanded(
              child: GridView.count(crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(10,(index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container
                  (height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    
                    image: DecorationImage(image: AssetImage(mypic[index]),fit: BoxFit.fill),
                    color:
                   color[index],borderRadius: BorderRadius.circular(16)),
                  
                  ),
                );
              },
              
              
              
              
              )
                       ),
            )],
         ),
    );
  }
}