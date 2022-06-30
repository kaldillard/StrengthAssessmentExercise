import 'package:coding_activity/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MetricsBubble extends StatelessWidget {
  const MetricsBubble({
    Key? key,
    required ValueNotifier<int> weight,
    required this.label,
  })  : _weight = weight,
        super(key: key);

  final ValueNotifier<int> _weight;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ValueListenableBuilder<int>(
              valueListenable: _weight,
              // Called when the value changes
              builder: (context, int value, _) {
                const String assetName = 'assets/graph.svg';
                final Widget svg = SvgPicture.asset(assetName,
                    semanticsLabel: 'Background Graph');
                return Column(
                  children: [
                    Container(
                        width: bubbleDiameter.toDouble(),
                        height: bubbleDiameter.toDouble(),
                        decoration: bubbleBoxDecoration,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          fit: StackFit.loose,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 30.0.r, bottom: 15.r),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    label,
                                    style: labelTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    _weight.value.toString(),
                                    style: weightTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "lbs",
                                    style: unitTextStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            svg
                          ],
                        )),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
