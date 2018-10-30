import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class NamedGradient {
  NamedGradient(this.gradient, this.name);

  LinearGradient gradient;
  String name;
}

List<NamedGradient> gradients = [
  NamedGradient(Gradients.hotLinear, 'Hot Linear'),
  NamedGradient(Gradients.jShine, 'J Shine'),
  NamedGradient(Gradients.aliHussien, 'Ali Hussien'),
  NamedGradient(Gradients.rainbowBlue, 'Rainbow'),
  NamedGradient(Gradients.ali, 'Ali'),
  NamedGradient(Gradients.cosmicFusion, 'Cosmic Fusion'),
  NamedGradient(Gradients.backToFuture, 'Back to Future'),
  NamedGradient(Gradients.blush, 'Blush'),
  NamedGradient(Gradients.byDesign, 'By Design'),
  NamedGradient(Gradients.coldLinear, 'Cold Linear'),
  NamedGradient(Gradients.haze, 'Haze'),
  NamedGradient(Gradients.hersheys, 'Hersheys'),
  NamedGradient(Gradients.tameer, 'Tameer'),
  NamedGradient(Gradients.taitanum, 'Taitanum'),
  NamedGradient(Gradients.deepSpace, 'Deep Space'),
];

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Gradient Widgets Demo',
      debugShowCheckedModeBanner: true,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Gradient Widgets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _divider(String title, {Widget child}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w200),
          ),
        ),
        Expanded(
          flex: 1,
          child: child ??
              Container(
                height: 1.0,
                color: Color(0xffFFD189),
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
          title: new Text(
            widget.title,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
//            GradientProgressIndicator(gradient: Gradients.aliHussien, value: 0.9,),
//            GradientProgressIndicator(gradient: Gradients.byDesign,),

            _divider('GradientText'),
            SizedBox(
              height: 54.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: gradients
                    .map((namedGradient) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GradientText(
                            'Hello',
                            shaderRect: Rect.fromLTWH(0.0, 0.0, 50.0, 50.0),
                            gradient: namedGradient.gradient,
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
//                                foreground: Paint()
//                                  ..shader = gradient.createShader(Rect.fromLTWH(0.0, 0.0, 50.0, 50.0))
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            _divider('GradientButton'),
            SizedBox(
              height: 80.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: gradients
                    .map((namedGradient) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GradientButton(
                            child: Text('Gradient'),
                            callback: () => print(''),
                            increaseWidthBy: 20.0,
                            gradient: namedGradient.gradient,
                          ),
                        ))
                    .toList(),
              ),
            ),
            _divider('CircularGradientButton'),
            SizedBox(
              height: 80.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: gradients
                    .map((namedGradient) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularGradientButton(
                            child: Icon(Icons.gradient),
                            callback: () => print(''),
                            gradient: namedGradient.gradient,
                          ),
                        ))
                    .toList(),
              ),
            ),
            _divider('GradientProgressIndicator'),
            _divider('Indeterminate',
                child: GradientProgressIndicator(
                  gradient: gradients[4].gradient,
                )),
            SizedBox(
              height: 42.0,
              child: ListView(
                children: gradients
                    .take(1)
                    .where((gradient) => gradient.gradient.colors.length == 2)
                    .map((namedGradient) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                          child: _divider('  Determinate', child: GradientProgressIndicator(
                            gradient: namedGradient.gradient,
                            value: Random().nextDouble(),
                          )),
                        ))
                    .toList(),
              ),
            ),
            _divider('GradientCard'),
            SizedBox(
              height: 65.0 * (gradients.length / 3),
              child: GridView.count(
                physics: ScrollPhysics(),
                childAspectRatio: 0.7,
                crossAxisCount: 5,
                crossAxisSpacing: 10.0,
                children: List.generate(gradients.length, (index) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 65.0,
                          width: 65.0,
                          child: GradientCard(
                            gradient: gradients[index].gradient,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              gradients[index].name,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),

            Divider(
              color: Colors.blueGrey,
            ),
          ],
        ));
  }
}
