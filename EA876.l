%{
#include <stdio.h>

int feec, unicamp, email = 0;
%}


EMAIL [A-Za-z0-9]+"@"("."[a-zA-Z]+)*

UNICAMP {EMAIL}"unicamp.br"
FEEC {EMAIL}"fee.unicamp.br"

%%

{FEEC} {
	email++;
	unicamp++;
	feec++;

}

{UNICAMP} {
	email++;
	unicamp++;

}

{EMAIL} {
	email++;
	
}

[\n] {
	printf("%d %d %d\n", email, unicamp, feec);
}

. ;

%%

int main(){
  yylex();
  return 0;
}
