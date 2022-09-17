import 'package:desafio_final/endereco.dart';

class Socio {
  String nome;
  final String _documento;
  Endereco endereco;

  Socio(this._documento, {required this.nome, required this.endereco});

  String get documento {
    if (_documento.length == 11) {
      return "${_documento.substring(0, 3)}.${_documento.substring(3, 6)}.${_documento.substring(6, 9)}-${_documento.substring(9, 11)}";
    } else {
      return "Documento inválido";
    }
  }

  bool comparaCPF(String documento) {
    if (documento == _documento) {
      return true;
    } else {
      return false;
    }
  }
}
