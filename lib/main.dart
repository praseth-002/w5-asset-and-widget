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

enum ButtonType { Primary, Secondary, Disabled }

enum ButtonIconPos { Left, Right }

// const ButtonColours = {
//   ButtonType.Primary: Colors.green,
//   ButtonType.Secondary: Colors.blue,
//   ButtonType.Disabled: Colors.grey,
// };
extension ButtonTypeColour on ButtonType {
  MaterialColor get color {
    switch (this) {
      case ButtonType.Primary:
        return Colors.green;
      case ButtonType.Secondary:
        return Colors.blue;
      case ButtonType.Disabled:
        return Colors.grey;
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
    this.iconPos = ButtonIconPos.Left,
  });

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
              Text(
                buttonText,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: buttonType.color.shade900,
                ),
              ),
            ] else ...[
              Text(
                buttonText,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: buttonType.color.shade900,
                ),
              ),
              SizedBox(width: 10),
              Icon(buttonIcon, color: buttonType.color.shade900),
            ],
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: Text("Products"), centerTitle: false),
//       body: Container(
//         padding: EdgeInsets.all(50),
//         color: Colors.blue,
//         child: Column(
//           children: [
//             ProductCard(product: Product.dart,),
//             ProductCard(product: Product.firebase,),
//             ProductCard(product: Product.flutter,),
//           ],
//         ),
//       ),
//     ),
//   ));
// }

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
  const ProductCard({super.key, required this.product});

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
                Image(image: AssetImage(product.image), width: 75),
                SizedBox(height: 10),
                Text(product.title, style: TextStyle(fontSize: 25)),
                SizedBox(height: 10),
                Text(product.description),
              ],
            ),
            // SizedBox(width: 5,)
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
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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

void main() {
  runApp(
    MaterialApp(
      home: Container(
        color: const Color.fromARGB(255, 255, 247, 254),
        child: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: ListView(
                children: [
                  WeatherCard(
                    weatherIcon: 'assets/cloudy.png',
                    city: 'Phnom Penh',
                    minTemp: '10.0',
                    maxTemp: '30.0',
                    curTemp: '12.2',
                    gradient: Colors.purple,
                  ),
                  WeatherCard(
                    weatherIcon: 'assets/sunnyCloudy.png',
                    city: 'Paris',
                    minTemp: '10.0',
                    maxTemp: '40.0',
                    curTemp: '22.2',
                    gradient: Colors.green,
                  ),
                  WeatherCard(
                    weatherIcon: 'assets/sunny.png',
                    city: 'Rome',
                    minTemp: '10.0',
                    maxTemp: '40.0',
                    curTemp: '45.2',
                    gradient: Colors.red,
                  ),
                  WeatherCard(
                    weatherIcon: 'assets/veryCloudy.png',
                    city: 'Toulouse',
                    minTemp: '10.0',
                    maxTemp: '40.0',
                    curTemp: '45.2',
                    gradient: Colors.orange,
                  ),
                  WeatherCard(
                    weatherIcon: 'assets/cloudy.png',
                    city: 'Phnom Penh',
                    minTemp: '10.0',
                    maxTemp: '30.0',
                    curTemp: '12.2',
                    gradient: Colors.purple,
                  ),
                  WeatherCard(
                    weatherIcon: 'assets/sunnyCloudy.png',
                    city: 'Paris',
                    minTemp: '10.0',
                    maxTemp: '40.0',
                    curTemp: '22.2',
                    gradient: Colors.green,
                  ),
                  WeatherCard(
                    weatherIcon: 'assets/sunny.png',
                    city: 'Rome',
                    minTemp: '10.0',
                    maxTemp: '40.0',
                    curTemp: '45.2',
                    gradient: Colors.red,
                  ),
                  WeatherCard(
                    weatherIcon: 'assets/veryCloudy.png',
                    city: 'Toulouse',
                    minTemp: '10.0',
                    maxTemp: '40.0',
                    curTemp: '45.2',
                    gradient: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class WeatherCard extends StatelessWidget {
  final String weatherIcon;
  final String city;
  final String minTemp;
  final String maxTemp;
  final String curTemp;
  final MaterialColor gradient;
  const WeatherCard({
    super.key,
    required this.weatherIcon,
    required this.city,
    required this.minTemp,
    required this.maxTemp,
    required this.curTemp,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          PhysicalModel(
            color: Colors.transparent,
            elevation: 10,
            shadowColor: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            clipBehavior: Clip.antiAlias,
            child: Container(
              padding: EdgeInsetsGeometry.all(10),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(25)),
                gradient: LinearGradient(
                  colors: [gradient.shade400, gradient.shade800],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(weatherIcon),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            city,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            'Min: $minTemp°C',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Max: $maxTemp°C',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container(color: Colors.transparent)),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(left: -100, top: -50, child: CircleAvatar(backgroundColor: gradient.shade500, radius: 100),),
                          Text("$curTemp°C", style: TextStyle(decoration: TextDecoration.none, color: Colors.white, fontSize: 24,)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: const Color.fromARGB(255, 150, 200, 240),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Expanded(child: Container()),
              Container(
                width: 50,
                height: 5,
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 5),
              ),
              Container(
                width: 50,
                height: 5,
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 5),
              ),
              Container(
                width: 50,
                height: 5,
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
