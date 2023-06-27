package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
)

func main() {
	// et the command-line arguments
	args := os.Args[1:]
	if len(args) != 2 {
		fmt.Println("Usage: go run main.go <file_path> <search_string>")
		return
	}

	filePath := args[0]
	searchString := args[1]

	// Open the file
	file, err := os.Open(filePath)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	// Create a scanner to read the file line by line
	scanner := bufio.NewScanner(file)

	// Iterate over each line and search for the string
	lineNumber := 1
	found := false
	for scanner.Scan() {
		line := scanner.Text()
		if containsString(line, searchString) {
			fmt.Printf("Found '%s' in line %d: %s\n", searchString, lineNumber, line)
			found = true
		}
		lineNumber++
	}

	if !found {
		fmt.Printf("'%s' not found in the file.\n", searchString)
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}
}

// Helper function to check if a string contains another string
func containsString(line, searchString string) bool {
	return (len(line) >= len(searchString)) && (line[:len(searchString)] == searchString)
}