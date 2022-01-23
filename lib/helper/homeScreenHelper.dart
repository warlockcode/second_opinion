import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://firebasestorage.googleapis.com/v0/b/second-opinion-44ba8.appspot.com/o/silverappbar.jpg?alt=media&token=3f03640d-9f5d-493d-ae08-8a2c93a0af31'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

var chipsCustom = [
  Chip(
    avatar: CircleAvatar(
      backgroundColor: Colors.grey.shade800,
      child: const Text('M'),
    ),
    label: const Text('Medical'),
  ),
  SizedBox(
    width: 15,
  ),
  Chip(
    avatar: CircleAvatar(
      backgroundColor: Colors.grey.shade800,
      child: const Text('D'),
    ),
    label: const Text('Dentist'),
  ),
  SizedBox(
    width: 15,
  ),
  Chip(
    avatar: CircleAvatar(
      backgroundColor: Colors.grey.shade800,
      child: const Text('M'),
    ),
    label: const Text('Mechanic'),
  ),
  SizedBox(
    width: 15,
  ),
  Chip(
    avatar: CircleAvatar(
      backgroundColor: Colors.grey.shade800,
      child: const Text('S'),
    ),
    label: const Text('Student'),
  ),
  SizedBox(
    width: 15,
  ),
  Chip(
    avatar: CircleAvatar(
      backgroundColor: Colors.grey.shade800,
      child: const Text('E'),
    ),
    label: const Text('Education'),
  ),
  SizedBox(
    width: 15,
  ),
  Chip(
    avatar: CircleAvatar(
      backgroundColor: Colors.grey.shade800,
      child: const Text('D'),
    ),
    label: const Text('Developer'),
  ),
  SizedBox(
    width: 15,
  ),
  Chip(
    avatar: CircleAvatar(
      backgroundColor: Colors.grey.shade800,
      child: const Text('AT'),
    ),
    label: const Text('Automation Developer'),
  )
];
