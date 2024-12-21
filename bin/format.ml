open Graphics;;
open Pf5.Geo;;
open Prog;;


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

(* ABS : juste poue testé le fait que si y'a que abs activé les points sont plus là *)
let is_abs = ref false;;
let x_min = ref 0.
let x_max = ref 0.
let y_min = ref 0.
let y_max = ref 0.
let rect = ref {x_min = 0.; x_max = 0.; y_min = 0. ; y_max = 0.};;

(* RC*)
let rc_r = ref 0;;
let rc_v = ref 0;;
let rc_b = ref 0;;
let is_rc = ref false;;

(* PROGRAM*)
let programme = ref [];;

let tuple_color = Arg.Tuple[
    Arg.Int (fun r -> Printf.printf "Rouge : %d\n" r);
    Arg.Int (fun v -> Printf.printf "Vert : %d\n" v);
    Arg.Int (fun b -> Printf.printf "Bleu : %d\n" b);
  ]

let printf_rect() = 
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
  printf_rect();
  (* Printf.printf "de abs x_min = %f\n" !x_min;
     Printf.printf "de abs y_min = %f\n" !y_min;
     Printf.printf "de abs x_max = %f\n" !x_max;
     Printf.printf "de abs y_max = %f\n" !y_max; *)
;;


let tuple_abs = Arg.Tuple[
    Arg.Float (fun xmin -> x_min := xmin);
    Arg.Float (fun ymin -> y_min := ymin);
    Arg.Float (fun xmax -> x_max := xmax);
    Arg.Float (fun ymax -> y_max := ymax);
    Arg.Unit  (fun () -> print_abs());
    Arg.Set is_abs;
  ]


let check_color x = if x >= 0 && x < 256 then true else false

let abs = Arg.Tuple[
    Arg.Float (fun xmin -> x_min := xmin);
    Arg.Float (fun ymin -> y_min := ymin);
    Arg.Float (fun xmax -> x_max := xmax);
    Arg.Float (fun ymax -> y_max := ymax);
    Arg.Unit (fun () -> 
        rect := { x_min = !x_min; x_max = !x_max; y_min = !y_min; y_max = !y_max });
    (* Arg.Set_float x_min;
       Arg.Set_float y_min;
       Arg.Set_float x_max;
       Arg.Set_float y_max;
       Arg.Unit (fun () -> Printf.printf "j'affecte mes val\n"); *)
    (* Arg.Unit  (fun () -> print_abs()); *)
    (* Arg.Unit (fun () -> run_abs rect); *)
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
  Printf.printf "size est activé \n";
  Arg.Tuple [
    Arg.Set_int w;
    Arg.Set_int h;
  ]
;;

let rc = 
  Arg.Tuple[
    Arg.Set_int rc_r;
    Arg.Set_int rc_v;
    Arg.Set_int rc_b;
    Arg.Set is_rc;
  ]


let speclist = [
  ("-abs",tuple_abs,"Affichage de rectangles et approximation initiale");
  ("-cr", Arg.Set is_cr,"Affichage des points");
  ("-bc", bc , "Couleur de l'arrière-plan");
  ("-fc", fc, "Couleur de l’avant plan");
  ("-rc", rc, "Couleur du rectangle");
  ("-pc", pc, "Couleur du point");
  ("-size",size,"Dimension de la fenêtre en pixels avec W = largeur, H = hauteur");
]


(* let anon_fun arg = 
   match arg with
   | "1" -> (fun () -> programme := prog1 )
   | "2" -> (fun () -> programme := prog2 )
   | "3" -> (fun () -> programme := prog3 )
   | _ ->   (fun () -> programme := prog1 ) *)


let anon_fun arg = 
  match arg with
  | "1" ->  programme := prog1 ()
  | "2" -> programme :=  prog2 ()
  | "3" ->  programme :=  prog4 ()
  | _ ->   close_graph ()
;;


let usage_msg = "inter ...  Option disponible :";;


(* TODO rattrapper les exceptions pr close graphe *)

























(* let tuple_abs = Arg.Tuple[
    Arg.Float (fun x_min -> 
      try
      Printf.printf "x_min = %f\n" x_min
      with 
      | Arg.Bad  s -> Printf.printf "mauvais argument donné %s" s
    );

    Arg.Float (fun y_min ->
      try
      Printf.printf "y_min = %f\n" y_min
    with 
    | Arg.Bad  s -> Printf.printf "mauvais argument donné %s" s
      );
    Arg.Float (fun x_max -> 
      try
      Printf.printf "x_max = %f\n" x_max
    with 
    | Arg.Bad  s -> Printf.printf "mauvais argument donné %s" s
      );
    Arg.Float (fun y_max -> 
      try Printf.printf "y_max = %f\n" y_max
    with 
    | Arg.Bad  s -> Printf.printf "mauvais argument donné %s" s
      );
   ]  *)
