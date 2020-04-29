import 'package:flutter/material.dart';
import 'package:taskm/homepage.dart';
import 'package:taskm/ui.dart';

class ui extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _ui();
  }
}

class _ui extends State<ui>{ 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
       appBar: new AppBar(
          title: Text("Choose your Domain"),
        ),
        
       drawer: new Drawer(),
        body:SafeArea(
          child: Column (
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              
              SizedBox(
                height:10,
              ),
              Container(
                color: Colors.lightGreen[100],
                height:140,
                margin : EdgeInsets.symmetric(vertical : 10.0, horizontal : 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical:15,horizontal:20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      
                          Image.asset(
                        "assets/stu.png",
                       
                      height:800,
                      ),
                      SizedBox(
                        width:10,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                          'Work',
                          style:
                          TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(
                            height:10,
                          ),
                          Text(
                        ' ',
                        style:
                        TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 16,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                        
                          ),
                     SizedBox(
                       height: 5,
                     ),
                  IconButton(
                              
                             onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()),), icon:Icon(Icons.arrow_forward),
                            ),
                            
                           ],
                        ),
                      ],
                  ),
                  ),
                ),
              Container(
                color: Colors.blue[100],
                height:140,
                margin : EdgeInsets.symmetric(vertical : 0.0, horizontal : 10),
                child:Row(
                  children: <Widget>[
                    SizedBox(
                      width:20,
                    ),
                    
                          Image.asset(
                        "assets/wo.png",
                      width:175,
                    
                
                      ),
                    
                    Column(
                        children: <Widget> [
                          SizedBox(
                            height:5,
                          ),
                          Text(
                          'Study',
                          style:
                            TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                          SizedBox(
                            height:20,
                          ),
                          Text(
                            'Add your tasks',
                            style:
                            TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 13.2,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height:20),
                          Row(
                            children: <Widget>[
                              
                               IconButton(
                              
                             onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()),), icon:Icon(Icons.arrow_forward),
                            ),
                              
                           ],
                        ),
                      ],
                  ),
                   ] ),
                ),
                SizedBox(height: 10,),
               Container(
                color: Colors.purple[100],
                height:140,
                margin : EdgeInsets.symmetric(vertical : 0.0, horizontal : 10),
                child:Row(
                  children: <Widget>[
                    SizedBox(
                      width:20,
                    ),
                    
                          Image.asset(
                        "assets/ba.png",
                     height:150,
                     width:200
                
                      ),
                    
                    Column(
                        children: <Widget> [
                          SizedBox(
                            height:5,
                          ),
                          Text(
                          'Hobbies',
                          style:
                            TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                          SizedBox(
                            height:20,
                          ),
                          Text(
                            'Add your interests',
                            style:
                            TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 13.2,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height:20),
                          Row(
                            children: <Widget>[
                              
                            IconButton(
                              
                             onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()),), icon:Icon(Icons.arrow_forward),
                            ),
                            
                            
                 
                           ],
                        ),
                      ],
                  ),
                  ]),
     ),
     SizedBox(height: 15,),
     Container(
                color: Colors.yellow[100],
                height:140,
                margin : EdgeInsets.symmetric(vertical : 0.0, horizontal : 10),
                child:Row(
                  children: <Widget>[
                    SizedBox(
                      width:20,
                    ),
                    
                          Image.asset(
                        "assets/ta.png",
                      width:150,
                      height: 200,
                
                      ),
                    
                    Column(
                        children: <Widget> [
                          SizedBox(
                            height:5,
                          ),
                          Text(
                          'Other Tasks',
                          style:
                            TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                          SizedBox(
                            height:20,
                          ),
                          Text(
                            'Add your tasks',
                            style:
                            TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 13.2,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height:20),
                          Row(
                            children: <Widget>[
                              
                               IconButton(
                              
                             onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()),), icon:Icon(Icons.arrow_forward),
                            ),
                              
                           ],
                        ),
                      ],
                  ),
                   ] ),
                ),
     
      ])));
                
  
             
                  
    
     
    
                }
}       
