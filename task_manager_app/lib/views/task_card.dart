import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:task_manager_app/utils/constant_colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../widget/check_box_widget.dart';
import '../widget/text_widget.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final bool completed;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onCheckboxChanged;

  const TaskCard({super.key,
    required this.title,
    required this.completed,
    required this.onTap,
    required this.onDelete,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Slidable(
      // The start action pane is the left side of the slide
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed:(context) => onDelete(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(
          vertical: screenSize.height / 90.0,
          horizontal: screenSize.width / 30.0,
        ),
        decoration: BoxDecoration(
          color: completed ? Colors.green.shade100 : ConstantColor.whiteColor,
          borderRadius: BorderRadius.circular(12.0),
          border: Border(
            left: BorderSide(
              color: completed ? Colors.green.shade300 : ConstantColor.purpleColor,
              width: 3.0,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 4,
              spreadRadius: 4,
            ),
          ],
        ),
        child: ListTile(
          dense: true,
          contentPadding: const EdgeInsets.all(10),
          title: textWidget(
            title: title,
            style: TextStyle(
              fontSize: 16,
              color: completed ? ConstantColor.greenColor : ConstantColor.blackColor,
              decoration: completed ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ).animate().fade().slideY(
            duration: 200.milliseconds,
            curve: Curves.easeInSine,
            begin: 1,
          ),
          trailing: checkBoxWidget(
            value: completed,
            onChanged: (value) {
              onCheckboxChanged();
            },
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
