import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minbaro_app/states/app_state.dart';
import 'package:provider/provider.dart';

const double _radius = 20;

FutureOr<T?> showMoreModalSheet<T>(BuildContext context) {
  Provider.of<AppState>(context, listen: false).blur();
  return showCupertinoModalPopup<T>(
    context: context,
    builder: (context) => Material(
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
        constraints: BoxConstraints(minHeight: 100),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_radius),
          topRight: Radius.circular(_radius),
        )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            ListTile(
              style: ListTileStyle.list,
              leading: Icon(CupertinoIcons.flag),
              title: Text('Report'),
              onTap: () {},
            ),
          ],
        ),
      ),
    ),
  ).then((value) {
    if (context.mounted) {
      Provider.of<AppState>(context, listen: false).unblur();
    }
    return value;
  });
}
