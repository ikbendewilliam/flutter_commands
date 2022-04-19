# Flutter commands

Generate new classes (screen, viewmodel, repository, service) with a single command

## installation 
`dart pub global activate fgen`

## Options

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
