open Graphics;;
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





















  

(* PROG TEST POUR TRANSLATE*)

(* let prog () =
  let mid_x = 0.0 in
  let mid_y = 0.0 in
  [
    (* Point dans le premier quadrant (x > 0, y > 0) *)
    Move (Translate {x = mid_x +. 5.0; y = mid_y +. 5.0});
    (* Point dans le deuxième quadrant (x < 0, y > 0) *)
    Move (Translate {x = mid_x -. 2.0; y = mid_y +. 2.0});
    (* Point dans le troisième quadrant (x < 0, y < 0) *)
    Move (Translate {x = mid_x -. 5.0; y = mid_y -. 5.0});
    (* Point dans le quatrième quadrant (x > 0, y < 0) *)
    Move (Translate {x = mid_x +. 1.0; y = mid_y -. 1.0});
    (* Retour au centre *)
    (* Move (Translate {x = -.mid_x; y = -.mid_y}); *)
  ]
;; *)

(* PROG TEST POUR ROTATE *)
(* let prog () =
  let mid_x = 0.0 in
  let mid_y = 0.0 in
  [
    (* Move(Rotate ({x = mid_x ; y = mid_y} , 90.0 )); *)
    (* Point dans le premier quadrant (x > 0, y > 0) *)
    Move (Translate {x = mid_x +. 5.0; y = mid_y +. 5.0});
    
    Move(Rotate ({x = !rect.x_min ; y = !rect.y_max } , (-60.0) ));
    (* Point dans le deuxième quadrant (x < 0, y > 0) *)
    Move (Translate {x = mid_x -. 2.0; y = mid_y +. 2.0});
    (* Point dans le troisième quadrant (x < 0, y < 0) *)
    Move (Translate {x = mid_x -. 5.0; y = mid_y -. 5.0});
    (* Point dans le quatrième quadrant (x > 0, y < 0) *)
    Move (Translate {x = mid_x +. 3.0; y = mid_y +. 3.0});
    (* Retour au centre *)
    (* Move (Translate {x = -.mid_x; y = -.mid_y}); *)
  ]
;; *)

(* PROG TEST POUR REPEAT*)
(* let prog () =
  (* let mid_x = 0.0 in *)
  let mid_y = 0.0 in
  [
    Repeat(4, [Move(Translate {x = !rect.x_min -. 2. ; y = mid_y })] );
  ]
;; *)

(* PROGRAMME POUR LE EITHER *)
(* let prog () =
  let mid_x = 0.0 in
  let mid_y = 0.0 in
  [
    Either ( [Move (Translate {x = mid_x +. 3.0; y = mid_y +. 3.0})] , [Move(Rotate ({x = mid_x ; y = mid_y} , 90.0 ))] )
    
    (* Repeat(5, [Move(Translate {x = !rect.x_min -. 2. ; y = mid_y })] ); *)
    (* Point dans le premier quadrant (x > 0, y > 0) *)
    (* Move (Translate {x = mid_x +. 5.0; y = mid_y +. 5.0}); *)
    
    (* Point dans le deuxième quadrant (x < 0, y > 0) *)
    (* Move (Translate {x = mid_x -. 2.0; y = mid_y +. 2.0}); *)
    (* Point dans le troisième quadrant (x < 0, y < 0) *)
    (* Move (Translate {x = mid_x -. 5.0; y = mid_y -. 5.0}); *)
    (* Point dans le quatrième quadrant (x > 0, y < 0) *)
    (* Move (Translate {x = mid_x +. 3.0; y = mid_y +. 3.0}); *)
    (* Retour au centre *)
    (* Move (Translate {x = -.mid_x; y = -.mid_y}); *)
  ]
;;  *)

let profg() = [Repeat (1, [
  Either (
    [Move(Translate {x = 1.; y = 0.})],
    [Move(Translate {x = -1.; y = 0.})]
    );
  Either (
    [Move(Translate {x = 0.; y = 1.})],
    [Move(Translate {x = 0.; y = -1.})]
    )      ]
)]
;;
  