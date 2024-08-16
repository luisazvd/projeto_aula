import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_aula/domain/cpf.dart';

void main() {
  group('Entidade CPF', () {
    group('Teste de CPF vazio', () {
      test('cpf correto', () {
        expect(() => CPF('385.828.160-30'), returnsNormally);
      });
      test('cpf vazio', () {
        expect(() => CPF(''), returnsNormally);
      });
    });
  });

  group('Números diferentes no CPF', () {
    test('eNumerosDiferentes() deve retornar true para CPF com números diferentes', () {
      final cpf = CPF('123.456.789-09');
      cpf.eOnzeNumeros(); 
      expect(cpf.eNumerosDiferentes(), isTrue);
    });

    test('eNumerosDiferentes() deve lançar exceção para CPF com todos os números iguais', () {
      expect(() => CPF('111.111.111-11').eNumerosDiferentes(), throwsA(isA<Exception>()));
    });
  });

  group('Teste de digitos corretos', () {
    test(
        'eDigitosCorretos() deve retornar true para CPF com dígitos verificadores corretos',
        () {
      final cpf = CPF('121.898.979-39');
      cpf.eOnzeNumeros();
      cpf.eNumerosDiferentes();
      expect(cpf.eDigitosCorretos(), isTrue);
    });

    test(
        'eDigitosCorretos() deve retornar false para CPF com dígitos verificadores incorretos',
        () {
      final cpf = CPF('123.456.789-00');
      cpf.eOnzeNumeros();
      cpf.eNumerosDiferentes();
      expect(cpf.eDigitosCorretos(), isFalse);
    });
  });
}
