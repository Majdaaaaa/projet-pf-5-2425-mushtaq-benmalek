open Graphics;;
open Pf5.Geo;;
open Pf5.Interp;;


let prog () = 
  let mid_x = (float_of_int (size_x ())) /. 2. in 
  let mid_y =  (float_of_int (size_y ())) /. 2. in 
  (*Carré*)
  [
    Repeat (4, [
        Move (Translate {x = 1.0*.42.10526316; y = 0.0*.52.63157895});  
        Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  
      ])
  ];;

(* let prog () =
   let mid_x = (float_of_int (size_x ())) /. 2. in 
   let mid_y =  (float_of_int (size_y ())) /. 2. in 
   let steps = 360 in          (* Number of steps to approximate the circle *)
   let step_length = 2. in    (* Length of each translation step *)
   let center = {x=mid_x; y=mid_y} in  (* Rotate around the origin (0, 0) *)
   let rotation_angle = 1.0 in (* Rotate by 1 degree per step *)
   [
    Repeat (steps, [
        Move (Translate ({x=step_length; y=0.0}));   (* Translate step_length forward *)
        Move (Rotate (center ,rotation_angle)) (* Rotate around the center by rotation_angle *)
      ])
   ]
   ;; *)

let rec list_length l = 
  match l with 
  |[] -> 0
  |_::w -> 1 + list_length w
;;
let rec list_nth l k = 
  match l with 
  |[] -> failwith "liste vide"
  |[a] -> if k==0 then a else failwith "existe pas"
  |a::w -> if k==0 then a else list_nth w (k-1)
;;
let run prog scale i = 
  (* let color = rgb !(Format.r) !(Format.v) !(Format.b) in set_color color; *)
  let mid_x = (float_of_int (size_x ())) /. 2. in 
  let mid_y =  (float_of_int (size_y ())) /. 2. in 
  let point = run prog {x=mid_x ; y=mid_y} in 
  (* List.iter (fun p -> Printf.printf "(%f, %f)\n" p.x p.y) point; *)
  let aux l  = 
    if i < list_length l then 
      let x = (int_of_float ((list_nth l i).x *. scale)) in 
      let y = (int_of_float ((list_nth l i).y *. scale))
      in Printf.printf "Plotting at: (%d, %d)\n" x y;
      fill_circle x y 3 ; 
  in aux point ; 
