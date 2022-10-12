import 'package:desafio_final/endereco.dart';

class Socio {
  //ATRIBUTOS
  final String nome;
  final String _documento;
  final Endereco endereco;

  //CONSTRUTOR
  Socio(this._documento, {required this.nome, required this.endereco});

  //MODIFICADOR DO DOCUMENTO PARA UMA FORMA 000.000.000-00
  String get documento {
    if (_documento.length == 11) {
      return "${_documento.substring(0, 3)}.${_documento.substring(3, 6)}.${_documento.substring(6, 9)}-${_documento.substring(9, 11)}";
    } else {
      return "Documento inválido";
    }
  }

  //METODO DE COMPARACAO DE CPF
  bool comparaCPF(String documento) {
    if (documento == _documento) {
      return true;
    } else {
      return false;
    }
  }
}
