# OS_IDZ_1
В каждой папке на каждую оценку содержится отчет в пдф, код программы в main.c, а также 5 файлов input.txt и соотвествующие им файлы output.txt с ответами.
Программы были собраны с помощью  
gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none main.c  
gcc main.s -o main  
./main input.txt output.txt  
Но можно было и без   
gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none main.c  
