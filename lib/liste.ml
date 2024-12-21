let rec last l =
  match l with
  | [] -> failwith "La liste est vide.\n"
  | [a] -> a
  | _::w -> last w
;;

let rec list_nth l k = 
  match l with 
  |[] -> failwith "liste vide"
  |[a] -> if k==0 then a else failwith "existe pas"
  |a::w -> if k==0 then a else list_nth w (k-1)
;;

let rec list_length l = 
match l with 
|[] -> 0
|_::w -> 1 + list_length w
;;