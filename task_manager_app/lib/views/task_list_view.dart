import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../widget/multi_action_floating_button.dart';
import '../widget/search_bar_widget.dart';
import '../widget/shimmer.dart';
import 'add_edit_task_view.dart';
import 'task_card.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.find();
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: searchBarWidget(
          title: 'Task Listing',
          onSearch: (value) {
            searchController.clear();
            controller.filterTasks(value);
            controller.currentPage(1); // Reset page number when filtering
          },
        ),
      ),
      body: Obx(() {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: controller.isLoading.value && controller.filteredTasks.isEmpty
              ? ListView.builder(
            itemCount: 16, // Number of skeleton cards to show
            itemBuilder: (context, index) {
              return const SkeletonTaskCard();
            },
          )
              : controller.filteredTasks.isEmpty
              ? Center(child: Text('No tasks available', style: Theme.of(context).textTheme.bodyLarge))
              : NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!controller.isLoading.value &&
                  controller.hasMoreData.value &&
                  scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                controller.loadMoreTasks();
              }
              return true;
            },
            child: ListView.builder(
              itemCount: controller.filteredTasks.length + 1, // Add one for the loading indicator
              itemBuilder: (context, index) {
                if (index == controller.filteredTasks.length) {
                  return controller.hasMoreData.value
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox.shrink();
                }

                final task = controller.filteredTasks[index];
                return TaskCard(
                  title: task.title,
                  completed: task.completed,
                  onDelete: () => controller.deleteTask(task.id),
                  onTap: () => Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
                        opacity: animation,
                        child: AddEditTaskView(task: task),
                      ),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;
                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);
                        return SlideTransition(position: offsetAnimation, child: child);
                      },
                    ),
                  ),
                  onCheckboxChanged: () => controller.toggleCompletion(task.id),
                );
              },
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async => await Get.toNamed('/add-edit-task'),
      ),
    );
  }
}
