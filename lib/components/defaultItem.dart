import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../style/colors.dart';

Widget defaultItem({
  required post,
  required context,
}) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
              child: Text(post.title,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ))),
          const Icon(
            Icons.arrow_forward_ios_sharp,
            size: 15,
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          SvgPicture.asset(
            'assets/images/setting_icon.svg',
            color: secondaryColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: SizedBox(
            height: 50,
            child: Text(
              post.body,
              overflow: TextOverflow.fade,
              style: TextStyle(color: secondaryColor),
            ),
          )),
        ],
      ),
    ],
  );
}