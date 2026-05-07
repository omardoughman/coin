#include <stdio.h>
#include "main.pb.h"
#include <jni.h>
#include <stdio.h>
#include "main.pb.h" // Your Nanopb data

int main() {
    printf("Coin Engine Initialized.\n");
    return 0;
}

// The name must match: Java_ClassName_MethodName
JNIEXPORT void JNICALL Java_main_runEngine(JNIEnv *env, jobject obj) {
    printf("C Engine: Java called the Native Engine successfully!\n");
    // You can now call functions in cntrl.c or process main.proto data here
}
