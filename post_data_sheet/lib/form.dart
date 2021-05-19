import 'package:flutter/material.dart';

import 'model/form_model.dart';
import 'network_handling/form_controller.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController interestController = TextEditingController();

  String _selection;
  String _bloodGroup;
  String _city;
  bool name=false,mobileNo=false,enable=false,designation=false,interest=false;

  @override
  void initState() {
    super.initState();
  }
  Future<void> _submitForm() async {

    if(_formKey.currentState.validate()){
      setState(() {
        enable=true;
      });
      FormModel formModel = FormModel(
        nameController.text.trim(),
          interestController.text.trim(),
        mobileController.text.trim(),
        designationController.text.trim(),
      );

      FormController formController = FormController();

      formController.submitForm(formModel, (String response) {

        if (response == FormController.STATUS_SUCCESS) {
          nameController.clear();
          mobileController.clear();
          interestController.clear();
          designationController.clear();
          setState(() {
            enable=false;
          });
          _showSnackbar("Details Submitted");
        } else {
          nameController.clear();
          mobileController.clear();
          interestController.clear();
        designationController.clear();
          setState(() {
            enable=false;
          });
          _showSnackbar("Error Occurred!");
        }
      });
      setState(() {
        enable=false;
      });
      _showSnackbar("Submitting Details");
    }


  }
  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message,style: TextStyle(color: Colors.black),),backgroundColor: Color(0xFFFEF08A),);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      key: _scaffoldKey,
      body  : Center(
        child: Container(
          height: MediaQuery.of(context).size.height*0.8,
          width: MediaQuery.of(context).size.width*0.9,
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right:24,top: 6,bottom: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color:Color(0xFF9dbeb9),
                            border: Border.all(
                              color: Color(0xFFFEF08A),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: <Widget>[

                              Column(
                                children: <Widget>[
                                  TextField(
                                    autofocus: false,
                                    textCapitalization: TextCapitalization.sentences,
                                    controller: nameController,
                                    onSubmitted: null,
                                    onChanged: (val) {
                                      setState(() {
                                        if(val.trim().length>1)
                                          name=true;
                                        else
                                          name=false;
                                      });
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter your Name',
                                      contentPadding: const EdgeInsets.only(
                                          left: 16,
                                          top:12

                                      ),
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, top: 4,bottom: 4,right: 24),
                      child: Container(
                        decoration: BoxDecoration(
                          color:Color(0xFF9dbeb9),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Color(0xFFFEF08A),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              autofocus: false,
                              textCapitalization: TextCapitalization.sentences,
                              maxLength: 13,
                              controller: mobileController,
                              onSubmitted: null,
                              onChanged: (val) {
                                setState(() {
                                  if(val.trim().length>=10)
                                    mobileNo=true;
                                  else
                                    mobileNo=false;
                                });
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                counterText: "",
                                border: InputBorder.none,
                                hintText: 'mobile number',
                                contentPadding: const EdgeInsets.only(
                                    left: 16,
                                    top:12
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            color:Color(0xFF9dbeb9),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Color(0xFFFEF08A),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  TextField(
                                    autofocus: false,
                                    //cursorColor: kColorC,
                                    textCapitalization: TextCapitalization.sentences,
                                    controller: interestController,
                                    onSubmitted: null,
                                    onChanged: (val){
                                      setState(() {
                                        if(val.trim().isNotEmpty)
                                          interest=true;
                                        else
                                          interest=false;
                                      });
                                    },

                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Area of Interest',
                                      contentPadding: const EdgeInsets.only(
                                          left: 16,
                                          top:12
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            color:Color(0xFF9dbeb9),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Color(0xFFFEF08A),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  TextField(
                                    autofocus: false,
                                    textCapitalization: TextCapitalization.sentences,
                                    controller: designationController,
                                    onSubmitted: null,
                                    onChanged: (val){
                                      setState(() {
                                        if(val.trim().isNotEmpty)
                                          designation=true;
                                        else
                                          designation=false;
                                      });
                                    },

                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Designation',
                                      contentPadding: const EdgeInsets.only(
                                          left: 16,
                                          top:12
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:24.0,vertical: 12,
                  ),
                  child: Container(
                    height: 56.0,
                    decoration: BoxDecoration(
                      color:Color(0xFF9dbeb9),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Color(0xFFFEF08A),
                        width: 1,
                      ),),
                    width: double.infinity,
                    child: RaisedButton(
                      disabledColor: Color(0xFFFEF08A).withOpacity(0.6),
                      color: Color(0xFFFEF08A),
                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(8.0),

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: enable,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 16,
                                width: 16,
                                child:  CircularProgressIndicator(
                                  strokeWidth: 6.0,
                                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFEF08A)),
                                  backgroundColor: Color(0xFFC4B5FD),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "Submit Details",
                          ),
                        ],
                      ),
                      onPressed:name&&mobileNo? _submitForm:null,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
