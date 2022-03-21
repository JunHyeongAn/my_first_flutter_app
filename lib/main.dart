import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Flutter App",
      home: Scaffold(
        body: mainPageBuilder,
      ),
    );
  }
}

Widget mainPageBuilder = Column(
  children: [
    imageSection,
    titleSection,
    buttonSection,
    textSection
  ],
);

Widget imageSection = Image.asset(
  "images/lake.jpg",
  fit: BoxFit.cover,
);

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FavoriteWidget();
}

class _FavoriteWidget extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    void _toggleFavorite() {
      setState(() {
        if(_isFavorited) {
          _favoriteCount -= 1;
          _isFavorited = false;
        }
        else {
          _favoriteCount += 1;
          _isFavorited = true;
        }
        // _isFavorited = !_isFavorited;
      });
      count += 1;
    }

    return Row(
      children: [
        IconButton(
          onPressed: _toggleFavorite,
          icon: _isFavorited ? const Icon(Icons.star) : const Icon(Icons.star_border),
          color: Colors.red[500],
        ),
        Text("$_favoriteCount")
      ],
    );
  }
}

// class _FavoriteWidgetState extends State<FavoriteWidget> {
//   // #enddocregion _FavoriteWidgetState-build
//   bool _isFavorited = true;
//   int _favoriteCount = 41;
//
//   // #enddocregion _FavoriteWidgetState-fields
//
//   // #docregion _toggleFavorite
//   void _toggleFavorite() {
//     setState(() {
//       if (_isFavorited) {
//         _favoriteCount -= 1;
//         _isFavorited = false;
//       } else {
//         _favoriteCount += 1;
//         _isFavorited = true;
//       }
//     });
//   }
//
//   // #enddocregion _toggleFavorite
//
//   // #docregion _FavoriteWidgetState-build
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(0),
//           child: IconButton(
//             padding: const EdgeInsets.all(0),
//             alignment: Alignment.centerRight,
//             icon: (_isFavorited
//                 ? const Icon(Icons.star)
//                 : const Icon(Icons.star_border)),
//             color: Colors.red[500],
//             onPressed: _toggleFavorite,
//           ),
//         ),
//         SizedBox(
//           width: 18,
//           child: SizedBox(
//             child: Text('$_favoriteCount'),
//           ),
//         ),
//       ],
//     );
//   }
// }


Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text("Oeschinen Lake Campground", style: mainTitleStyle,),
              ),
              Text("Kandersteg, Switzerland", style: subTitleStyle,)
            ],
          )
      ),
      const FavoriteWidget()
    ],
  ),
);

TextStyle mainTitleStyle = const TextStyle(
  fontWeight: FontWeight.bold,
);

TextStyle subTitleStyle = TextStyle(
  fontSize: 13,
  color: Colors.grey[500]
);

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    children: [
      Icon(icon, color: color, size: 35,),
      Container(
        padding: const EdgeInsets.only(top: 10),
        child: Text(label, style: const TextStyle(color: Colors.blue, fontSize: 13),),
      )
    ],
  );
}

Color color = Colors.blue;

Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    _buildButtonColumn(color, Icons.call, "CALL"),
    _buildButtonColumn(color, Icons.near_me, "ROUTE"),
    _buildButtonColumn(color, Icons.share, "SHARE")
  ],
);

Widget textSection = const Padding(
  padding: EdgeInsets.all(32),
  child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.', softWrap: true,),
);


void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}
