open Geo

(* Code de la Section 4 du projet. *)

type instruction =
  Move of transformation
| Repeat of int * program
| Either of program * program 
and program = instruction list

let is_deterministic (prog : program) : bool =
  failwith "À compléter"

let unfold_repeat (prog : program) : program =
  failwith "À compléter"

let run_det (prog : program) (p : point) : point list =
  failwith "À compléter"

let target_reached_det (prog : program) (p : point) (target : rectangle) : bool =
  failwith "À compléter"
  
let rec run (prog : program) (p : point) : point list =
  match prog with 
  [] -> [p]
  |ins :: r ->
    match ins with 
    Move t ->
      let new_point = transform t p in 
      new_point :: run r new_point
    |Repeat(n,r_prog) -> 
      let rec aux (n : int) (prog : program) (p : point) (pl : point list) : point list =
        if n > 0 then
          match prog with 
          [] -> aux (n-1) prog p pl 
          |ins::r ->
            match ins with 
            Move t -> 
              let new_point = transform t p in 
              aux n r new_point (pl @ [new_point])
          |Repeat(n1,r1_prog) -> aux n r1_prog  p (pl @ aux n1 r1_prog p [])
          |Either(p1,p2)-> aux n (if Random.bool () then p1 else p2) p pl
          else pl
      in aux n r_prog p []
    |Either(p1,p2) -> if Random.bool () then run (p1 @ r) p else run (p2 @ r) p
;;


let all_choices (prog : program) : program list =
  failwith "À compléter"

let target_reached (prog : program) (p : point) (r : rectangle) : bool =
  failwith "À compléter"
