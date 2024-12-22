exception Quit;;
open Graphics;;
open Format;;
open Prog;;
open Pf5.Geo;;

let i = ref 0;;
let j = ref (-1);;
let copie_rect = ref {x_min = 0.; y_min = 0. ; x_max = 0. ; y_max = 0.};;

let drawing () = 
  Option.rc();
  Option.abs !j ();
  Option.ae !i ();
  Option.pc ();
  Option.cr !i  ();
  Option.fc ();
  i := !i+1;
  j := !j+1;
;;

let  choix_abs  () = 
  set_color red;
  moveto 10 (size_y ()-20);
  draw_string "Programme deterministe.";
  moveto 10 (size_y ()-35);
  draw_string "Appuyez sur <1> ou <2> ou <3> ou <4> pour choisir un nouveau programme a executer." ;
  moveto 10 (size_y ()-50);
  draw_string "Le programme <3> n'est pas deterministe.";;

let prog_fini () =
  set_color red;
  moveto 10 (size_y ()-20);
  draw_string "Programme fini.";
  moveto 10 (size_y ()-35);
  draw_string "Appuyez sur <1> ou <2> ou <3> ou <4> pour choisir un nouveau programme a executer." ;;


let rec main () = 
  Arg.parse Format.speclist Format.anon_fun Format.usage_msg; 
  condition();
  copie_rect := {x_min = (!rect).x_min ; y_min = (!rect).y_min ; x_max = (!rect).x_max ; y_max = (!rect).y_max };
  Option.size ();
  Option.bc ();
  Option.fc ();
  Init.init_graphics ();
  Option.not_detereministic !prog;
  while true do
    let eve = wait_next_event [Key_pressed] in 
    if eve.key = 'q' then raise Quit;
    try
      if eve.key = 'n' then (
        drawing ();
      );
      if eve.key = 's' then ( 
        while true do
          drawing ();
        done
      );
    with
    | Cr.Fin -> (
        prog_fini ();
        (*Pour abs si *)
        rect := !copie_rect;
        handler_ex ();
      )
    | Option.Deter -> (
        choix_abs ();
        rect := !copie_rect;
        handler_ex ();
      )
  done
and handler_ex () = 
  let eve = wait_next_event [Key_pressed] in 
  choix_prog  eve.key;
and choix_prog key = 
  i := 0;
  j := (-1);
  match key with
  | '1' -> prog := prog1 (); clear_graph (); main ()
  | '2' -> prog := prog2 (); clear_graph (); main ()
  | '3' -> prog := prog3 (); clear_graph (); main ()
  | '4' -> prog := prog4 (); clear_graph (); main ()
  | 'q' -> raise Quit 
  | _ -> ()
;;


let () =
  try
    main ();
  with 
  | Quit -> close_graph ()
  | Arg -> Printf.printf "Il faut un programme a éxécuté\n"; close_graph ()
  | Not_in_rectangle -> Printf.printf "La coordonnée (0.0, 0.0) n'est pas dans le rectangle donnée.\n"
  | Abs_ae_exception -> Printf.printf "Les options -ae et -abs ne peuvent pas s'éxecuter en même temps.\n"
  | Rc_only -> Printf.printf "L'option -rc doit être utiliser avec l'option -abs ou -ae.\n"
  | Not_color -> Printf.printf "Ce n'est pas une couleur valide.\n"
