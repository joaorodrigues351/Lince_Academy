void main(){
    programa('letras');

    programa('1234');
}

void programa(String valor) {
    try {
        int numero = int.parse(valor);
        print('Numero digitado: $numero');
    } catch(e) {
        print('Entrada invalida. Insira apenas numeros inteiros');
    }


}