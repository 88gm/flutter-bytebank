import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: ListaTransferencia(),
          appBar: AppBar(
            title: Text('Transferências'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ),
      ),
    );

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemTransferencia(Transferencia(100, DateTime.parse('2021-10-20'))),
        ItemTransferencia(Transferencia(300, DateTime.parse('2021-03-20'))),
        ItemTransferencia(Transferencia(200, DateTime.parse('2021-05-20'))),
      ],
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
        leading: Icon(Icons.monetization_on),
        title: Text(_transf.valor.toString()),
        subtitle: Text(_transf.dataTransferencia.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final DateTime dataTransferencia;

  Transferencia(this.valor, this.dataTransferencia);
}
