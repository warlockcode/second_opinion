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

var services=["Medical Services","Car Services","Teaching Services","Petrol Services","Developer Services","Insurance Services","FinancialServices"];
var CustomIcons=["https://image.flaticon.com/icons/png/512/1254/1254770.png","https://image.freepik.com/free-icon/car-repair-garage_318-9407.jpg","https://image.flaticon.com/icons/png/512/1250/1250487.png","https://image.flaticon.com/icons/png/512/99/99729.png","https://image.flaticon.com/icons/png/128/1238/1238369.png","https://image.flaticon.com/icons/png/512/1255/1255518.png","https://image.flaticon.com/icons/png/512/1255/1255221.png"];
var differentIcons=[Icon(
  Icons.local_hospital_sharp,
  color: Colors.red[900],
  size: 40,
),
  Icon(
    Icons.car_rental,
    color: Colors.red[900],
    size: 40,
  ),
  Icon(
    Icons.microwave,
    color: Colors.red[900],
    size: 40,
  ),
  Icon(
    Icons.pets_rounded,
    color: Colors.red[900],
    size: 40,
  ),
  Icon(
    Icons.developer_mode,
    color: Colors.red[900],
    size: 40,
  ),
  Icon(
    Icons.airline_seat_individual_suite_rounded,
    color: Colors.red[900],
    size: 40,
  ),
  Icon(
    Icons.monetization_on,
    color: Colors.red[900],
    size: 40,
  )

];

var chipsCustom=[ Chip(
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
  )];