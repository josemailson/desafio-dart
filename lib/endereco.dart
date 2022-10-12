//Criação da classe Endereco

class Endereco {
  //ATRIBUTOS
  final String logradouro;
  final int? numero;
  final String bairro;
  final String cidade;
  final String estado;
  final _cep;

  //CONSTRUTOR
  Endereco(this._cep,
      {required this.logradouro,
      this.numero,
      required this.bairro,
      required this.cidade,
      required this.estado});

  //MODIFICADOR DO CEP PARA A FORMA 00.000-000
  String get cep {
    if (_cep.length == 8) {
      return "${_cep.substring(0, 2)}.${_cep.substring(2, 5)}-${_cep.substring(5, 8)}";
    } else {
      return "CEP inválido";
    }
  }
}
