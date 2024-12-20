open Graphics ;;
open Pf5.Geo;;
open Pf5.Interp;;

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
        Move (Translate {x = 1.0 *. 100.0; y = 0.0});  
        Move (Rotate ({x = mid_x; y = mid_y}, 144.0))  
      ])
  ]
;;
let prog5 () =
  let mid_x = (float_of_int (size_x ())) /. 2. in
  let mid_y = (float_of_int (size_y ())) /. 2. in
  (* Spirale *)
  [
    Repeat (360, [
        Move (Translate {x = 20.0; y = 0.0});  
        Move (Rotate ({x = mid_x; y = mid_y}, 10.0))  
      ])
  ]
;;
