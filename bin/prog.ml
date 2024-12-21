open Graphics ;;
open Pf5.Geo;;
open Pf5.Interp;;

let x () = float_of_int (size_x ()/19);;
let y () = float_of_int (size_y ()/19);;

let prog1 () = 
  let mid_x = (float_of_int (size_x ())) /. 2. in 
  let mid_y =  (float_of_int (size_y ())) /. 2. in 
  (*Carré*)
  [
    Repeat (4, [
        Move (Translate {x = 1.0*.42.10526316; y = 0.0*.52.63157895});  
        Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  
      ])
  ];;

let prog2 () =
  let mid_x = (float_of_int (size_x ())) /. 2. in
  let mid_y = (float_of_int (size_y ())) /. 2. in
  [
    Repeat (3, [
        Move (Translate {x = 1.0 *. 50.0; y = 0.0});  
        Move (Rotate ({x = mid_x; y = mid_y}, 120.0))  
      ])
  ]
;;

let prog3 () =
  let mid_x = (float_of_int (size_x ())) /. 2. in
  let mid_y = (float_of_int (size_y ())) /. 2. in
  [
    Repeat (5, [
        Move (Translate {x = x (); y = 0.0});  
        Move (Rotate ({x = mid_x; y = mid_y}, 144.0))  
      ])
  ]
;;

(* let prog4 () =
   let mid_x = (float_of_int (size_x ())) /. 2. in
   let mid_y = (float_of_int (size_y ())) /. 2. in
   moveto (int_of_float mid_x) (int_of_float mid_y) ;
   let (x,y) = current_point () in 
   let fx = (float_of_int x )in 
   let fy = (float_of_int y ) in 
   [
    Repeat (10, [
        Move (Translate {x = 30. ; y=30.});
        Move (Rotate ({x= fx ; y= fy }, 36.))
      ])
   ];; *)

(* let prog4 () =
  let mid_x = (float_of_int (size_x ())) /. 2. in
  let mid_y = (float_of_int (size_y ())) /. 2. in
  moveto (int_of_float mid_x) (int_of_float mid_y) ;
  [
    Repeat (3,[
        Move (Translate {x = 100.; y = 0. });
        (* Move (Translate {x = 10.0; y = 10.0}); *)
        Move (Rotate ({x = mid_x; y = mid_y}, 120.0));
        (* Move (Translate {x = 10.0; y = 10.0}); *)
      ])
  ]
;; *)