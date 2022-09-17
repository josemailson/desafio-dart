import 'dart:ffi';

import 'package:desafio_final/endereco.dart';
import 'package:desafio_final/socio.dart';

class Cliente {
  final id;
  final _cnpj;
  final dataCriacao;
  String razaoSocial;
  String? nomeFantasia;
  final _telefone;
  Endereco endereco;
  Socio socio;

  Cliente(this._cnpj, this._telefone, this.nomeFantasia,
      {required this.id,
      required this.dataCriacao,
      required this.razaoSocial,
      required this.endereco,
      required this.socio});

  String get cnpj {
    if (_cnpj.length == 14) {
      return "${_cnpj.substring(0, 2)}.${_cnpj.substring(2, 5)}.${_cnpj.substring(5, 8)}/${_cnpj.substring(8, 12)}-${_cnpj.substring(12, 14)}";
    } else {
      return "Documento inválido";
    }
  }

  String get telefone {
    if (_telefone.length == 11) {
      return "(${_telefone.substring(0, 2)}) ${_telefone.substring(2, 3)} ${_telefone.substring(3, 7)}-${_telefone.substring(7, 11)}";
    } else {
      return "Telefone inválido";
    }
  }

  bool comparaCNPJ(String documento) {
    if (documento == _cnpj) {
      return true;
    } else {
      return false;
    }
  }
}
