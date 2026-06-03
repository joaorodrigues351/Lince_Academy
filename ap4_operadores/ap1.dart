void main(){

  final anos = [2016, 1988, 2000, 2100, 2300, 1993];
  
  for (var ano in anos){
    print(ehAnoBissexto(ano)
    ? 'O ano $ano eh bissexto' : 'O ano $ano nao eh bissexto');
    }
  }
  bool ehAnoBissexto(int ano) {
    if (ano % 100 == 0){
      return(ano % 400) == 0;
    } else {
      return(ano % 4) == 0;
    }
  }
