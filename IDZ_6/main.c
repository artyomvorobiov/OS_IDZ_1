#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>


typedef struct start {
    char *string;
    int length;
    int capacity;
} start ;
const int size = 5000;
void charEnd(start *s, char c) {
    if (s->length == s->capacity) {
        s->capacity += 2;
        s->string = realloc(s->string, s->capacity);
    }
    s->string[s->length] = c;
    s->length++;
}

start *newString(char *s) {
    start *string = malloc(sizeof(start));
    string->capacity = 1;
    string->length = 0;
    string->string = malloc(string->capacity);
    size_t char_length = strlen(s);
    for (size_t i = 0; i < char_length; ++i) {
        charEnd(string, s[i]);
    }
    return string;
}


start *change(start *s) {
    struct start *res;
    res = newString("");
    for (int i = 0; i < s->length; i++) {
        if (s->string[i] == 'a') {
            charEnd(res, '0');
            charEnd(res, 'x');
            charEnd(res, '6');
            charEnd(res, '1');
        } else if (s->string[i] == 'e') {
            charEnd(res, '0');
            charEnd(res, 'x');
            charEnd(res, '6');
            charEnd(res, '5');
        } else if (s->string[i] == 'i') {
            charEnd(res, '0');
            charEnd(res, 'x');
            charEnd(res, '6');
            charEnd(res, '9');
        } else if (s->string[i] == 'o') {
            charEnd(res, '0');
            charEnd(res, 'x');
            charEnd(res, '6');
            charEnd(res, 'f');
        } else if (s->string[i] == 'u') {
            charEnd(res, '0');
            charEnd(res, 'x');
            charEnd(res, '7');
            charEnd(res, '5');
        } else if (s->string[i] == 'y') {
            charEnd(res, '0');
            charEnd(res, 'x');
            charEnd(res, '7');
            charEnd(res, '9');
        } else if (s->string[i] == 'A') {
            charEnd(res, '0');
            charEnd(res, 'x');
            charEnd(res, '4');
            charEnd(res, '1');
        } else if (s->string[i] == 'E') {
            charEnd(res, '0');
            charEnd(res, 'x');
            charEnd(res, '4');
            charEnd(res, '5');
        } else if (s->string[i] == 'I') {
            charEnd(res, '0');
            charEnd(res, 'x');
            charEnd(res, '4');
            charEnd(res, '9');
        } else if (s->string[i] == 'O') {
            charEnd(res, '0');
            charEnd(res, 'x');
            charEnd(res, '4');
            charEnd(res, 'f');
        } else if (s->string[i] == 'U') {
            charEnd(res, '0');
            charEnd(res, 'x');
            charEnd(res, '5');
            charEnd(res, '5');
        } else if (s->string[i] == 'Y') {
            charEnd(res, '0');
            charEnd(res, 'x');
            charEnd(res, '5');
            charEnd(res, '9');
        } else {
            charEnd(res, s->string[i]);
        }
    }
    return res;
}

int firstProcess(int fd[], char *t, char buffer[]) {
    // Первый процесс
    if (close(fd[0] < 0)) {
        printf("Первый процесс не может считать\n");
        return 0;
    }

    int in = open(t, O_RDONLY);
    if (in < 0) {
        printf("Первый процесс не может считать %s", t);
        return 0;
    }
    size_t n;
    while ((n = read(in, buffer, size)) > 0) {
        if (write(fd[1], buffer, n) != n) {
            printf("Первый процесс не может записать все\n");
            return 0;
        }
    }

    if (close(fd[1]) < 0) {
        printf("Первый процесс не может записать\n");
        return 0;
    }

    if (close(in) < 0) {
        printf("Первый процесс не может закрыть %s\n", t);
        return 0;
    }
    return 1;
}


int secondProcessChild(int fd[], start **a) {
    // Продолжение второго процесса
    if (close(fd[0] < 0)) {
        printf("Второй подпроцесс не может считать\n");
        return 0;
    }

    if (write(fd[1], (*a)->string, (*a)->length) != (*a)->length) {
        printf("Второй подпроцесс не может записать все\n");
        return 0;
    }

    if (close(fd[1]) < 0) {
        printf("Второй подпроцесс не может записать\n");
        return 0;
    }
    // printf("Второй подпроцесс закончен\n");
    return 1;
}


int thirdProcess(int fd[], char *f, char buffer[]) {
    // Третий процесс
    if (close(fd[1]) < 0) {
        printf("Третий процесс не может закрыть\n");
        return 0;
    }

    int out = open(f, O_WRONLY | O_CREAT | O_TRUNC, 0666);
    if (out < 0) {
        printf("Третий процесс не может открыть файл %s для записи", f);
        return 0;
    }

    size_t n;
    while ((n = read(fd[0], buffer, size)) > 0) {
        if (write(out, buffer, n) != n) {
            printf("Третий процесс не может записать все\n");
            return 0;
        }
    }

    if (close(fd[0]) < 0) {
        printf("Третий процесс не может считать\n");
        return 0;
    }
    return 1;
}

int secondProcess(int fd[], start **f, char buffer[]) {
    // Второй процесс
    if (close(fd[1]) < 0) {
        printf("Второй процесс не может записать\n");
        return 0;
    }

    start *createNewString = newString("");

    size_t a;
    while ((a = read(fd[0], buffer, size)) > 0) {
        for (int i = 0; i < a; ++i) {
            charEnd(createNewString, buffer[i]);
        }
    }

    *f = change(createNewString);

    free(createNewString->string);
    free(createNewString);

    if (close(fd[0]) < 0) {
        printf("Второй процесс не может считать\n");
        return 0;
    }
    return 1;
}


int main(__attribute__((unused)) int argc, char *argv[]) {
    umask(0);

    char *t = argv[1];
    char *f = argv[2];
    int fd[2];
    int fd1[2];
    char buffer[size];
    pipe(fd);
    pipe(fd1);
    start *f2 = newString("");
    int result = fork();  // разделяем процесс
    if (result < 0) {
        printf("Не получилось разделить\n");
        exit(-1);
    } else if (result > 0) {  // Родитель
        if (!firstProcess(fd, t, buffer)) {
            exit(-1);
        }
        printf("Выходим из первого\n");
        if (!thirdProcess(fd1, f, buffer)) {
            exit(-1);
        }
        printf("Выходим из третьего\n");
    } else {  // Ребенок
        if (!secondProcess(fd, &f2, buffer)) {
            exit(-1);
        }
        printf("Выходим из второго\n");
        if (!secondProcessChild(fd1, &f2)) {
            exit(-1);
        }
        printf("Выходим из подвторого\n");
    }
    return 0;
}