open Graphics;;
open Pf5.Geo;;
open Pf5.Interp;;
exception Fin;;
open Pf5.Liste;;

(** [run] dessine les points donnés par la fonction [Pf5.run].
    Dessine les points de 1 à i (de 1 pour ne pas dessiner l'origine) 
    à chaque appel pour éviter que les rectangles recouvrent les points.
    Lève l'exception [Fin] quand le programme est fini.
    @param prog 
    @param i
*)
let run prog i =  
  let l = run prog {x=0.; y=0.} in
  if i < list_length l  then (
    let sx = size_x () / 19 in 
    let sy = size_y () / 19 in
    let mid_x = size_x () / 2 in 
    let mid_y = size_y () / 2 in 
    let rec aux i j = 
      if j <= i then 
        let p = list_nth l j in
        let p_x = int_of_float (ceil p.x) in 
        let p_y = int_of_float (ceil p.y) in
        let x = mid_x + (p_x * sx) in
        let y = mid_y + (p_y * sy) in 
        fill_rect x y 5 5;
        aux i (j + 1)
    in
    aux i 1
  ) else 
    raise Fin
;;
