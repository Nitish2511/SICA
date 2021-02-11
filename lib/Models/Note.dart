
class Note {

  int _id;
  String _title;
  String _discription;
  String _date;
  int _priority;

  Note(this._title,this._date,this._priority,[this._discription]);

  Note.withID(this._id,this._title,this._date,this._priority,[this._discription]);

  int get id => _id;
  String get title => _title;
  String get discription => _discription;
  String get date => _date;
  int get priority => _priority;

  set title(String newTitle){
    if(newTitle.length <=255){
      this._title = newTitle;
    }
  }
  set discription(String newDiscription){
    if(newDiscription.length <= 255){
      this._discription = newDiscription;
    }
  }
  set date(String newDate){
    this._date = newDate;
  }
  set priority(int newPriority){
    if(newPriority >=1 && newPriority <=2){
      this._priority = newPriority;
    }
  }
  Map<String,dynamic> ToMap(){
    var map = Map<String, dynamic>();

    if(id != 0){
      map['id'] = _id;
    }
    map['title'] = _title;
    map['discription'] = _discription;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }
  Note.fromMapObject(Map<String, dynamic> map){
    this._id = map['id'];
    this._title = map['title'];
    this._discription = map['discription'];
    this._priority = map['priority'];
    this._date = map['date'];
  }
}