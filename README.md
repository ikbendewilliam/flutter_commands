# FGEN

Generate new classes (screen, viewmodel, repository, service) with a single command. Expand these options by adding your own templates (see below).

## installation

`dart pub global activate fgen`

## Using the command

```
fgen login -svrw
```

Will generate:

- (-s) LoginScreen (+ navigator/navigation code)
- (-v) LoginViewModel
- (-r) LoginRepository
- (-w) LoginService + LoginWebService

All generated files depend when needed on the relevant other generated files. So

- Screen -> ViewModel
- ViewModel -> Repository
- Repository -> Service

See the example folder to check the generated files

You can add additional options to the command by using custom templates.

## Custom templates

### Configuration

You can use custom templates by adding a `.fgen` folder in the root of your project or by defining the location of the folder in your pubspec by adding the following to your pubspec.yaml:

```yaml
fgen:
  templates_folder: .fgen
```

The templates folder should contain a `templates.yaml` file with the following structure:

```yaml
dialog: # name of the template and also the command to use it. In this case --dialog
  folder: screen # folder where the file should be generated in
  template_files: # list of files to generate
    - dialog.dart: _dialog # template file in this folder: suffix to be added to the generated file (in this case running with name 'test' will result in test_dialog.dart)
  abbr: d # abbreviation to use for the command, rather than using --dashboard, you can use -d
  help: Generate a dialog, if viewmodel is generated, will add ProviderWidget # help text to show when running fgen --help
```

You can use the default names or abbreviations to override the default templates. (--screen -s, --viewmodel -v, --repository -r, --webservice -w).

You can check if the templates have been detected by running `fgen --help`:

```
% fgen --help
Found templates: 5
-h, --help          Print this help
-d, --dialog        Generate a dialog, if viewmodel is generated, will add ProviderWidget
-r, --repository    Generate a repository
-s, --screen        Generate a screen with baseScreen, if viewmodel is generated, will add ProviderWidget
-v, --viewmodel     Generate a viewmodel
-w, --webservice    Generate a service (abstract) and webservice (implementation) file
```

### Template files

Below is an example of a template file. You can use the following variables:
- `fgen_name` (name of the file)
- `fgen_project_name` (name of the project as defined in pubspec.yaml)
- `fgen_if templatesUsedContains(otherTemplate)` (if the `otherTemplate` is also being generated, you can use this to add extra code) end with `fgen_else` or `fgen_endif` always add /* */ around them.

Note: You can use the variables in three capitalization styles: `fgen_name`, `FgenName` and `fgenName`, the script will detect which one you used and replace it with the correct value. (e.g. `fgen_name` will be replaced with `this_is_a_name` and `FgenName` will be replaced with `ThisIsAName`)

```dart
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
          Container(),
    );
/* fgen_else */
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Container(),
    );
/* fgen_endif */
  }
}
```

## Default templates

The code generated with the default templates is compatible and based on the icapps template code. See [flutter-template](https://github.com/icapps/flutter-template) for the latest state.
