/* File: {{_file_name_}}
 * Written by: {{_author_}}
 * Created on: {{_date_}}
 * Description: <++>
 */

#include "{{_header_name_}}"

// main
// {{{
int main() {
  FileResult *fr = getFile();
  if (fr->e != NULL) {
    printf("%s\n", fr->e->msg);
    return 1;
  }

  Error *e = run(fr->f);
  if (e != NULL) {
    printf("%s\n", e->msg);
    return 1;
  }
}
// }}}

// run
Error *run(FILE *ptr) {
  // <++>
  return NULL;
}
