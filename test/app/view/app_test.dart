import 'package:flutter_test/flutter_test.dart';
import 'package:notimee_flutter_todos/app/app.dart';
import 'package:notimee_flutter_todos/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
