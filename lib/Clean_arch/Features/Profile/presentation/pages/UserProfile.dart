import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/Utils/Constants.dart';
import '../../../../../modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';

class UserProfile extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PremCubitCubit, PremCubitState>(
        listener: (context, state) {
        },
        builder: (context, state) {

     if (state is shopGetUserLSuccessState) {
    // if (state.userData.status==true) {

    PremCubitCubit cubit=PremCubitCubit.get(context);
    print(' token from profile ${cubit.tokenn}');
    var userprofile=cubit.getuserData;
    nameController.text=userprofile!.data!.name!;
    emailController.text=userprofile.data!.email!;
    phoneController.text=userprofile.data!.phone!;
     }
    // else{
    //   print('stata error');
    // }
    // }else{
    //   print('status error');
    // }
          return Scaffold(
            appBar: AppBar(title: Text('Your Profile'),),
            body: Form(
              key: _formKey,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      if(state is shopUpdateLoadingState)
                        LinearProgressIndicator(),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: nameController,
                        keyboardType:TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name can\'t be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText:'User Name',
                          prefixIcon:Icon(Icons.person,),
                          suffixIcon: Icons.email_outlined !=null ? IconButton(onPressed: (){
                          },
                            icon: Icon(Icons.email_outlined,),
                          ):null,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType:TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email can\'t be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText:'Email Address',
                          prefixIcon:Icon(Icons.email,),
                          suffixIcon: Icons.email_outlined !=null ? IconButton(onPressed: (){
                          },
                            icon: Icon(Icons.email_outlined,),
                          ):null,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: phoneController,
                        keyboardType:TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'phone can\'t be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText:'Phone',
                          prefixIcon:Icon(Icons.person,),
                          suffixIcon: Icons.email_outlined !=null ? IconButton(onPressed: (){
                          },
                            icon: Icon(Icons.email_outlined,),
                          ):null,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        color: Colors.blue,
                        child: TextButton(onPressed:(){
                          logOut(context);
                        }, child: Text('Logout',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        color: Colors.blue,
                        child: TextButton(onPressed:(){
                          if (_formKey.currentState!.validate()) {
                            PremCubitCubit.get(context).UserUppdate(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                            );
                            print(nameController.text);
                            print(phoneController.text);
                            //  NavigateTo(context, premleague());
                            //   print(state.toString());
                          }                        },
                            child: Text('Update',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
