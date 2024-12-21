open Graphics;;
open Format;;
open Prog;;
open Pf5.Interp;;


let prog = ref [] ;;

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
    let list = (unfold_repeat !prog) in 
    let size = list_length list in
    if i<size then
      let programme = list_nth list i in
      Printf.printf "i = %d\n" i;
      Printf.printf "La taille de la liste est %d\n" size;
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
    Cr.run (!prog) i
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

let choix_prog () = 
  match !programme with 
  |1-> prog := prog1 ()
  |2-> prog := prog2 ()
  |3-> prog := prog3 ()
  |4-> prog := prog4 ()
  |_ -> Printf.printf "lololo"
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