import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/blocs/dashboard_class_details_page_bloc.dart';
import 'package:pearl_edu_hub/data/vos/classes_vo.dart';
import 'package:pearl_edu_hub/rescources/strings.dart';
import 'package:pearl_edu_hub/widgets/dashboard_app_bar_view.dart';
import 'package:provider/provider.dart';

class DashboardClassDetailsPage extends StatelessWidget {
  const DashboardClassDetailsPage(
      {super.key, required this.classId, required this.onTapMenu});

  final String classId;
  final Function onTapMenu;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          DashboardClassDetailsPageBloc(classId: int.parse(classId)),
      child: Selector<DashboardClassDetailsPageBloc, ClassesVO?>(
        selector: (BuildContext context, bloc) => bloc.classDetail,
        builder: (BuildContext context, classDetail, Widget? child) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardAppBarView(
                onTapMenu: () {
                  onTapMenu();
                },
                appBarLabel: '$kTextClasses/${classDetail?.id}'),
          ],
        ),
      ),
    );
  }
}
