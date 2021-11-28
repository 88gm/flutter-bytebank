import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final _controladorCampoNrConta = TextEditingController();
  final _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Criando transferência')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controladorCampoNrConta,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
                decoration: const InputDecoration(
                  labelText: 'Conta',
                  hintText: '0000',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controladorCampoValor,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
                decoration: const InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '0.00',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final int? numeroConta =
                int.tryParse(_controladorCampoNrConta.text);
                final double? valor =
                double.tryParse(_controladorCampoValor.text);

                if (numeroConta != null && valor != null) {
                  final transferenciaCriada = Transferencia(valor, numeroConta);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$transferenciaCriada'),
                      )
                  );
                }
              },
              child: const Text('Confirmar'),
            ),
          ],
        ));
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100, 123)),
          ItemTransferencia(Transferencia(350, 124)),
          ItemTransferencia(Transferencia(200, 125)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transf;

  ItemTransferencia(this._transf);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transf.valor.toString()),
        subtitle: Text(_transf.nrConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int nrConta;

  Transferencia(this.valor, this.nrConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, nrConta: $nrConta}';
  }
}
