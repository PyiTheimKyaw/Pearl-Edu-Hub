import 'package:pearl_edu_hub/data/vos/classes_vo.dart';

abstract class DashboardClassesDao {
  void saveAllDashboardClasses(List<ClassesVO>? dashboardClasses);

  void saveSingleClass(ClassesVO? classDetail);

  List<ClassesVO>? getAllDashboardClasses();

  List<ClassesVO>? getAllDashboardClassesList();

  ClassesVO? getDashboardClassById({required int id});

  ClassesVO? getDashboardClassDetails({required int id});

  Stream getAllDashboardClassesEventStream();

  Stream<List<ClassesVO>?> getAllDashboardClassesStream();

  Stream<ClassesVO?> getClassDetailsStream({required int id});
}
