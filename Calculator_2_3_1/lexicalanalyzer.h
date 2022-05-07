#ifndef MYCALC_2_LEXICALANALYZER_H
#define MYCALC_2_LEXICALANALYZER_H
//为了确保扫描的字符是一个完整的数 定义一个枚举类型来表示当前扫描
//到字符的状态
typedef enum {
    //没有任何值的时候是初始状态
    INITIAL_STATUS,
    //遇到0-9整数的时候是整数状态
    IN_INT_PART_STATUS,
    //遇到小数点的时候是DOT状态
    DOT_STATUS,
    //在小数状态之后，如果再遇到整数则进入浮点数状态
    IN_FRAC_PART_STATUS
} LexerStatus;


void parse_line(char *buf);
#endif //MYCALC_2_LEXICALANALYZER_H
