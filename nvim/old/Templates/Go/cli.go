/* File: {{_file_name_}}
 * Written by: {{_author_}}
 * Created on: {{_date_}}
 * Description: <++>
 */

package main

import (
	"errors"
	"flag"
	"log"
	"os"
)

type config struct {
	foo string
}

func main() {
	c, parseErr := parse()
	if parseErr != nil {
		log.Println("Error!", parseErr.Error())
		os.Exit(1)
	}

	if err := run(c); err != nil {
		log.Println("Error!", err.Error())
		os.Exit(2)
	}
}

func parse() (config, error) {
	c := config{}

	flag.StringVar(&c.foo, "Foo", "default foo", "A foo to bar")

	flag.Parse()

	if c.foo == "" {
		return c, errors.New("Could not parse foo")
	}

	return c, nil
}

func run(c config) error {
	// <++>
	return nil
}
