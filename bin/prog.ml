open Pf5.Geo;;
open Pf5.Interp;;

(* let prog1 () = 
  (*Carré*)
  [
    Repeat (2, [
        Move (Translate ({x = 1.0; y = 0.0}));  
        Move (Rotate ({x = 0.0; y = 0.0}, 90.0)) ;
      ])
  ];; *)

let prog2 () =
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
(* ;;  *)

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

(* let prog1 () =
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
(* 
let prog1() =
  [Repeat(5,  [Move(Translate{x = 1.0 ; y = 1.0})]  )]
;; *)


(* let prog1() =
  [   Move(Translate{x = 1.0 ; y = 1.0});
      Move(Translate{x = 1.0 ; y = 1.0});
      Move(Translate{x = 1.0 ; y = 1.0});
      Move(Translate{x = 1.0 ; y = 1.0});
      Move(Translate{x = 1.0 ; y = 1.0});
      Move(Translate{x = 1.0 ; y = 1.0});
      Move(Translate{x = 1.0 ; y = 1.0});
      Move(Translate{x = 1.0 ; y = 1.0});
      (* Move(Translate{x = 1.0 ; y = 1.0}) *)
  ]
;; *)

(* let prog1() =
  [
    Move(Translate{x = 0.0 ; y = 5.0});
    Move(Translate{x = -1.0 ; y = 1.0});
    Move(Translate{x =  1.0 ; y = -1.0});
    Move(Translate{x = -1.0 ; y = 1.0});
    (* Move(Translate{x = -1.0 ; y = 0.0});
    Move(Translate{x = -1.0 ; y = 0.0});
    Move(Translate{x = -1.0 ; y = -1.0});
    Move(Translate{x =  0.0 ; y = -1.0});
    Move(Translate{x =  0.0 ; y = -1.0});
    Move(Translate{x =  0.0 ; y = -1.0});
    Move(Translate{x =  0.0 ; y = -1.0}); *)
  ] *)


  (* let prog1() =
  [
    Move(Translate{x = -1.0 ; y = 4.0});
    
    (* Move(Translate{x = -1.0 ; y = 1.0}); *)
    Move(Translate{x =  -1.0 ; y = 1.0});
    Move(Translate{x = -1.0 ; y = 1.0});
    
    Move(Translate{x = -1.0 ; y = 0.0});
    Move(Translate{x = -1.0 ; y = 0.0});
    
    Move(Translate{x = -1.0 ; y = -1.0});
    Move(Translate{x = -1.0 ; y = -1.0});
    
    Move(Translate{x = 0.0 ; y = -1.0});
    Move(Translate{x = 0.0 ; y = -1.0});
    Move(Translate{x = 0.0 ; y = -1.0});
    
    Move(Translate{x = 1.0 ; y = -1.0});
    Move(Translate{x = 1.0 ; y = -1.0});
    Move(Translate{x = 1.0 ; y = -1.0});
    Move(Translate{x = 1.0 ; y = -1.0});
    Move(Translate{x = 1.0 ; y = -1.0});
    Move(Translate{x = 1.0 ; y = -1.0});
  
    Move(Translate{x = 1.0 ; y = 1.0});
    Move(Translate{x = 1.0 ; y = 1.0});
    Move(Translate{x = 1.0 ; y = 1.0});
    Move(Translate{x = 1.0 ; y = 1.0});
    Move(Translate{x = 1.0 ; y = 1.0});
    Move(Translate{x = 1.0 ; y = 1.0});

    Move(Translate{x = 0.0 ; y = 1.0});
    Move(Translate{x = 0.0 ; y = 1.0});
    Move(Translate{x = 0.0 ; y = 1.0});

    Move(Translate{x = -1.0 ; y = 1.0});
    Move(Translate{x = -1.0 ; y = 1.0});
    Move(Translate{x = -1.0 ; y = 0.0});
    Move(Translate{x = -1.0 ; y = 0.0});

    Move(Translate{x = -1.0 ; y = -1.0});
    Move(Translate{x = -1.0 ; y = -1.0});

  ] *)



  let prog1() =
  [
    Move(Translate{x = -1.0 ; y = 4.0});
    Repeat(2,[Move(Translate{x =  -1.0 ; y = 1.0})]);
    
    Repeat(2,[ Move(Translate{x = -1.0 ; y = 0.0})]);
    
    
    Repeat(2,[Move(Translate{x = -1.0 ; y = -1.0})]);
    
    
    Repeat(3,[Move(Translate{x = 0.0 ; y = -1.0})]);
    
    Repeat(6,[Move(Translate{x = 1.0 ; y = -1.0})]);
    
  
    Repeat(6,[Move(Translate{x = 1.0 ; y = 1.0})]);
    
    Repeat(3,[Move(Translate{x = 0.0 ; y = 1.0})]);
    
    Repeat(2,[Move(Translate{x = -1.0 ; y = 1.0})]);
    
    Repeat(2,[Move(Translate{x = -1.0 ; y = 0.0})]);
    
    Repeat(2,[Move(Translate{x = -1.0 ; y = -1.0})]);

  ]


(* let rev_opp cmds = 
  let rec aux cmds =
    match cmds with 
    | [] -> []
    | a::w ->
        match a with
        | Move ( Translate {x = _ ; y = _ }) -> a :: aux w
        | Move ( Rotate ({x = xx ; y = yy } , f) ) -> Move(Rotate ({x = xx ; y = yy },-.f))  :: aux w
        | Repeat (i,c) -> Repeat(i, List.rev (aux c)) :: aux w
        | Either (p,q) -> a:: aux p @ aux q
  in List.rev (aux cmds) 
;;

let rec dragon size n = 
  if n=0 then [Move(Translate{x = size; y = 0.0 })]
  else
    let size' = size /. sqrt 2. in
    dragon size' (n-1) @
    [Move(Rotate({x = 0.0 ; y = 0.0}, 90.0)) ] @ 
    rev_opp (dragon size' (n-1))
;;


let prog1() =
  dragon 5. 3
;; *)




(* let prog1() = *)

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
  