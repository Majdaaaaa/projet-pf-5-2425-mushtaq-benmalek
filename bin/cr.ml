open Graphics;;
open Pf5.Geo;;
open Pf5.Interp;;

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
    if i < list_length l  then 
      let p_x = ref (int_of_float ((list_nth l i).x)) in 
      let p_y = ref (int_of_float ((list_nth l i).y)) in
      if !p_x < 0 then 
        p_x := !p_x * (-1);
      if !p_y < 0 then 
        p_y := !p_y * (-1);
      let x = ((!p_x - mid_x) * sx) + mid_x in
      let y = ((!p_y - mid_y) * sy) + mid_y in
      Printf.printf "Plotting at: (%d, %d)\n" x y;
      Printf.printf "x = [%d] ,  y =[%d]\n"  (int_of_float ((list_nth l i).x)) (int_of_float ((list_nth l i).y));
      fill_circle x y ((max sx sy)/10);
  in aux (point prog)
;;

let run_ligne prog = 
  let points = point prog in 
  List.iter (fun p -> lineto (int_of_float p.x) (int_of_float p.y)) points;;
