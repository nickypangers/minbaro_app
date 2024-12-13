import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key});

  final _radius = 20.0;

  final _content =
      'Ad in magna commodo tempor ipsum @esse aute occaecat amet. Id laborum do in ut officia aliqua. Voluptate eiusmod nulla reprehenderit labore qui. Proident @voluptate pariatur ex exercitation deserunt sint. Laboris ullamco ea eiusmod laboris in quis sint anim nostrud pariatur nostrud @adipisicing.';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        spacing: 8,
        children: [
          Row(
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
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.deepPurple),
                        children: [
                          TextSpan(
                            text: ' • 3m',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(CupertinoIcons.ellipsis),
            ],
          ),
          _buildIndentedRow(
            child: Flexible(
              child: Text.rich(
                TextSpan(
                  text: _content,
                ),
              ),
            ),
          ),
          _buildIndentedRow(
            child: Row(
              spacing: 8,
              children: [
                IconButton(
                  icon: Icon(
                    CupertinoIcons.heart,
                    size: 14,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.bubble_left,
                    size: 14,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.bookmark,
                    size: 14,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndentedRow({required Widget child}) {
    return Row(
      spacing: 8,
      children: [
        SizedBox(width: _radius * 2),
        child,
      ],
    );
  }
}
