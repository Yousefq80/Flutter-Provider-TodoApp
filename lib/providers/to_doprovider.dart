import 'package:flutter/material.dart';
import 'package:tasklist/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Taskmodel> tasks = [
    // "do task1",
    // "do task2",
    // "do task3",
    // "do task4",
    // "do task5",
    Taskmodel(task: "task 01", iscompleted: false),
    Taskmodel(task: "task 02", iscompleted: false),
    Taskmodel(task: "task 03", iscompleted: false),
    Taskmodel(task: "task 04", iscompleted: false),
    Taskmodel(task: "task 05", iscompleted: false),
  ];

  void addTask(String task) {
    Taskmodel taskslist = Taskmodel(task: task, iscompleted: false);
    tasks.add(taskslist);
    notifyListeners();
  }

  void changestatus(int index) {
    tasks[index].iscompleted = !tasks[index].iscompleted;
    notifyListeners();
  }

  void deletetask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
