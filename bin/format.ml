(* open Graphics;; *)
open Pf5.Geo;;
exception Not_in_rectangle;;
exception Arg;;
exception Abs_ae_exception;;
exception Rc_only;;
exception Not_color;;

let point_origine = ref {x=0. ; y=0.} ;;
(* BC *)
let bc_r = ref 0;;
let bc_v = ref 0;;
let bc_b = ref 0;;
let is_bc = ref false;;

(* CR *)
let is_cr = ref false;;

(* FC *)
let fc_r = ref 0;;
let fc_v = ref 0;;
let fc_b = ref 0;;
let is_fc = ref false;;

(* PC *)
let pc_r = ref 0;;
let pc_v = ref 0;;
let pc_b = ref 0;;
let is_pc = ref false;;

(* SIZE *)
let w = ref 800;;
let h = ref 600;;
let is_size = ref false;;

(* ABS *)
let is_abs = ref false;;
let x_min = ref 0.
let x_max = ref 0.
let y_min = ref 0.
let y_max = ref 0.
let rect = ref {x_min = 0.; x_max = 0.; y_min = 0. ; y_max = 0.};;

(* AE *)
let is_ae = ref false;;

(* RC *)
let rc_r = ref 0;;
let rc_v = ref 0;;
let rc_b = ref 0;;
let is_rc = ref false;;

(* PROGRAM *)
let programme = ref 0;;

let abs = Arg.Tuple[
    Arg.Float (fun xmin -> x_min := xmin);
    Arg.Float (fun ymin -> y_min := ymin);
    Arg.Float (fun xmax -> x_max := xmax);
    Arg.Float (fun ymax -> y_max := ymax);
    Arg.Unit (fun () -> 
        rect := { x_min = !x_min; x_max = !x_max; y_min = !y_min; y_max = !y_max });
    Arg.Set is_abs;
  ]

let bc = 
  Arg.Tuple [
    Arg.Set_int bc_r;
    Arg.Set_int bc_v;
    Arg.Set_int bc_b;
    Arg.Set is_bc;
  ] ;;

let fc = 
  Arg.Tuple [
    Arg.Set_int fc_r;
    Arg.Set_int fc_v;
    Arg.Set_int fc_b;
    Arg.Set is_fc;
  ]

let pc = 
  Arg.Tuple [
    Arg.Set_int pc_r;
    Arg.Set_int pc_v;
    Arg.Set_int pc_b;
    Arg.Set is_pc;
  ]
;;

let size = 
  Arg.Tuple [
    Arg.Set_int w;
    Arg.Set_int h;
    Arg.Set is_size;
  ]
;;

let rc = 
  Arg.Tuple[
    Arg.Set_int rc_r;
    Arg.Set_int rc_v;
    Arg.Set_int rc_b;
    Arg.Set is_rc;
  ]
;;

let ae = Arg.Tuple[
    Arg.Float (fun xmin -> x_min := xmin);
    Arg.Float (fun ymin -> y_min := ymin);
    Arg.Float (fun xmax -> x_max := xmax);
    Arg.Float (fun ymax -> y_max := ymax);
    Arg.Unit (fun () -> 
        rect := { x_min = !x_min; x_max = !x_max; y_min = !y_min; y_max = !y_max });
    Arg.Set is_ae;
  ]


let speclist = [
  ("-abs",abs,"x_min y_min x_max y_max -> Affichage de rectangles et approximation initiale");
  ("-cr", Arg.Set is_cr,"-> Affichage des points");
  ("-bc", bc , "r v b -> Couleur de l'arrière-plan");
  ("-fc", fc, "r v b -> Couleur de l’avant plan");
  ("-rc", rc, "r v b : Couleur du rectangle");
  ("-pc", pc, "r v b : Couleur du point");
  ("-ae", ae , "-> Approximation qui scinde le Either");
  ("-size",size,"w h -> Dimension de la fenêtre en pixels avec W = largeur, H = hauteur");
]

let anon_fun arg = 
  match arg with
  | "1" -> programme := 1
  | "2" -> programme := 2
  | "3" -> programme := 3
  | "4" -> programme := 4
  | _ ->  Printf.printf "Ce n'est pas un programme.\n"
;;


let usage_msg = "inter ...  Option disponible :";;

let check_color r g b  = if r >= 0 && r < 256  && g >= 0 && g < 256 && b >= 0 && b < 256 then true else false

let condition() =
  if !programme = 0 then raise Arg;
  if in_rectangle !rect !point_origine = false then raise Not_in_rectangle;
  if !is_ae = true && !is_abs = true  then raise Abs_ae_exception;
  if !is_rc = true && !is_abs = false && !is_ae = false then raise Rc_only;

  if !is_bc = true && check_color !bc_r !bc_b !bc_v = false  then raise Not_color;
  if !is_rc = true && check_color !rc_r !rc_b !rc_v = false  then raise Not_color;
  if !is_fc = true && check_color !fc_r !fc_b !fc_v = false  then raise Not_color;
  if !is_pc = true && check_color !pc_r !pc_b !pc_v = false  then raise Not_color;
;;

(* TODO rattrapper les exceptions pr close graphe *)


(* DEBUGGAGE *)
(* let printf_rect() = 
  Printf.printf "de rect x_min = %f\n" !rect.x_min;
  Printf.printf "de rect y_min = %f\n" !rect.y_min;
  Printf.printf "de rect x_max = %f\n" !rect.x_max;
  Printf.printf "de rect y_max = %f\n" !rect.y_max;
  let point = {x=0. ; y=0.} in
  if in_rectangle !rect point then Printf.printf "est ce que la coordonnée (%f,%f)  est ici : %s\n" 0. 0. (string_of_bool (in_rectangle !rect point))
  else
    close_graph(); Printf.printf "la coordonnée (%f,%f) est pas inclut dans le rect\n" 0. 0.;
;;

let print_abs()=
  rect:= { x_min = !x_min ; x_max = !x_max ; y_min = !y_min ; y_max = !y_max };
  (* printf_rect(); *)
  (* Printf.printf "de abs x_min = %f\n" !x_min;
     Printf.printf "de abs y_min = %f\n" !y_min;
     Printf.printf "de abs x_max = %f\n" !x_max;
     Printf.printf "de abs y_max = %f\n" !y_max; *)
;; *)