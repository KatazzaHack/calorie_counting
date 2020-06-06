import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'dart:math';

class OutOfPieChart extends StatefulWidget {
  final int fullBar;
  final int filledBar;
  final bool infoInside;
  final double size;
  final String stringInside;

  OutOfPieChart(
      {Key key,
      this.filledBar,
      this.fullBar,
      this.infoInside,
      this.size,
      this.stringInside})
      : super(key: key);

  @override
  OutOfPieChartState createState() => OutOfPieChartState(this.filledBar,
      this.fullBar, this.infoInside, this.size, this.stringInside);
}

class OutOfPieChartState extends State<OutOfPieChart> {
  final int fullBar;
  final int filledBar;
  final bool infoInside;
  final double size;
  final String stringInside;

  OutOfPieChartState(this.filledBar, this.fullBar, this.infoInside, this.size,
      this.stringInside);

  List<charts.Series> computeSeriesList() {
    int blueArc = min(this.filledBar, this.fullBar);
    int whiteArc = this.fullBar - min(this.filledBar, this.fullBar);
    if ((whiteArc == 0) && (blueArc == 0)) {
      whiteArc = 0;
      blueArc = 1;
    }
    final data = [
      new BarHolder(
          0, blueArc, charts.MaterialPalette.blue.shadeDefault.darker),
      new BarHolder(
          1,
          whiteArc,
          charts.MaterialPalette.blue.shadeDefault.lighter.lighter.lighter
              .lighter),
    ];
    return [
      new charts.Series<BarHolder, int>(
        id: 'Calories',
        domainFn: (BarHolder calories, _) => calories.fieldNumber,
        measureFn: (BarHolder calories, _) => calories.calories,
        colorFn: (BarHolder calories, _) => calories.color,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    int offset = infoInside ? 0 : (this.size * 0.1).round();
    return Stack(
      children: <Widget>[
        charts.PieChart(
          this.computeSeriesList(),
          animate: true,
          animationDuration: Duration(milliseconds: 400),
          defaultRenderer: new charts.ArcRendererConfig(
              arcWidth: (this.size * 0.15).round()),
          layoutConfig: new charts.LayoutConfig(
              leftMarginSpec: new charts.MarginSpec.fixedPixel(offset),
              topMarginSpec: new charts.MarginSpec.fixedPixel(offset),
              rightMarginSpec: new charts.MarginSpec.fixedPixel(offset),
              bottomMarginSpec: new charts.MarginSpec.fixedPixel(offset)),
        ),
        Center(
          child: Text(
            infoInside ? "$filledBar / $fullBar" : stringInside,
            style: TextStyle(
                fontSize: infoInside ? this.size * 0.1 : offset * 2.0,
                color: infoInside
                    ? charts.ColorUtil.toDartColor(
                        charts.MaterialPalette.blue.shadeDefault)
                    : Colors.black,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class BarHolder {
  final int fieldNumber;
  final int calories;
  charts.Color color;

  BarHolder(this.fieldNumber, this.calories, this.color);
}
