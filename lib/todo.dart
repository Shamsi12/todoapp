import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  var output = "";
  List<dynamic> myList = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Center(
        child: Text("TODO App", style: TextStyle(   color: Colors.white,
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,),),),
        backgroundColor: Colors.blue[600],
      ),
      
      body: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              color: Colors.teal,
              margin: EdgeInsets.only(top: 15),
              child: ListTile(
                title: Text("${myList[index]}",style: TextStyle(color: Colors.white,fontSize: 16),),
                trailing: Container(
                  width: 50,
                  child: Row(
                    children: [
                      //To delete
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            myList.removeAt(index);
                          });
                        },
                        child: Icon(Icons.delete,color: Colors.white,size: 25,),
                      ),

                      //To Update/Edit
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Edit Item"),
                                  content: TextField(
                                    onChanged: (value){ output = value; },),
                                  actions: [
                                    ElevatedButton(onPressed: (){
                                      setState(() {
                                        myList.replaceRange(index, index+1, {output});
                                      });
                                      Navigator.of(context).pop();
                                    }, child: Text("Edit"))
                                  ],
                                );
                              });
                        },
                        child: Icon(Icons.edit,color: Colors.white,size: 25),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Item"),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            myList.add(output);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },
        child: Text("+",textAlign: TextAlign.center ,style: TextStyle(fontWeight: FontWeight.bold, 
                                          fontSize: 35,),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
