import 'package:hive/hive.dart';
import 'package:pearl_edu_hub/data/vos/classes_vo.dart';
import 'package:pearl_edu_hub/data/vos/enrollment_vo.dart';
import 'package:pearl_edu_hub/data/vos/lecture_vo.dart';
import 'package:pearl_edu_hub/data/vos/live_session_vo.dart';
import 'package:pearl_edu_hub/utils/hive_constants.dart';

class BoxHelper {
  BoxHelper() {
    _registerAdapters();
  }

  _registerAdapters() {
    Hive
      ..registerAdapter(ClassesVOAdapter())
      ..registerAdapter(LectureVOAdapter())
      ..registerAdapter(EnrollmentVOAdapter())
      ..registerAdapter(LiveSessionVOAdapter());
  }

  Future<void> openBoxes() async {
    await Future.wait([
      Hive.openBox<ClassesVO>(kBoxDashboardClasses),
      Hive.openBox<LectureVO>(kBoxDashboardLectures),
      Hive.openBox<EnrollmentVO>(kBoxEnrollments),
      Hive.openBox<LiveSessionVO>(kBoxLiveSessions),
    ]);
  }
}
