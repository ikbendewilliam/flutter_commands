import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:example/di/injectable.dart';
import 'package:example/viewmodel/test/test_viewmodel.dart';
import 'package:example/widget/provider/provider_widget.dart';

@flutterRoute
class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  TestScreenState createState() => TestScreenState();
}

class TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<TestViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) =>
        BaseScreen(),
    );
  }
}
