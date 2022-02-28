class Todo {
  String? title;
  int? selectedDate;
  String? desc;
  bool done;

  Todo({this.title, this.selectedDate, this.desc, this.done = false});

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        title: json['title'],
        selectedDate: json['selectedDate'],
        desc: json['desc'],
        done: json['done'],
      );
  Map<String, dynamic> toJson() =>
      {
      'title': title, 
      'selectedDate': selectedDate, 
      'desc': desc,
      'done' :done,
      };
}
