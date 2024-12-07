(* tester le format du programme vu que là on attend que 3 programme pour le moment *)
(* let format_prog s = *)
  (* match s with
  | "1" | "2" | "3"  -> true
  | _ -> false
;; *) 

(* on teste le format des options *)
(* let format_option option =
  match option with
  | "-cr" -> (true,0)
  | "-bc" | "-fc" | "-rc" | "-pc" -> (true,1)
  | "-size" | "-abs" -> (true,2)
  | _ -> (false,-1)
;; *)

(* on teste le format des options *)
(* let format_option option =
  match option with
  | "-cr" -> true
  | "-bc" | "-fc" | "-rc" | "-pc" -> true
  | "-size" | "-abs" -> true
  | _ -> false
;; *)

(* on teste si l'argument donné est un float *)
(* TODO : float of string renvoie un float si y'a un int dans le string grave ou paaaas ?????????? *)
(* let is_float arg =
  try
    Some (float_of_string arg)
  with 
  | Failure _ -> None
;; *)

(* option r,v,b et min max respectée*)
(* let format_option_arg arg b =
  if b then 
    match is_float arg with
  | Some _ -> true
  | None -> false
else 
  match arg with
  | "r" | "v" | "b" -> true
  | _ -> false
;; *)

(* let format_complet option args prog =
  if format_prog prog && fst(format_option option) && format_option_arg args true then Printf.printf "Le format est respecté pour option %s et pour prog %s \n" option prog
  else Printf.printf "Le format n'est pas respecté pour prog il faut choisir parmis 1 2 ou 3 là vous avez choisi pour option %s pour prog %s \n" option prog
;; *)

(* let format_complet option args prog =
  if format_prog prog && format_option option && format_option_arg args true then Printf.printf "Le format est respecté pour option %s et pour prog %s \n" option prog
  else Printf.printf "Le format n'est pas respecté pour prog il faut choisir parmis 1 2 ou 3 là vous avez choisi pour option %s pour prog %s \n" option prog
;; *)

(* let rec format_l l =
  match l with
  | [] -> true
  | a::b::w ->
;; *)

(* let format_complet option args prog =
  let (b,i) = format_option option in
  if format_prog prog && b then
    match i with
    | 0 -> Printf.printf "Le format est respecté pour option %s et pour prog %s \n" option prog
    | -1 -> 
  else Printf.printf "Le format n'est pas respecté pour prog il faut choisir parmis 1 2 ou 3 là vous avez choisi pour option %s pour prog %s \n" option prog
;;
*)


(* let speclist = [
  ("-cr",Arg.Unit(fun () -> Printf.printf "Vous avez choisi cr\n"),"Affichage de points");
  ("-bc", Arg.Tuple (fun n1 n2 n3 -> Printf.printf "Vous avez choisi pour bc "^string_of_int n1^"et "string_of_int n2^" enfin "string_of_int n3),"couleur de l’arrière plan");
  ("-fc", Arg.Tuple (fun n1 n2 n3 -> Printf.printf "Vous avez choisi pour fc "^string_of_int n1^"et "string_of_int n2^" enfin "string_of_int n3),"couleur de l’avant plan");
  ("-rc", Arg.Tuple (fun n1 n2 n3 -> Printf.printf "Vous avez choisi pour rc "^string_of_int n1^"et "string_of_int n2^" enfin "string_of_int n3),"couleur du rectangle");
  ("-pc", Arg.Tuple (fun n1 n2 n3 -> Printf.printf "Vous avez choisi pour pc "^string_of_int n1^"et "string_of_int n2^" enfin "string_of_int n3),"couleur du point");
  ("-size", Arg.Tuple (fun n1 n2 -> Printf.printf "Vous avez choisi pour size "^string_of_int n1^"et "string_of_int n2),"la dimension de la fenêtre en pixels")
] *)


(* let speclist = [
  ("-cr", Arg.Unit (fun () -> Printf.printf "Vous avez choisi cr\n"), "Affichage de points");
  ("-bc", Arg.Tuple [
    Arg.Int (fun n1 -> Printf.printf "Couleur de l'arrière-plan: \nRouge : %d\n" n1);
    Arg.Int (fun n2 -> Printf.printf "Vert : %d\n" n2);
    Arg.Int (fun n3 -> Printf.printf "Bleu : %d\n" n3);
  ], "Couleur de l'arrière-plan");
] *)

open Graph

let tuple_color = Arg.Tuple [
  Arg.Int (fun r -> Printf.printf "Rouge : %d\n" r);
  Arg.Int (fun v -> Printf.printf "Vert : %d\n" v);
  Arg.Int (fun b -> Printf.printf "Bleu : %d\n" b);
]

let tuple_size = Arg.Tuple[
  Arg.Int (fun w -> Printf.printf "largeur = %d\n" w);
  Arg.Int(fun h ->Printf.printf "hauteur = %d\n" h)]

let tuple_abs = Arg.Tuple[
  Arg.Float (fun x_min -> Printf.printf "x_min = %f\n" x_min);
  Arg.Float (fun y_min -> Printf.printf "y_min = %f\n" y_min);
  Arg.Float (fun x_max -> Printf.printf "x_max = %f\n" x_max);
  Arg.Float (fun y_max -> Printf.printf "y_max = %f\n" y_max);
]

let speclist = [
  ("-abs",tuple_abs,"Affichage de rectangles et approximation initiale");
  (* ("-cr", Arg.Unit (fun () -> Printf.printf "Vous avez choisi cr\n"), "Affichage de points"); *)
  ("-cr", Arg.Unit (fun () -> graphe), "Affichage de points");
  ("-bc", tuple_color, "Couleur de l'arrière-plan");
  ("-fc", tuple_color, "Couleur de l’avant plan");
  ("-rc", tuple_color, "Couleur du rectangle");
  ("-pc", tuple_color, "Couleur du point");
  ("-size",tuple_size,"Dimension de la fenêtre en pixels avec W = largeur, H = hauteur");
  ("-1", Arg.Unit (fun () -> Printf.printf "Vous avez choisi le programme %d\n" 1),"programme à choisir")
]

let anon_fun arg = Printf.printf "Ce n'est un argument valide %s  \n" arg

let usage_msg = "inter ...  Option disponible :"