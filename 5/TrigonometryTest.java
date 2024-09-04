import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

import java.io.FileInputStream;
import java.io.InputStream;

public class TrigonometryTest {
    public static void main(String[] args) throws Exception {
        // Leer el archivo de entrada
        InputStream is = new FileInputStream("expr.in");
        CharStream input = CharStreams.fromStream(is);

        // Crear el analizador léxico y el parser
        TrigonometryLexer lexer = new TrigonometryLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        TrigonometryParser parser = new TrigonometryParser(tokens);

        // Iniciar el análisis
        ParseTree tree = parser.parse();

        // Crear un visitor para evaluar las expresiones
        ParseTreeWalker walker = new ParseTreeWalker();
        TrigonometryVisitor visitor = new TrigonometryVisitor();
        walker.walk(visitor, tree);
    }
}
