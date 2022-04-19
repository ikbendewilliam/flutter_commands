# Flutter commands

Generate new classes (screen, viewmodel, repository, service) with a single command

## installation 
`dart pub global activate fgen`

## Options

```
fgen login -s -v -r -w
```
Will generate:
- (-s) LoginScreen (+ navigator/navigation code)
- (-v) LoginViewModel
- (-r) LoginRepository
- (-w) LoginService + LoginWebService

# TODO

[] Combine multiple generators (s+v+r+s) and they depend on each other
[] Create new project
[] Add docs 
