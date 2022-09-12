import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/layout/layout.dart';
import 'package:mini_social_app/modules/new_post/controller/new_post_cubit.dart';
import 'package:mini_social_app/modules/new_post/controller/new_post_states.dart';
import 'package:mini_social_app/shared/component/component.dart';

class NewPostScreen extends StatelessWidget {
  // const NewPostScreen({Key? key}) : super(key: key);
  var captionController = TextEditingController();
  var contentImageController = TextEditingController();
  var profileImageController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewPostCubit(),
      child: BlocConsumer<NewPostCubit, NewPostStates>(
        listener: (context, state) {
          if (state is NewPostSuccessState) {
            defaultShowToAst(msg: 'Post created successfully');
            navigateAndFinish(context, LayOut());
          }
        },
        builder: (context, state) {
          var cubit = NewPostCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Create New Post'),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: captionController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Caption'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: profileImageController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Profile Image Url'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: contentImageController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Image Url'),
                    ),
                    const Spacer(),
                    defaultButton(
                        onPressed: () {
                          cubit.createPost(
                              profileImage: profileImageController.text,
                              contentImage: contentImageController.text,
                              caption: captionController.text);
                        },
                        widget: state is NewPostLoadingState
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Submit'))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
