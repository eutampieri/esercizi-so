#define _THREAD_SAFE

#include <pthread.h>
#include <inttypes.h>
#include <stdio.h>

#define DEBUG
#include "DBGpthread.h"

#define GREEN "\x1B[32m"
#define PURPLE "\x1B[35m"
#define RESET "\x1B[0m"

const uint8_t M = 20;
const uint8_t N = 50;

uint8_t moduli = M;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cond_imp = PTHREAD_COND_INITIALIZER;
pthread_cond_t cond_stud = PTHREAD_COND_INITIALIZER;

void impiegata(void* _) {
    while(1) {
        DBGpthread_mutex_lock(&mutex, "lock impiegata");
        while (moduli > 0) {
            printf("%sImpiegata va a fare altro...%s\n",PURPLE, RESET);
            DBGpthread_cond_wait(&cond_imp, &mutex, "Impiegata aspetta");
        }
        if(moduli == 0) {
            moduli = M;
            printf("%sImpiegata porta nuovi moduli...%s\n", PURPLE, RESET);
            DBGpthread_cond_broadcast(&cond_stud, "impiegata sveglia studenti");
        }
        DBGpthread_mutex_unlock(&mutex, "impiegata unlock");
    }
}
void studente(void* num) {
    int stud_n = (intptr_t*)(num);
    while(1) {
        printf("%sParte studente %d...%s\n", GREEN, stud_n, RESET);
        pthread_mutex_lock(&mutex);
        while(moduli <= 0) {
            DBGpthread_cond_wait(&cond_stud, &mutex, "moduli finiti");
        }
        printf("%sStudente %d prende modulo... ci sono %d moduli adesso%s\n",GREEN, stud_n, moduli-1, RESET);
        moduli--;
        if(moduli == 0) {
            DBGpthread_cond_signal(&cond_imp, "segnalo mod finiti");
        }
        pthread_mutex_unlock(&mutex);
        pthread_exit(NULL);
    }
}

int main() {
    pthread_t tid;
    pthread_create(&tid, NULL, impiegata, NULL);
    intptr_t i;
    for(i = 0; i < N; i++) {
        pthread_create(&tid, NULL, studente, i);
    }
    pthread_exit(NULL);
}
