open Graphics;;
open Pf5.Geo;;
open Pf5.Interp;;

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
(* ABS : juste poue testé le fait que si y'a que abs activé les points sont plus là *)
let is_abs = ref false;;


let tuple_color = Arg.Tuple [
    Arg.Int (fun r -> Printf.printf "Rouge : %d\n" r);
    Arg.Int (fun v -> Printf.printf "Vert : %d\n" v);
    Arg.Int (fun b -> Printf.printf "Bleu : %d\n" b);
  ]

let tuple_size = Arg.Tuple[
    Arg.Int (fun w -> Printf.printf "largeur = %d\n" w);
    Arg.Int(fun h ->Printf.printf "hauteur = %d\n" h)]

let tuple_abs = Arg.Tuple[
    Arg.Float (fun x_min -> Printf.printf "x_min = %f\n" x_min);
    Arg.Float (fun y_min -> Printf.printf "y_min = %f\n" y_min);
    Arg.Float (fun x_max -> Printf.printf "x_max = %f\n" x_max);
    Arg.Float (fun y_max -> Printf.printf "y_max = %f\n" y_max);
    Arg.Set is_abs;
  ]


(*Le problème est là si on enlève les () ca marche pas, psq on utilise size_x et size_y qui font parti de graphics et Ocaml évalue ça avant 
  D'avoir ouvert la fenêtre ca fais Graphics.graphics_failure ...*)
let prog () = 
  let mid_x = (float_of_int (size_x ())) /. 2. in 
  let mid_y =  (float_of_int (size_y ())) /. 2. in 
  (*Carré*)
  [
    Repeat (4, [
        Move (Translate {x = 1.0*.42.10526316; y = 0.0*.52.63157895});  
        Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  
      ])
  ];;

let bc = 
  Printf.printf "BC\n";
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
  ];
;;


(* Les options dessins doivent être mis aprés -fc ou -bc  *)
(* Nouvel ordre a respecté : -bc avant -fc *)
(* pour testé  dune exec interp -- -bc 205 92 92 -pc 255 255 0 -cr -fc 142 68 173 
   TODO : Si on change l'ordre ca marche plus correctement !!! *)
let speclist = [
  ("-abs",tuple_abs,"Affichage de rectangles et approximation initiale");
  (* ("-cr", Arg.Unit (fun () -> Printf.printf "Vous avez choisi cr\n"), "Affichage de points"); *)
  (* ("-cr",  Arg.Unit (fun () -> Cr.run (prog () ) 1. ), "Affichage de points"); (* Faut faire une des reférences pour chaque valeur d'options  *)
                                                                                  Donc le run devrai pas être là *)
  ("-cr", Arg.Set is_cr,"Affichage des points");
  ("-bc", bc , "Couleur de l'arrière-plan");
  ("-fc", fc, "Couleur de l’avant plan");
  ("-rc", tuple_color, "Couleur du rectangle");
  ("-pc", pc, "Couleur du point");
  ("-size",tuple_size,"Dimension de la fenêtre en pixels avec W = largeur, H = hauteur");
  ("-1", Arg.Unit (fun () -> Printf.printf "Vous avez choisi le programme %d\n" 1),"programme à choisir")
]

let anon_fun arg = Printf.printf "Ce n'est un argument valide %s  \n" arg

let usage_msg = "interp ...  Option disponible :"