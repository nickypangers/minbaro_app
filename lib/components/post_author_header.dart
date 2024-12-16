import 'package:flutter/material.dart';

class PostAuthorHeader extends StatelessWidget {
  const PostAuthorHeader({super.key});

  final double _radius = 20;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        CircleAvatar(
          radius: _radius,
          foregroundColor: Colors.lightBlue,
          foregroundImage: NetworkImage(
            'https://picsum.photos/id/1/200/200',
          ),
        ),
        SizedBox(
          height: _radius * 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'nickypangers',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text.rich(
                TextSpan(
                  text: 'topic',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                  children: [
                    TextSpan(
                      text: ' • 3m',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
