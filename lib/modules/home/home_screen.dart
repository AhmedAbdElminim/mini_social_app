import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/modules/home/controller/home_cubit.dart';
import 'package:mini_social_app/modules/home/controller/home_states.dart';

import '../../shared/component/component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getAllData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is GetDataErrorState) {
            print(state.error);
          }
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return cubit.data.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: cubit
                                          .data[index].displayPicture
                                          .contains('https')
                                      ? NetworkImage(
                                          cubit.data[index].displayPicture)
                                      : const NetworkImage(
                                          'https://student.valuxapps.com/storage/assets/defaults/user.jpg'),
                                ),
                                title: Text(cubit.data[index].displayName),
                                subtitle: Text(cubit.data[index].createdAt),
                                trailing: const Icon(Icons.more_horiz),
                              ),
                            ),
                            if (cubit.data[index].caption != '')
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 5, left: 15, right: 15),
                                child: Text(cubit.data[index].caption),
                              ),
                            if (cubit.data[index].displayPicture
                                .contains('https'))
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: defaultCachedNetworkImage(
                                    imageUrl: cubit.data[index].displayContent),
                              ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: const [
                                    Text('Like'),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Icon(Icons.favorite_border),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Text('Comment'),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Icon(Icons.comment),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Text('Share'),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Icon(Icons.share),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  itemCount: cubit.data.length,
                );
        },
      ),
    );
  }
}
