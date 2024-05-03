/*
 * C function definitions for assembly startup
 */

__attribute__((noreturn, weak))
void __exit(void)
{
    while(1);
}
