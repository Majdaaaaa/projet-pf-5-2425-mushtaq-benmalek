open Graphics;;
open Format;;
open Pf5.Interp;;


 (* let prog() = 
  let mid_x = (float_of_int (size_x ())) /. 2. in 
  let mid_y =  (float_of_int (size_y ())) /. 2. in 
  (*Carré*)
  [
    Repeat (4, [
        Move (Translate {x = 1.0*.42.10526316; y = 0.0*.52.63157895});  
        Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  
      ])
  ];;  *)

  (* let prog () =
    let mid_x = (float_of_int (size_x ())) /. 2. in
    let mid_y = (float_of_int (size_y ())) /. 2. in
    [
      (* Répète 4 fois pour tracer un carré *)
      Repeat (4, [
          Move (Translate {x = 1.0 *. 100.0; y = 0.0});  (* Déplace horizontalement *)
          Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  (* Tourne autour du centre *)
        ]);
      Move(Translate {x = -. mid_x; y = -. mid_y});
      (* Répète 3 fois pour tracer un triangle équilatéral *)
      Repeat (3, [
          Move (Translate {x = 1.0 *. 75.0; y = 0.0});  (* Déplace horizontalement *)
          Move (Rotate ({x = mid_x; y = mid_y}, 120.0)) (* Tourne autour du centre *)
        ]);
      (* Déplacement diagonal *)
      Move (Translate {x = 50.0; y = 50.0});
      (* Rotation autour d'un point spécifique *)
      Move (Rotate ({x = mid_x +. 50.0; y = mid_y +. 50.0}, 45.0));
      (* Retour au centre *)
      Move (Translate {x = -.mid_x; y = -.mid_y});
    ]
  ;; *)

  (* let prog () =
    let mid_x = (float_of_int (size_x ())) /. 2. in
    let mid_y = (float_of_int (size_y ())) /. 2. in
    [
      (* Point dans le premier quadrant (x > 0, y > 0) *)
      Move (Translate {x = mid_x +. 20.0; y = mid_y +. 20.0});
      (* Point dans le deuxième quadrant (x < 0, y > 0) *)
      Move (Translate {x = mid_x -. 20.0; y = mid_y +. 20.0});
      (* Point dans le troisième quadrant (x < 0, y < 0) *)
      Move (Translate {x = mid_x -. 20.0; y = mid_y -. 20.0});
      (* Point dans le quatrième quadrant (x > 0, y < 0) *)
      Move (Translate {x = mid_x +. 20.0; y = mid_y -. 20.0});
      (* Déplacement léger autour du centre *)
      Move (Translate {x = mid_x; y = mid_y});
      (* Répète un carré avec des déplacements réduits *)
      Repeat (4, [
          Move (Translate {x = 1.0 *. 30.0; y = 0.0});  (* Déplace horizontalement *)
          Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  (* Tourne autour du centre *)
        ]);
      (* Répète un triangle équilatéral avec des côtés plus courts *)
      Repeat (3, [
          Move (Translate {x = 1.0 *. 25.0; y = 0.0});  (* Déplace horizontalement *)
          Move (Rotate ({x = mid_x; y = mid_y}, 120.0)) (* Tourne autour du centre *)
        ]);
      (* Retour au centre *)
      Move (Translate {x = -.mid_x; y = -.mid_y});
    ]
  ;; *)
(* 
  
let prog () =
  let mid_x = 0.0 in
  let mid_y = 0.0 in
  [
    (* Point dans le premier quadrant (x > 0, y > 0) *)
    Move (Translate {x = mid_x +. 5.0; y = mid_y +. 5.0});
    (* Point dans le deuxième quadrant (x < 0, y > 0) *)
    Move (Translate {x = mid_x -. 5.0; y = mid_y +. 5.0});
    (* Point dans le troisième quadrant (x < 0, y < 0) *)
    Move (Translate {x = mid_x -. 5.0; y = mid_y -. 5.0});
    (* Point dans le quatrième quadrant (x > 0, y < 0) *)
    Move (Translate {x = mid_x +. 5.0; y = mid_y -. 5.0});
    (* Carré avec des distances adaptées *)
    Repeat (4, [
        Move (Translate {x = 4.0; y = 0.0});  (* Déplace horizontalement *)
        Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  (* Tourne autour du centre *)
      ]);
    (* Triangle équilatéral avec des côtés plus courts *)
    Repeat (3, [
        Move (Translate {x = 3.0; y = 0.0});  (* Déplace horizontalement *)
        Move (Rotate ({x = mid_x; y = mid_y}, 120.0)) (* Tourne autour du centre *)
      ]
      );
    (* Retour au centre *)
    Move (Translate {x = -.mid_x; y = -.mid_y});
  ]
;; *)


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

(* let prog() = [Repeat (1, [
  Either (
    [Move(Translate {x = 1.; y = 0.})],
    [Move(Translate {x = -1.; y = 0.})]
    );
  Either (
    [Move(Translate {x = 0.; y = 1.})],
    [Move(Translate {x = 0.; y = -1.})]
    )      ]
)]
;; *)
  

  let rec list_nth l k = 
    match l with 
    |[] -> failwith "liste vide"
    |[a] -> if k==0 then a else failwith "existe pas"
    |a::w -> if k==0 then a else list_nth w (k-1)
  ;;

  let rec list_length l = 
    match l with 
    |[] -> 0
    |_::w -> 1 + list_length w
  ;;

let print_programme prog =
  match prog with
  | Move _ -> Printf.printf "Move\n"
  | Repeat _ -> Printf.printf "Repeat \n " 
  | Either _ -> Printf.printf "Either\n"
;;

let abs i () =
  if !is_abs then
    let list = prog() in 
    let size = list_length list in
    if i<size then
      if i = -1 then Abs.draw_abs !rect
      else
      let programme = list_nth list i in
      Printf.printf "i = %d\n" i;
      print_programme programme;
      (* Printf.printf "La taille de la liste est %d\n" size; *)
      Abs.run_abs [programme] rect
;;

(* let ae i () =
  if !is_ae = true && !is_abs = true then close_graph();
else
  if !is_ae then
    let list = prog() in 
    let size = list_nth i in
    if i < size then
      let list_rect =  *)
      

let bc ()= 
  if !is_bc then 
    let c = rgb !bc_r !bc_v !bc_b in
    (* Printf.printf "%d %d %d\n" !bc_r !bc_v !bc_b; *)
    set_color c; 
    clear_graph (); 
    fill_rect 0 0 (size_x()) (size_y());
    set_color white;;


let fc () =
  if !is_fc then
    let c = rgb !fc_r !fc_v !fc_b in
    set_color c; (* Change la valeur de Graphics.foreground, tout les dessins a partir de la seront fais de la couleur c *)
;;

let pc () =
  if !is_pc then
    let c = rgb !pc_r !pc_v !pc_b in
    set_color c;;

let cr i () =
  if !is_abs = false || (!is_abs && !is_cr) then 
    Cr.run (Cr.prog ()) 1. i;;


let size() =
  let res = " "^string_of_int !w^"x"^string_of_int !h in
  open_graph res
;;

let rc() = 
  if !is_rc then 
    let c = rgb !rc_r !rc_v !rc_b in
    set_color c
;;

  (* let abs() =
  if !is_abs then 
    (* Abs.draw_abs !rect *)
    Abs.run_abs (prog()) !rect 
;; *)


(*
Printf.printf "dans abs()\n"; *)
    (* printf_rect(); *)
    (* Printf.printf "\n"; *)
    (* Abs.run_abs !rect
*)