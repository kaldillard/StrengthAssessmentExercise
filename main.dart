import 'package:coding_activity/metricsBubble.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:coding_activity/styles.dart';
import 'package:flutter_svg/svg.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (BuildContext context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Metrics',
          theme: ThemeData(
              appBarTheme: const AppBarTheme(color: Color(0xff53a99a))),
          home: const MyHomePage(title: 'Metrics'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _labelController = TextEditingController();
  late String label = "Upper Body";
  final ValueNotifier<int> _weight = ValueNotifier<int>(45);
  late StateSetter internalSetter;

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _labelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MetricsBubble(weight: _weight, label: label),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomDialog(context);
        },
        backgroundColor: const Color(0xff53a99a),
        elevation: 8,
        icon: Icon(
          Icons.edit_rounded,
          size: 19.sp,
        ),
        label: Text(
          "Modify",
          style: labelTextStyle,
        ),
      ),
    );
  }

  showCustomDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          // Custom dialog widget to edit label and weight
          return DialogForm();
        });
  }

  Dialog DialogForm() {
    return Dialog(
        backgroundColor: const Color(0xff53a99a),
        alignment: Alignment.topCenter,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Enter Label and Weight",
                  style: TextStyle(
                      fontFamily: 'League Gothic',
                      fontSize: 38.sp,
                      color: Colors.white)),
              SizedBox(
                height: 15.h,
              ),
              TextFormField(
                  onChanged: (value) {
                    setState(() {
                      label = value;
                    });
                  },
                  controller: _labelController,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.number,
                  decoration: labelTextFieldStyle),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.weightHanging,
                    color: Color(0x80ffffff),
                    size: 19.sp,
                  ),
                  // Slider for weight
                  Expanded(
                    child: StatefulBuilder(builder: (context, setter) {
                      internalSetter = setter;
                      return Slider(
                        value: _weight.value.toDouble(),
                        onChanged: (value) => setter(() {
                          _weight.value = value.toInt();
                        }),
                        min: 0,
                        max: 350,
                        inactiveColor: const Color(0x80ffffff),
                        activeColor: Colors.white,
                      );
                    }),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
