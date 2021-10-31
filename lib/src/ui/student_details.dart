import 'package:flutter/material.dart';
import 'package:student_details/src/model/Student.dart';
import '../utils/constant.dart';
import './component/component.dart';
import '../utils/color.dart';

enum SearchType { web, image, news, shopping }

class StudentDetail extends StatefulWidget {
  const StudentDetail({Key key}) : super(key: key);

  @override
  _StudentDetailState createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Student student;

  @override
  void initState() {
    student = Student();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstant.studentDetail,
      home: SafeArea(
        top: false,
        child: Scaffold(
          extendBody: true,
          appBar: _buildAppBar(),
          body: _buildBody(),
          bottomSheet: _buildBottomControl(),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Center(child: const Text(AppConstant.studentDetail)),
    );
  }

  Widget _buildTopControl() {
    return Container(
      color: AppColor.gradientLeft,
      padding: EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UIComponent.buildTopButton(
                  Colors.red,
                  Colors.white,
                  AppConstant.deleteLabel,
                  () => print("delete"),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UIComponent.buildTopButton(
                  Colors.white,
                  Colors.black,
                  AppConstant.cancelLabel,
                  () => print("cancel"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: UIComponent.buildTopButton(
                    Colors.blue,
                    Colors.white,
                    AppConstant.validateLabel,
                    () {
                      _formKey.currentState.validate();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControl() {
    return Container(
      height: 70.0,
      // margin: EdgeInsets.only(bottom: 5.0, right: 20.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                child: const Text(
                  AppConstant.goBackAndEdit,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.0,
                  ),
                ),
                onPressed: () => print("goBackAndEdit"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.all(4.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ElevatedButton(
                  child: const Text(
                    AppConstant.postLabel,
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print(student.parentGuardianHighest);
                      print(student.guardian1LastName);
                      print(student.guardian2LastName);
                      print(student.guardian1FirstName);
                      print(student.guardian2FirstName);
                      print(student.recordEffectiveStartDate);
                      print(student.recordEffectiveEndDate);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(EdgeInsets.all(4.0)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //for test
  List<Map<String, dynamic>> _generateDropdownList(String title, int length) {
    final result = <Map<String, dynamic>>[];
    for (int i = 0; i < length; i++) {
      result.add({
        "label": "$title - ${i + 1}",
        "value": i,
      });
    }
    return result;
  }

  Widget _buildStudentInfo() {
    Widget title = UIComponent.buildTitle(AppConstant.studentInfo);
    final fields = <Widget>[];
    // legalLastName
    Widget legalLastName = AppTextField(
      title: AppConstant.legalLastName,
      isRequired: true,
      student: new Student(),
      onSave: (newValue) => student.legalLastName = newValue,
    );
    // legalFirstName
    Widget legalFirstName = AppTextField(
      title: AppConstant.legalFirstName,
      isRequired: true,
      onSave: (newValue) => student.legalFirstName = newValue,
    );
    // legalMiddleName
    Widget legalMiddleName = AppTextField(
        title: AppConstant.legalMiddleName,
        isRequired: false,
        onSave: (newValue) => student.legalMiddleName = newValue);
    // aliasLegalLastName
    Widget aliasLegalLastName = AppTextField(
        title: AppConstant.aliasLegalLastName,
        isRequired: false,
        onSave: (newValue) => student.aliasLegalLastName = newValue);
    // aliasLegalLastName
    Widget aliasLegalFirstName = AppTextField(
        title: AppConstant.aliasLegalFirstName,
        isRequired: false,
        onSave: (newValue) => student.aliasLegalFirstName = newValue);
    // aliasLegalMiddleName
    Widget aliasLegalMiddleName = AppTextField(
        title: AppConstant.aliasLegalMiddleName,
        isRequired: false,
        onSave: (newValue) => student.aliasLegalMiddleName = newValue);
    Widget legalSuffix = AppDropDownField(
      title: AppConstant.legalSuffix,
      isRequired: false,
      data: _generateDropdownList(AppConstant.legalSuffix, 3),
      onSave: (newValue) => student.legalSuffix = newValue,
    );
    // birthDate
    Widget birthDate = AppDatePickerField(
      title: AppConstant.birthDate,
      isRequired: true,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      onSave: (newValue) => student.birthDate = newValue,
    );
    // preferredFirstName
    Widget preferredFirstName = AppTextField(
        title: AppConstant.preferredFirstName,
        isRequired: false,
        onSave: (newValue) => student.preferredFirstName = newValue);
    // preferredFirstName
    Widget preferredLastName = AppTextField(
        title: AppConstant.preferredLastName,
        isRequired: false,
        onSave: (newValue) => student.preferredLastName = newValue);
    // gender
    final genderList = [
      {
        "label": "Male - M",
        "value": 0,
      },
      {
        "label": "Female - F",
        "value": 1,
      },
      {
        "label": "Other - O",
        "value": 2,
      }
    ];
    Widget gender = AppDropDownField(
      title: AppConstant.gender,
      isRequired: false,
      data: genderList,
      onSave: (newValue) => student.gender = newValue,
    );
    // enrolledInUS
    Widget enrolledInUS = AppRadioField(
      title: AppConstant.enrolledInUS,
      isRequired: false,
      isHasThreeCol: false,
      onSave: (newValue) => student.enrolledInUS = newValue,
    );
    // birthCountry
    Widget birthCountry = AppDropDownField(
      title: AppConstant.birthCountry,
      isRequired: false,
      data: _generateDropdownList(AppConstant.birthCountry, 100),
      onSave: (newValue) => student.birthCountry = newValue,
    );
    // birthCity
    Widget birthCity = AppTextField(
      title: AppConstant.birthCity,
      isRequired: false,
      onSave: (newValue) => student.birthCity = newValue,
    );
    // initialUSEnrollmentDate
    Widget initialUSEnrollmentDate = AppDatePickerField(
      title: AppConstant.initialUSEnrollmentDate,
      isRequired: false,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      onSave: (newValue) => student.initialUSEnrollmentDate = newValue,
    );

    fields.add(legalLastName);
    fields.add(legalFirstName);
    fields.add(legalMiddleName);
    fields.add(aliasLegalLastName);
    fields.add(aliasLegalFirstName);
    fields.add(aliasLegalMiddleName);
    fields.add(legalSuffix);
    fields.add(birthDate);
    fields.add(preferredFirstName);
    fields.add(preferredLastName);
    fields.add(gender);
    fields.add(enrolledInUS);
    fields.add(birthCountry);
    fields.add(birthCity);
    fields.add(initialUSEnrollmentDate);
    return UIComponent.buildDetailsPart(title, fields);
  }

  Widget _buildEthnicityAndRace() {
    Widget title = UIComponent.buildTitle(AppConstant.ethnicityAndRace);
    final fields = <Widget>[];
    // hispanicEthnicityIndicator
    Widget hispanicEthnicityIndicator = AppRadioField(
      title: AppConstant.hispanicEthnicityIndicator,
      isRequired: false,
      isHasThreeCol: true,
      onSave: (newValue) => student.hispanicEthnicityIndicator = newValue,
    );
    // raceCodeMissingIndicator
    Widget raceCodeMissingIndicator = AppRadioField(
      title: AppConstant.raceCodeMissingIndicator,
      isRequired: false,
      isHasThreeCol: false,
      onSave: (newValue) => student.raceCodeMissingIndicator = newValue,
    );
    // ethnicityMissingIndicator
    Widget ethnicityMissingIndicator = AppRadioField(
      title: AppConstant.ethnicityMissingIndicator,
      isRequired: false,
      isHasThreeCol: false,
      onSave: (newValue) => student.ethnicityMissingIndicator = newValue,
    );
    // raceCode1
    Widget raceCode1 = AppDropDownField(
      title: AppConstant.raceCode1,
      isRequired: false,
      data: _generateDropdownList(AppConstant.raceCode1, 10),
      onSave: (newValue) => student.raceCode1 = newValue,
    );
    // raceCode2
    Widget raceCode2 = AppDropDownField(
      title: AppConstant.raceCode2,
      isRequired: false,
      data: _generateDropdownList(AppConstant.raceCode2, 10),
      onSave: (newValue) => student.raceCode2 = newValue,
    );
    // raceCode3
    Widget raceCode3 = AppDropDownField(
      title: AppConstant.raceCode3,
      isRequired: false,
      data: _generateDropdownList(AppConstant.raceCode3, 10),
      onSave: (newValue) => student.raceCode3 = newValue,
    );
    // raceCode4
    Widget raceCode4 = AppDropDownField(
      title: AppConstant.raceCode4,
      isRequired: false,
      data: _generateDropdownList(AppConstant.raceCode4, 10),
      onSave: (newValue) => student.raceCode4 = newValue,
    );
    // raceCode5
    Widget raceCode5 = AppDropDownField(
      title: AppConstant.raceCode5,
      isRequired: false,
      data: _generateDropdownList(AppConstant.raceCode5, 10),
      onSave: (newValue) => student.raceCode5 = newValue,
    );

    fields.add(hispanicEthnicityIndicator);
    fields.add(raceCodeMissingIndicator);
    fields.add(ethnicityMissingIndicator);
    fields.add(raceCode1);
    fields.add(raceCode2);
    fields.add(raceCode3);
    fields.add(raceCode4);
    fields.add(raceCode5);

    return UIComponent.buildDetailsPart(title, fields);
  }

  Widget _buildParentGuardian() {
    Widget title = UIComponent.buildTitle(AppConstant.parentGuardian);
    final fields = <Widget>[];
    // parentGuardianHighest
    Widget parentGuardianHighest = AppDropDownField(
      title: AppConstant.parentGuardianHighest,
      isRequired: false,
      data: _generateDropdownList(AppConstant.parentGuardianHighest, 10),
      onSave: (newValue) => student.parentGuardianHighest = newValue,
    );
    // guardian1FirstName
    Widget guardian1FirstName = AppTextField(
      title: AppConstant.guardian1FirstName,
      isRequired: false,
      onSave: (newValue) => student.guardian1FirstName = newValue,
    );
    // guardian1LastName
    Widget guardian1LastName = AppTextField(
      title: AppConstant.guardian1LastName,
      isRequired: false,
      onSave: (newValue) => student.guardian1LastName = newValue,
    );
    // guardian2FirstName
    Widget guardian2FirstName = AppTextField(
      title: AppConstant.guardian2FirstName,
      isRequired: false,
      onSave: (newValue) => student.guardian2FirstName = newValue,
    );
    // guardian2LastName
    Widget guardian2LastName = AppTextField(
      title: AppConstant.guardian2LastName,
      isRequired: false,
      onSave: (newValue) => student.guardian2LastName = newValue,
    );
    fields.add(parentGuardianHighest);
    fields.add(guardian1FirstName);
    fields.add(guardian1LastName);
    fields.add(guardian2FirstName);
    fields.add(guardian2LastName);
    return UIComponent.buildDetailsPart(title, fields);
  }

  Widget _buildBottomInfoField(String title, String info) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: RichText(
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: 10,
        softWrap: true,
        text: TextSpan(children: [
          TextSpan(text: title, style: UIStyle.text18Black),
          TextSpan(
            text: info,
            style: UIStyle.text20BlackBold,
          ),
        ]),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: 1.0,
      color: Colors.black26,
    );
  }

  Widget _buildBottomInfo() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 0,
              color: Colors.black,
              offset: Offset(0, 1),
              spreadRadius: 1)
        ],
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBottomInfoField(
              AppConstant.studentName, '....................'),
          _buildDivider(),
          _buildBottomInfoField(
              AppConstant.reportingLEA, '....................'),
          _buildDivider(),
          _buildBottomInfoField(
              AppConstant.schoolOfAttendance, '....................'),
          _buildDivider(),
          _buildBottomInfoField(AppConstant.sSID, '....................'),
          _buildDivider(),
          _buildBottomInfoField(AppConstant.localID, '....................'),
          _buildDivider(),
          _buildBottomInfoField(AppConstant.gender, '....................'),
          _buildDivider(),
          _buildBottomInfoField(AppConstant.birthDate, '....................'),
          _buildDivider(),
          _buildBottomInfoField(AppConstant.gradeLevel, '....................'),
          _buildDivider(),
          _buildBottomInfoField(AppConstant.enrollmentStartDate, '08/13/2020'),
        ],
      ),
    );
  }

  Widget _buildRecordEffective() {
    return Container(
        child: Column(
      children: [
        AppDatePickerField(
          title: AppConstant.recordEffectiveStartDate,
          isRequired: true,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          onSave: (newValue) => student.recordEffectiveStartDate = newValue,
        ),
        AppDatePickerField(
          title: AppConstant.recordEffectiveEndDate,
          isRequired: false,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          onSave: (newValue) => student.recordEffectiveEndDate = newValue,
        ),
      ],
    ));
  }

  Widget _buildDetail() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 50.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStudentInfo(),
                SizedBox(height: 10.0),
                _buildEthnicityAndRace(),
                SizedBox(height: 10.0),
                _buildParentGuardian(),
                SizedBox(height: 10.0),
                _buildBottomInfo(),
                SizedBox(height: 10.0),
                _buildRecordEffective()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildTopControl(),
        SizedBox(height: 10.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0),
            child: const Text(
              AppConstant.requiredMsg,
              style: TextStyle(color: Colors.red, fontSize: 15.0),
            ),
          ),
        ),
        Expanded(child: _buildDetail()),
      ],
    );
  }
}
