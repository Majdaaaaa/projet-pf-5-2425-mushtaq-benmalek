open Graphics;;
open Format;;
open Pf5.Interp;;
open Pf5.Liste;;
open Pf5.Approx;;
exception Deter;;

(** [not_derteministic] utilse la fonction [all_choices] pour dérouler toute les exécutions possibles d'un programme 
    non-deterministe, et choisi une exécution au hasard et la stocke dans la variable det_prog
    @param p le programme 
*)
let det_prog = ref [];;
let not_detereministic p = 
  let lp = all_choices p in 
  let rand = Random.int (list_length lp) in 
  det_prog := list_nth lp rand 
;;

(* Sur-approximation *)
(** [abs] applique l'option abs au rectangle [j]
    Lève l'exception [Deter] si le programme est deterministe.
    Lève l'exception [Fin] quand le programme est fini.
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
    Lève l'exception [Fin] quand le programme est fini.
    @param i la i-ème instruction à exécuter du programme
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

(** [bc] applique l'option -fc.
    Change la couleur de l'arrière-plan si l'option est activé.
*)
let bc ()= 
  if !is_bc then 
    let c = rgb !bc_r !bc_v !bc_b in
    set_color c; 
    clear_graph (); 
    fill_rect 0 0 (size_x()) (size_y());
    set_color white
;;

(** [fc] applique l'option -fc.
    Change la couleur de l'avant-plan si l'option est activée, remet la couleur par défaut (noir) sinon.
*)
let fc () =
  let basic = black in 
  if !is_fc then
    let c = rgb !fc_r !fc_v !fc_b in
    set_color c; (* Change la valeur de Graphics.foreground, tous les dessins à partir de la seront fait de la couleur c *)
  else 
    set_color basic
;;
(** [pc] applique l'option -pc.
    Change la couleur des points. 
*)
let pc () =
  if !is_pc then
    let c = rgb !pc_r !pc_v !pc_b in
    set_color c
;;

(** [cr] applique l'option -cr. L'option -cr affiche les points si :
    - l'option -abs n'est pas activée.
    - l'option -ae n'est pas activée.
      (Donc -cr est activée par défaut si aucune option n'est specifiée)
    - l'option -cr est activée et -abs ne l'est pas. 
      Rattrape l'exception [Fin] et la renvoie pour qu'elle arrive dans [main].
      @param i le i-ème point à afficher 
*)
let cr i () =
  try
    (*Sur-approx et points au même temps pas de sens*)
    if (!is_abs = false && !is_ae = false ) || (!is_cr = true && !is_abs=false) then (
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
