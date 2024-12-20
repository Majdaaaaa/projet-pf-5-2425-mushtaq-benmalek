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

(** [run prog scale i] exécute le programme [prog] avec une échelle [scale] et un index [i].
    Il trace un cercle aux coordonnées calculées à partir de [prog] et [scale].
    @param prog le programme à exécuter
    (* @param scale l'échelle à appliquer aux coordonnées *)
    @param i l'index de l'élément à tracer *)
let run prog i = 
  let mid_x = (float_of_int (size_x ())) /. 2. in 
  let mid_y =  (float_of_int (size_y ())) /. 2. in 
  let point = run prog {x=mid_x ; y=mid_y} in 
  let aux l  = 
    if i < list_length l then 
      let x = (int_of_float ((list_nth l i).x)) in 
      let y = (int_of_float ((list_nth l i).y))
      in Printf.printf "Plotting at: (%d, %d)\n" x y;
      fill_circle x y 3 ; 
  in aux point ; 
