/* File: {{_file_name_}}
 * Written by: {{_author_}}
 * Created on: {{_date_}}
 * Description: <++>
 */

package main

import (
	"log"
	"os"
)

func main() {
	if err := run(); err != nil {
		log.Println("Error!", err.Error())
		os.Exit(2)
	}
}

func run() error {
	// <++>
	return nil
}
