
import 'package:todohive/model/note_model.dart';
//store data in class
class ListController{

List <NoteModel> data=[];
void addNote (NoteModel newnote){
  data.add(newnote);

  }
}