import 'dart:convert';
import 'dart:developer';

import 'package:local_cep/src/constants/api_contants.dart';
import 'package:local_cep/src/model/cep_model.dart';
import 'package:http/http.dart' as http;

class CepService {
  Future<CepModel> getLocationByCep(cep) async {
    var url = Uri.parse("${ConstantsApi.baseUrl}/$cep/json");
    CepModel cepModel = CepModel();
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      cepModel = CepModel(
          cep: body['cep'],
          bairro: body['bairro'],
          complemento: body['complemento'],
          ddd: body['ddd'],
          localidade: body['localidade'],
          logradouro: body['logradouro'],
          uf: body['uf']);
      return cepModel;
    } else {
      log('Deu Ruim!');
    }
    return CepModel();
  }
}
