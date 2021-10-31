import 'package:student_details/src/ui/enum/radio_choose.dart';

class Student {
  // student information
  String _legalLastName;
  String _legalMiddleName;
  String _aliasLegalFirstName;
  Map<String, dynamic> _legalSuffix;
  String _preferredFirstName;
  Map<String, dynamic> _gender;
  Map<String, dynamic> _birthCountry;
  String _birthCity;
  String _legalFirstName;
  String _aliasLegalLastName;
  String _aliasLegalMiddleName;
  DateTime _birthDate;
  String _preferredLastName;
  RadioChoose _enrolledInUS;
  Map<String, dynamic> _birthStateAndProvince;
  DateTime _initialUSEnrollmentDate;
  //Ethnicity & Race
  RadioChoose _hispanicEthnicityIndicator;
  RadioChoose _ethnicityMissingIndicator;
  Map<String, dynamic> _raceCode2;
  Map<String, dynamic> _raceCode4;
  RadioChoose _raceCodeMissingIndicator;
  Map<String, dynamic> _raceCode1;
  Map<String, dynamic> _raceCode3;
  Map<String, dynamic> _raceCode5;
  // Parent Guardian
  Map<String, dynamic> _parentGuardianHighest;
  String _guardian1LastName;
  String _guardian2LastName;
  String _guardian1FirstName;
  String _guardian2FirstName;
  DateTime _recordEffectiveStartDate;
  DateTime _recordEffectiveEndDate;

  @override
  String toString() {
    return '''
        legalLastName: $_legalLastName,
        legalMiddleName: $_legalMiddleName
        aliasLegalFirstName: $_aliasLegalFirstName
        legalSuffix: $_legalSuffix
        preferredFirstName: $_preferredFirstName
        gender: $_gender
        birthCountry: $_birthCountry
        birthCity: $_birthCity
        legalFirstName: $_legalFirstName
        aliasLegalLastName: $_aliasLegalLastName
        aliasLegalMiddleName: $_aliasLegalMiddleName
        birthDate: $_birthDate
        preferredLastName: $_preferredLastName
        enrolledInUS: $_enrolledInUS
        birthStateAndProvince: $_birthStateAndProvince
        initialUSEnrollmentDate: $_initialUSEnrollmentDate
        hispanicEthnicityIndicator: $_hispanicEthnicityIndicator
        ethnicityMissingIndicator: $_ethnicityMissingIndicator
        raceCode2: $_raceCode2
        raceCode4: $_raceCode4
        raceCodeMissingIndicator: $_raceCodeMissingIndicator
        raceCode1: $_raceCode1
        raceCode3: $_raceCode3
        raceCode5: $_raceCode5
        parentGuardianHighest: $_parentGuardianHighest
        guardian1LastName: $_guardian1LastName
        guardian2LastName: $_guardian2LastName
        guardian1FirstName: $_guardian1FirstName
        guardian2FirstName: $_guardian2FirstName
        recordEffectiveStartDate: $_recordEffectiveStartDate
        recordEffectiveEndDate: $_recordEffectiveEndDate''';
  }

  Map<String, dynamic> get legalSuffix => _legalSuffix;

  set legalSuffix(Map<String, dynamic> value) {
    _legalSuffix = value;
  }

  String get legalLastName => _legalLastName;

  set legalLastName(String value) {
    _legalLastName = value;
  }

  String get legalMiddleName => _legalMiddleName;

  set legalMiddleName(String value) {
    _legalMiddleName = value;
  }

  String get aliasLegalFirstName => _aliasLegalFirstName;

  set aliasLegalFirstName(String value) {
    _aliasLegalFirstName = value;
  }

  String get preferredFirstName => _preferredFirstName;

  set preferredFirstName(String value) {
    _preferredFirstName = value;
  }

  String get birthCity => _birthCity;

  set birthCity(String value) {
    _birthCity = value;
  }

  String get legalFirstName => _legalFirstName;

  set legalFirstName(String value) {
    _legalFirstName = value;
  }

