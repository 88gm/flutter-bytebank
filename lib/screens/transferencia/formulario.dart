import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoValor = "Valor";
const _dicaCampoValor = "0.00";

const _rotuloCampoNumeroConta = "Número da conta";
const _dicaCampoNumeroConta = "0000";

const _textoBotaoConfirmar = "Confirmar";


class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{
  final _controladorCampoNrConta = TextEditingController();
  final _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(_tituloAppBar)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                  controlador: _controladorCampoNrConta,
                  rotulo: _rotuloCampoNumeroConta,
                  dica: _dicaCampoNumeroConta,
                  icone: Icons.account_balance_outlined
              ),
              Editor(
                  controlador: _controladorCampoValor,
                  rotulo: _rotuloCampoValor,
                  dica: _dicaCampoValor,
                  icone: Icons.attach_money
              ),
              ElevatedButton(
                onPressed: () => _criaTransferencia(context),
                child: const Text(_textoBotaoConfirmar),
              ),
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta =
    int.tryParse(_controladorCampoNrConta.text);
    final double? valor =
    double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('Criando transferencia');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}