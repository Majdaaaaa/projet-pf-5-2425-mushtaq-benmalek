(*tester le format du programme vu que là on attend que 3 programme pour le moment *)
let format_prog s =
  match s with
  | "1" | "2" | "3"  -> true
  | _ -> false
;;

(* on teste le format des options *)
let format_option option =
  match option with
  | "-cr" -> (true,0)
  | "-bc" | "-fc" | "-rc" | "-pc" -> (true,1)
  | "-size" | "-abs" -> (true,2)
  | _ -> (false,-1)
;;

(* on teste si l'argument donné est un float *)
(* TODO : float of string renvoie un float si y'a un int dans le string grave ou paaaas ?????????? *)
let is_float arg =
  try
    Some (float_of_string arg)
  with 
  | Failure _ -> None
;;

(* option r,v,b et min max respectée*)
let format_option_arg arg b =
  if b then 
    match is_float arg with
  | Some _ -> true
  | None -> false
else 
  match arg with
  | "r" | "v" | "b" -> true
  | _ -> false
;;

let format_complet option args prog =
  if format_prog prog && fst(format_option option) && format_option_arg args true then Printf.printf "Le format est respecté pour option %s et pour prog %s \n" option prog
  else Printf.printf "Le format n'est pas respecté pour prog il faut choisir parmis 1 2 ou 3 là vous avez choisi pour option %s pour prog %s \n" option prog
;;

let rec format_l l =
  match l with
  | [] -> true
  | a::b::w ->
;;

(* let format_complet option args prog =
  let (b,i) = format_option option in
  if format_prog prog && b then
    match i with
    | 0 -> Printf.printf "Le format est respecté pour option %s et pour prog %s \n" option prog
    | -1 -> 
  else Printf.printf "Le format n'est pas respecté pour prog il faut choisir parmis 1 2 ou 3 là vous avez choisi pour option %s pour prog %s \n" option prog
;; *)