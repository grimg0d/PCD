%{
        #include "y.tab.h"
%}

%%

[\n]            return 0;
.               ;

%%

int yywrap(void) {
        return 0;
}
