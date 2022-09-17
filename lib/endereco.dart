class Endereco {
  String logradouro;
  int? numero;
  String bairro;
  String cidade;
  String estado;
  final _cep;

  Endereco(this._cep,
      {required this.logradouro,
      this.numero,
      required this.bairro,
      required this.cidade,
      required this.estado});

  String get cep {
    if (_cep.length == 8) {
      return "${_cep.substring(0, 2)}.${_cep.substring(2, 5)}-${_cep.substring(5, 8)}";
    } else {
      return "CEP inválido";
    }
  }
}
