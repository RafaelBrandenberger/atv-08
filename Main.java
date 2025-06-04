import java.io.*;

public class Main {
  public static void main(String[] args) throws Exception {
    BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
    System.out.println("Digite expressões matemáticas (termine com ';') e pressione ENTER. Ctrl+C para sair.");
    System.out.println("Agora suporta +, -, *, /, %, ^"); // ADICIONADO: AVISO DOS NOVOS OPERADORES

    while (true) {
      System.out.print("> ");
      String linha = reader.readLine();
      if (linha == null || linha.trim().isEmpty()) continue;

      // Adiciona \n para garantir leitura correta:
      StringReader sr = new StringReader(linha + "\n");

      parser p = new parser(new Yylex(sr));
      try {
        p.parse();
      } catch (Exception e) {
        System.err.println("Erro na expressão: " + e.getMessage());
      }
    }
  }
}