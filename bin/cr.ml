open Graphics;;
open Pf5.Geo;;
open Pf5.Interp;;
exception Fin;;
open Pf5.Liste;;

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
          let p_x = Float.to_int p.x in 
          let p_y = Float.to_int p.y in
          let x = mid_x + (p_x * sx) in
          let y = mid_y + (p_y * sy) in 
          fill_rect x y 5 5;
          aux i (j + 1)
      in
      aux i 1
  ) else 
    raise Fin
;;
