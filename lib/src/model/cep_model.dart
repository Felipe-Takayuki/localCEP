// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CepModel {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ddd;
  CepModel({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
    this.ddd,
  });


  CepModel copyWith({
    String? cep,
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
    String? uf,
    String? ddd,
  }) {
    return CepModel(
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
      ddd: ddd ?? this.ddd,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'ddd': ddd,
    };
  }

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel(
      cep: map['cep'] != null ? map['cep'] as String : null,
      logradouro: map['logradouro'] != null ? map['logradouro'] as String : null,
      complemento: map['complemento'] != null ? map['complemento'] as String : null,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
      localidade: map['localidade'] != null ? map['localidade'] as String : null,
      uf: map['uf'] != null ? map['uf'] as String : null,
      ddd: map['ddd'] != null ? map['ddd'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CepModel.fromJson(String source) => CepModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CepModel(cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro: $bairro, localidade: $localidade, uf: $uf, ddd: $ddd)';
  }

  @override
  bool operator ==(covariant CepModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.cep == cep &&
      other.logradouro == logradouro &&
      other.complemento == complemento &&
      other.bairro == bairro &&
      other.localidade == localidade &&
      other.uf == uf &&
      other.ddd == ddd;
  }

  @override
  int get hashCode {
    return cep.hashCode ^
      logradouro.hashCode ^
      complemento.hashCode ^
      bairro.hashCode ^
      localidade.hashCode ^
      uf.hashCode ^
      ddd.hashCode;
  }
}
