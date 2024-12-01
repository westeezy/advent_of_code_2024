open Utils

let create_lists_from_input input =
  List.fold_left
    (fun (acc1, acc2) line ->
      let parts = String.split_on_char ' ' line |> List.filter (fun x -> x <> "") in
      match parts with
      | [n1; n2] ->
          let n1 = int_of_string n1 in
          let n2 = int_of_string n2 in
          (n1 :: acc1, n2 :: acc2)
      | _ -> (acc1, acc2))
    ([], []) input

let total_distance list1 list2 =
  let sorted1 = List.sort compare list1 in
  let sorted2 = List.sort compare list2 in
  List.fold_left2 (fun acc x y -> acc + abs (x - y)) 0 sorted1 sorted2

let similarity_score left_list right_list =
  let count_occurrences lst x =
    List.fold_left (fun acc n -> if n = x then acc + 1 else acc) 0 lst
  in
  List.fold_left
    (fun acc x -> acc + (x * (count_occurrences right_list x))) 0 left_list

let () =
  let filename = "src/day01/input.txt" in
  let input = read_input filename in
  let left_list, right_list = create_lists_from_input input in

  (* Solve Part 1: Calculate total distance *)
  let distance = total_distance left_list right_list in
  Printf.printf "\nTotal distance (Part 1): %d\n" distance;

  (* Solve Part 2: Calculate similarity score *)
  let score = similarity_score left_list right_list in
  Printf.printf "Similarity score (Part 2): %d\n" score

