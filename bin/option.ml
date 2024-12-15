open Graphics;;
open Format;;

let bc ()= 
  if !is_bc then 
    let c = rgb !bc_r !bc_v !bc_b in
    Printf.printf "%d %d %d\n" !bc_r !bc_v !bc_b;
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
    Cr.run (Cr.prog ()) 1. i;