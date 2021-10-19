import 'package:flutter/material.dart';
import 'package:student_details/src/ui/enum/gender.dart';
import '../utils/constant.dart';
import './component/component.dart';
import '../utils/color.dart';

class StudentDetail extends StatefulWidget {
  const StudentDetail({Key key}) : super(key: key);

  @override
  _StudentDetailState createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  Key _formKey = GlobalKey<FormState>();
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
          // floatingActionButton: _buildBottomControl(),
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
                    () => print("validateLabel"),
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
                  onPressed: () => print("post"),
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
    Widget legalLastName =
        AppTextField(title: AppConstant.legalLastName, isRequired: true);
    // legalFirstName
    Widget legalFirstName =
        AppTextField(title: AppConstant.legalFirstName, isRequired: true);
    // legalMiddleName
    Widget legalMiddleName =
        AppTextField(title: AppConstant.legalMiddleName, isRequired: false);
    // aliasLegalLastName
    Widget aliasLegalLastName =
        AppTextField(title: AppConstant.aliasLegalLastName, isRequired: false);
    // aliasLegalLastName
    Widget aliasLegalFirstName =
        AppTextField(title: AppConstant.aliasLegalFirstName, isRequired: false);
    // aliasLegalMiddleName
    Widget aliasLegalMiddleName = AppTextField(
        title: AppConstant.aliasLegalMiddleName, isRequired: false);
    Widget legalSuffix = AppDropDownField(
        title: AppConstant.legalSuffix,
        isRequired: false,
        data: _generateDropdownList(AppConstant.legalSuffix, 3));
    // birthDate
    Widget birthDate = AppDatePickerField(
      title: AppConstant.birthDate,
      isRequired: true,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    // preferredFirstName
    Widget preferredFirstName =
        AppTextField(title: AppConstant.preferredFirstName, isRequired: false);
    ;
    // preferredFirstName
    Widget preferredLastName =
        AppTextField(title: AppConstant.preferredLastName, isRequired: false);
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
        title: AppConstant.gender, isRequired: false, data: genderList);
    // enrolledInUS
    Widget enrolledInUS = AppRadioField(
      title: AppConstant.enrolledInUS,
      isRequired: false,
      isHasThreeCol: false,
    );
    // birthCountry
    Widget birthCountry = AppDropDownField(
        title: AppConstant.birthCountry,
        isRequired: false,
        data: _generateDropdownList(AppConstant.birthCountry, 100));
    // birthCity
    Widget birthCity =
        AppTextField(title: AppConstant.birthCity, isRequired: false);
    // initialUSEnrollmentDate
    Widget initialUSEnrollmentDate = AppDatePickerField(
      title: AppConstant.initialUSEnrollmentDate,
      isRequired: false,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
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
    );
    // raceCodeMissingIndicator
    Widget raceCodeMissingIndicator = AppRadioField(
      title: AppConstant.raceCodeMissingIndicator,
      isRequired: false,
      isHasThreeCol: false,
    );
    // ethnicityMissingIndicator
    Widget ethnicityMissingIndicator = AppRadioField(
      title: AppConstant.ethnicityMissingIndicator,
      isRequired: false,
      isHasThreeCol: false,
    );
    // raceCode1
    Widget raceCode1 = AppDropDownField(
      title: AppConstant.raceCode1,
      isRequired: false,
      data: _generateDropdownList(AppConstant.raceCode1, 10),
    );
    // raceCode2
    Widget raceCode2 = AppDropDownField(
      title: AppConstant.raceCode2,
      isRequired: false,
      data: _generateDropdownList(AppConstant.raceCode2, 10),
    );
    // raceCode3
    Widget raceCode3 = AppDropDownField(
      title: AppConstant.raceCode3,
      isRequired: false,
      data: _generateDropdownList(AppConstant.raceCode3, 10),
    );
    // raceCode4
    Widget raceCode4 = AppDropDownField(
      title: AppConstant.raceCode4,
      isRequired: false,
      data: _generateDropdownList(AppConstant.raceCode4, 10),
    );
    // raceCode5
    Widget raceCode5 = AppDropDownField(
      title: AppConstant.raceCode5,
      isRequired: false,
      data: _generateDropdownList(AppConstant.raceCode5, 10),
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
    );
    // guardian1FirstName
    Widget guardian1FirstName =
        AppTextField(title: AppConstant.guardian1FirstName, isRequired: false);
    // guardian1LastName
    Widget guardian1LastName =
        AppTextField(title: AppConstant.guardian1LastName, isRequired: false);
    // guardian2FirstName
    Widget guardian2FirstName =
        AppTextField(title: AppConstant.guardian2FirstName, isRequired: false);
    // guardian2LastName
    Widget guardian2LastName =
        AppTextField(title: AppConstant.guardian2LastName, isRequired: false);
    fields.add(parentGuardianHighest);
    fields.add(guardian1FirstName);
    fields.add(guardian1LastName);
    fields.add(guardian2FirstName);
    fields.add(guardian2LastName);
    return UIComponent.buildDetailsPart(title, fields);
  }

// TODO: làm tiếp boxShadow
  Widget _buildBottomInfo() {
    return Container(
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
      child: Row(
        // mainAxisSize: MainAxisSize.max,

        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                        text: AppConstant.studentName,
                        style: UIStyle.text18Black),
                    TextSpan(
                        text: "Jones, Jonas", style: UIStyle.text20BlackBold),
                  ]),
                ),
              )
            ],
          ),
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
        ),
        AppDatePickerField(
          title: AppConstant.recordEffectiveEndDate,
          isRequired: false,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
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
