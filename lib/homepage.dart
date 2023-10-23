import 'package:flutter/material.dart';
import 'package:todohive/controller/controller.dart';
import 'package:todohive/model/note_model.dart';
import 'package:todohive/view/widgets.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
 void initState(){
  loaddbdata();
    super.initState();
  }
  loaddbdata() async {
     ListController obj = ListController();
     await obj.loadData();
  }
  TextEditingController _titlecontroller = TextEditingController();

  TextEditingController _descriptioncontroller = TextEditingController();

  TextEditingController _datecontroller = TextEditingController();

  ListController obj = ListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('My Notes')),
        backgroundColor: Color.fromARGB(255, 235, 124, 232),
      ),
      backgroundColor: Color.fromARGB(255, 131, 169, 231),


      body: ListView.separated(
        itemCount: obj.data.length,
        itemBuilder: (context, index) => Todolist(
          title: obj.data[index].title,
          description: obj.data[index].des,
          date: obj.data[index].date,
          onPressed: () {
           obj.deleteNote(index);
            setState(() {});
          },
        ),
         separatorBuilder: (context, index) => Spacer(),
      ),
        floatingActionButton: FloatingActionButton(
            elevation: 0,
            child: Icon(
              Icons.add,
              color: Color(0xff374151),
            ),
            backgroundColor: Color.fromARGB(255, 235, 124, 232),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).viewInsets.bottom),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: _titlecontroller,
                              decoration: InputDecoration(
                                  hintText: 'enter title',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: _descriptioncontroller,
                              decoration: InputDecoration(
                                  hintText: 'enter description',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                           
                            TextField(
                              controller: _datecontroller,
                              decoration: InputDecoration(
                                  hintText: 'enter date',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                obj.addNote(
                                  NoteModel(
                                      title: _titlecontroller.text,
                                      date: _datecontroller.text,
                                      des: _descriptioncontroller.text),
                                );
                                _datecontroller.clear();
                                _descriptioncontroller.clear();
                                _titlecontroller.clear();
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Text('Add',
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }),
      );
    
  }
}
