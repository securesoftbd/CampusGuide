import 'package:firebase_database/firebase_database.dart';

class TeacherInfo {
  static var campus;
  static var depertment;
  static var email;
  static var gender;
  static var name;
  static var designation;
  static var phone_number;
  static var user_image;
  static var room_number;
  static var off_day;

  TeacherInfo.fromFB(DataSnapshot data) {
    name = data.value["Name"];
    email = data.value["Email"];
    phone_number = data.value["Phone Number"];
    gender = data.value["Gender"];
    campus = data.value["Campus"];
    depertment = data.value["Depertment"];
    designation = data.value["Designation"];
    user_image=data.value["Image"];
    room_number=data.value["RoomNumber"];
    off_day=data.value["OffDay"];
  }


 static void printData(){

    print("Campus  ${campus}");
    print("Campus  ${depertment}");
    print("Campus  ${email}");
    print("Campus  ${gender}");
    print("Campus  ${name}");
    print("Campus  ${designation}");
    print("Campus  ${phone_number}");
    print("user_image ${user_image}");
    print("Room Number ${room_number}");
    print("Off day ${off_day}");

  }


}
