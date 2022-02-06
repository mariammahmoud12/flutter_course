import 'package:first/modules/bmi/bmiScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              radius: 15.0,
              child: Icon(
                Icons.camera_alt,
                size: 20.0,
              ),
            ),
            onPressed: ()
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BmiScreen()
                  )
              );
            },
          ),
          IconButton(
            icon: CircleAvatar(
              radius: 15.0,
              child: Icon(
                Icons.edit,
                size: 20.0,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildStoryItem(),
                    separatorBuilder: (cntext, index) => SizedBox(
                          width: 20.0,
                        ),
                    itemCount: 6),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context , index) => buildChatItem(),
                  separatorBuilder: (context , index) => SizedBox(
                    height: 20.0,
                  ),
                  itemCount: 10
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildStoryItem() => Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
                ),
                radius: 25.0,
              ),
              Container(
                padding: EdgeInsetsDirectional.only(
                  end: 3.0,
                  bottom: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.green,
                ),
              )
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Mariam Mahmoud',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );

Widget buildChatItem() => Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
              ),
              radius: 30.0,
            ),
            Container(
              padding: EdgeInsetsDirectional.only(
                end: 3.0,
                bottom: 3.0,
              ),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.green,
              ),
            )
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mariam Mahmoud Younis',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Mariam Mahmoud Younis Mohamed mahmoud moustafa faied',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('02:00 pm'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
// SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: Row(
//     children: [
//       Container(
//         width: 60.0,
//         child: Column(
//           children: [
//             Stack(
//               alignment: AlignmentDirectional.bottomEnd,
//               children: [
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
//                   ),
//                   radius: 25.0,
//                 ),
//                 Container(
//                   padding: EdgeInsetsDirectional.only(
//                     end: 3.0,
//                     bottom: 3.0,
//                   ),
//                   child: CircleAvatar(
//                     radius: 6.0,
//                     backgroundColor: Colors.green,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 6.0,
//             ),
//             Text(
//               'Mariam Mahmoud',
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//       SizedBox(
//         width: 15.0,
//       ),
//       Container(
//         width: 60.0,
//         child: Column(
//           children: [
//             Stack(
//               alignment: AlignmentDirectional.bottomEnd,
//               children: [
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
//                   ),
//                   radius: 25.0,
//                 ),
//                 Container(
//                   padding: EdgeInsetsDirectional.only(
//                     end: 3.0,
//                     bottom: 3.0,
//                   ),
//                   child: CircleAvatar(
//                     radius: 6.0,
//                     backgroundColor: Colors.green,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 6.0,
//             ),
//             Text(
//               'Mariam Mahmoud',
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//       SizedBox(
//         width: 15.0,
//       ),
//       Container(
//         width: 60.0,
//         child: Column(
//           children: [
//             Stack(
//               alignment: AlignmentDirectional.bottomEnd,
//               children: [
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
//                   ),
//                   radius: 25.0,
//                 ),
//                 Container(
//                   padding: EdgeInsetsDirectional.only(
//                     end: 3.0,
//                     bottom: 3.0,
//                   ),
//                   child: CircleAvatar(
//                     radius: 6.0,
//                     backgroundColor: Colors.green,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 6.0,
//             ),
//             Text(
//               'Mariam Mahmoud',
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//       SizedBox(
//         width: 15.0,
//       ),
//       Container(
//         width: 60.0,
//         child: Column(
//           children: [
//             Stack(
//               alignment: AlignmentDirectional.bottomEnd,
//               children: [
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
//                   ),
//                   radius: 25.0,
//                 ),
//                 Container(
//                   padding: EdgeInsetsDirectional.only(
//                     end: 3.0,
//                     bottom: 3.0,
//                   ),
//                   child: CircleAvatar(
//                     radius: 6.0,
//                     backgroundColor: Colors.green,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 6.0,
//             ),
//             Text(
//               'Mariam Mahmoud',
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//       SizedBox(
//         width: 15.0,
//       ),
//       Container(
//         width: 60.0,
//         child: Column(
//           children: [
//             Stack(
//               alignment: AlignmentDirectional.bottomEnd,
//               children: [
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
//                   ),
//                   radius: 25.0,
//                 ),
//                 Container(
//                   padding: EdgeInsetsDirectional.only(
//                     end: 3.0,
//                     bottom: 3.0,
//                   ),
//                   child: CircleAvatar(
//                     radius: 6.0,
//                     backgroundColor: Colors.green,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 6.0,
//             ),
//             Text(
//               'Mariam Mahmoud',
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//       SizedBox(
//         width: 15.0,
//       ),
//       Container(
//         width: 60.0,
//         child: Column(
//           children: [
//             Stack(
//               alignment: AlignmentDirectional.bottomEnd,
//               children: [
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
//                   ),
//                   radius: 25.0,
//                 ),
//                 Container(
//                   padding: EdgeInsetsDirectional.only(
//                     end: 3.0,
//                     bottom: 3.0,
//                   ),
//                   child: CircleAvatar(
//                     radius: 6.0,
//                     backgroundColor: Colors.green,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 6.0,
//             ),
//             Text(
//               'Mariam Mahmoud',
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//     ],
//   ),
// ),
// Column(
//   children: [
//     Row(
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomEnd,
//           children: [
//             CircleAvatar(
//               backgroundImage: NetworkImage(
//                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
//               ),
//               radius: 30.0,
//             ),
//             Container(
//               padding: EdgeInsetsDirectional.only(
//                 end: 3.0,
//                 bottom: 3.0,
//               ),
//               child: CircleAvatar(
//                 radius: 6.0,
//                 backgroundColor: Colors.green,
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           width: 20.0,
//         ),
//         Expanded(
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Mariam Mahmoud Younis',
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16.0,
//                 ),
//               ),
//               SizedBox(
//                 height: 5.0,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       'Mariam Mahmoud Younis Mohamed mahmoud moustafa faied',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Text(
//                     '02:00 pm'
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 10.0,
//     ),
//     Row(
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomEnd,
//           children: [
//             CircleAvatar(
//               backgroundImage: NetworkImage(
//                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
//               ),
//               radius: 30.0,
//             ),
//             Container(
//               padding: EdgeInsetsDirectional.only(
//                 end: 3.0,
//                 bottom: 3.0,
//               ),
//               child: CircleAvatar(
//                 radius: 6.0,
//                 backgroundColor: Colors.green,
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           width: 20.0,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Mariam Mahmoud Younis',
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16.0,
//                 ),
//               ),
//               SizedBox(
//                 height: 5.0,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       'Mariam Mahmoud Younis Mohamed mahmoud moustafa faied',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Text(
//                       '02:00 pm'
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 10.0,
//     ),
//     Row(
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomEnd,
//           children: [
//             CircleAvatar(
//               backgroundImage: NetworkImage(
//                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
//               ),
//               radius: 30.0,
//             ),
//             Container(
//               padding: EdgeInsetsDirectional.only(
//                 end: 3.0,
//                 bottom: 3.0,
//               ),
//               child: CircleAvatar(
//                 radius: 6.0,
//                 backgroundColor: Colors.green,
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           width: 20.0,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Mariam Mahmoud Younis',
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16.0,
//                 ),
//               ),
//               SizedBox(
//                 height: 5.0,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       'Mariam Mahmoud Younis Mohamed mahmoud moustafa faied',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Text(
//                       '02:00 pm'
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 10.0,
//     ),
//     Row(
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomEnd,
//           children: [
//             CircleAvatar(
//               backgroundImage: NetworkImage(
//                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
//               ),
//               radius: 30.0,
//             ),
//             Container(
//               padding: EdgeInsetsDirectional.only(
//                 end: 3.0,
//                 bottom: 3.0,
//               ),
//               child: CircleAvatar(
//                 radius: 6.0,
//                 backgroundColor: Colors.green,
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           width: 20.0,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Mariam Mahmoud Younis',
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16.0,
//                 ),
//               ),
//               SizedBox(
//                 height: 5.0,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       'Mariam Mahmoud Younis Mohamed mahmoud moustafa faied',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Text(
//                       '02:00 pm'
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 10.0,
//     ),
//     Row(
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomEnd,
//           children: [
//             CircleAvatar(
//               backgroundImage: NetworkImage(
//                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
//               ),
//               radius: 30.0,
//             ),
//             Container(
//               padding: EdgeInsetsDirectional.only(
//                 end: 3.0,
//                 bottom: 3.0,
//               ),
//               child: CircleAvatar(
//                 radius: 6.0,
//                 backgroundColor: Colors.green,
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           width: 20.0,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Mariam Mahmoud Younis',
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16.0,
//                 ),
//               ),
//               SizedBox(
//                 height: 5.0,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       'Mariam Mahmoud Younis Mohamed mahmoud moustafa faied',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Text(
//                       '02:00 pm'
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 10.0,
//     ),
//     Row(
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomEnd,
//           children: [
//             CircleAvatar(
//               backgroundImage: NetworkImage(
//                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
//               ),
//               radius: 30.0,
//             ),
//             Container(
//               padding: EdgeInsetsDirectional.only(
//                 end: 3.0,
//                 bottom: 3.0,
//               ),
//               child: CircleAvatar(
//                 radius: 6.0,
//                 backgroundColor: Colors.green,
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           width: 20.0,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Mariam Mahmoud Younis',
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16.0,
//                 ),
//               ),
//               SizedBox(
//                 height: 5.0,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       'Mariam Mahmoud Younis Mohamed mahmoud moustafa faied',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Text(
//                       '02:00 pm'
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 10.0,
//     ),
//     Row(
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomEnd,
//           children: [
//             CircleAvatar(
//               backgroundImage: NetworkImage(
//                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
//               ),
//               radius: 30.0,
//             ),
//             Container(
//               padding: EdgeInsetsDirectional.only(
//                 end: 3.0,
//                 bottom: 3.0,
//               ),
//               child: CircleAvatar(
//                 radius: 6.0,
//                 backgroundColor: Colors.green,
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           width: 20.0,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Mariam Mahmoud Younis',
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16.0,
//                 ),
//               ),
//               SizedBox(
//                 height: 5.0,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       'Mariam Mahmoud Younis Mohamed mahmoud moustafa faied',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Text(
//                       '02:00 pm'
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 10.0,
//     ),
//     Row(
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomEnd,
//           children: [
//             CircleAvatar(
//               backgroundImage: NetworkImage(
//                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU',
//               ),
//               radius: 30.0,
//             ),
//             Container(
//               padding: EdgeInsetsDirectional.only(
//                 end: 3.0,
//                 bottom: 3.0,
//               ),
//               child: CircleAvatar(
//                 radius: 6.0,
//                 backgroundColor: Colors.green,
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           width: 20.0,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Mariam Mahmoud Younis',
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16.0,
//                 ),
//               ),
//               SizedBox(
//                 height: 5.0,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       'Mariam Mahmoud Younis Mohamed mahmoud moustafa faied',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Text(
//                       '02:00 pm'
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ],
// ),