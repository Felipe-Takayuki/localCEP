// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class CepEvent {}

class SearchCep extends CepEvent {
  final String cep;
  SearchCep({
    required this.cep,
  });
}

