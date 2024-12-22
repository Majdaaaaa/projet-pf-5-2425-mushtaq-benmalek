(**[last] retourne le dernier élément d'une liste 
   @param l la liste dont on veut retourner le dernier élément
   @return le dernier élément si la liste est vide la fonction ne retourne rien
*)
let rec last l =
  match l with
  | [] -> failwith "La liste est vide.\n"
  | [a] -> a
  | _::w -> last w
;;

(**[list_nth] retourne le k-ème élément d'une liste 
   @param l la liste dont on veut retourner le k-ème élément
   @return le k-ème élément si la liste est vide la fonction ne retourne rien
*)
let rec list_nth l k = 
  match l with 
  |[] -> failwith "liste vide"
  |[a] -> if k==0 then a else failwith "existe pas"
  |a::w -> if k==0 then a else list_nth w (k-1)
;;

(**[list_length] retourne la taille d'une liste 
   @param l la liste dont on veut conntaître la taille
   @return la taille de la liste
*)
let rec list_length l = 
match l with 
|[] -> 0
|_::w -> 1 + list_length w
;;