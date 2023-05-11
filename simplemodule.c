#include <linux/module.h>
#include <linux/sched.h>
#include <linux/init.h>

MODULE_AUTHOR("Amaury Quintero");
MODULE_DESCRIPTION("A very simple loadable module...");

static int number = 0;
static char* word = "mango";

module_param(number, int, S_IRUGO);
MODULE_PARM_DESC(number, "Sample integer parameter");

module_param(word, charp, S_IRUGO);
MODULE_PARM_DESC(word, "Sample string parameter");

int init_simple(void) {
    printk("hello from your simple kernel module\n");
    printk("number=%d, word=%s\n", number, word);
    // returning a negative value indicates an error
    return 0;
}

void cleanup_simple(void) {
    printk("goodbye from your simple kernel module\n");
    return;
}

module_init(init_simple);
module_exit(cleanup_simple);

MODULE_LICENSE("GPL");
