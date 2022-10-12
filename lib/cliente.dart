import 'package:desafio_final/endereco.dart';
import 'package:desafio_final/socio.dart';

//Criação da classe Cliente

class Cliente {
  //ATRIBUTOS
  final id;
  final _cnpj;
  final dataCriacao;
  final String razaoSocial;
  final String? nomeFantasia;
  final _telefone;
  final Endereco endereco;
  final Socio socio;

  //CONSTRUTOR
  Cliente(this._cnpj, this._telefone, this.nomeFantasia,
      {required this.id,
      required this.dataCriacao,
      required this.razaoSocial,
      required this.endereco,
      required this.socio});

  //MODIFICADOR DO CNPJ PARA UMA FORMA 00.000.000/0000-00
  String get cnpj {
    if (_cnpj.length == 14) {
      return "${_cnpj.substring(0, 2)}.${_cnpj.substring(2, 5)}.${_cnpj.substring(5, 8)}/${_cnpj.substring(8, 12)}-${_cnpj.substring(12, 14)}";
    } else {
      return "Documento inválido";
    }
  }

  //MODIFICADOR DO TELEFONE PARA UMA FORMA (00) 0 0000-0000
  String get telefone {
    if (_telefone.length == 11) {
      return "(${_telefone.substring(0, 2)}) ${_telefone.substring(2, 3)} ${_telefone.substring(3, 7)}-${_telefone.substring(7, 11)}";
    } else {
      return "Telefone inválido";
    }
  }

  //MÉTODO PARA COMPARAR CNPJ
  bool comparaCNPJ(String documento) {
    if (documento == _cnpj) {
      return true;
    } else {
      return false;
    }
  }
}
