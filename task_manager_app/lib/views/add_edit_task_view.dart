import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/utils/constant_colors.dart';
import '../controllers/task_controller.dart';
import '../models/task.dart';
import '../utils/text_style.dart';
import '../widget/button_widget.dart';
import '../widget/pop_up_alert_dialog.dart';
import '../widget/text_form_field_widget.dart';
import '../widget/text_widget.dart';

class AddEditTaskView extends StatelessWidget {
  final Task? task;
  final TextEditingController titleController = TextEditingController();
  final TaskController controller = Get.find();

  AddEditTaskView({super.key, this.task}) {
    if (task != null) {
      titleController.text = task!.title;
    }
  }


  //----global key ---
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: ConstantColor.whiteColor),
        title: textWidget(title: task == null ? 'Add Task' : 'Edit Task',style: ConstantTextStyle.appBarTitleTextStyle),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          textWidget(title: 'Title',style: Theme.of(context).textTheme.displayMedium),
               SizedBox(height: screenSize.height/60.0),
              ElegantTextField(
                controller: titleController,
                  hintText: 'Enter task title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task title';
                  }
                  return null;
                },
              ),
               SizedBox(height: screenSize.height/40.0),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: task == null
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                        modernElevatedButton(
                        key: const ValueKey('addButton'),
                        backgroundColor: ConstantColor.whiteColor,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            controller.addTask(Task(
                              userId: 1,
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: titleController.text,
                              completed: false,
                            ));
                            Get.back();
                          }
                        },
                        // minimumSize: Size(screenSize.width, screenSize.height/24.0),
                        label: 'Add Task',
                        textStyle: ConstantTextStyle.button2TextStyle
                                        ),
                      ],
                    )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    modernElevatedButton(
                        key: const ValueKey('updateButton'),
                        backgroundColor: ConstantColor.whiteColor,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            controller.updateTask(task!.copyWith(title: titleController.text));
                            Get.back();
                          }
                        },
                        label: 'Update Task',
                        textStyle: ConstantTextStyle.button2TextStyle
                    ),

                     SizedBox(height: screenSize.height/80),

                    modernElevatedButton(
                      key: const ValueKey('deleteButton'),
                      onPressed: () {
                        YesNoPermissionDialog.showExitConfirmationDialog(
                          context:context,
                          title: 'Please Confirm!', content: 'Are you sure want to remove this task ?',
                          actions: [
                            modernElevatedButton(
                                key: const ValueKey('deleteButton'),
                                label: 'Yes',
                                backgroundColor: ConstantColor.purpleColor,
                                onPressed:() {controller.deleteTask(task!.id);
                                  Get.back();
                                  Get.back();
                                }
                            ),
                            SizedBox(width: screenSize.width/100.0),
                            modernElevatedButton(
                              // key: const ValueKey('deleteButton'),
                              label: 'No',
                              onPressed:() => Get.back(),
                            ),
                          ],
                        );
                        // controller.deleteTask(task!.id);Get.back();
                        },
                      label: 'Delete Task',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


