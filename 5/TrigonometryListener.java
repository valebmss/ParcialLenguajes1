// Generated from Trigonometry.g4 by ANTLR 4.13.0
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link TrigonometryParser}.
 */
public interface TrigonometryListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link TrigonometryParser#parse}.
	 * @param ctx the parse tree
	 */
	void enterParse(TrigonometryParser.ParseContext ctx);
	/**
	 * Exit a parse tree produced by {@link TrigonometryParser#parse}.
	 * @param ctx the parse tree
	 */
	void exitParse(TrigonometryParser.ParseContext ctx);
	/**
	 * Enter a parse tree produced by {@link TrigonometryParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(TrigonometryParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link TrigonometryParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(TrigonometryParser.ExpressionContext ctx);
}