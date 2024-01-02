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
class FgenNameDialog extends StatefulWidget {
  const FgenNameDialog({super.key});

  @override
  FgenNameDialogState createState() => FgenNameDialogState();
}

class FgenNameDialogState extends State<FgenNameDialog> {
  @override
  Widget build(BuildContext context) {
/* fgen_if templatesUsedContains(viewmodel) */
    return ProviderWidget<FgenNameViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) =>
        Container(),
    );
/* fgen_else */
    return DataProviderWidget(
      childBuilder: (context, theme, localization) =>
        Container(),
    );
/* fgen_endif */
  }
}
