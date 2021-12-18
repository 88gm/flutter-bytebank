class Transferencia {
  final double valor;
  final int nrConta;

  Transferencia(this.valor, this.nrConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, nrConta: $nrConta}';
  }
}