open Graphics;;
open Format;;
open Pf5.Interp;;
open Pf5.Approx;;

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

let det_prog = ref [];;

let not_detereministic p = 
  let lp = all_choices p in 
  let rand = Random.int (list_length lp) in 
  det_prog := list_nth lp rand 
;;
let is_det = is_deterministic !prog;;

(* Sur-approximation *)
let abs j () =
  if !is_abs then
    if is_det = false then
      let size = list_length !prog in
      if j < size then(
        if j = -1 then Abs.draw_rect !rect
        else
          let programme = list_nth !prog j in
          Abs.run_abs [programme] rect)
      else raise Cr.Fin
;;

(* Choix aléatoire *)
let ae i () =
  if !is_ae then 
    let rect_list = run_rect !det_prog !rect in
    let size = list_length rect_list  in
    if i < size then
      let r = list_nth rect_list i in
      Abs.draw_rect r
    else raise Cr.Fin
;;

let bc ()= 
  if !is_bc then 
    let c = rgb !bc_r !bc_v !bc_b in
    Printf.printf "%d %d %d\n" !bc_r !bc_v !bc_b;
    set_color c; 
    clear_graph (); 
    fill_rect 0 0 (size_x()) (size_y());
    set_color white
;;


let fc () =
  let basic = black in 
  if !is_fc then
    let c = rgb !fc_r !fc_v !fc_b in
    set_color c; (* Change la valeur de Graphics.foreground, tout les dessins a partir de la seront fais de la couleur c *)
  else 
    set_color basic
;;

let pc () =
  if !is_pc then
    let c = rgb !pc_r !pc_v !pc_b in
    set_color c
;;

let cr i () =
  try
    if !is_abs = false || ((!is_abs=true) && (!is_cr=true))  then (
      Cr.run !prog i)
  with 
  | Cr.Fin -> raise Cr.Fin
;;

let size () = 
  (* Printf.printf "w : %d , h : %d\n" !w !h; *)
  let res = " "^string_of_int !w^"x"^string_of_int !h in
  open_graph res
;;

let rc() = 
  if !is_rc then 
    let c = rgb !rc_r !rc_v !rc_b in
    set_color c
;;
