---------------------------------go-cli-----------------------------------------------


* To run the application, use the command go run main.go <file_path> <search_string>, where <file_path> is the path to the large file you want to search in, and <search_string> is the string you want to find in the file.

* For example, if you want to search for the string "example" in a file named large_file.txt, you would run the command:

   go run main.go large_file.txt example

* The application will read the file line by line and print out any lines that contain the search string, along with the line number. If the search string is not found, it will display a message indicating so.