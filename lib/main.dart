import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("My Hobbies"), centerTitle: false),
//         body: Container(
//           color: Colors.grey.shade400,
//           padding: EdgeInsets.symmetric(vertical: 40),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // HobbyCard(
//               //   hobbyText: "Drinking",
//               //   hobbyColor: Colors.yellow[700]!,
//               //   hobbyIcon: Icon(Icons.sports_bar_outlined, color: Colors.white),
//               // ),
//               // HobbyCard(
//               //   hobbyText: "Eating",
//               //   hobbyColor: Colors.red,
//               //   hobbyIcon: Icon(Icons.fastfood_outlined, color: Colors.white),
//               // ),
//               // HobbyCard(
//               //   hobbyText: "Smoking",
//               //   hobbyColor: Colors.orange,
//               //   hobbyIcon: Icon(
//               //     Icons.smoking_rooms_outlined,
//               //     color: Colors.white,
//               //   ),
//               // ),

//               // CustomButton(buttonType: ButtonType.Primary, buttonText: "Primary", buttonIcon: Icons.present_to_all, iconPos: ButtonIconPos.Right),
//               // CustomButton(buttonType: ButtonType.Secondary, buttonText: "Secondary", buttonIcon: Icons.co_present),
//               // CustomButton(buttonType: ButtonType.Disabled, buttonText: "Disabled", buttonIcon: Icons.file_present, iconPos: ButtonIconPos.Right)

//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Products"), centerTitle: false),
      body: Container(
        padding: EdgeInsets.all(50),
        color: Colors.blue,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.white,  
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Image(image: AssetImage('assets/dart.png')),
                  Text("DART", style: TextStyle(fontSize: 50),),
                  Text("the best object language."),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  ));
}

enum ButtonType {Primary, Secondary, Disabled}
enum ButtonIconPos {Left, Right}
// const ButtonColours = {
//   ButtonType.Primary: Colors.green,
//   ButtonType.Secondary: Colors.blue,
//   ButtonType.Disabled: Colors.grey,
// };
extension ButtonTypeColour on ButtonType {
  MaterialColor get color{
    switch (this) {
      case ButtonType.Primary : return Colors.green;
      case ButtonType.Secondary : return Colors.blue;
      case ButtonType.Disabled : return Colors.grey;
    }
  }
}

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  final String buttonText;
  final IconData buttonIcon;
  final ButtonIconPos iconPos;

  const CustomButton({
    super.key,
    required this.buttonType,
    required this.buttonText,
    required this.buttonIcon,
    this.iconPos = ButtonIconPos.Left});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: buttonType.color,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPos == ButtonIconPos.Left) ...[
              Icon(buttonIcon, color: buttonType.color.shade900),
              SizedBox(width: 10),
              Text(buttonText, style: TextStyle(decoration: TextDecoration.none, color: buttonType.color.shade900))
            ] else ... [
              Text(buttonText, style: TextStyle(decoration: TextDecoration.none, color: buttonType.color.shade900)),
              SizedBox(width: 10),
              Icon(buttonIcon, color: buttonType.color.shade900),
            ]
          ],
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final String hobbyText;
  final Color hobbyColor;
  final Icon hobbyIcon;
  const HobbyCard({
    super.key,
    required this.hobbyText,
    required this.hobbyColor,
    required this.hobbyIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: hobbyColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20) ,
        child: Row(
          children: [
            hobbyIcon,
            Text(
              hobbyText,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
