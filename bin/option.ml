open Graphics;;
open Format;;
open Pf5.Interp;;

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

let not_detereministic p = 
  let lp = all_choices p in 
  let rand = Random.int (list_length lp) in 
  prog := list_nth lp rand 
;;
let stock_prog = ref (!prog);;

let abs i () =
  if !is_abs && (is_deterministic !stock_prog = false) then (
    not_detereministic !prog;
    let list = (!prog) in 
    let size = list_length list in
    if i<size then
      if i = -1 then Abs.draw_abs !rect 
      else
        let programme = list_nth list i in
        Abs.run_abs [programme] rect)
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
    if check_color !bc_r && check_color !bc_v && check_color !bc_b then (
      Printf.printf "%d %d %d\n" !bc_r !bc_v !bc_b;
      set_color c; 
      clear_graph (); 
      fill_rect 0 0 (size_x()) (size_y());
      set_color white)
;;


let fc () =
  let basic = white in
  if !is_fc then
    let c = rgb !fc_r !fc_v !fc_b in
    set_color c; (* Change la valeur de Graphics.foreground, tout les dessins a partir de la seront fais de la couleur c *)
  else 
    set_color basic
;;

let pc () =
  if !is_pc then
    if check_color !pc_r && check_color !pc_v && check_color !pc_b then (
      let c = rgb !pc_r !pc_v !pc_b in
      set_color c)

;;

let cr i () =
  try
    if !is_abs = false || (!is_abs && !is_cr) then 
      not_detereministic !prog ;
    Cr.run !prog i
  with 
  | Cr.Fin -> raise Cr.Fin
;;

let size () = 
  Printf.printf "w : %d , h : %d\n" !w !h;
  let res = " "^string_of_int !w^"x"^string_of_int !h in
  open_graph res
;;

let rc() = 
  if !is_rc then 
    let c = rgb !rc_r !rc_v !rc_b in
    set_color c
;;
