import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_cep/src/data/blocs/cep_bloc.dart';
import 'package:local_cep/src/data/blocs/cep_event.dart';
import 'package:local_cep/src/data/blocs/cep_state.dart';
import 'package:local_cep/src/ui/widgets/card_cep_widget.dart';

class SearchCepPage extends StatefulWidget {
  const SearchCepPage({super.key});

  @override
  State<SearchCepPage> createState() => _SearchCepPageState();
}

class _SearchCepPageState extends State<SearchCepPage> {
  final cepController = TextEditingController();
  late final CepBloc _cepBloc;
  @override
  void initState() {
    super.initState();
    _cepBloc = CepBloc();
  }

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 57, 95, 112),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'LocalCEP',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
            const Spacer(
              flex: 2,
            ),
            SizedBox(
                width: sizeOf.width * .6,
                child: TextFormField(
                  controller: cepController,
                  inputFormatters: [
                    CepInputFormatter(),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      _cepBloc.inputCep.add(SearchCep(cep: cepController.text));
                    },
                    child: const Text(
                      'Buscar Cep',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
            ),
            const Spacer(),
            StreamBuilder(
              stream: _cepBloc.outputCep,
              builder: (context, state) {
                if (state.data is CepLoadingState) {
                  return const CircularProgressIndicator();
                } else if (state.data is CepLoadedState) {
                  final cep = state.data?.cepModel;
                  return cep?.cep != null
                      ? Center(child: CardCepWidget(cepModel: cep))
                      : const Center(
                          child: Text(
                          'CEP Desconhecido, Digite um CEP Válido',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ));
                } else if (state.data is CepErrorState) {
                  return const Text('Error');
                }
                return const Text('');
              },
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
