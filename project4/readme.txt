计算器代码构成说明：

myflex.c 人工实现的词法分析器C语言源代码
myflex.h myflex.c对应的头文件
calculator.l 借助flex工具实现的词法分析器脚本源代码
calculator_lex.c 借助flex工具实现的词法分析器自动生成C语言源文件
calculator_lex.h 借助flex工具实现的词法分析器自动生成C语言头文件

calculator.y 借助yacc/bison工具实现的语法分析器脚本源代码
calculator_yacc.c 借助yacc/bison工具实现的语法分析器自动生成C语言源文件
calculator_yacc.h 借助yacc/bison工具实现的语法分析器自动生成C语言头文件

expr.c 有关表达式操作的C语言源文件
expr.h expr.c对应的头文件

main.c 计算器程序的主函数
test.txt 测试用例代码

## 计算器使用方法：
./calculator 
./calculator test.txt
./calculator_self
./calculator_self test.txt

## flex或bison的使用方法

# Windows版的flex和bison，给Visual Studio用
win_flex -o calculator_lex.c --wincompat calculator.l
win_bison -o calculator.c calculator.y

#MinGW、Linux or Mac
flex -o calculator_lex.c --header-file=calculator_lex.h calculator.l
bison -o calculator_yacc.c -d calculator.y
