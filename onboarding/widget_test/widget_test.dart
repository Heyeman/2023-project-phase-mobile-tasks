import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:replicate/createTask.dart' as CT;
import 'package:replicate/taskList.dart' as TL;
// import 'package:replicate/taskDetail.dart';

import 'package:replicate/main.dart';

void main() {
  testWidgets('Tests task creation', (WidgetTester tester) async {
    String title = "newTask",
        description = "newDescription",
        deadline = "April 29, 2023";

    await tester.pumpWidget(generateApp([]));

    final titleFinder = find.text(title);

    expect(titleFinder, findsNothing);

    final createTaskButton = find.text('Create task');
    await tester.tap(createTaskButton);
    await tester.pumpAndSettle();

    final titleField = find.byKey(Key('Title'));
    final descriptionField = find.byKey(Key('Description'));
    final deadlineField = find.byKey(Key('Deadline'));

    await tester.enterText(titleField, title);
    await tester.enterText(descriptionField, description);
    await tester.enterText(deadlineField, deadline);

    final submitButton = find.text('Save');
    await tester.tap(submitButton);

    await tester.pumpAndSettle();

    final newTitleFinder = find.text(title);

    expect(newTitleFinder, findsOneWidget);
  });
  testWidgets('Tests rejection of empty task creation',
      (WidgetTester tester) async {
    String title = "newTask123", description = "", deadline = "April 29, 2023";

    await tester.pumpWidget(generateApp([]));

    final titleFinder = find.text(title);

    expect(titleFinder, findsNothing);

    final createTaskButton = find.text('Create task');
    await tester.tap(createTaskButton);
    await tester.pumpAndSettle();

    final titleField = find.byKey(Key('Title'));
    final descriptionField = find.byKey(Key('Description'));
    final deadlineField = find.byKey(Key('Deadline'));

    await tester.enterText(titleField, title);
    await tester.enterText(descriptionField, description);
    await tester.enterText(deadlineField, deadline);

    final submitButton = find.text('Save');
    await tester.tap(submitButton);

    await tester.pumpAndSettle();

    final newTitleFinder = find.text(title);

    expect(newTitleFinder, findsNothing);
  });

  testWidgets('Tests if tasks are listed correctly',
      (WidgetTester tester) async {
    String title = "newTask",
        description = "newDescription",
        deadline = "April 29, 2023";

    await tester.pumpWidget(generateApp([Todo(title, description, deadline)]));

    final titleFinder = find.text(title);

    expect(titleFinder, findsOneWidget);
  });
}
