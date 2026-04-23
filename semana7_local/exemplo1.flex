import java_cup.runtime.Symbol;

%%

%class Scanner
%unicode
%cup
%line
%column
%public

%{
		public Scanner(java.io.InputStream in) {
				this(new java.io.InputStreamReader(in, java.nio.charset.Charset.forName("UTF-8")));
		}
%}

digito = [0-9]
letra = [a-zA-Z]
inteiro = 0 | [1-9][0-9]*

fimdeLinha = \r|\n|\r\n
espaco = {fimdeLinha} | [ \t\f]
opMais = "+"

%%

{inteiro} {
	double aux = Double.parseDouble(yytext());
	return new Symbol (sym.INTEIRO, new Double(aux));
}

/**
 * O do atributo sym.<nome> que usaremos aqui
 * é o nome que demos la no arquivo .cup
 */
{opMais} { return new Symbol(sym.MAIS);	}

"-" { return new Symbol(sym.MENOS);}
"/" { return new Symbol(sym.DIV);}
"*" { return new Symbol(sym.MULT);}
"%" { return new Symbol(sym.MOD);}
";" { return new Symbol(sym.PTVIRG);}

"(" { return new Symbol(sym.ABRE_PAREN); }
")" { return new Symbol(sym.FECHA_PAREN); }

{espaco} { /* despreza */ }

.|\\n {
  System.err.println("Caractere inválido '" + yytext() + "' na linha " + yyline + ":" + yycolumn);
  return new Symbol(sym.ERROR);  // ou sym.EOF, mas ERROR é melhor
}