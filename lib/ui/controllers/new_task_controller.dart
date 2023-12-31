import 'package:get/get.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/network_caller/network_response.dart';
import 'package:task_manager/data/utility/urls.dart';

class NewTaskController extends GetxController {
  bool _getNewTaskInProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  bool get getNewTaskInProgress => _getNewTaskInProgress;
  TaskListModel get taskListModel => _taskListModel;

  Future<bool> getNewTaskList() async {
    _getNewTaskInProgress = true;
    bool isSuccess = false;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getNewTasks);
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.jsonResponse);
      isSuccess = true;
    }
    _getNewTaskInProgress = false;
    update();
    return isSuccess;
  }
}
