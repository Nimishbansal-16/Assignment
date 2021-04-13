import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui' as ui;
import 'package:polygon_clipper/polygon_border.dart';

import 'package:intern_app/user_model.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
    @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  User _user = new User();
  bool isSignedIn = false, showPassword = true;
  @override

   void toast(String data){
    Fluttertoast.showToast(
      msg: data,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white
    );
  }

  void _submitForm() {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
    RegExp regExp = new RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');
    if(!regExp.hasMatch(_user.email)){
      toast("Enter a valid Email ID");
    } else if(_user.password.length < 8){
      toast("Password must have atleast 8 characters");
    } else {
      print("Success");
      toast("Successfull");
    }
  }
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 130),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            shape: PolygonBorder(
            sides: 5,
            borderRadius: 5.0, // Default 0.0 degrees
            rotate: 0.0, // Default 0.0 degrees
            border: BorderSide.none, // Default BorderSide.none
            ),
            onPressed: (){
              _submitForm();
              },
            child: Icon(
              Icons.arrow_forward,
              color: Colors.redAccent),
            ),
            ),
        body: Stack(
          children: [
            Positioned(
            child: Container(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  CustomPaint(
                  size: Size(size.width,(size.width*1.584).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(),
                  ),
                  CustomPaint(
                    painter: OpenPainter(),
                  ),
                  Center(
                    child: Form(
                       key: _formkey,
                       autovalidate: true,
                   child: SingleChildScrollView(
                     child: Container(
                     margin: const EdgeInsets.fromLTRB(30,105,100, 205),
                     width: 400.0,
                     height: 190.0,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                             Text(
                               'Login',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 40,
                               ),
                             ),
                         SizedBox(
                           height:10
                         ),
                         TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value) {
                          return null;
                          },
                          onSaved: (String value) {
                          _user.email = value;
                          },

                          decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email address',
                          hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                          ),
                          ),
                      Divider(
                        height: 5,
                        thickness: 2,
                        color: Colors.black12,
                        ),
                         TextFormField(
                          obscureText: showPassword,
                          validator: (String value) {
                            return null;
                          },
                          onSaved: (String value) {
                         _user.password = value;
                           },
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Color.fromRGBO(255, 63, 111, 1),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          ),
                          ),
                       ),
                         Divider(
                           height: 5,
                           thickness: 2,
                           color: Colors.grey,
                         ),
                         SizedBox(
                           height:10,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             GestureDetector(
                               onTap: (){

                               }  ,
                                child: Text(
                                 'Forgot Password?',
                                 style:TextStyle(
                                   color: Colors.white,
                                   fontSize: 10,
                                 )
                               ),
                             )
                           ],
                         )
                       ],
                     ),
  ),
                   ),
                  ),
    ),
                ],
              )
            )

            )
          ],
        )
    );
  }
}
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {


final rect=Offset(size.width*0.2344000,size.height*0.2835859);
final rect2=Offset(0,size.height);
  Paint paint_0 = new Paint()
      ..color = Colors.red[100]
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..shader=ui.Gradient.linear(
    rect,
        rect2,
        [
          Color.fromRGBO(255,138,120,0.8),
          //Color.fromRGBO(255,114,117,1),
          Color.fromRGBO(255,90,111,1),
        ],
    );

    Path path_0 = Path();
    path_0.moveTo(size.width*0.0020000,size.height*0.3393939);
    path_0.quadraticBezierTo(size.width*0.1135000,size.height*0.253662,size.width*0.2844000,size.height*0.2735859);
    path_0.quadraticBezierTo(size.width*0.5369000,size.height*0.3097222,size.width*0.9932000,size.height*0.6542929);
    path_0.lineTo(size.width,700);
    path_0.lineTo(0,700);
    path_0.lineTo(size.width*0.0020000,size.height*0.4393939);
    path_0.close();
    canvas.drawPath(path_0, paint_0);

final rect3=Offset(size.width*0.9960000,30);
final rect4=Offset(size.width*0.6640000,size.height*0.2151515);
  Paint paint_1 = new Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..shader=ui.Gradient.linear(
    rect3,
        rect2,
        [
          Color.fromRGBO(255,120,120,0.8),
          //Color.fromRGBO(255,114,117,1),
          Color.fromRGBO(255,20,101,2),
        ],
    );



    Path path_1 = Path();
    path_1.moveTo(size.width,size.height*0.2525253);
    path_1.quadraticBezierTo(size.width*0.9325000,size.height*0.2828283,size.width*0.9120000,size.height*0.2929293);
    path_1.quadraticBezierTo(size.width*0.9020000,size.height*0.2977273,size.width*0.8720000,size.height*0.2878788);
    path_1.quadraticBezierTo(size.width*0.7176000,size.height*0.2340909,size.width*0.6640000,size.height*0.2151515);
    path_1.quadraticBezierTo(size.width*0.6604000,size.height*0.2154672,size.width*0.6512000,size.height*0.1921717);
    path_1.lineTo(size.width*0.6536000,30);
    path_1.lineTo(size.width,30);
    path_1.lineTo(size.width,size.height*0.2525253);
    path_1.close();
    canvas.drawPath(path_1, paint_1);

       }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect5=Offset(0,700);
    final rect6=Offset(400,900);
    var paint1 = Paint()

      ..style = PaintingStyle.fill
      ..shader=ui.Gradient.linear(
    rect5,
        rect6,
        [
          Color.fromRGBO(255,110,120,1),
          //Color.fromRGBO(255,114,117,1),
          Color.fromRGBO(255,95,111,1),
        ],
    );
    canvas.drawRect(Offset(0, 700) & const Size(400, 300), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}







