import 'package:crud/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Verificar geração de frase ao clicar no botão', (WidgetTester tester) async {
    // Carrega o widget na tela.
    await tester.pumpWidget(MaterialApp(home: Home()));

    // Verifica se o texto inicial está presente na tela.
    expect(find.text("Clique abaixo para gerar uma frase!"), findsOneWidget);

    // Salva o texto inicial para verificar depois.
    final textoInicial = "Clique abaixo para gerar uma frase!";

    // Clica no botão para gerar uma nova frase.
    await tester.tap(find.text("Nova Frase"));
    await tester.pump();  // Atualiza o widget após o evento de clique.

    // Verifica se o texto gerado é diferente do texto inicial.
    expect(find.text(textoInicial), findsNothing);
    expect(find.text("Nova Frase"), findsOneWidget); // Verifica se o botão ainda existe.
  });
}
