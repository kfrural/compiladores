
%%

%standalone
%line
%column
%class Scanner

Exp1 = (b|(ab*a))*

Exp2 = ab{2}a

%%

{Exp1} {System.out.println("Deu bom: " + yytext()); }

{Exp2} {System.out.println("Deu bom: " + yytext()); }

.*\r\n { System.out.println("Deu ruim: " + yytext()); }