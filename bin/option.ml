open Graphics;;
open Format;;
open Prog;;
open Pf5.Interp;;
open Pf5.Liste;;
let prog = ref [] ;;
open Pf5.Approx;;
  
let print_programme prog =
  match prog with
  | Move _ -> Printf.printf "Move\n"
  | Repeat _ -> Printf.printf "Repeat \n " 
  | Either _ -> Printf.printf "Either\n"
;;

let abs j () =
    if !is_abs then
    let size = list_length !prog in
    (* Printf.printf "size = %d \n" size; *)
    if j < size then
      if j = -1 then Abs.draw_rect !rect
      else
      let programme = list_nth !prog j in
      (* Printf.printf "j = %d\n" j; *)
      (* print_programme programme; *)
      (* Printf.printf "La taille de la liste est %d\n" size; *)
      Abs.run_abs [programme] rect
;;

let ae i () =
  if !is_ae then
    let rect_list = run_rect !prog !rect in
    let size = list_length rect_list  in
    if i < size then
      let r = list_nth rect_list i in
      Abs.draw_rect r
;;
      

let bc ()= 
  (* Printf.printf "w : %d , h : %d\n" !w !h; *)
  if !is_bc then 
    let c = rgb !bc_r !bc_v !bc_b in
    (* if check_color !bc_r && check_color !bc_v && check_color !bc_b then ( *)
      Printf.printf "%d %d %d\n" !bc_r !bc_v !bc_b;
      set_color c; 
      clear_graph (); 
      fill_rect 0 0 (size_x()) (size_y());
      set_color white
      (* ) *)
;;


let fc () =
  if !is_fc then
    let c = rgb !fc_r !fc_v !fc_b in
    set_color c; (* Change la valeur de Graphics.foreground, tout les dessins a partir de la seront fais de la couleur c *)
;;

let pc () =
  if !is_pc then
    (* if check_color !pc_r && check_color !pc_v && check_color !pc_b then ( *)
      let c = rgb !pc_r !pc_v !pc_b in
      set_color c
      (* ) *)

;;

let cr i () =
  if !is_abs = false || (!is_abs && !is_cr) then 
    if is_deterministic !prog then 
      Cr.run (!prog) i
    else 
      let lp = all_choices !prog in
      let rec aux j = 
        if j < list_length lp then 
          let prog = list_nth lp j in
          Cr.run prog i;
          aux (j+1)
      in aux 0
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

let choix_prog () = 
  match !programme with 
  |1-> prog := prog1 ()
  |2-> prog := prog2 ()
  |3-> prog := prog3 ()
  |4-> prog := prog4 ()
  |_ -> Printf.printf "lololo"
;;