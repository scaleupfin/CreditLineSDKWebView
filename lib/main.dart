import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scale_up_module/main.dart';
import 'package:scale_up_module/view/otp_screens/OtpScreen.dart';
import 'package:scale_up_module/view/splash_screen/SplashScreen.dart';

void main() {
  runApp(const MyWebApp());
}

class MyWebApp extends StatelessWidget {
  const MyWebApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: ()async {

                Map<String, dynamic> json = {
                  "mobileNumber": "1234567890",
                  "companyID": "CompanyID123",
                  "productID": "ProductID123",
                  "transactionId": "",
                  "isPayNow": false,
                  "baseUrl": "https://gateway-qa.scaleupfin.com"
                };

                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) {
                  return MyApp() ;
                },
                ),);

              },
              child: Text('Business Loan'),
            ),
             const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Supply Chan finance'),
            )
          ],
        ),
      ),   );
  }
}
