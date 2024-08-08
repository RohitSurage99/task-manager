// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:get/get.dart';
// import 'package:task_manager_app/controllers/task_controller.dart';
// import 'package:task_manager_app/models/task.dart';
// import 'package:task_manager_app/services/api_service.dart';
//
// // Mock class for ApiService
// class MockApiService extends Mock implements ApiService {}
//
// void main() {
//   group('TaskController', () {
//     late TaskController taskController;
//     late MockApiService mockApiService;
//
//     setUp(() {
//       mockApiService = MockApiService();
//       taskController = TaskController(apiService: mockApiService);
//     });
//
//     test('fetchTasks updates tasks and filteredTasks when successful', () async {
//       // Arrange
//       final response = [{'id': 1, 'title': 'Test Task', 'completed': false}];
//       when(mockApiService.fetchTasks(page: 1, limit: 10))
//           .thenAnswer((_) async => response);
//
//       // Act
//       await taskController.fetchTasks();
//
//       // Assert
//       expect(taskController.tasks.length, 1);
//       expect(taskController.filteredTasks.length, 1);
//       expect(taskController.tasks[0].title, 'Test Task');
//     });
//
//     test('fetchTasks sets hasMoreData to false if no data returned', () async {
//       // Arrange
//       when(mockApiService.fetchTasks(page: 1, limit: 10))
//           .thenAnswer((_) async => []);
//
//       // Act
//       await taskController.fetchTasks();
//
//       // Assert
//       expect(taskController.hasMoreData.value, false);
//     });
//
//     test('addTask updates tasks list and shows success message', () async {
//       // Arrange
//       final task = Task(id: 1, title: 'New Task', completed: false);
//       when(mockApiService.addTask(any)).thenAnswer((_) async {});
//
//       // Act
//       await taskController.addTask(task);
//
//       // Assert
//       expect(taskController.tasks.length, 1);
//       expect(taskController.tasks[0].title, 'New Task');
//       verify(mockApiService.addTask(task.toJson())).called(1);
//     });
//
//     test('updateTask updates the task and shows success message', () async {
//       // Arrange
//       final task = Task(id: 1, title: 'Updated Task', completed: true);
//       when(mockApiService.updateTask(any, any)).thenAnswer((_) async {});
//
//       // Act
//       await taskController.updateTask(task);
//
//       // Assert
//       expect(taskController.tasks[0].title, 'Updated Task');
//       verify(mockApiService.updateTask(task.id, task.toJson())).called(1);
//     });
//
//     test('deleteTask removes the task from the list and shows success message', () async {
//       // Arrange
//       final task = Task(id: 1, title: 'Task to be deleted', completed: false);
//       taskController.tasks.add(task);
//       when(mockApiService.deleteTask(any)).thenAnswer((_) async {});
//
//       // Act
//       await taskController.deleteTask(task.id);
//
//       // Assert
//       expect(taskController.tasks.isEmpty, true);
//       verify(mockApiService.deleteTask(task.id)).called(1);
//     });
//
//     test('toggleCompletion toggles task completion status', () async {
//       // Arrange
//       final task = Task(id: 1, title: 'Task to be toggled', completed: false);
//       taskController.tasks.add(task);
//       final updatedTask = task.copyWith(completed: true);
//       when(mockApiService.updateTask(any, any)).thenAnswer((_) async {});
//
//       // Act
//       await taskController.toggleCompletion(task.id);
//
//       // Assert
//       expect(taskController.tasks[0].completed, true);
//       verify(mockApiService.updateTask(task.id, updatedTask.toJson())).called(1);
//     });
//
//     test('filterTasks filters tasks based on query', () async {
//       // Arrange
//       final task1 = Task(id: 1, title: 'Task One', completed: false);
//       final task2 = Task(id: 2, title: 'Task Two', completed: true);
//       taskController.tasks.addAll([task1, task2]);
//
//       // Act
//       taskController.filterTasks('One');
//
//       // Assert
//       expect(taskController.filteredTasks.length, 1);
//       expect(taskController.filteredTasks[0].title, 'Task One');
//     });
//
//     test('filterTasks clears filter when query is empty', () async {
//       // Arrange
//       final task1 = Task(id: 1, title: 'Task One', completed: false);
//       final task2 = Task(id: 2, title: 'Task Two', completed: true);
//       taskController.tasks.addAll([task1, task2]);
//
//       // Act
//       taskController.filterTasks('');
//
//       // Assert
//       expect(taskController.filteredTasks.length, 2);
//     });
//   });
// }
