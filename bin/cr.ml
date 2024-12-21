open Graphics;;
open Pf5.Geo;;
open Pf5.Interp;;

(* let prog () =
   let mid_x = (float_of_int (size_x ())) /. 2. in
   let mid_y = (float_of_int (size_y ())) /. 2. in
   [
    (* Point dans le premier quadrant (x > 0, y > 0) *)
    Move (Translate {x = mid_x +. 50.0; y = mid_y +. 50.0});
    (* Point dans le deuxième quadrant (x < 0, y > 0) *)
    Move (Translate {x = mid_x -. 50.0; y = mid_y +. 50.0});
    (* Point dans le troisième quadrant (x < 0, y < 0) *)
    Move (Translate {x = mid_x -. 50.0; y = mid_y -. 50.0});
    (* Point dans le quatrième quadrant (x > 0, y < 0) *)
    Move (Translate {x = mid_x +. 50.0; y = mid_y -. 50.0});
   ]
   ;; *)



(* let prog () = 
   let mid_x = (float_of_int (size_x ())) /. 2. in 
   let mid_y =  (float_of_int (size_y ())) /. 2. in 
   (*Carré*)
   [
    Repeat (4, [
        Move (Translate {x = 1.0*.42.10526316; y = 0.0*.52.63157895});  
        Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  
      ])
   ];; *)
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

let point prog =
  let mid_x = (float_of_int (size_x ())) /. 2. in 
  let mid_y =  (float_of_int (size_y ())) /. 2. in 
  run prog {x=mid_x ; y=mid_y} ;;

let run prog i =
  let sx = size_x ()/19 in 
  let sy = size_y ()/19 in
  let mid_x = size_x () / 2 in 
  let mid_y =  size_y () / 2 in 
  let aux l  = 
    if i < list_length l && i > 0  then 
      let x = (((int_of_float ((list_nth l i).x)) - mid_x) * sx) + mid_x in 
      let y = (((int_of_float ((list_nth l i).y)) - mid_y) * sy) + mid_y in 
      Printf.printf "Plotting at: (%d, %d)\n" x y;
      fill_circle x y ((max sx sy)/10);
  in aux (point prog)
;;

let run_ligne prog = 
  let points = point prog in 
  List.iter (fun p -> lineto (int_of_float p.x) (int_of_float p.y)) points;;
