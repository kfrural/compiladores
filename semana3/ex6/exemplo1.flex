
%%

%standalone
%line
%column
%class Scanner

letra = [A-Za-z]
digito = [0-9]
digitos = {digito}{digito}*
ident = {letra}({letra}|{digito})*
tipoVariavel = {kw_int}|{kw_float}|{kw_double}|{kw_char}|{kw_string}|{kw_bool}
declaracaoVariavel = {tipoVariavel}{espaco}{ident}";"
fracao =("\."{digitos})?
exponencial =("E"("+"|"-")?{digitos})?
numReal = ("-"?){digitos}{fracao}{exponencial}
fimdeLinha = \r|\n|\r\n
branco = " "
espaco = ({fimdeLinha}|[ \t]|{branco})*

kw_if = "if"
kw_else = "else"
kw_while = "while"
kw_for = "for"
kw_int = "int"
kw_float = "float"
kw_double = "double"
kw_char = "char"
kw_string = "string"
kw_bool = "boolean"
kw_print = "print"
kw_cout = "cout"
kw_concat = "<<"

qualquerLetra = .
texto = {qualquerLetra}*
msgTela = {kw_cout}{espaco}{kw_concat}{espaco}{texto}

%%

{declaracaoVariavel} {System.out.println("<declaracaoVar: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" ); }

{kw_if} {System.out.println("<if: " + yytext() + ", linha:" + yyline + ", coluna:" + yycolumn + ">" ); }

{kw_else} {System.out.println("<else: " + yytext() + ", linha: " + yyline + ", coluna: " + yycolumn + ">>"); }

{kw_while} {System.out.println("<while: " + yytext() + ", linha:" + yyline + ", coluna:" + yycolumn + ">" ); }

{kw_for} {System.out.println("<for: " + yytext() + ", linha: " + yyline + ", coluna: " + yycolumn + ">>"); }

{kw_int} {System.out.println("<int: " + yytext()+ ", linha:" + yyline + ", coluna:" + yycolumn + ">" ); }

{kw_float} {System.out.println("<float: " + yytext() + ", linha:" + yyline + ", coluna:" + yycolumn + ">" ); }

{kw_double} {System.out.println("<double: " + yytext() + ", linha:" + yyline + ", coluna:" + yycolumn + ">" ); }

{kw_char} {System.out.println("<char: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" ); }

{kw_string} {System.out.println("<string: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" ); }

{kw_bool} {System.out.println("<bool: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" ); }

{kw_print} {System.out.println("<print: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" ); }

{numReal} {System.out.println("<num: " + yytext() + ", linha:" + yyline + ", coluna:" + yycolumn + ">" ); }

{ident} {System.out.println("<ident: " + yytext() + ", linha:" + yyline + ", coluna:" + yycolumn + ">" ); }

{msgTela} {System.out.println("<msgTela: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" ); }