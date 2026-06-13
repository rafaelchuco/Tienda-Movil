import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tiendamovil/main.dart';

void main() {
  testWidgets('App arranca en LoginScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Iniciar sesión'), findsWidgets);
    expect(find.byType(CupertinoTextField), findsNWidgets(2));
  });
}
