import java_cup.runtime.Symbol;

%%
%cup

digito = [0-9]
inteiro = {digito}+
mais    = "+"
menos   = "-"
mult    = "*"    
div     = "/"    
resto   = "%"    
pot     = "^"    
ptv     = ";"

%%
{inteiro}    { return new Symbol(sym.INTEIRO, yyline, yycolumn, Integer.valueOf(yytext())); }
{mais}       { return new Symbol(sym.MAIS); }
{menos}      { return new Symbol(sym.MENOS); }
{mult}       { return new Symbol(sym.MULT); }    
{div}        { return new Symbol(sym.DIV); }     
{resto}      { return new Symbol(sym.RESTO); }   
{pot}        { return new Symbol(sym.POT); }     
{ptv}        { return new Symbol(sym.PTVIRG); }
[ \t\r]+     { /* IGNORA ESPAÇOS */ }
[\n\r]+      { /* IGNORA QUEBRAS DE LINHA */ }
.            { System.err.println("CARACTERE INVÁLIDO: " + yytext()); return null; }