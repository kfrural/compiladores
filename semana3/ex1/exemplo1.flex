
%%

%standalone
%line
%column
%class Scanner

Ling1 = (aa|bb|(ab|ba)(bb|aa)*(ba|ab))*

%%

{Ling1} {System.out.println("<Lign1: " + yytext() +
      ", linha: " + yyline +
      ", coluna: " + yycolumn + ">>"); }