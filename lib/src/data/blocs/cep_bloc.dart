import 'dart:async';

import 'package:local_cep/src/data/blocs/cep_event.dart';
import 'package:local_cep/src/data/blocs/cep_state.dart';
import 'package:local_cep/src/data/service/cep_service.dart';
import 'package:local_cep/src/model/cep_model.dart';

class CepBloc {
  final _service = CepService();

  final StreamController<CepEvent> _inputCepController = StreamController<CepEvent>();
  final StreamController<CepState> _outputTarefaController = StreamController<CepState>();

  Sink<CepEvent> get inputCep => _inputCepController.sink;
  Stream<CepState> get outputCep => _outputTarefaController.stream;
  
  CepBloc(){
    _inputCepController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CepEvent event) async {
    CepModel cep = CepModel();

    _outputTarefaController.add(CepLoadingState());

    if(event is SearchCep) {
      cep = await _service.getLocationByCep(event.cep.isEmpty ? '00000000' : event.cep);
    }

    _outputTarefaController.add(CepLoadedState(cep: cep));
  }
}