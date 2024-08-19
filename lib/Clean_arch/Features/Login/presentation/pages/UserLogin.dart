import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:premleague/Clean_arch/Core/Utils/Strings/app_text.dart';
import 'package:premleague/Clean_arch/premier.dart';
import 'package:premleague/Clean_arch/Features/Register/presentation/pages/UserRegister.dart';
import 'package:premleague/modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';
import 'package:premleague/Clean_arch/Core/Utils/Constants.dart';
import 'package:premleague/Clean_arch/Core/local/cache_helper.dart';
import '../../../../Core/Utils/components.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class UserLogin extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  UserLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PremCubitCubit, PremCubitState>(
          listener: (context, state)  {
        if (state is shopLoginSuccessState) {
          if (state.loginmodel.status!) {
            print(state.loginmodel.message);
            PremCubitCubit.get(context).tokenn=state.loginmodel.data?.token;
            print('/////////////////////');
            print('token is  ${state.loginmodel.data?.token}');
             CacheHelper.savaData(key: 'token', value: state.loginmodel.data?.token);
             print('///////////////////////');
             Token=CacheHelper.getAllData(key:'token');
             print('Token is :::${Token}');
            NavigationAndFinish(context, premleague());
            Fluttertoast.showToast(
                msg: state.loginmodel.message!,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0.sp);
          } else {
            print(state.loginmodel.message);
            Fluttertoast.showToast(
                msg: state.loginmodel.message!,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0.sp);
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
                          'Login Now',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width/10,
                        ),
                    
                        TextFormField(
                          controller: emailController,
                            keyboardType:TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppText.emailValidation;
                              }
                              return null;
                            },
                          decoration: InputDecoration(
                            labelText:'Email Address',
                            prefixIcon:const Icon(Icons.email_outlined,),
                            // ignore: unnecessary_null_comparison
                            suffixIcon: IconButton(onPressed: (){
                            },
                              icon: const Icon(Icons.email_outlined,),
                            ),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                         SizedBox(
                          height:  MediaQuery.of(context).size.width/20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          keyboardType:TextInputType.emailAddress,
                          obscureText: PremCubitCubit.get(context).ispassowrdShown,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppText.passValidation;
                            } 
                              return null;
                          },
                          decoration: InputDecoration(
                            labelText:'Password',
                            prefixIcon:Icon(PremCubitCubit.get(context).suffix,),
                            suffixIcon:  IconButton(onPressed: (){
                              PremCubitCubit.get(context)
                                  .changePasswordVisibility();
                            },
                              icon: Icon(PremCubitCubit.get(context).suffix,),
                            ),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                         SizedBox(
                          height:  MediaQuery.of(context).size.width/20,
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
                                // print(PremCubitCubit.get(context).isLogin);
                                // print(emailController.text);
                                // print(passwordController.text);
                                //  NavigateTo(context, premleague());
                                //   print(state.toString());
                              }
                            },
                            text: 'login',
                            isUPpercase: true,
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.width/25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                            AppText.loginDonNotHaveAcc,
                            style: TextStyle(
                              color: Colors.black
                            ),
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
