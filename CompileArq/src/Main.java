import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.RandomAccess;

import jdk.jfr.Experimental;

class Main {    

    public static boolean isAttr(String codeLine) {
        return (codeLine.charAt(1) == '=' ? true : false);
    }

    public static boolean convertToHex(List<String> codeLines) throws Exception {
        RandomAccessFile result = new RandomAccessFile("./data/result.db", "rw");
        // Variaveis
        String X = "";
        String Y = "";
        
        for(String codeLine : codeLines) {
            // Verificar se é uma atribuição
            boolean isAttr = isAttr(codeLine);
            if(isAttr) {
                char operand = codeLine.charAt(0);
                char value = codeLine.charAt(2);
                switch(operand) {
                    case 'X':
                        X = value + "";
                        break;
                    case 'Y':
                        Y = value + "";
                        break;
                    default:
                        break;
                }
            } else {
                String lineReplaced = codeLine.replace(";", "");
                String expression = X + Y;
                if(lineReplaced.equals(Mnemonico.A.getMnemonico())) {
                    expression += Mnemonico.A.getCodHex();
                } else if(lineReplaced.equals(Mnemonico.AB.getMnemonico())) {
                    expression += Mnemonico.AB.getCodHex();

                } else if(lineReplaced.equals(Mnemonico.A_AND_NOT_B.getMnemonico())) {
                    expression += Mnemonico.A_AND_NOT_B.getCodHex();

                } else if(lineReplaced.equals(Mnemonico.A_NOT_OR_B.getMnemonico())) {
                    expression += Mnemonico.A_NOT_OR_B.getCodHex();

                } else if(lineReplaced.equals(Mnemonico.A_OR_B.getMnemonico())) {
                    expression += Mnemonico.A_OR_B.getCodHex();

                } else if(lineReplaced.equals(Mnemonico.A_OR_B_NOT.getMnemonico())) {
                    expression += Mnemonico.A_OR_B_NOT.getCodHex();

                } else if(lineReplaced.equals(Mnemonico.B.getMnemonico())) {
                    expression += Mnemonico.B.getCodHex();

                } else if(lineReplaced.equals(Mnemonico.NOT_A.getMnemonico())) {
                    expression += Mnemonico.NOT_A.getCodHex();

                } else if(lineReplaced.equals(Mnemonico.NOT_A_AND_B.getMnemonico())) {
                    expression += Mnemonico.NOT_A_AND_B.getCodHex();

                } else if(lineReplaced.equals(Mnemonico.NOT_A_B.getMnemonico())) {
                    expression += Mnemonico.NOT_A_B.getCodHex();

                } else if(lineReplaced.equals(Mnemonico.NOT_A_OR_B.getMnemonico())) {
                    expression += Mnemonico.NOT_A_OR_B.getCodHex();

                } else if(lineReplaced.equals(Mnemonico.NOT_A_XOR_B.getMnemonico())) {
                    expression += Mnemonico.NOT_A_XOR_B.getCodHex();

                } else if(lineReplaced.equals(Mnemonico.NOT_B.getMnemonico())) {
                    expression += Mnemonico.NOT_B.getCodHex();

                } else if(lineReplaced.equals(Mnemonico.UM_LOGICO.getMnemonico())) {
                    expression += Mnemonico.UM_LOGICO.getCodHex();

                } else if(lineReplaced.equals(Mnemonico.XOR_A_B.getMnemonico())) {
                    expression += Mnemonico.XOR_A_B.getCodHex();

                } else if(lineReplaced.equals(Mnemonico.ZERO_LOGICO.getMnemonico())) {
                    expression += Mnemonico.ZERO_LOGICO.getCodHex();

                }
                
                expression += "\n"; 
                result.write(expression.getBytes());
                result.seek(result.length());
                
            }

        }

        return false;
    }

    public static void main(String[] args) throws Exception {
        try {
            BufferedReader br = new BufferedReader(new FileReader("./data/ula.db"));
        
            List<String> lines = new ArrayList<String>();

            String line = "";
            line = br.readLine();
            if(line.equals("inicio:")) {
                while((line = br.readLine()).compareTo("fim.") != 0) {
                    lines.add(line);
                }
            }   
            br.close();

            boolean error = convertToHex(lines);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
} 