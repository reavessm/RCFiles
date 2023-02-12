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

const (
	testAnswerOne = -2
	testAnswerTwo = -2
)

func main() {
	testInput, input, err := openInput()
	if err != nil {
		log.Println("Error!", err.Error())
		os.Exit(99)
	}

	testOutputOne := runPartOne(testInput)
	if testOutputOne == -1 {
		log.Println("Error! Invalid answer for test 1!")
		os.Exit(1)
	}
	if testOutputOne != testAnswerOne {
		log.Println("Error! Incorrect answer for test 1!")
		log.Println("\tGot:", testOutputOne)
		log.Println("\tExpected:", testAnswerOne)
		os.Exit(1)
	}

	outputOne := runPartOne(input)
	if outputOne == -1 {
		log.Println("Error! Invalid answer for part 1!")
		os.Exit(1)
	}
	log.Println("Part 1", outputOne)

	testOutputTwo := runPartTwo(testInput)
	if testOutputTwo == -1 {
		log.Println("Error! Invalid answer for test 2!")
		os.Exit(2)
	}
	if testOutputTwo != testAnswerTwo {
		log.Println("Error! Incorrect answer for test 2!")
		os.Exit(2)
	}

	outputTwo := runPartTwo(input)
	if outputTwo == -1 {
		log.Println("Error! Invalid answer for part 1!")
		os.Exit(1)
	}
	log.Println("Part 2", outputTwo)
}

func openInput() (string, string, error) {
	input, err := os.ReadFile("input.txt")
	if err != nil {
		return "", "", err
	}

	testInput, err := os.ReadFile("test_input.txt")
	if err != nil {
		return "", "", err
	}

	return string(testInput), string(input), nil
}

func runPartOne(s string) int {
	// <++>
	return -1
}

func runPartTwo(s string) int {
	// <++>
	return -1
}
