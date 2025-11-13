// import 'dart:nativewrappers/_internal/vm/lib/ffi_patch.dart';

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
          children: [
            ProductCard(product: Product.dart,),
            ProductCard(product: Product.firebase,),
            ProductCard(product: Product.flutter,),
          ],
        ),
      ),
    ),
  ));
}

enum Product {
  dart(
    title: 'DART',
    description: 'The best object language.',
    image: 'assets/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'The best UI toolkit.',
    image: 'assets/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'The best backend service.',
    image: 'assets/firebase.png',
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage(product.image), width: 75,),
                SizedBox(height: 10,),
                Text(product.title, style: TextStyle(fontSize: 25),),
                SizedBox(height: 10,),
                Text(product.description)
              ],
            ),
            // SizedBox(width: 5,)
          ],
        ),
      ),
    );
  }
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
