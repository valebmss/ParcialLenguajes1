# token.awk

# Expresión regular para "+" y "++"
/^\+\+?$/ {
    print "Token: " $0 " -> Match: PLUS"
}

# Expresión regular para números enteros
/^[0-9]+$/ {
    print "Token: " $0 " -> Match: INTEGER"
}

# Expresión regular para números decimales
/^[0-9]+\.[0-9]+$/ {
    print "Token: " $0 " -> Match: FLOAT"
}