  String get aliasLegalLastName => _aliasLegalLastName;

  set aliasLegalLastName(String value) {
    _aliasLegalLastName = value;
  }

  String get aliasLegalMiddleName => _aliasLegalMiddleName;

  set aliasLegalMiddleName(String value) {
    _aliasLegalMiddleName = value;
  }

  DateTime get birthDate => _birthDate;

  set birthDate(DateTime value) {
    _birthDate = value;
  }

  String get preferredLastName => _preferredLastName;

  set preferredLastName(String value) {
    _preferredLastName = value;
  }

  RadioChoose get enrolledInUS => _enrolledInUS;

  set enrolledInUS(RadioChoose value) {
    _enrolledInUS = value;
  }

  DateTime get initialUSEnrollmentDate => _initialUSEnrollmentDate;

  set initialUSEnrollmentDate(DateTime value) {
    _initialUSEnrollmentDate = value;
  }

  RadioChoose get hispanicEthnicityIndicator => _hispanicEthnicityIndicator;

  set hispanicEthnicityIndicator(RadioChoose value) {
    _hispanicEthnicityIndicator = value;
  }

  RadioChoose get ethnicityMissingIndicator => _ethnicityMissingIndicator;

  set ethnicityMissingIndicator(RadioChoose value) {
    _ethnicityMissingIndicator = value;
  }

  RadioChoose get raceCodeMissingIndicator => _raceCodeMissingIndicator;

  set raceCodeMissingIndicator(RadioChoose value) {
    _raceCodeMissingIndicator = value;
  }

  Map<String, dynamic> get parentGuardianHighest => _parentGuardianHighest;

  set parentGuardianHighest(Map<String, dynamic> value) {
    _parentGuardianHighest = value;
  }

  String get guardian1LastName => _guardian1LastName;

  set guardian1LastName(String value) {
    _guardian1LastName = value;
  }

  String get guardian2LastName => _guardian2LastName;

  set guardian2LastName(String value) {
    _guardian2LastName = value;
  }

  String get guardian1FirstName => _guardian1FirstName;

  set guardian1FirstName(String value) {
    _guardian1FirstName = value;
  }

  String get guardian2FirstName => _guardian2FirstName;

  set guardian2FirstName(String value) {
    _guardian2FirstName = value;
  }

  DateTime get recordEffectiveStartDate => _recordEffectiveStartDate;

  set recordEffectiveStartDate(DateTime value) {
    _recordEffectiveStartDate = value;
  }

  DateTime get recordEffectiveEndDate => _recordEffectiveEndDate;

  set recordEffectiveEndDate(DateTime value) {
    _recordEffectiveEndDate = value;
  }

  Map<String, dynamic> get gender => _gender;

  set gender(Map<String, dynamic> value) {
    _gender = value;
  }

  Map<String, dynamic> get birthCountry => _birthCountry;

  set birthCountry(Map<String, dynamic> value) {
    _birthCountry = value;
  }

  Map<String, dynamic> get birthStateAndProvince => _birthStateAndProvince;

  set birthStateAndProvince(Map<String, dynamic> value) {
    _birthStateAndProvince = value;
  }

  Map<String, dynamic> get raceCode2 => _raceCode2;

  set raceCode2(Map<String, dynamic> value) {
    _raceCode2 = value;
  }

  Map<String, dynamic> get raceCode4 => _raceCode4;

  set raceCode4(Map<String, dynamic> value) {
    _raceCode4 = value;
  }

  Map<String, dynamic> get raceCode1 => _raceCode1;

  set raceCode1(Map<String, dynamic> value) {
    _raceCode1 = value;
  }

  Map<String, dynamic> get raceCode3 => _raceCode3;

  set raceCode3(Map<String, dynamic> value) {
    _raceCode3 = value;
  }

  Map<String, dynamic> get raceCode5 => _raceCode5;

  set raceCode5(Map<String, dynamic> value) {
    _raceCode5 = value;
  }
}
