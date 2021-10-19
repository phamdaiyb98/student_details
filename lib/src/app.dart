import 'package:flutter/material.dart';
import 'package:student_details/src/ui/student_details.dart';
import 'package:student_details/src/utils/constant.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstant.studentDetail,
      home: StudentDetail(),
    );
  }
}
