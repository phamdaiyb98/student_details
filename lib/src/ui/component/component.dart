import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:student_details/src/model/Student.dart';
import 'package:student_details/src/ui/enum/radio_choose.dart';
import 'package:student_details/src/utils/constant.dart';
import 'package:student_details/src/utils/function_helper.dart';
import 'package:student_details/src/utils/validator.dart';

class UIComponent {
  static Widget buildTopButton(
      Color backgroundColor, Color color, String label, Function onPressed) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          padding: MaterialStateProperty.all(EdgeInsets.all(5.0))),
      child: Text(label, style: TextStyle(color: color)),
      onPressed: () => onPressed(),
    );
  }

  static Widget buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.green[900],
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  static Widget buildDetailsPart(Widget title, List<Widget> fields) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(child: title),
          SizedBox(height: 10.0),
          SizedBox(
            child: Column(children: fields),
          )
        ],
      ),
    );
  }
}

class UIStyle {
  static const UnderlineInputBorder enabledBorder = UnderlineInputBorder(
    // prefixIcon có height dư ra một ít là để khớp với enabledBorder,focusedBorder,errorBorder,focusedErrorBorder
    // => thêm borderSide trùng với màu của TextField là được
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  );

  static const TextStyle text18Black =
      TextStyle(fontSize: 18.0, color: Colors.black);

  static const TextStyle text20BlackBold = TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black);
}

// AppTextField
class AppTextField extends StatefulWidget {
  const AppTextField(
      {Key key, this.title, this.isRequired, this.student, this.onSave})
      : super(key: key);
  final String title;
  final bool isRequired;
  final Student student;
  final Function onSave;

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.isRequired ? widget.title + " *" : widget.title,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600)),
          SizedBox(height: 5.0),
          SizedBox(
            height: 70.0,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.isRequired
                  ? (value) => Validator.validateTextField(value)
                  : null,
              onSaved: (newValue) => widget.onSave(newValue),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                helperText: "",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.black54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.green),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.black54),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// AppRadioField
class AppRadioField extends StatefulWidget {
  const AppRadioField(
      {Key key, this.title, this.isRequired, this.isHasThreeCol, this.onSave})
      : super(key: key);

  final String title;
  final bool isRequired;
  final bool isHasThreeCol;
  final Function onSave;

  @override
  _RadioFieldState createState() => _RadioFieldState();
}

class _RadioFieldState extends State<AppRadioField> {
  RadioChoose _groupValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.isRequired ? widget.title + " *" : widget.title,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600)),
          SizedBox(height: 5.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: FormField(
              onSaved: (_) => widget.onSave(_groupValue),
              builder: (field) => Column(
                children: [
                  widget.isHasThreeCol
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: RadioChoose.notApplicable,
                                groupValue: _groupValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    _groupValue = newValue;
                                  });
                                }),
                            const Text(AppConstant.notApplicable)
                          ],
                        )
                      : Row(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                          value: RadioChoose.yes,
                          groupValue: _groupValue,
                          onChanged: (newValue) {
                            setState(() {
                              _groupValue = newValue;
                            });
                          }),
                      const Text(AppConstant.yes)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                          value: RadioChoose.no,
                          groupValue: _groupValue,
                          onChanged: (newValue) {
                            setState(() {
                              _groupValue = newValue;
                            });
                          }),
                      const Text(AppConstant.no)
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

// AppDatePickerField
class AppDatePickerField extends StatefulWidget {
  const AppDatePickerField(
      {Key key,
      this.title,
      this.isRequired,
      this.firstDate,
      this.lastDate,
      this.onSave})
      : super(key: key);
  final String title;
  final bool isRequired;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function onSave;

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<AppDatePickerField> {
  TextEditingController _textController = TextEditingController();
  DateTime _currentValue;

  @override
  void initState() {
    _textController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.isRequired ? widget.title + " *" : widget.title,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600)),
          SizedBox(height: 5.0),
          Container(
            height: 70,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.isRequired
                  ? (value) => Validator.validateTextField(value)
                  : null,
              onSaved: (newValue) => widget.onSave(_currentValue),
              controller: _textController,
              readOnly: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                suffixIcon: Icon(
                  Icons.calendar_today_rounded,
                  color: Colors.grey[800],
                ),
                helperText: "",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.black54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.black54),
                ),
              ),
              onTap: () async {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: widget.firstDate,
                  maxTime: widget.lastDate,
                  onChanged: (date) {
                    // print('change $date');
                  },
                  onConfirm: (date) {
                    // print('confirm $date');
                    _currentValue = date;
                    String formattedDate =
                        DateFormat("dd/MM/yyyy").format(date);
                    setState(() {
                      _textController.text = formattedDate;
                    });
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.en,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

// DropdownButton
class AppDropDownField extends StatefulWidget {
  const AppDropDownField(
      {Key key, this.title, this.isRequired, this.data, this.onSave})
      : super(key: key);
  final String title;
  final bool isRequired;
  final List<Map<String, dynamic>> data;
  final Function onSave;

  @override
  _DropDownFieldState createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<AppDropDownField> {
  final _items = <DropdownMenuItem>[];
  dynamic _value;

  @override
  void initState() {
    super.initState();
    if (!isNullOrEmpty(widget.data)) {
      // giá trị mặc định
      _value = widget.data.first["value"];
      // get dữ liệu đổ ra list
      widget.data.forEach((element) {
        final item = DropdownMenuItem(
          child: Text(element["label"]),
          value: element["value"],
        );
        _items.add(item);
      });
    }
  }

  Map<String, dynamic> findItemByValue(int value) {
    int length = widget.data.length;
    for (int i = 0; i < length; i++) {
      // check same value
      if (widget.data[i]['value'] == value) {
        return widget.data[i];
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.isRequired ? widget.title + " *" : widget.title,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600)),
          SizedBox(height: 5.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 0,
                    color: Colors.black54,
                    offset: Offset(0, 1),
                    spreadRadius: 1)
              ],
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            height: 47.0,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: FormField(
              onSaved: (_) => widget.onSave(findItemByValue(_value)),
              builder: (field) => DropdownButtonHideUnderline(
                child: DropdownButton<dynamic>(
                  dropdownColor: Colors.blue[50],
                  isExpanded: true,
                  onChanged: (newValue) {
                    setState(() {
                      _value = newValue;
                    });
                  },
                  value: _value,
                  items: _items,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
