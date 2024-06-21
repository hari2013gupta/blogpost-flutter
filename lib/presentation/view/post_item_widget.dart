import 'package:flutter/material.dart';
import 'package:flutter_test21jun/data/model/post_model.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({
    super.key,
    required this.item,
  });

  final PostModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text('${item.id}. ',
                  style: const TextStyle(fontSize: 20, color: Colors.green)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(item.title, style: const TextStyle(fontSize: 20)),
              ),
            ],
          ),
          const Divider(),
          Text(item.body,
              style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }
}
