import 'dart:convert';

// Agregação e Composição

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  // método para serializar em JSON
  Map<String, dynamic> toJson() => {'nome': _nome};
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  // método para serializar em JSON
  Map<String, dynamic> toJson() => {
    'nome': _nome,
    'dependentes': _dependentes.map((d) => d.toJson()).toList(),
  };
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  // método para serializar em JSON
  Map<String, dynamic> toJson() => {
    'nomeProjeto': _nomeProjeto,
    'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
  };
}

void main() {
  // 1. Criar varios objetos Dependentes
  var depA1 = Dependente('Ana');
  var depA2 = Dependente('Bruno');

  var depB1 = Dependente('Carla');

  var depC1 = Dependente('Diego');
  var depC2 = Dependente('Eduarda');
  var depC3 = Dependente('Fábio');

  // 2. Criar varios objetos Funcionario
  // 3. Associar os Dependentes criados aos respectivos funcionarios
  var func1 = Funcionario('Alice', [depA1, depA2]);
  var func2 = Funcionario('Bernardo', [depB1]);
  var func3 = Funcionario('Clara', [depC1, depC2, depC3]);

  // 4. Criar uma lista de Funcionarios
  var listaFuncionarios = [func1, func2, func3];

  // 5. criar um objeto Equipe Projeto chamando o metodo contrutor que da nome ao projeto e insere uma coleção de funcionario
  var equipe = EquipeProjeto('Projeto Dart - Atividade-02', listaFuncionarios);

  // 6. Printar no formato JSON o objeto Equipe Projeto.
  var encoder = JsonEncoder.withIndent('  ');
  print(encoder.convert(equipe.toJson()));
}
