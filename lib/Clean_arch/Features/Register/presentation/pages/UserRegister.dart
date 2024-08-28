import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:premleague/Clean_arch/Features/Register/presentation/pages/SelectFavTeamScreen.dart';
import 'package:premleague/modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';
import '../../../../Core/Utils/components.dart';
class UserRegister extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  UserRegister({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PremCubitCubit, PremCubitState>(
        listener: (context, state)  {
          if (state is shopRegisterSuccessState) {
            if (state.userModel.status!) {
              print(state.userModel.message);
              PremCubitCubit.get(context).tokenn=state.userModel?.data?.token;
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
              navigateAndFinish(context, SelectBestTeamScreen());
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
                        'REGISTER Now',
                        style: Theme.of(context)
                            .textTheme.headlineMedium
                            ?.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height:  MediaQuery.of(context).size.width/10,
                      ),
                      // Text(
                      //   'Register now',
                      //   style:
                      //   Theme.of(context).textTheme.bodyMedium?.copyWith(
                      //     color: Colors.grey,
                      //   ),
                      // ),
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
                          prefixIcon:const Icon(Icons.person,),
                          suffixIcon: IconButton(onPressed: (){
                          },
                            icon: const Icon(Icons.person,),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height:MediaQuery.of(context).size.width/25,
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
                          suffixIcon:IconButton(onPressed: (){
                          },
                            icon: Icon(Icons.email_outlined,),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height:  MediaQuery.of(context).size.width/25,
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
                        height:  MediaQuery.of(context).size.width/25,
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
                        height:  MediaQuery.of(context).size.width/25,
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
                        height: MediaQuery.of(context).size.width/15,
                      ),
                      ConditionalBuilder(
                        condition: state is! shopRegisterLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              PremCubitCubit.get(context).userRegister(
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
                        PremCubitCubit.get(context).getStandingsData();

                          },
                          text: 'register',
                          isUPpercase: true,
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
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
