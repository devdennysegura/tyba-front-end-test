part of tyba.ui.widgets;

class HomeViewLoadingState extends StatelessWidget {
  final BoxConstraints constraints;

  HomeViewLoadingState(this.constraints);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: constraints.maxHeight,
        height: constraints.maxHeight,
        child: FlareActor(
          "assets/anims/foods.flr",
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: 'loading',
        ),
      ),
    );
  }
}
