/*
 * C function definitions for assembly startup
 */


/*
 * Default exit handler, called after main returns, runs in endless loop
 */
__attribute__((noreturn, weak))
void __exit(void)
{
    while(1);
}

__attribute__((noreturn, weak))
void Default_Handler(void)
{
    while(1);
}
