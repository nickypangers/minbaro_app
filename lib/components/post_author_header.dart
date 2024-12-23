import 'package:flutter/material.dart';
import 'package:minbaro_app/helpers/date_time_helper.dart';
import 'package:minbaro_app/models/models.dart';

class PostAuthorHeader extends StatelessWidget {
  const PostAuthorHeader({required this.post, super.key});

  final Post post;

  final double _radius = 20;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        CircleAvatar(
          radius: _radius,
          foregroundColor: Theme.of(context).colorScheme.onSurface,
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
                post.author.username,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text.rich(
                TextSpan(
                  text: post.topic.name,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                  children: [
                    TextSpan(
                        text:
                            ' • ${DateTimeHelper.formatAgoString(post.createdAt)}',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.onSurface),
                        children: [
                          if (post.createdAt != post.updatedAt)
                            TextSpan(
                              text: ' edited',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                            ),
                        ]),
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
