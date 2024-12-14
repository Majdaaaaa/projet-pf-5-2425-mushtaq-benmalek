exception Quit;;
open Graphics;;
open Format;;
open_graph " 800x600";;

let bc ()= 
  let c = rgb !bc_r !bc_v !bc_b in
  Printf.printf "%d %d %d\n" !bc_r !bc_v !bc_b;
  set_color c; 
  clear_graph (); 
  fill_rect 0 0 (size_x()) (size_y());
  set_color white;;


let fc () =
  let c = rgb !fc_r !fc_v !fc_b in
  set_color c; (* Change la valeur de Graphics.foreground, tout les dessins a partir de la seront fais de la couleur c *)
;;

let pc () =
  let c = rgb !pc_r !pc_v !pc_b in
  set_color c;;

let () =
  try
    let nbargs = Array.length Sys.argv in
    if nbargs <= 1 then ( 
      Printf.printf "Il manque des arguments\n";
      raise Quit;
    )
    else 
      Arg.parse Format.speclist Format.anon_fun Format.usage_msg;
    if !is_bc then 
      bc ();
    if !is_pc then
      pc ();
    (*! est ce que c'est grave que le repere est dessiné sur les points ???*)
    if !is_abs = false || (!is_abs && !is_cr) then 
      Cr.run (prog ()) 1. ;
    if !is_fc then
      fc ();
    Init.init_graphics ();
    while true do
      let eve = wait_next_event [Key_pressed] in
      if eve.key = 'q' then raise Quit
    done
  with 
  | Quit -> close_graph ();;
