import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:example/di/injectable.dart';
import 'package:example/viewmodel/test/test_viewmodel.dart';
import 'package:example/widget/provider/provider_widget.dart';

@flutterRoute
class TestDialog extends StatefulWidget {
  const TestDialog({super.key});

  @override
  TestDialogState createState() => TestDialogState();
}

class TestDialogState extends State<TestDialog> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<TestViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) =>
        Container(),
    );
  }
}
