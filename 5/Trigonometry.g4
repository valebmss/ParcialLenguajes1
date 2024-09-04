grammar Trigonometry;

parse
    : expression+ EOF
    ;

expression
    : 'Sin' '(' NUMBER ')'  { System.out.println(Math.sin(Math.toRadians(Double.parseDouble($NUMBER.text)))); }
    | 'Cos' '(' NUMBER ')'  { System.out.println(Math.cos(Math.toRadians(Double.parseDouble($NUMBER.text)))); }
    | 'Tan' '(' NUMBER ')'  { System.out.println(Math.tan(Math.toRadians(Double.parseDouble($NUMBER.text)))); }
    ;

NUMBER
    : [0-9]+ ('.' [0-9]+)?
    ;

WS
    : [ \t\n\r]+ -> skip
    ;
