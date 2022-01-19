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
              'https://images.unsplash.com/photo-1642167714894-1c22e231c5de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
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
