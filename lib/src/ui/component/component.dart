import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:student_details/src/ui/enum/radio_choose.dart';
import 'package:student_details/src/utils/constant.dart';
import 'package:student_details/src/utils/funtion_helper.dart';

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
  const AppTextField({Key key, this.title, this.isRequired}) : super(key: key);
  final String title;
  final bool isRequired;

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
              decoration: InputDecoration(
                helperText: "",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.green),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.black),
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
      {Key key, this.title, this.isRequired, this.isHasThreeCol})
      : super(key: key);

  final String title;
  final bool isRequired;
  final bool isHasThreeCol;

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
            color: Colors.grey[300],
            child: Column(
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
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

// AppDatePickerField
class AppDatePickerField extends StatefulWidget {
  const AppDatePickerField(
      {Key key, this.title, this.isRequired, this.firstDate, this.lastDate})
      : super(key: key);
  final String title;
  final bool isRequired;
  final DateTime firstDate;
  final DateTime lastDate;

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<AppDatePickerField> {
  TextEditingController _textController = TextEditingController();

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
          SizedBox(
            height: 70.0,
            child: TextFormField(
              controller: _textController,
              readOnly: true,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.calendar_today_rounded,
                  color: Colors.grey[800],
                ),
                // onPressed: () {
                //   showDatePicker(
                //     context: context,
                //     initialDate: DateTime.now(),
                //     firstDate: DateTime(1950),
                //     lastDate: DateTime(2030),
                //     helpText: AppConstant.birthDate,
                //     // locale: Locale('fr', 'CH'),
                //   ).then((value) => print(value));
                // },
                // errorText: errorText,
                helperText: "",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              onTap: () async {
                // DateTime pickedDate = await showDatePicker(
                //   context: context,
                //   helpText: widget.title,
                //   // TODO: see: https://flutter.dev/docs/development/accessibility-and-localization/internationalization to resolve
                //   // locale: Locale('fr', 'CA'),
                //   initialDate: DateTime.now(),
                //   firstDate: widget.firstDate,
                //   lastDate: widget.lastDate,

                // );

                // if (pickedDate != null) {
                //   String formattedDate =
                //       DateFormat("dd/MM/yyyy").format(pickedDate);
                //   setState(() {
                //     _textController.text = formattedDate;
                //   });
                // } else {
                //   print("Date is not selected");
                // }

                // DatePicker.showPicker(
                //   context,
                //   showTitleActions: true,
                //   onChanged: (date) {
                //     print('change $date');
                //   },
                //   onConfirm: (date) {
                //     print('confirm $date');
                //     String formattedDate =
                //         DateFormat("dd/MM/yyyy").format(date);
                //     setState(() {
                //       _textController.text = formattedDate;
                //     });
                //   },
                //   onCancel: () {},
                //   pickerModel: MyDatePickerModel(),
                //   locale: LocaleType.en,
                // );

                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: widget.firstDate,
                  maxTime: widget.lastDate,
                  onChanged: (date) {
                    print('change $date');
                  },
                  onConfirm: (date) {
                    print('confirm $date');
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
  const AppDropDownField({Key key, this.title, this.isRequired, this.data})
      : super(key: key);
  final String title;
  final bool isRequired;
  final List<Map<String, dynamic>> data;

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
            height: 50.0,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                dropdownColor: Colors.blue[50],
                underline: Container(),
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
          )
        ],
      ),
    );
  }
}
