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
  let aux l  = 
    if i < list_length l && i > 0  then 
      let x = (int_of_float ((list_nth l i).x)) in 
      let y = (int_of_float ((list_nth l i).y))
      in Printf.printf "Plotting at: (%d, %d)\n" x y;
      fill_circle x y 3 ; 
  in aux (point prog)
;;

let run_ligne prog = 
  let points = point prog in 
  List.iter (fun p -> lineto (int_of_float p.x) (int_of_float p.y)) points;;
