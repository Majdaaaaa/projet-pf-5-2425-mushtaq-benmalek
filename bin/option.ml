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

let prog () =
  let mid_x = (float_of_int (size_x ())) /. 2. in
  let mid_y = (float_of_int (size_y ())) /. 2. in
  [
    (* Répète 4 fois pour tracer un carré *)
    Repeat (4, [
        Move (Translate {x = 1.0 *. 100.0; y = 0.0});  (* Déplace horizontalement *)
        Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  (* Tourne autour du centre *)
      ]);
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
;;



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

let abs i () =
  if !is_abs then
    let list = prog () in 
    let size = list_length list in
    if i<size then
      let programme = list_nth list i in
      Printf.printf "i = %d\n" i;
      Printf.printf "La taille de la liste est %d\n" size;
      Abs.run_abs [programme] rect 
;;

let bc ()= 
  (* Printf.printf "w : %d , h : %d\n" !w !h; *)
  if !is_bc then 
    let c = rgb !bc_r !bc_v !bc_b in
    if check_color !bc_r && check_color !bc_v && check_color !bc_b then (
      Printf.printf "%d %d %d\n" !bc_r !bc_v !bc_b;
      set_color c; 
      clear_graph (); 
      fill_rect 0 0 (size_x()) (size_y());
      set_color white)
;;


let fc () =
  if !is_fc then
    let c = rgb !fc_r !fc_v !fc_b in
    set_color c; (* Change la valeur de Graphics.foreground, tout les dessins a partir de la seront fais de la couleur c *)
;;

let pc () =
  if !is_pc then
    if check_color !pc_r && check_color !pc_v && check_color !pc_b then (
      let c = rgb !pc_r !pc_v !pc_b in
      set_color c)

;;

let cr i () =
  if !is_abs = false || (!is_abs && !is_cr) then 
    Cr.run (!programme) i
;;

let size () = 
  if !is_size then (
    close_graph ();
    Printf.printf "w : %d , h : %d\n" !w !h;
    let res = " "^string_of_int !w^"x"^string_of_int !h in
    open_graph res
  )
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