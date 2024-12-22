open Geo
open Liste
(* Code de la Section 4 du projet. *)

type instruction =
    Move of transformation
  | Repeat of int * program
  | Either of program * program 
and program = instruction list

let rec is_deterministic (prog : program) : bool =
  match prog with
  | [] -> true
  | a::w -> match a with
    | Move t -> is_deterministic w
    | Repeat (i,p) -> is_deterministic (p@w)
    | Either (p,q) -> false
;;
exception E
(* Réponse à l'exercice 4.1 *)
(* exception E
   let rec unfold_repeat (prog : program) : program =
   match prog with
   | [] -> []
   | a::w ->
     match a with
            | Move t -> Move t :: unfold_repeat w
            | Repeat (i,p) ->
              if i=0 then unfold_repeat w
                else p@unfold_repeat(Repeat (i-1,p)::w)

            | Either(p,q) -> raise E
   ;; *)

(* Réponse à l'exercice 4.4 *)
let rec unfold_repeat (prog : program) : program =
  match prog with
  | [] -> []
  | a::w ->
    match a with
    | Move t -> Move t :: unfold_repeat w
    | Repeat (i,p) ->
      if i=0 then unfold_repeat w
      else p@unfold_repeat(Repeat (i-1,p)::w)

    | Either(p,q) -> 
      unfold_repeat(p@q@w) 
;;

let run_det (prog : program) (p : point) : point list =
  let rec aux prog p =
    match prog with
    | [] -> []
    | a::w ->
      match a with
      | Move t -> let new_point = transform t p  in new_point:: aux w new_point
      | Repeat (i,pro) -> aux (unfold_repeat prog) p
      | Either (p,q) -> raise E
  in p::aux prog p
;;


let target_reached_det (prog : program) (p : point) (target : rectangle) : bool =
  let l=run_det prog p in
  in_rectangle target (last l)
;;

let run (prog : program) (p : point) : point list =
  let rec aux prog p =
    match prog with
    | [] -> []
    | a::w -> 
      match a with
      | Move t -> let new_point= transform t p in new_point::aux w new_point
      | Repeat(i,pro) -> aux (unfold_repeat prog) p
      | Either(pp,q) -> let b=Random.bool() in 
        if b then aux (pp@w) p
        else aux(q@w) p 
  in p::aux prog p
;;

let rec all_choices (prog : program) : program list =
  match prog with 
  | [] -> [[]]
  | ins :: r ->
    match ins with
    | Repeat (i, p) -> 
      let unfolded_prog = unfold_repeat [Repeat (i, p)] in
      all_choices (unfolded_prog @ r) (* ajoute des instruction a la liste des programme 
                                       * Donc quand les instruction arrivrant a la branche Move t 
                                       * Ils seront ajouté a chaque branche du programme *)
    | Either (p1, p2) -> 
      let choices_p1 = all_choices (p1 @ r) in
      let choices_p2 = all_choices (p2 @ r) in
      choices_p1 @ choices_p2
    | Move t -> List.map (fun p -> Move t :: p) (all_choices r) (* ajouter Move t a chaque branche du programme *)
;;

let  target_reached (prog : program) (p : point) (r : rectangle) : bool =
  let c_l = all_choices prog in 
  let rec aux c_l p r =
    match c_l with 
      [] -> false
    |[pr] -> let l = run pr p in 
      in_rectangle r (last l)
    |pr :: rest -> 
      aux [pr] p r && aux rest p r
  in aux c_l p r
;;