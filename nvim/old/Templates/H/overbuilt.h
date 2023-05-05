/* File: {{_file_name_}}
 * Written by: {{_author_}}
 * Created on: {{_date_}}
 * Description: <++>
 */

#ifndef {{_header_name_caps_}}_H
#define {{_header_name_caps_}}_H

#include <stdio.h>
#include <stdlib.h>

// Errors
// {{{
typedef struct {
  char *msg;
} Error;

Error *newError(char *message) {
  Error *e = (Error *)malloc(sizeof(Error));

  e->msg = message;

  return e;
}
/// }}}

// FileResults
// {{{
typedef struct {
  Error *e;
  FILE *f;
} FileResult;

FileResult *newFileResult(FILE *f, Error *e) {
  FileResult *fr = (FileResult *)malloc(sizeof(FileResult));

  fr->f = f;
  fr->e = e;

  return fr;
}
// }}}

// getFile
// {{{
FileResult *getFile() {
  char fileName[100];
  printf("Please input a file name\n");
  scanf("%s", fileName);

  FILE *ptr = fopen(fileName, "r");
  if (ptr == NULL) {
    return newFileResult(NULL, newError("No such file"));
  }
  return newFileResult(ptr, NULL);
}
// }}}

/// Run method
Error *run(FILE *ptr);

#endif
