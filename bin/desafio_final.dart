import 'dart:io';
import 'package:desafio_final/cliente.dart';
import 'package:desafio_final/endereco.dart';
import 'package:desafio_final/socio.dart';
import 'package:uuid/uuid.dart';

void main() {
  List clientes = <Cliente>[];

  String retornarCliente(Cliente cliente) {
    String cadastro = "ID: ${cliente.id} \n"
        "CNPJ: ${cliente.cnpj} Data Cadastro: ${cliente.dataCriacao} \n"
        "Razão Social: ${cliente.razaoSocial} \n"
        "Nome Fantasia: ${cliente.nomeFantasia} \n"
        "Telefone: ${cliente.telefone} \n"
        "Endereço: ${cliente.endereco.logradouro}, ${cliente.endereco.numero}, ${cliente.endereco.bairro}, ${cliente.endereco.cidade}/${cliente.endereco.estado}, ${cliente.endereco.cep} \n"
        "Sócio: \n"
        "CPF: ${cliente.socio.documento} \n"
        "Nome Completo: ${cliente.socio.nome} \n"
        "Endereço: ${cliente.socio.endereco.logradouro}, ${cliente.socio.endereco.numero}, ${cliente.socio.endereco.bairro}, ${cliente.socio.endereco.cidade}/${cliente.socio.endereco.estado}, ${cliente.socio.endereco.cep} \n";
    return cadastro;
  }

  String buscarCliente(String documento) {
    String retorno = '';
    for (var i = 0; i < clientes.length; i++) {
      if (clientes[i].comparaCNPJ(documento)) {
        retorno = retornarCliente(clientes[i]);
      } else {
        retorno = 'CNPJ não localizado em cadastro!';
      }
    }
    return retorno;
  }

  void listarClientesAlfabetica(List clientes) {
    for (var i = 0; i < clientes.length - 1; i++) {
      for (var j = 0; j < clientes.length; j++) {
        if (clientes[i].razaoSocial.compareTo(clientes[j].razaoSocial) > 0) {
          Cliente temp = clientes[i];
          clientes[i] = clientes[j];
          clientes[j] = temp;
        }
      }
    }
    for (var i = 0; i < clientes.length; i++) {
      print(retornarCliente(clientes[i]));
    }
  }

  int opcao = 0;
  do {
    print('CADASTRO DE EMPRESAS');
    print('Excolha uma opção:');
    print('1 - CADASTRAR EMPRESA POR CNPJ');
    print('2 - BUSCAR EMPRESAS POR CNPJ');
    print('3 - BUSCAR EMPRESA POR CPF/CNPJ DO SÓCIO');
    print('4 - LISTAR EMPRESA EM ORDEM ALFABÉTICA (RAZÃO SOCIAL)');
    print('5 - EXCLUIR EMPRESA (POR ID)');
    print('6 - SAIR');
    opcao = int.parse(stdin.readLineSync()!);
    switch (opcao) {
      case 1:
        Cliente cliente = criarCliente();
        clientes.add(cliente);
        break;
      case 2:
        print('Digite o CNPJ para buscar:');
        String documento = stdin.readLineSync()!;
        print(buscarCliente(documento));
        break;
      case 3:
        print('buscando empresa pelo sócio');
        print(clientes);
        break;
      case 4:
        listarClientesAlfabetica(clientes);
        break;
      case 5:
        print('excluindo empresa');
        break;
      case 6:
        print('saindo');
        break;
      default:
        print('opção inválida!');
    }
  } while (opcao != 6);
}

Cliente criarCliente() {
  var uuid = Uuid();
  String id = uuid.v1();

  print('Digite o CNPJ:');

  var cnpj = stdin.readLineSync()!;
  while (cnpj.length != 14) {
    print('CNPJ inválido. Digite CNPJ:');
    var aux = stdin.readLineSync()!;
    cnpj = aux;
  }

  final dataCriacao = DateTime.now();

  print('Digite a razão social:');

  String razaoSocial = stdin.readLineSync()!;

  print('Digite o nome fantasia:');

  String nomeFantasia = stdin.readLineSync()!;

  print('Digite telefone:');

  var telefone = stdin.readLineSync()!;
  while (telefone.length != 11) {
    print('Telefone inválido. Digite telefone:');
    var aux = stdin.readLineSync()!;
    telefone = aux;
  }

  print('Digite endereço.');
  print('Logradouro:');
  String logradouro = stdin.readLineSync()!;
  print('Número:');
  int numero = int.parse(stdin.readLineSync()!);
  print('Bairro:');
  String bairro = stdin.readLineSync()!;
  print('Cidade:');
  String cidade = stdin.readLineSync()!;
  print('Estado:');
  String estado = stdin.readLineSync()!;
  print('CEP:');
  String cepAux = stdin.readLineSync()!;
  while (cepAux.length != 8) {
    print('CEP inválido. Digite CEP:');
    var aux = stdin.readLineSync()!;
    cepAux = aux;
  }
  String cep = cepAux;
  Endereco endereco = Endereco(cep,
      logradouro: logradouro,
      numero: numero,
      bairro: bairro,
      cidade: cidade,
      estado: estado);

  print('Digite documento do sócio:');

  String documento = stdin.readLineSync()!;
  while (documento.length != 11 && documento.length != 14) {
    print('CNPJ inválido. Digite CNPJ:');
    var aux = stdin.readLineSync()!;
    documento = aux;
  }

  print('Digite o nome do sócio:');

  String nome = stdin.readLineSync()!;

  print('Digite endereço.');
  print('Logradouro:');
  String logradouro2 = stdin.readLineSync()!;
  print('Número:');
  int numero2 = int.parse(stdin.readLineSync()!);
  print('Bairro:');
  String bairro2 = stdin.readLineSync()!;
  print('Cidade:');
  String cidade2 = stdin.readLineSync()!;
  print('Estado:');
  String estado2 = stdin.readLineSync()!;
  print('CEP:');
  String cep2 = stdin.readLineSync()!;
  while (cep2.length != 8) {
    print('CEP inválido. Digite CEP:');
    var aux = stdin.readLineSync()!;
    cep2 = aux;
  }
  Endereco enderecoSocio = Endereco(cep2,
      logradouro: logradouro2,
      numero: numero2,
      bairro: bairro2,
      cidade: cidade2,
      estado: estado2);

  Socio socio = Socio(documento, nome: nome, endereco: enderecoSocio);

  Cliente cliente = Cliente(cnpj, telefone, nomeFantasia,
      id: id,
      dataCriacao: dataCriacao,
      razaoSocial: razaoSocial,
      endereco: endereco,
      socio: socio);

  print('Cadastro de cliente $nomeFantasia criado!');
  print('Razão Social: $razaoSocial');
  print('CNPJ: $cnpj');
  print('id: $id');
  return cliente;
}
