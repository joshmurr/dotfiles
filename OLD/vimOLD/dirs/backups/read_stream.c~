#include <stdio.h>

int main(int argc, char *argv[]){
    if(argc != 2){
        fprintf(stderr, "Usage view_bytes FILE.ext\n");
        return 1;
    }

    char *infile = argv[1];

    // "rb" when opening non-text files
    FILE *inputFile = fopen(infile, "rb");
    if (inputFile == NULL){
        fprintf(stderr, "Could not open %s.\n", infile);
        return 1;
    }

    int c;

    while (c != EOF){
        c = getc(inputFile);
        // if((c >= 0 && c <= 31)|| c > 127) printf("%c\n", 46);
        printf("%d\n",c);
    }

    fclose(inputFile);


    return 0;
}
