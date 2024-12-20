open Graphics;;
open Format;; 
exception Arg;;

  let bc ()= 
    if !is_bc then 
      let c = rgb !bc_r !bc_v !bc_b in
      if check_color !bc_r && check_color !bc_v && check_color !bc_b then (
        Printf.printf "%d %d %d\n" !bc_r !bc_v !bc_b;
        set_color c; 
        clear_graph (); 
        fill_rect 0 0 (size_x()) (size_y());
        set_color white)
      else 
        raise Arg
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
    else 
       raise Arg 
;;

let cr i () =
  if !is_abs = false || (!is_abs && !is_cr) then 
    if !programme <> [] then 
      Cr.run (!programme) i
;;

let size() = 
  let res = " "^string_of_int !w^"x"^string_of_int !h in
  Printf.printf "%d %d\n" !w !h ;
  open_graph res;
  Printf.printf "%s\n" res ; 
;;