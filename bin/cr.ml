open Graphics;;
open Pf5.Geo;;
open Pf5.Interp;;
exception Fin;;

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

let dessin prog i =
  let sx = size_x ()/19 in 
  let sy = size_y ()/19 in
  let mid_x = size_x () / 2 in 
  let mid_y =  size_y () / 2 in 
  let l = run (prog) {x=0. ; y=0.}  in
  if i < list_length l  then 
    let p = list_nth l i in
    let p_x = (Float.to_int p.x) in 
    let p_y = (Float.to_int p.y) in
    let x = mid_x + ((p_x) * sx) in
    let y = mid_y + ((p_y) * sy) in 
    fill_rect x y 5 5;
  else 
    raise Fin;;

let run prog i =
  dessin prog i
;;
