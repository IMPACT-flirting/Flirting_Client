import 'package:get/get.dart';

class HomeController extends GetxController {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  DateTime get focusedDay => _focusedDay;
  DateTime? get selectedDay => _selectedDay;

  void updateFocusedDay(DateTime focusedDay) {
    _focusedDay = focusedDay;
    update();
  }

  void updateSelectedDay(DateTime selectedDay) {
    _selectedDay = selectedDay;
    update();
  }
}
