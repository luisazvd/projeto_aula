class CPF {
  late List<int> numerosCPF;
  CPF(String cpf) {
    if (cpf == '') throw Exception('CPF não pode ser vazio');
    cpf = cpf.replaceAll(RegExp(r'\D'), '');
    List<String> temp = cpf.split('');
    numerosCPF = cpf.split('').map((e) => int.parse(e)).toList();
  }

  bool eOnzeNumeros() {
    if (numerosCPF.length != 11) throw Exception('CPF deve possuir 11 números');
    return true;
  }

  bool eNumerosDiferentes() {
    var eDiferente = false;
    for (var i = 0; i < 9; i++) {
      if (numerosCPF[0] != numerosCPF[i]) {
        eDiferente = true;
        break;
      }
    }
    if (!eDiferente)
      throw Exception('CPF não pode ter todos os números iguais');
    return eDiferente;
  }

  bool eDigitosCorretos() {
    if (!eOnzeNumeros()) return false;
    if (!eNumerosDiferentes()) return false;

    int calcularDigitoVerificador(List<int> cpfParcial) {
      int soma = 0;
      int peso = cpfParcial.length + 1;

      for (int num in cpfParcial) {
        soma += num * peso;
        peso--;
      }

      int resto = soma % 11;
      return resto < 2 ? 0 : 11 - resto;
    }

    List<int> cpfParcial1 = numerosCPF.sublist(0, 9);
    int digito1 = calcularDigitoVerificador(cpfParcial1);

    List<int> cpfParcial2 = numerosCPF.sublist(0, 10);
    int digito2 = calcularDigitoVerificador(cpfParcial2);

    return digito1 == numerosCPF[9] && digito2 == numerosCPF[10];
  }

  // bool eUnico() {
  //   String cpfStr = numerosCPF.join('');
  //   if (cpfsExistentes.contains(cpfStr)) {
  //     return false; // CPF já existente
  //   } else {
  //     cpfsExistentes.add(cpfStr); // Adiciona CPF à lista de existentes
  //     return true; // CPF é único
  //   }
}

