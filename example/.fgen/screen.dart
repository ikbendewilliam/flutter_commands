import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
/* fgen_if templatesUsedContains(viewmodel) */
import 'package:fgen_project_name/di/injectable.dart';
import 'package:fgen_project_name/viewmodel/fgen_name/fgen_name_viewmodel.dart';
import 'package:fgen_project_name/widget/provider/provider_widget.dart';
/* fgen_else */
import 'package:fgen_project_name/widget/provider/data_provider_widget.dart';
/* fgen_endif */

@flutterRoute
class FgenNameScreen extends StatefulWidget {
  const FgenNameScreen({super.key});

  @override
  FgenNameScreenState createState() => FgenNameScreenState();
}

class FgenNameScreenState extends State<FgenNameScreen> {
  @override
  Widget build(BuildContext context) {
/* fgen_if templatesUsedContains(viewmodel) */
    return ProviderWidget<FgenNameViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) =>
        BaseScreen(),
    );
/* fgen_else */
    return DataProviderWidget(
      childBuilder: (context, theme, localization) =>
        BaseScreen(),
    );
/* fgen_endif */
  }
}
