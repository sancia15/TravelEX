import 'package:flutter/material.dart';
import 'package:travel_ex/screens/home.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final _controller = TextEditingController();
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          actions:<Widget> [
            IconButton(
              icon: Icon(Icons.search,
                color: Colors.white,),
            )
          ],
          title: Text("Add A New Memory"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(name),
          Container(
            child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                        focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    hintText: "Enter your Memories",
                    filled: true,
                    fillColor: Colors.grey[200])),
            padding: EdgeInsets.all(32),
          ),
          Container(
            width: double.infinity,
            child: FlatButton(
              child: Text("Submit"),
              color: Colors.red,
              onPressed: () {
                // setState((){
                //   name= _controller.text;
                // });
              },
            ),
            padding: EdgeInsets.all(32),
          ),
        ]));
        Container(
                child:TextField(
                    controller:_controller,
                    decoration:InputDecoration(
                        enabledBorder:OutlineInputBorder(
                            borderSide:BorderSide(color:Colors.transparent),
                            borderRadius:BorderRadius.all(Radius.circular(40))

                        ),
                        focusedBorder:OutlineInputBorder(
                            borderSide:BorderSide(color:Colors.transparent),
                            borderRadius:BorderRadius.all(Radius.circular(40))

                        ),
                        hintText:"Title",
                        filled:true,
                        fillColor: Colors.grey[200]

                    )
                ),
                padding: EdgeInsets.all(32),
              ),

              Container(
                child:TextField(
                  controller:_controller,
                  decoration:InputDecoration(
                    enabledBorder:OutlineInputBorder(
                      borderSide:BorderSide(color:Colors.transparent),
                      borderRadius:BorderRadius.all(Radius.circular(40))

                    ),
                    focusedBorder:OutlineInputBorder(
                        borderSide:BorderSide(color:Colors.transparent),
                        borderRadius:BorderRadius.all(Radius.circular(40))

                    ),
                    hintText:"Enter your memories",
                    filled:true,
                    fillColor: Colors.grey[200]

                  )
                ),
                padding: EdgeInsets.all(32),
              ),

              Container(
                width:double.infinity,
                child:FlatButton(
                  child: Text("Submit"),
                  color:Colors.red,
                  onPressed:(){
                    // setState((){
                    //   name= _controller.text;
                    // });
                  },
                ),
                padding: EdgeInsets.all(32),
              ),
            ]
        )
    );
  }

}

//TODO

// Design: Add a TextBox to write about the Adventure-Done
//         Add an Image view such that the user can add a certain image
//         Add an option to add the location
//
// Implementation: On Submit, add the details to the SQLLite DB
//     Implement a way to add image to DB
//     Get the location on button click
//     Get the system current time and date