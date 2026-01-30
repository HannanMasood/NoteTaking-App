import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.yellow.shade700 ,
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white), 
        backgroundColor: Colors.black,
        title: Center(child: Text("To-Do app",style: TextStyle(color: Colors.white),)),
      ),
      drawer: Drawer(
     
            child: ListView(  
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black
                  ),
                  child:
                  Text("header" ,style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,))
                  ),
                   ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                 
                  Navigator.pop(context); 
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                 
                  Navigator.pop(context);
                },
              ),
              ],
            ),
          ),
          
      body:
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text("Hello Talha",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          )
          , Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text("Today you have for tasks",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading:Image.asset('lib/images/s.png') ,
                  trailing:Icon(Icons.more_vert) ,
                  title:Text("Today"),
                  subtitle: Text("4 tasks pending"),
                ),
              ),
                            Padding(
                padding: const EdgeInsets.all(35.0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading:Image.asset('lib/images/s.png') ,
                  trailing:Icon(Icons.more_vert) ,
                  title:Text("Today"),
                  subtitle: Text("4 tasks pending"),
                ),
              ),
                            Padding(
                padding: const EdgeInsets.all(35.0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading:Image.asset('lib/images/s.png') ,
                  trailing:Icon(Icons.more_vert) ,
                  title:Text("Today"),
                  subtitle: Text("4 tasks pending"),
                ),
              ),
                            Padding(
                padding: const EdgeInsets.all(35.0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading:Image.asset('lib/images/s.png') ,
                  trailing:Icon(Icons.more_vert) ,
                  title:Text("Today"),
                  subtitle: Text("4 tasks pending"),
                ),
              ),
                            Padding(
                padding: const EdgeInsets.all(35.0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading:Image.asset('lib/images/s.png') ,
                  trailing:Icon(Icons.more_vert) ,
                  title:Text("Today"),
                  subtitle: Text("4 tasks pending"),
                ),
              )
            ],
          )
          
        ],
      ),
    );
  }
}