#define __THREAD_SAFE

#include <pthread.h>
#include <inttypes.h>
#include <stdio.h>

const uint8_t M = 20;
const uint8_t N = 50;

uint8_t moduli = M;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t condvar = PTHREAD_COND_INITIALIZER;

void impiegata(void* _) {
    while(1) {
        pthread_mutex_lock(&mutex);
        printf("Impiegata va a fare altro...\n");
        pthread_cond_wait(&condvar, &mutex);
        if(moduli == 0) {
            moduli = M;
            printf("Impiegata porta nuovi moduli...\n");
        }
        pthread_cond_signal(&condvar);
        pthread_mutex_unlock(&mutex);
    }
}
void studente(void* num) {
    int stud_n = (intptr_t*)(num);
    while(1) {
        pthread_mutex_lock(&mutex);
        if(moduli > 0) {
            printf("Studente %d prende modulo... ci sono %d moduli adesso\n", stud_n, moduli);
            moduli--;
        }
        if(moduli == 0) {
            pthread_cond_signal(&condvar);
        }
        pthread_mutex_unlock(&mutex);
    }
}

int main() {
    pthread_t tid;
    pthread_create(&tid, NULL, impiegata, NULL);
    for(intptr_t i = 0; i < N; i++) {
        pthread_create(&tid, NULL, studente, i);
    }
    pthread_exit(NULL);
}
