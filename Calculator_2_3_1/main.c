#include <stdio.h>
#include "token.h"
#include "lexicalanalyzer.h"
#include "parser.h"
int main() {
    // lexicalanalyzer调试代码  注释下面的代码，打开这段
    /*char buf[LINE_BUF_SIZE];
    while (fgets(buf, LINE_BUF_SIZE, stdin) != NULL) {
        parse_line(buf);
    }*/

    char line[LINE_BUF_SIZE];
    double value;

    fgets(line, LINE_BUF_SIZE, stdin);
    set_line(line);
    value = pParse_line();
    if(flag >=1)
        printf(">>%f\n", value);
    else
        printf(">>%d\n", (int)(value));
    return 0;
}
