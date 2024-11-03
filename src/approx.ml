open Geo
open Interp

(* Code de la Section 5 du projet. *)

(* Code de la Section 5 du projet. *)
(* c'est des float donc si je rajoute 1 c troooop grand donc j'ajoute un petit nbr pr être sûre que max est inclus *)
let sample (rect : rectangle) : point =
  let x= Random.float (rect.x_max-.rect.x_min+.0.00001) in
  let y= Random.float (rect.y_max-.rect.y_min+.0.00001) in 
  let p={x=x+.rect.x_min;y=y+.rect.y_min} in p
  
let rec aux_translate_corners ( l : point list) (t : transformation) : point list =
  match l with
  | [] -> []
  | a::w -> transform t a :: aux_translate_corners w t
;;

  let transform_rect (t : transformation) (r : rectangle) : rectangle =
    let corners_r = corners r in
    let list_new_corners = aux_translate_corners corners_r t in
    match t with
    | Translate _ ->
      let point_min = List.nth list_new_corners 0 in
      let point_max = List.nth list_new_corners 3 in
      let new_r = {x_min=point_min.x;x_max=point_max.x;y_min=point_min.y;y_max=point_max.y}; 
    in new_r
    | Rotate _ -> rectangle_of_list list_new_corners
;;

let  run_rect (prog : program) (r : rectangle) : rectangle list =
  let rec aux prog r =
  match prog with
  | [] -> []
  | a::w -> match a with
            | Move t -> let new_rect = transform_rect t r in
                        new_rect::aux w new_rect
            | Repeat _ -> let new_prog = unfold_repeat prog in
                          aux new_prog r
            | Either (p,q) -> 
              let b=Random.bool() in
              if b then aux (p@w) r
              else aux (q@w) r
            in r::aux prog r
;;


let inclusion (r : rectangle) (t : rectangle) : bool =
  (t.x_min <= r.x_min && r.x_max <= t.x_max) && (t.y_min <= r.y_min && r.y_max <= t.y_max)
;;

let target_reached_rect (prog : program) (r : rectangle) (target : rectangle) : bool =
  let c_l = all_choices prog in 
  let rec aux c_l r target =
    match c_l with 
    [] -> false
    |[pr] -> let l = run_rect pr r in 
      inclusion (List.nth l ((List.length l )-1)) target
    |pr :: rest -> let l = run_rect pr r in 
      inclusion (List.nth l ((List.length l )-1)) target && aux rest r target
  in aux c_l r target
;;

let run_polymorphe (transform : transformation -> 'a -> 'a) (prog : program) (i : 'a) : 'a list =
  let rec aux prog i =
    match prog with
    | [] -> []
    | pr :: rest -> match pr with 
      | Move t ->
        let new_state = transform t i in
          new_state :: aux rest new_state
      | Repeat (n, sub_prog)  ->
        let unfolded_prog = unfold_repeat [Repeat (n, sub_prog)] in
          aux (unfolded_prog @ rest) i
    | Either (p1, p2)  ->
        let chosen_prog = if Random.bool() then p1 else p2 in
          aux (chosen_prog @ rest) i 
    in i :: aux prog i 
;;

let rec over_approximate (prog : program) (r : rectangle) : rectangle =
  failwith "À compléter"

let feasible_target_reached (prog : program) (r : rectangle) (target : rectangle) : bool =
  failwith "À compléter"
