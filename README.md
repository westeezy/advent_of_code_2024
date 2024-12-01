# Advent of Code 2024 - OCaml Solutions

This project contains my solutions to the Advent of Code 2024 challenges, implemented in **OCaml**. Each day of the challenge has its own folder with a solution in the form of an executable.

## Quick Start

```bash
./create_day.sh
dune fmt
dune build src/day01/day01.exe
dune exec src/day01/day01.exe
```

## Prerequisites

To run this project, you'll need the following tools installed on your machine:

1. **OCaml** - Programming language for solving the problems.
2. **Dune** - Build system and project management tool for OCaml.
3. **opam** - OCaml package manager (to install dependencies).

### Installing Dependencies

1. **Install opam**

   ```bash
   brew install opam
   ```

1. **Install OCaml**

   ```bash
   opam install ocaml
   ```

1. **Install Dune**

   ```bash
   opam install dune
   ```

1. **Install OCamlFormat**

   ```bash
   opam install ocamlformat
   ```

1. Install the project dependencies:

   ```bash
   opam switch create . 4.14.0
   eval $(opam env)
   ```

## Project Structure

```
advent_of_code_2024/
├── dune-project              # Dune project configuration file
├── src/                      # Folder containing solutions for each day
│   ├── day01/                # Day 01 folder
│   │   ├── day01.ml          # OCaml solution for Day 01
│   │   └── dune              # Dune configuration for Day 01
│   ├── day02/                # Day 02 folder
│   │   ├── day02.ml          # OCaml solution for Day 02
│   │   └── dune              # Dune configuration for Day 02
│   └── dune                  # Dune configuration for the whole project
└── _build/                   # Build folder (auto-generated)
```

## Preparing Solutions

### Adding a New Day

To add a new day’s solution:

1. Run the provided bash script create_day.sh to automate the creation of a new day’s folder, including downloading the day’s input and question from Advent of Code.

   ```bash
   export AOC_SESSION="<session cookie value>"
   ./create_day.sh
   ```

1. After running the script, write your OCaml solution in the newly created `dayXX.ml` file.

### Formatting

```bash
dune fmt
```

### Building a Single Day

```bash
dune build src/day01/day01.exe
```

### Running a Single Day

```bash
dune exec src/day01/day01.exe
```

## Utilities

The Utils module provides shared functions for reading and processing input files.

### Example: `Utils.read_input`

This function reads the file and returns a list of strings, with each string representing a line from the file.

```ocaml
let input = Utils.read_input "src/day01/input.txt"
```

### Example: `Utils.create_lists_from_input`

You can also use the create_lists_from_input function, which processes the lines of the input file into two lists of integers:

```ocaml
let left_list, right_list = Utils.create_lists_from_input input
```
