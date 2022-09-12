import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';

Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  bool isPassword = false,
  required String hintText,
  required IconData prefixIcon,
  Widget? suffixIcon,
  required String? Function(String?)? validator,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon),
    );
Widget defaultButton(
        {required void Function()? onPressed, required Widget widget}) =>
    MaterialButton(
      onPressed: onPressed,
      color: Colors.deepOrange,
      child: Center(child: widget),
    );
Future defaultShowToAst({required String msg, bool isError = false}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

Future navigateAndFinish(context, Widget widget) =>
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget), (route) => false);
Widget defaultCachedNetworkImage(
        {required String imageUrl,
        double height = 300.0,
        double width = double.infinity}) =>
    CachedNetworkImage(
      width: width,
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[850]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
