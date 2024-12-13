(* open Graph *)
open Graphics;;
open Pf5.Geo;;
open Pf5.Interp;;


(* déclaration des variables *)
let x_min = ref 0.
let x_max = ref 0.
let y_min = ref 0.
let y_max = ref 0.
let rect = ref {x_min = 0.; x_max = 0.; y_min = 0. ; y_max = 0.};;
(* let rect = ref None *)

let tuple_color = Arg.Tuple[
    Arg.Int (fun r -> Printf.printf "Rouge : %d\n" r);
    Arg.Int (fun v -> Printf.printf "Vert : %d\n" v);
    Arg.Int (fun b -> Printf.printf "Bleu : %d\n" b);
  ]

let tuple_size = Arg.Tuple [
    Arg.Int (fun w -> Printf.printf "largeur = %d\n" w);
    Arg.Int (fun h -> Printf.printf "hauteur = %d\n" h);
    ]

let printf_rect() = 
    Printf.printf "de rect x_min = %f\n" !rect.x_min;
    Printf.printf "de rect y_min = %f\n" !rect.y_min;
    Printf.printf "de rect x_max = %f\n" !rect.x_max;
    Printf.printf "de rect y_max = %f\n" !rect.y_max;
    let point = {x=0. ; y=0.} in
      Printf.printf "est ce que la coordonnée (%f,%f)  est ici : %s\n" 0. 0. (string_of_bool (in_rectangle !rect point))
;;

let print_abs()=
  rect:= { x_min = !x_min ; x_max = !x_max ; y_min = !y_min ; y_max = !y_max };
  printf_rect();
  Printf.printf "de abs x_min = %f\n" !x_min;
  Printf.printf "de abs y_min = %f\n" !y_min;
  Printf.printf "de abs x_max = %f\n" !x_max;
  Printf.printf "de abs y_max = %f\n" !y_max;
;;


let tuple_abs = Arg.Tuple[
    Arg.Float (fun xmin -> x_min := xmin);
    Arg.Float (fun ymin -> y_min := ymin);
    Arg.Float (fun xmax -> x_max := xmax);
    Arg.Float (fun ymax -> y_max := ymax);
    Arg.Unit  (fun () -> print_abs());
  ]


let check_color x = if x > 0 && x < 256 then true else false

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

let speclist = [
  ("-abs",tuple_abs,"Affichage de rectangles et approximation initiale");
  (* ("-cr", Arg.Unit (fun () -> Printf.printf "Vous avez choisi cr\n"), "Affichage de points"); *)
  ("-cr",  Arg.Unit (fun () -> Cr.run (prog () ) 1.), "Affichage de points");
  ("-bc", tuple_color, "Couleur de l'arrière-plan");
  ("-fc", tuple_color, "Couleur de l’avant plan");
  ("-rc", tuple_color, "Couleur du rectangle");
  ("-pc", tuple_color, "Couleur du point");
  ("-size",tuple_size,"Dimension de la fenêtre en pixels avec W = largeur, H = hauteur");
  (* ("-1", Arg.Unit (fun () -> Printf.printf "Vous avez choisi le programme %d\n" 1),"programme à choisir") *)
]


let anon_fun arg = 
  match arg with
  | "1" -> Printf.printf "c'est le programme  un : %s\n" arg
  | "2" -> Printf.printf "c'est le programme deux : %s\n" arg
  | "3" -> Printf.printf "c'est le programme trois : %s\n" arg
  | _ -> close_graph();Printf.printf "c'est quoi ça ? \n"


let usage_msg = "inter ...  Option disponible :"




























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
