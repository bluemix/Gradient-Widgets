import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

List<LinearGradient> gradients = [
  Gradients.hotLinear,
  Gradients.jShine,
  Gradients.aliHussien,
  Gradients.rainbowBlue,
  Gradients.ali,
  Gradients.cosmicFusion,
  Gradients.backToFuture,
  Gradients.blush,
  Gradients.byDesign,
  Gradients.coldLinear,
  Gradients.haze,
  Gradients.hersheys,
  Gradients.taitanum,
  Gradients.tameer,
];

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Gradient Widgets Demo',
      debugShowCheckedModeBanner: false,
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
  Widget _divider(String title) {
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
          child: Container(
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
            _divider('GradientText'),
            SizedBox(
              height: 54.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: gradients
                    .map((gradient) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GradientText(
                            'Hello',
                            shaderRect: Rect.fromLTWH(0.0, 0.0, 50.0, 50.0),
                            gradient: gradient,
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
                    .map((gradient) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: GradientButton(
                              child: Text('Gradient'),
                              callback: () => print(''),
                              increaseWidthBy: 20.0,
                              gradient: gradient,
                            ),
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
                    .map((gradient) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularGradientButton(
                              child: Icon(Icons.gradient),
                              callback: () => print(''),
                              increaseWidthBy: 20.0,
                              gradient: gradient,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            _divider('GradientCard'),
            SizedBox(
              height: 80.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: gradients
                    .map((gradient) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Container(
                              height: 65.0,
                              width: 65.0,
//                              child: Center(child: Text('Hello'),),
                              child: GradientCard(
                                gradient: gradient,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Divider(
              color: Colors.blueGrey,
            ),
          ],
        ));
  }
}
