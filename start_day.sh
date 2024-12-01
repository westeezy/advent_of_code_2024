
#!/bin/bash

# Check if the script is being run from the root of the project
if [ ! -f dune-project ]; then
  echo "Please run this script from the root of your Advent of Code project."
  exit 1
fi

# Ensure that the session cookie is provided
if [ -z "$AOC_SESSION" ]; then
  echo "You need to set your Advent of Code session cookie as the AOC_SESSION environment variable."
  exit 1
fi

# Ask for the day number
read -p "Enter the day number (1-25): " day

# Validate that the day number is between 1 and 25
if [[ ! "$day" =~ ^[0-9]+$ ]] || [ "$day" -lt 1 ] || [ "$day" -gt 25 ]; then
  echo "Invalid day number. Please enter a number between 1 and 25."
  exit 1
fi

# Format the day number as dayXX (e.g., 01, 02, etc.) for question URL
formatted_day=$(printf "%02d" $day)

# Create the directory for the day
mkdir -p "src/day$formatted_day"

# Create the dune file in the day directory
cat > "src/day$formatted_day/dune" <<EOL
(executable
 (name day$formatted_day)
 (public_name day$formatted_day)
 (libraries utils))
EOL

# Create an empty OCaml file for the day's solution
touch "src/day$formatted_day/day$formatted_day.ml"

# Download the question and input files using curl
echo "Downloading question and input for Day $formatted_day..."

# Fetch the question (uses dayXX format)
# curl -k -s -b "session=$AOC_SESSION" "https://adventofcode.com/2024/day/$day" -o "src/day$formatted_day/question.txt"

# Fetch the input (uses dayX format for days 1-9)
curl -k -s -b "session=$AOC_SESSION" "https://adventofcode.com/2024/day/$day/input" -o "src/day$formatted_day/input.txt"

echo "Created day$formatted_day, downloaded question and input."
echo "Done with Day $formatted_day!"

