import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/layout/layout.dart';
import 'package:mini_social_app/modules/auth/controller/auth_cubit.dart';
import 'package:mini_social_app/modules/auth/controller/auth_states.dart';
import 'package:mini_social_app/modules/auth/screens/register_screen.dart';
import 'package:mini_social_app/shared/component/constatnt.dart';

import '../../../shared/component/component.dart';

class LoginScreen extends StatelessWidget {
  //const LoginScreen({Key? key}) : super(key: key);
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            defaultShowToAst(msg: 'Login Done Successfully');
            navigateAndFinish(context, LayOut());
            // print('login done successfully');
          }
          if (state is LoginErrorState) {
            //print(state.error);
            defaultShowToAst(msg: state.error, isError: true);
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SafeArea(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 150,
                        ),
                        const Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        defaultTextField(
                            controller: userNameController,
                            prefixIcon: Icons.edit,
                            hintText: 'Enter UserName',
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) return 'UserName is Empty';
                              return null;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultTextField(
                            controller: passwordController,
                            prefixIcon: Icons.password,
                            hintText: 'Enter Password',
                            isPassword: cubit.isSecure,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  cubit.changePasswordVisibility();
                                },
                                icon: cubit.isSecure
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility)),
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty) return 'password is Empty';
                              return null;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                password = passwordController.text;
                                userName = userNameController.text;
                                cubit.loginUser(
                                    userName: userNameController.text,
                                    password: passwordController.text);
                              }
                            },
                            widget: state is LoginLoadingState
                                ? const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text('LOGIN')),
                        // const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text('Don\'t have an account?'),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()));
                                },
                                child: const Text('Register Now'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
