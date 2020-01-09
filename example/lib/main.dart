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
  NamedGradient(Gradients.aliHussien, 'Golden Sunset'),
  NamedGradient(Gradients.rainbowBlue, 'Rainbow'),
  NamedGradient(Gradients.ali, 'Techno'),
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

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gradient Widgets Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Gradient Widgets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _divider(String title, {Widget child}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            title,
            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w200),
          ),
        ),
        Expanded(
          flex: 1,
          child: child ??
              Container(
                height: 1,
                color: Color(0xffFFD189),
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
//            GradientProgressIndicator(gradient: Gradients.aliHussien, value: 0.9,),
//            GradientProgressIndicator(gradient: Gradients.byDesign,),
            _divider('GradientText'),
            SizedBox(
              height: 54,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: gradients
                    .map((namedGradient) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: GradientText(
                            'Hello',
                            gradient: namedGradient.gradient,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            _divider('GradientButton'),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: gradients
                    .map((namedGradient) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: GradientButton(
                            child: Text('Gradient'),
                            callback: () => print('${namedGradient.name} clicked'),
                            increaseWidthBy: 20,
                            gradient: namedGradient.gradient,
                            shadowColor: namedGradient.gradient.colors.last.withOpacity(0.25),
                          ),
                        ))
                    .toList(),
              ),
            ),
            _divider('CircularGradientButton'),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: gradients
                    .map((namedGradient) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: CircularGradientButton(
                            child: Icon(Icons.gradient),
                            callback: () => print('${namedGradient.name} clicked'),
                            gradient: namedGradient.gradient,
                            shadowColor: namedGradient.gradient.colors.last.withOpacity(0.5),
                            elevation: 5,
                          ),
                        ))
                    .toList(),
              ),
            ),
            _divider('GradientProgressIndicator'),
            _divider('Indeterminate',
                child: GradientProgressIndicator(
                  key: widget.key,
                  gradient: gradients[4].gradient,
                )),
            SizedBox(
              height: 42,
              child: ListView(
                children: gradients
                    .take(1)
                    .where((gradient) => gradient.gradient.colors.length == 2)
                    .map((namedGradient) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          child: _divider('  Determinate',
                              child: GradientProgressIndicator(
                                gradient: namedGradient.gradient,
                                value: Random().nextDouble(),
                              )),
                        ))
                    .toList(),
              ),
            ),
            _divider('GradientCard'),
            SizedBox(
              height: 65 * (gradients.length / 3),
              child: GridView.count(
                physics: ScrollPhysics(),
                childAspectRatio: 0.7,
                crossAxisCount: 5,
                crossAxisSpacing: 2,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                children: List.generate(gradients.length, (index) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          child: GradientCard(
                            gradient: gradients[index].gradient,
                            elevation: 8,
                            shadowColor: gradients[index].gradient.colors.last.withOpacity(0.25),
                            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
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
