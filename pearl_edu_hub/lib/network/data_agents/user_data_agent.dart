import 'package:pearl_edu_hub/network/responses/classes_response.dart';
import 'package:pearl_edu_hub/network/responses/students_response.dart';

abstract class UserDataAgent {
  Future<ClassesResponse> getClassesForAdmin();

  Future<StudentsResponse> getStudents();
}
