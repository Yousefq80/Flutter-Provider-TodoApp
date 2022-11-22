import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../providers/to_doprovider.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
        actions: [
          IconButton(
              onPressed: () {
                context.push("/add");
              },
              icon: Icon(Icons.add_box_outlined))
        ],
      ),
      body: ListView.builder(
          itemCount: context.watch<TaskProvider>().tasks.length,
          itemBuilder: (context, index) => Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: context
                          .watch<TaskProvider>()
                          .tasks[index]
                          .iscompleted,
                      onChanged: (value) {
                        context.read<TaskProvider>().changestatus(index);
                      },
                    ),
                    Text(context.watch<TaskProvider>().tasks[index].task),
                    Spacer(),
                    if (!context.watch<TaskProvider>().tasks[index].iscompleted)
                      IconButton(
                          onPressed: null, icon: Icon(Icons.delete_forever))
                    else
                      IconButton(
                          onPressed: () {
                            var taskprovider = context.read<TaskProvider>();
                            taskprovider.deletetask(index);
                          },
                          icon: Icon(Icons.delete)),
                  ],
                ),
              ))),
    );
  }
}
