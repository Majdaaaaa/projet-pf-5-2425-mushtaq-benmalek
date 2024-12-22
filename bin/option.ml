open Graphics;;
open Format;;
open Pf5.Interp;;
open Pf5.Liste;;
open Pf5.Approx;;
exception Deter;;
let det_prog = ref [];;

let not_detereministic p = 
  let lp = all_choices p in 
  let rand = Random.int (list_length lp) in 
  det_prog := list_nth lp rand 
;;
let is_det = is_deterministic !prog;;

(* Sur-approximation *)
(** [abs] applique l'option abs au rectangle [j]
    @param j la j-ème instruction à exécuter du programme
*)
let abs j () =
  if !is_abs= true then
    if is_deterministic !prog = false then
      let size = list_length !prog in
      if j < size then(
        if j = -1 then Abs.draw_rect !rect
        else
          let programme = list_nth !prog j in
          Abs.run_abs [programme] rect)
      else raise Cr.Fin
    else raise Deter
;;

(* Choix aléatoire *)
(** [ae] applique l'option abs au rectangle [i]
    @param i la j-ème instruction à exécuter du programme
*)
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
    (*Sur-approx et points au même temps pas de sens*)
    if (!is_abs = false && !is_ae = false ) || !is_cr = true then (
      Cr.run !det_prog i)
  with 
  | Cr.Fin -> raise Cr.Fin
;;

(** [size] set la size de la fenêtre et l'ouvre
*)
let size () = 
  let res = " "^string_of_int !w^"x"^string_of_int !h in
  open_graph res
;;

(** [rc] applique l'option rc au rectangle [rect]
*)
let rc() = 
  if !is_rc then 
    let c = rgb !rc_r !rc_v !rc_b in
    set_color c
;;
