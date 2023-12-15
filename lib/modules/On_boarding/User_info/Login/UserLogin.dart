import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:premleague/layout/premleaguePro/premier.dart';
import 'package:premleague/modules/On_boarding/User_info/Register/UserRegister.dart';
import 'package:premleague/modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';
import 'package:premleague/shared/component/Constants.dart';
import 'package:premleague/shared/network/local/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../shared/component/components.dart';
import '../../../archived_tasks/premleague/cubit/cubit/UserCubit/Login Cubit/login_cubit.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class UserLogin extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // var formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PremCubitCubit, PremCubitState>(
          listener: (context, state)  {
        if (state is shopLoginSuccessState) {
          if (state.loginmodel.status!) {
            print(state.loginmodel.message);
            PremCubitCubit.get(context).Tokenn=state.loginmodel?.data?.token;
            print('/////////////////////');
            print('token is  ${state.loginmodel?.data?.token}');
        //    Token = state.loginmodel.data!.token!;
             CacheHelper.savaData(key: 'token', value: state.loginmodel.data?.token);
             print('///////////////////////');
             Token=CacheHelper.getAllData(key:'token');
             print('Token is :::${Token}');
            // SharedPreferences sharedPreferences=SharedPreferences.getInstance();
            // sharedPreferences.setString('token',state.loginmodel.data!.token! );
            // print(sharedPreferences.get('token'));
            NavigationAndFinish(context, premleague());
            Fluttertoast.showToast(
                msg: state.loginmodel.message!,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          } else {
            print(state.loginmodel.message);
            Fluttertoast.showToast(
                msg: state.loginmodel.message!,
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
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Login now',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        SizedBox(
                          height: 40,
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
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! shopLoginLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (_formKey.currentState!.validate()) {
                                PremCubitCubit.get(context).UserLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                PremCubitCubit.get(context).IsUserLogin(isLogin: true);
                                print(PremCubitCubit.get(context).isLogin);
                                print(emailController.text);
                                print(passwordController.text);
                                //  NavigateTo(context, premleague());
                                //   print(state.toString());
                              }
                            },
                            text: 'login',
                            isUPpercase: true,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                            ),
                            defaultTextButton(
                                function: () {
                                  print(PremCubitCubit().isLogin);
                                  NavigateTo(context, UserRegister());
                                },
                                text: 'Register now',
                                Color: Colors.blue),
                          ],
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
