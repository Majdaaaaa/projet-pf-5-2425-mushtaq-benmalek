(* open Graph *)
open Graphics;;
open Pf5.Geo;;
open Pf5.Interp;;

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

let anon_fun arg = Printf.printf "Ce n'est un argument valide %s  \n" arg

let usage_msg = "inter ...  Option disponible :"