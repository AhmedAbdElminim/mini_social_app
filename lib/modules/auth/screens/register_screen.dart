import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/modules/auth/controller/auth_cubit.dart';
import 'package:mini_social_app/modules/auth/controller/auth_states.dart';

import '../../../shared/component/component.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            defaultShowToAst(msg: 'Register done successfully Login Now');
            navigateAndFinish(context, LoginScreen());
          }
          if (state is RegisterErrorState) {
            defaultShowToAst(msg: state.error);
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
                          height: 60,
                        ),
                        const Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        defaultTextField(
                            controller: firstNameController,
                            prefixIcon: Icons.edit,
                            hintText: 'Enter FirstName',
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) return 'FirstName is Empty';
                              return null;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultTextField(
                            controller: lastNameController,
                            prefixIcon: Icons.edit,
                            hintText: 'Enter LastName',
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) return 'lastName is Empty';
                              return null;
                            }),
                        const SizedBox(
                          height: 20,
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
                                cubit.registerUser(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    userName: userNameController.text,
                                    password: passwordController.text);
                              }
                            },
                            widget: state is RegisterLoadingState
                                ? const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text('REGISTER')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text('Already have an account?'),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Login Now'))
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
