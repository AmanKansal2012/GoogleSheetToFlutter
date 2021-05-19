class FormModel {
  String name;
  String interest;
  String mobileNo;
  String designation;


  FormModel(this.name,this.interest,  this.mobileNo,this.designation);

  factory FormModel.fromJson(dynamic json) {
    return FormModel("${json['name']}", "${json['interest']}","${json['mobileNo']}","${json['designation']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
    'name': name,
    'interest': interest,
    'mobileNo': mobileNo,
    'designation': designation,
  };
}
