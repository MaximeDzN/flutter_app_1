
class Artist {
  String? lastName;
  String? firstName;
  String? nickName;
  DateTime? birthDate;
  Artist(this.lastName,this.firstName,this.nickName,this.birthDate);


  factory Artist.fromJson(Map<String,dynamic> json){

    return Artist(json['lastName'], json['firstName'], json['nickName'], DateTime.parse(json['birthDate']));
  }

}