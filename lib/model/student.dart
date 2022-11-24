import 'package:mongo_dart/mongo_dart.dart';

class Student {
  ObjectId ?_id;
  String? email;
  String? name;
  String? teacher;
  String? race;
  String? sex;
  String? age;
  String? address;
  String? famsize;
  String? pstatus;
  String? medu;
  String? fedu;
  String? mjob;
  String? fjob;
  String? reason;
  String? guardian;
  String? traveltime;
  String? studytime;
  String? failures;
  String? schoolsup;
  String? famsup;
  String? paid;
  String? activities;
  String? nursery;
  String? higher;
  String? internet;
  String? romantic;
  String? famrel;
  String? freetime;
  String? goout;
  String? dalc;
  String? walc;
  String? health;
  String? absences;
  String? g1;
  String? g2;
  String? g3;
  //UInt32? __V;

  Student(
       this._id,
    {  this.email,
      this.name,
      this.teacher,
      this.race,
      this.sex,
      this.age,
      this.address,
      this.famsize,
      this.pstatus,
      this.medu,
      this.fedu,
      this.mjob,
      this.fjob,
      this.reason,
      this.guardian,
      this.traveltime,
      this.studytime,
      this.failures,
      this.schoolsup,
      this.famsup,
      this.paid,
      this.activities,
      this.nursery,
      this.higher,
      this.internet,
      this.romantic,
      this.famrel,
      this.freetime,
      this.goout,
      this.dalc,
      this.walc,
      this.health,
      this.absences,
      this.g1,
      this.g2,
      this.g3,
      });

  Student.fromJson(Map<String, dynamic> json) {
    _id = json['_id'] != null ?  json['_id'] : null;
    email = json['email'];
    name = json['name'];
    teacher = json['teacher'];
    race = json['Race'];
    sex = json['sex'];
    age = json['age'];
    address = json['address'];
    famsize = json['famsize'];
    pstatus = json['Pstatus'];
    medu = json['Medu'];
    fedu = json['Fedu'];
    mjob = json['Mjob'];
    fjob = json['Fjob'];
    reason = json['reason'];
    guardian = json['guardian'];
    traveltime = json['traveltime'];
    studytime = json['studytime'];
    failures = json['failures'];
    schoolsup = json['schoolsup'];
    famsup = json['famsup'];
    paid = json['paid'];
    activities = json['activities'];
    nursery = json['nursery'];
    higher = json['higher'];
    internet = json['internet'];
    romantic = json['romantic'];
    famrel = json['famrel'];
    freetime = json['freetime'];
    goout = json['goout'];
    dalc = json['Dalc'];
    walc = json['Walc'];
    health = json['health'];
    absences = json['absences'];
    g1 = json['G1'];
    g2 = json['G2'];
    g3 = json['G3'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._id != null) {
      data['id'] = this._id!.toJson();
    }
    data['email'] = this.email;
    data['name'] = this.name;
    data['teacher'] = this.teacher;
    data['Race'] = this.race;
    data['sex'] = this.sex;
    data['age'] = this.age;
    data['address'] = this.address;
    data['famsize'] = this.famsize;
    data['Pstatus'] = this.pstatus;
    data['Medu'] = this.medu;
    data['Fedu'] = this.fedu;
    data['Mjob'] = this.mjob;
    data['Fjob'] = this.fjob;
    data['reason'] = this.reason;
    data['guardian'] = this.guardian;
    data['traveltime'] = this.traveltime;
    data['studytime'] = this.studytime;
    data['failures'] = this.failures;
    data['schoolsup'] = this.schoolsup;
    data['famsup'] = this.famsup;
    data['paid'] = this.paid;
    data['activities'] = this.activities;
    data['nursery'] = this.nursery;
    data['higher'] = this.higher;
    data['internet'] = this.internet;
    data['romantic'] = this.romantic;
    data['famrel'] = this.famrel;
    data['freetime'] = this.freetime;
    data['goout'] = this.goout;
    data['Dalc'] = this.dalc;
    data['Walc'] = this.walc;
    data['health'] = this.health;
    data['absences'] = this.absences;
    data['G1'] = this.g1;
    data['G2'] = this.g2;
    data['G3'] = this.g3;

    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}

class V {
  String? numberInt;

  V({this.numberInt});

  V.fromJson(Map<String, dynamic> json) {
    numberInt = json['$numberInt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$numberInt'] = this.numberInt;
    return data;
  }
}
