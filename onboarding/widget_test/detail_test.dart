import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:replicate/createTask.dart' as CT;
import 'package:replicate/taskList.dart' as TL;
// import 'package:replicate/taskDetail.dart';

import 'package:replicate/main.dart';

void main() {

  testWidgets('Checks if it goes to the correct detail page',
      (WidgetTester tester) async {
    String title = "newTask1236", description = "", deadline = "April 29, 2023";

    await tester.pumpWidget(generateApp([Todo(title, description, deadline)]));

    final titleFinder = find.text(title);

    expect(titleFinder, findsOneWidget);

    // tap the task
    await tester.tap(titleFinder);
    await tester.pumpAndSettle();
    final detailTitle = find.text("Title");
    final detailDescription = find.text("Description");
    final detailDeadline = find.text("Deadline");

    expect(detailTitle, findsOneWidget);
    expect(detailDescription, findsOneWidget);
    expect(detailDeadline, findsOneWidget);


    
    final detailsTitle = find.text(title);
    final detailsDescription = find.text(description);
    final detailsDeadline = find.text(deadline);

    expect(detailsTitle, findsOneWidget);
    expect(detailsDescription, findsOneWidget);
    expect(detailsDeadline, findsOneWidget);
    
  });
}
