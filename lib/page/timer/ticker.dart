
/// Ticker class will be our data source for timer application.
/// It will expose a stream of ticks which we can subscribe and react to.
/// All [Ticker] class does is expose a tick function which takes the number of ticks(seconds) we want and returns a stream which emits the remaining seconds every second.
class Ticker {
  Stream<int> tick({int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}
