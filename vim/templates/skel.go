/**
 * File: @FILENAME@
 * Written by:  Stephen M. Reaves
 * Created on:  @DATE@
 * Description: <++>
 */

package @BASENAME@

import (
  "log"
)

func main() {
	// Optionally parse flags here

	if err := run(); err != nil {
		log.Fatalln(err)
	}
}

func run() error {
	return nil
}
