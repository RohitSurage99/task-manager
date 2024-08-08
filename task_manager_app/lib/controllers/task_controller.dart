import 'package:get/get.dart';
import '../models/task.dart';
import '../services/api_service.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  var filteredTasks = <Task>[].obs;
  var isLoading = true.obs;
  var currentPage = 0.obs;
  final int itemsPerPage = 10;
  var hasMoreData = true.obs;
  //
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    fetchTasks();
    super.onInit();
  }


   fetchTasks({int page = 1}) async {
    isLoading(true);
    try {
      var taskList = await apiService.fetchTasks(page: page, limit: itemsPerPage);
      if (taskList.isEmpty) {
        hasMoreData(false);
      } else {
        var newTasks = taskList.map((task) => Task.fromJson(task)).toList();
        if (page == 1) {
          tasks.value = newTasks;
        } else {
          tasks.addAll(newTasks);
        }
        filteredTasks.value = tasks;
        currentPage(page);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load tasks');
    } finally {
      isLoading(false);
    }
  }

  List<Task> getPaginatedTasks(int page) {
    final startIndex = (page - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    return filteredTasks.sublist(startIndex, endIndex < filteredTasks.length ? endIndex : filteredTasks.length);
  }

  void loadMoreTasks() {
    if (!hasMoreData.value || isLoading.value) return;
    final nextPage = currentPage.value + 1;
    fetchTasks(page: nextPage);
  }


  void filterTasks(String query) {
    if (query.isEmpty) {
      filteredTasks.value = tasks;
      hasMoreData(false);
    } else {
      hasMoreData(false);
      filteredTasks.value = tasks.where((task) => task.title.toLowerCase().contains(query.toLowerCase())).toList();
    }
  }

  void addTask(Task task) async {
    try {
      await apiService.addTask(task.toJson());
      tasks.add(task);
      Get.snackbar('Task Added!', 'Successfully add task');
      filterTasks(''); // Refresh filtered tasks
      // fetchTasks(page: currentPage.value);
    } catch (e) {
      Get.snackbar('Error', 'Failed to add task');
    }
  }

  void updateTask(Task task) async {
    try {
      await apiService.updateTask(task.id, task.toJson());
      var index = tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        tasks[index] = task;
        Get.snackbar('Task Update!', 'Successfully update task');
        filterTasks(''); // Refresh filtered tasks
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update task');
    }
  }

  void deleteTask(int id) async {
    try {
      await apiService.deleteTask(id);
      tasks.removeWhere((t) => t.id == id);
      Get.snackbar('Delete!', 'Successfully delete task');
      filterTasks('');
      // fetchTasks(page: currentPage.value);
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete task');
    }
  }

  void toggleCompletion(int id) {
    var index = tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      var task = tasks[index];
      var updatedTask = task.copyWith(completed: !task.completed);
      updateTask(updatedTask);
    }
  }

// void toggleCompletion(int id) {
//     var index = tasks.indexWhere((t) => t.id == id);
//     if (index != -1) {
//       var task = tasks[index];
//       task.completed = !task.completed;
//       updateTask(task);
//     }
//   }
}




