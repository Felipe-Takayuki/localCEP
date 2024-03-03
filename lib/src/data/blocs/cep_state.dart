import 'package:local_cep/src/model/cep_model.dart';

abstract class CepState {
  final CepModel cepModel;

  CepState({required this.cepModel});
}

class CepInitialState extends CepState {
  CepInitialState() : super(cepModel: CepModel());
}

class CepLoadingState extends CepState {
  CepLoadingState() : super(cepModel: CepModel());
}

class CepLoadedState extends CepState {
  CepLoadedState({required CepModel cep}) : super(cepModel: cep);
}

class CepErrorState extends CepState {
  final Exception exception;
  CepErrorState({required this.exception}) : super(cepModel: CepModel());
}
