%%

%standalone
%line
%column
%class Scanner

kw_if = "if"
kw_else = "else"
kw_while = "while"
kw_for = "for"
kw_int = "int"
kw_float = "float"
kw_double = "double"
kw_char = "char"
kw_string = "string"
kw_String = "String"
kw_bool = "boolean"
kw_print = "print"
kw_cout = "cout"
kw_concat = "<<"
kw_program = "program"
kw_class = "class"
kw_void = "void"
kw_main = "main"
kw_new = "new"

letra = [A-Za-z]
digito = [0-9]
digitos = {digito}{digito}*
tipoVariavel = {kw_int}|{kw_float}|{kw_double}|{kw_char}|{kw_string}|{kw_bool}|{kw_String}
tipoCondicao = {kw_if}|{kw_while}
tipoMetodo = {kw_void}
tipoEstrutura = {kw_program}|{kw_class}|{kw_main}
tipoComando = {kw_print}|{kw_new}
relop = ("="|"=="|"!="|"<"|">"|"<="|">=")
strLiteral = \"([^\\\"]|\\.)*\"
palavrasReservadas = {tipoVariavel}|{tipoCondicao}|{tipoMetodo}|{tipoEstrutura}|{tipoComando}
declaracaoVariavel = {tipoVariavel}{espaco}*{ident}{espaco}*{relop}{espaco}*{strLiteral}?{espaco}*";"
declaracaoSimples = {tipoVariavel}{espaco}*{ident}{espaco}*";"
ident = {letra}({letra}|{digito})*
fracao =("\."{digitos})?
exponencial =("E"("+"|"-")?{digitos})?
numReal = ("-"?){digitos}{fracao}{exponencial}
letraHex = [A-Fa-f]
hexadecimal = "0x"({letraHex} | {digito})+
fimdeLinha = \r|\n|\r\n
branco = " "
espaco = ({fimdeLinha}|[ \t]|{branco})*

qualquerLetra = .
texto = {qualquerLetra}*
comentarioG = "/*"~"*/"
msgTela = {kw_cout}{espaco}{kw_concat}{espaco}{texto}

op_atributo = "="
leftpar = "("
rightpar = ")"
leftkey = "{"
rightkey = "}"
ponto = "."
virgula = ","
pontovirgula = ";"

simbolo = {op_atributo}|{leftpar}|{rightpar}|{leftkey}|{rightkey}|{ponto}|{virgula}|{pontovirgula}

%%

/*
{declaracaoVariavel} {System.out.println("<declaracaoVar: " + yytext() + ", linha:" + yyline + ", coluna:" + yycolumn + ">" ); }

{declaracaoSimples} {System.out.println("<declaracaoSimples: " + yytext() + ", linha:" + yyline + ", coluna:" + yycolumn + ">" ); }

{msgTela} {System.out.println("<msgTela: "+ yytext()+ ", linha:"+ yyline + ", coluna:"+ yycolumn +">" ); }

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

{relop} {System.out.println("<relop: " + yytext() + ", linha:" + yyline + ", coluna:" + yycolumn + ">" ); }

{ident} {System.out.println("<ident: " + yytext() + ", linha:" + yyline + ", coluna:" + yycolumn + ">" ); }
*/
{palavrasReservadas} {System.out.println("[" + yyline + "," + yycolumn + "]" + " palavra_reservada: " + yytext()); }

{simbolo} {System.out.println("[" + yyline + "," + yycolumn + "]" + " simbolo: " + yytext()); }

{ident} {System.out.println("[" + yyline + "," + yycolumn + "]" + " ident: " + yytext()); }

{numReal} {System.out.println("[" + yyline + "," + yycolumn + "]" + " num_real: " + yytext()); }

{hexadecimal} {System.out.println("[" + yyline + "," + yycolumn + "]" + " num_hexadecimal: " + yytext()); }

{comentarioG} {System.out.println("[" + yyline + "," + yycolumn + "]" + " comentario_grande: " + yytext()); }
