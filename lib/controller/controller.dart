
import 'package:hive_flutter/adapters.dart';
import 'package:todohive/model/note_model.dart';


//store data in list
class ListController{
List <NoteModel> data=[];

//todo is name od database
final mybox=Hive.box('todo');


void addNote (NoteModel newnote){
  data.add(newnote);
  updateData();
  }

void deleteNote(int index) {
    data.removeAt(index);
    updateData();
    
}

//load data from the database
//todobase is name  of list
loadData()async{
  data=await mybox.get('tododata');
}

//update databse
void updateData(){
  mybox.put('tododata', data);
}
  
}