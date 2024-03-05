import 'package:hive/hive.dart';
import 'package:pearl_edu_hub/data/vos/classes_vo.dart';
import 'package:pearl_edu_hub/persistence/daos/dashboard_daos/classes_dao.dart';
import 'package:pearl_edu_hub/utils/hive_constants.dart';

class DashboardClassesDaoImpl extends DashboardClassesDao {
  @override
  void saveAllDashboardClasses(List<ClassesVO>? dashboardClasses) {
    Map<int, ClassesVO> classesMap = {
      for (var classItem in dashboardClasses ?? []) classItem.id: classItem
    };
    getDashboardClassesBox()
      ..deleteAll(getDashboardClassesBox().keys)
      ..putAll(classesMap);
  }

  @override
  void saveSingleClass(ClassesVO? classDetail) async {
    if (classDetail != null) {
      getDashboardClassesBox()
        ..delete(classDetail.id)
        ..put(classDetail.id, classDetail);
    }
  }

  @override
  List<ClassesVO>? getAllDashboardClasses() {
    return getDashboardClassesBox().values.toList();
  }

  @override
  List<ClassesVO>? getAllDashboardClassesList() {
    if (getAllDashboardClasses() != null &&
        (getAllDashboardClasses()?.isNotEmpty ?? false)) {
      return getAllDashboardClasses();
    } else {
      return null;
    }
  }

  @override
  Stream getAllDashboardClassesEventStream() {
    return getDashboardClassesBox().watch();
  }

  @override
  Stream<List<ClassesVO>?> getAllDashboardClassesStream() {
    return Stream.value(getAllDashboardClassesList());
  }

  Box<ClassesVO> getDashboardClassesBox() {
    return Hive.box<ClassesVO>(kBoxDashboardClasses);
  }

  @override
  ClassesVO? getDashboardClassById({required int id}) {
    return getDashboardClassesBox().get(id);
  }

  @override
  ClassesVO? getDashboardClassDetails({required int id}) {
    if (getDashboardClassById(id: id) != null) {
      return getDashboardClassById(id: id);
    } else {
      return null;
    }
  }

  @override
  Stream<ClassesVO?> getClassDetailsStream({required int id}) {
    return Stream.value(getDashboardClassById(id: id));
  }
}
