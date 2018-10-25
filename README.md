


<center>
![Gradient Widgets](art/screenshot1_resized_cropped.png)
</center>




## Gradient Widgets
Flutter widgets wrapped with gradients.


* GradientText
* GradientCard
* GradientButton
* CircularGradientButton

## Usage


### `GradientCard`

```
GradientCard(gradient: Gradients.tameer);
```

other parameters are the same as the `Card`.


### `GradientButton`
currently, you need to wrap `GradientButton` inside `Center`

```
Center(
   child: GradientButton(
                 child: Text('Gradient'),
                 callback: () {},
                 gradient: Gradients.backToFuture,
           ),
)

```
other parameters are the same as any *`Button`.



### `GradientText`

```
GradientText('Hello',
             shaderRect: Rect.fromLTWH(0.0, 0.0, 50.0, 50.0),
             gradient: Gradients.hotLinear,
             style: TextStyle(fontSize: 40.0,),);
```

other parameters are the same as the `Text`.



### `CircularGradientButton`

currently, you need to wrap `GradientButton` inside `Center`


```
Center(
   child: CircularGradientButton(
                 child: Icon(Icons.gradient),
                 callback: (){},
                 gradient: Gradients.rainbowBlue,
           ),
)

```

other parameters are the same as `FloatingActionButton`.




## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
