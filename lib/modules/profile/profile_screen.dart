import 'package:flutter/cupertino.dart';
import 'package:mini_social_app/modules/auth/screens/login_screen.dart';
import 'package:mini_social_app/shared/component/component.dart';
import 'package:mini_social_app/shared/component/constatnt.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'UserName: $userName ',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Password: $password',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
            child: defaultButton(
                onPressed: () {
                  token = '';
                  navigateAndFinish(context, LoginScreen());
                },
                widget: const Text('LogOut')),
          ),
        ],
      ),
    );
  }
}
