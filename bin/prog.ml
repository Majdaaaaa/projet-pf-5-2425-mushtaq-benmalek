open Graphics ;;
open Pf5.Geo;;
open Pf5.Interp;;

let prog1 () = 
  let mid_x = (float_of_int (size_x ())) /. 2. in 
  let mid_y =  (float_of_int (size_y ())) /. 2. in 
  (*Carré*)
  [
    Repeat (4, [
        Move (Translate {x = 1.0; y = 0.0});  
        Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  
      ])
  ];;

let prog2 () =
  let mid_x = (float_of_int (size_x ())) /. 2. in
  let mid_y = (float_of_int (size_y ())) /. 2. in
  [
    Repeat (3, [
        Move (Translate {x = 3.; y = 0.0});  
        Move (Rotate ({x = mid_x; y = mid_y}, 120.0))  
      ])
  ]
;;

let prog3 () =
  let mid_x = (float_of_int (size_x ())) /. 2. in
  let mid_y = (float_of_int (size_y ())) /. 2. in
  [
    Repeat (5, [
        Move (Translate {x =2.; y = 0.0});  
        Move (Rotate ({x = mid_x; y = mid_y}, 144.0))  
      ]);
    Move (Translate ({x=2. ; y= 3.}))
  ]
;;

let prog4 () =
  let mid_x = (float_of_int (size_x ())) /. 2. in
  let mid_y = (float_of_int (size_y ())) /. 2. in
  [
    (* Répète 4 fois pour tracer un carré *)
    Repeat (4, [
        Move (Translate {x = 1.0 *. 3.0; y = 0.0});  (* Déplace horizontalement *)
        Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  (* Tourne autour du centre *)
      ]);
    (* Répète 3 fois pour tracer un triangle équilatéral *)
    Repeat (3, [
        Move (Translate {x = 1.0 *. 7.0; y = 0.0});  (* Déplace horizontalement *)
        Move (Rotate ({x = mid_x; y = mid_y}, 120.0)) (* Tourne autour du centre *)
      ]);
    (* Déplacement diagonal *)
    Move (Translate {x = 5.0; y = 5.0});
    (* Rotation autour d'un point spécifique *)
    Move (Rotate ({x = mid_x +. 5.0; y = mid_y +. 5.0}, 45.0));
    (* Retour au centre *)
    Move (Translate {x = 0.; y = 0.});
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