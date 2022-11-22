import 'package:flutter/material.dart' show ChangeNotifier;

class TaskProvider extends ChangeNotifier {
  List<String> tasks = [
    "Define provider class",
    "Provide/Configure the provider",
    "watch/read provider variables/function",
  ];

  void addTask(String task) {
    tasks.add(task);
    notifyListeners();
  }
}
