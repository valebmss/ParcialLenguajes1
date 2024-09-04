import org.antlr.v4.runtime.tree.ParseTreeWalker;

public class TrigonometryVisitor extends TrigonometryBaseListener {
    @Override
    public void enterExpression(TrigonometryParser.ExpressionContext ctx) {
        double value = Double.parseDouble(ctx.NUMBER().getText());
   /*      if (ctx.getText().startsWith("Sin")) {
            System.out.println(Math.sin(Math.toRadians(value)));
        } else if (ctx.getText().startsWith("Cos")) {
            System.out.println(Math.cos(Math.toRadians(value)));
        } else if (ctx.getText().startsWith("Tan")) {
            System.out.println(Math.tan(Math.toRadians(value)));
        }
    */

    }
}
