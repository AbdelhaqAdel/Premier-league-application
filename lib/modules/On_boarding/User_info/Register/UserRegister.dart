import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:premleague/layout/premleaguePro/premier.dart';
import 'package:premleague/modules/On_boarding/User_info/Register/UserRegister.dart';
import 'package:premleague/modules/On_boarding/User_info/SelectFavTeamScreen.dart';
import 'package:premleague/modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';
import 'package:premleague/shared/component/Constants.dart';
import 'package:premleague/shared/network/local/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../shared/component/components.dart';
import '../../../archived_tasks/premleague/cubit/cubit/UserCubit/Login Cubit/login_cubit.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class UserRegister extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var imageController = TextEditingController();

  var _formKey = GlobalKey<FormState>();
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // var formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PremCubitCubit, PremCubitState>(
        listener: (context, state)  {
          if (state is shopRegisterSuccessState) {
            if (state.userModel.status!) {
              print(state.userModel.message);
              PremCubitCubit.get(context).Tokenn=state.userModel?.data?.token;
              print('/////////////////////');
              print('regtoken is  ${state.userModel?.data?.token}');
              print('regtoken issss  ${PremCubitCubit.get(context).regTokenn}');
              //    Token = state.loginmodel.data!.token!;
             // CacheHelper.savaData(key: 'token', value: state.loginmodel.data?.token);
              print('///////////////////////');
              //Token=CacheHelper.getAllData(key:'token');
             // print('Token is :::${Token}');
              // SharedPreferences sharedPreferences=SharedPreferences.getInstance();
              // sharedPreferences.setString('token',state.loginmodel.data!.token! );
              // print(sharedPreferences.get('token'));
              NavigationAndFinish(context, SelectBestTeamScreen());
              Fluttertoast.showToast(
                  msg: state.userModel.message!,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              print(state.userModel.message);
              Fluttertoast.showToast(
                  msg: state.userModel.message!,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REGISTER',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Register now',
                        style:
                        Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      TextFormField(
                        controller: nameController,
                        keyboardType:TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'name can\'t be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText:'User name',
                          prefixIcon:Icon(Icons.person,),
                          suffixIcon: Icons.person !=null ? IconButton(onPressed: (){
                          },
                            icon: Icon(Icons.person,),
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
                          prefixIcon:Icon(Icons.email_outlined,),
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
                        controller: passwordController,
                        keyboardType:TextInputType.emailAddress,
                        obscureText: PremCubitCubit.get(context).ispassowrdShown,
                        // enabled: isClickable,
                        //  onFieldSubmitted: (value) {
                        //    onSubmit!(value);
                        //  },
                        //  onChanged: (value) {
                        //    onChange!(value);
                        //  },
                        //  onTap: () {
                        //    onTap!();
                        //  },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password can\'t be empty';
                          } else
                            return null;
                        },
                        decoration: InputDecoration(
                          labelText:'Password',
                          prefixIcon:Icon(PremCubitCubit.get(context).suffix,),
                          suffixIcon: PremCubitCubit.get(context).suffix !=null ? IconButton(onPressed: (){
                            PremCubitCubit.get(context)
                                .changePasswordVisibility();
                          },
                            icon: Icon(PremCubitCubit.get(context).suffix,),
                          ):null,
                          border: OutlineInputBorder(),
                        ),
                        // onSubmit: (value) {
                        //   if (_formKey.currentState!.validate()) {
                        //     LoginCubit.get(context).UserLogin(
                        //       email: emailController.text,
                        //       password: passwordController.text,
                        //     );
                        //   }
                        // },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: phoneController,
                        keyboardType:TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'phone can\'t be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText:'Phone',
                          prefixIcon:Icon(Icons.phone,),
                          suffixIcon: Icons.phone !=null ? IconButton(onPressed: (){
                          },
                            icon: Icon(Icons.phone,),
                          ):null,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: imageController,
                        keyboardType:TextInputType.emailAddress,
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'name can\'t be empty';
                        //   }
                        //   return null;
                        // },
                        decoration: InputDecoration(
                          labelText:'User Image',
                          prefixIcon:Icon(Icons.image,),
                          suffixIcon: Icons.person !=null ? IconButton(onPressed: (){
                          },
                            icon: Icon(Icons.person,),
                          ):null,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: state is! shopRegisterLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              PremCubitCubit.get(context).UserRegister(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                                image: imageController.text,
                              );
                              PremCubitCubit.get(context).IsUserLogin(isLogin: true);
                              print(PremCubitCubit.get(context).isLogin);
                              print(emailController.text);
                              print(passwordController.text);
                              //  NavigateTo(context, premleague());
                              //   print(state.toString());
                            }
                          },
                          text: 'register',
                          isUPpercase: true,
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                    ]),
              ),
            ),
          ),
        ),
      );
    });

  }
}
