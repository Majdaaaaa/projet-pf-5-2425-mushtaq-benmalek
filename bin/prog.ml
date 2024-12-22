open Pf5.Geo;;
open Pf5.Interp;;
open Cr;;

(* let prog1 () = 
   (*Carré*)
   [
    Repeat (2, [
        Move (Translate ({x = 1.0; y = 0.0}));  
        Move (Rotate ({x = 0.0; y = 0.0}, 90.0)) ;
      ])
   ];; *)

let prog9 () =
  let center = { x = 0.0; y = 0.0 } in (* Centre de rotation *)

  let move_right = Move (Translate {x = 1.0; y = -1.0}) in
  let rotate_and_draw = Move (Rotate (center, 22.5)) in

  (* Sous-programme : Une étape avec translation et rotation traçant des points *)
  let one_spiral_step = [
    move_right;           (* Déplacement et dessin du point *)
    rotate_and_draw;      (* Rotation autour du centre et dessin du point *)
  ] in

  (* Répéter le motif pour une spirale élégante *)
  [Repeat (64, one_spiral_step)] (* Plus d'étapes pour une spirale fluide *)
;;

(* Définir des vecteurs *)
let vec1 = { x = 2.0; y = 0.0 }
let vec2 = { x = 0.0; y = 2.0 }

(* Définir des transformations *)
let trans1 = Translate vec1
let trans2 = Rotate ({ x = 0.0; y = 0.0 }, 90.0)
let trans3 = Translate vec2

(* Créer des instructions *)
let move1 = Move trans1
let move2 = Move trans2
let move3 = Move trans3
(* Composer un programme *)
let prog19 ()= [
  (* move1; *)
  Repeat (100, [move2; move1;move3]);
]


let prog20 () =
  (* let mid_x = (float_of_int (size_x ())) /. 2. in
     let mid_y = (float_of_int (size_y ())) /. 2. in *)
  [
    Repeat (1, [
        Move (Translate {x = 3.; y = 0.0});  
        Move (Rotate ({x = 0.; y = 0.}, 120.0))  
      ])
  ]
;;

let prog3 () =
  [
    Repeat (2, [
        Move (Translate {x =2.; y = 0.0});  
      ]);
  ]
;;

(* let prog4 () =
   let mid_x = (float_of_int (size_x ())) /. 2. in
   let mid_y = (float_of_int (size_y ())) /. 2. in
   [
    (* Répète 4 fois pour tracer un carré *)
    Repeat (4, [
        Move (Translate {x = 3.0; y = 0.0});  (* Déplace horizontalement *)
        Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  (* Tourne autour du centre *)
      ]);
    (* Répète 3 fois pour tracer un triangle équilatéral *)
    Repeat (3, [
        Move (Translate {x = 1.0 *. 7.0; y = 0.0});  (* Déplace horizontalement *)
        Move (Rotate ({x = mid_x; y = mid_y}, 120.0)) (* Tourne autour du centre *)
      ]);
    (* Déplacement diagonal *)
    Move (Translate {x = 1.0; y = 1.0});
    (* Rotation autour d'un point spécifique *)
    Move (Rotate ({x = mid_x +. 1.0; y = mid_y +. 1.0}, 45.0));
    (* Retour au centre *)
    Move (Translate {x = 0.; y = 0.});
   ]
   ;; *)

let prog4 () =
  (* [
     Repeat (10, [
        Either ([Move (Translate {x = 1.0; y =  0.0}) ; Move(Rotate({x=0.; y=0.},30.))] , [Move(Translate ({x = 0. ; y = 1.} ));  Move(Rotate({x=0.; y=0.}, 90.))] );
        Move(Rotate ({x = 0. ; y = 0.} , 90.0 ))
      ]);
     ] *)
  [
    Repeat (10, [
        Either ([Move (Translate {x = 1.0; y =  0.0})] , [Move(Translate ({x = 0. ; y = 1.} ))] );
        Move(Rotate ({x = 0. ; y = 0.} , 90.0 ))
      ]);
  ]

(* Either ([Move (Translate {x =  0. +. 1.0; y =  0.0})] , [Move(Rotate ({x = 0. ; y = 0.} , 90.0 ))] );
   Either ([Move (Translate {x =  0. +. 2.0; y =  0.0})] , [Move(Rotate ({x = 0. ; y = 0.} , 90.0 ))] );
   Either ([Move (Translate {x =  0. +. 3.0; y =  0.0})] , [Move(Rotate ({x = 0. ; y = 0.} , 90.0 ))] ) *)
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

(* PROG TEST POUR TRANSLATE*)

let prog8 () =
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
;;

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
let prog17 () =
  let mid_x = 0.0 in
  let mid_y = 0.0 in
  [
    Either ( [Move (Translate {x = mid_x +. 3.0; y = mid_y +. 3.0})] , [Move(Rotate ({x = mid_x ; y = mid_y} , 90.0 ))] );

    Repeat(5, [Move(Translate {x = -. 2. ; y = mid_y })] );
    (* Point dans le premier quadrant (x > 0, y > 0) *)
    Move (Translate {x = mid_x +. 5.0; y = mid_y +. 5.0});

    (* Point dans le deuxième quadrant (x < 0, y > 0) *)
    Move (Translate {x = mid_x -. 2.0; y = mid_y +. 2.0});
    (* Point dans le troisième quadrant (x < 0, y < 0) *)
    Move (Translate {x = mid_x -. 5.0; y = mid_y -. 5.0});
    (* Point dans le quatrième quadrant (x > 0, y < 0) *)
    Move (Translate {x = mid_x +. 3.0; y = mid_y +. 3.0});
    (* Retour au centre *)
    Move (Translate {x = -.mid_x; y = -.mid_y})
  ]
;; 

let prog1() = [
  Repeat (9, [Move (Translate {x = 1. ;y=1.})]);
  Repeat (9, [Move (Translate {x = (-1.) ;y=(-1.)})]);

  Repeat (9, [Move (Translate {x = (-1.) ;y=1.})]);
  Repeat (9, [Move (Translate {x = 1. ;y=(-1.)})]);

  Repeat (9, [Move (Translate {x = 1. ;y=(-1.)})]);
  Repeat (9, [Move (Translate {x = (-1.) ;y=1.})]);

  Repeat (9, [Move (Translate {x = (-1.) ;y=(-1.)})]);
]
;;

let prog2 () = [
  Move (Translate {x = 0. ; y=1.});
  Move (Rotate (!point, 36.));
  Move (Rotate (!point, 72.));

  (* Move (Translate {x = 1. ; y=0.}); *)
  Move (Rotate (!point, 36.));
  Move (Rotate (!point, 72.));

  (* Move (Translate {x = 0. ; y=1.}); *)
  Move (Rotate (!point, 36.));
  Move (Rotate (!point, 72.));

  (* Move (Translate {x = (-1.) ; y=0.}); *)
  Move (Rotate (!point, 36.));
  Move (Rotate (!point, 72.));

  (* Move (Translate {x = (0.) ; y=1.}); *)
  Move (Rotate (!point, 36.));
  Move (Rotate (!point, 72.));

]