import 'package:flutter/material.dart';
import 'package:local_cep/src/model/cep_model.dart';

class CardCepWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final CepModel? cepModel;
  const CardCepWidget({super.key, this.width, this.height,  this.cepModel});

  @override
  Widget build(BuildContext context) {
    const  textStyle =   TextStyle(
      color: Colors.white,
      fontSize: 20
    );
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 83, 82, 82),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Cep: ${cepModel?.cep}', style: textStyle, textAlign: TextAlign.center, ),
          Text('Cidade: ${cepModel?.localidade} - ${cepModel?.uf}', style: textStyle,),
          Text('Bairro: ${cepModel?.bairro}', style: textStyle,),
          Text('ddd: ${cepModel?.ddd}', style: textStyle,),
          Text('logradouro: ${cepModel?.logradouro}',style: textStyle,)
        ],
      ),
    );
  }
}