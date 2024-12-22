exception Quit;;
open Graphics;;
open Format;;
open Prog;;
open Pf5.Geo;;

let i = ref 0;;
let j = ref (-1);;
let copie_rect = ref {x_min = 0.; y_min = 0. ; x_max = 0. ; y_max = 0.};;

(** [drawing] appel toute les fonctions qui servent a afficher les affichages des options demandé par l'utilisateur.
*)
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

(** [choix_abs] Affiche un message si l'option -abs est spécifié et le programme est déterministe.
*)
let  choix_abs  () = 
  set_color red;
  moveto 10 (size_y ()-20);
  draw_string "Programme deterministe.";
  moveto 10 (size_y ()-35);
  draw_string "Appuyez sur <1> ou <2> ou <3> ou <4> pour choisir un nouveau programme a executer." ;
  moveto 10 (size_y ()-50);
  draw_string "Les programmes <3> et <4> ne sont pas deterministe.";;

(** [prog_fini] Affiche un message lorsque le programme est fini.
*)
let prog_fini () =
  set_color red;
  moveto 10 (size_y ()-20);
  draw_string "Programme fini.";
  moveto 10 (size_y ()-35);
  draw_string "Appuyez sur <1> ou <2> ou <3> ou <4> pour choisir un nouveau programme a executer." ;;

(** [main] appel toute les fonctions des options, du repére et [drawing], ainsi que le parsing.
    Attends une entrée par le clavier : 
    - <q> : pour fermer la fenêtre.
    - <n> : passer à l'étape suivant.
    - <s> : affiche toute l'exécution du programme en une fois.
      Rattrape les exceptions [Cr.Fin] et [Option.Deter] fait un l'affichage approprié et laisse le choix a l'utilisateur pour
      un autre programme a éxécution.
      Lève l'exception [Quit].
*)
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
        handler_ex ();
      )
    | Option.Deter -> (
        choix_abs ();
        handler_ex ();
      )
  done

(** [handler_ex] gestionnaire de fin de programme.*)
and handler_ex () = 
  let eve = wait_next_event [Key_pressed] in 
  choix_prog  eve.key

(** [choix_prog] attends une entrée au clavier pour spécifié un nouveau programme a éxécuter.
    @param key l'entrée clavier. 
*)
and choix_prog key = 
  rect := !copie_rect;
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
  | Arg -> Printf.printf "Il faut un programme à éxécuter\n"; close_graph ()
  | Not_in_rectangle -> Printf.printf "La coordonnée (0.0, 0.0) n'est pas dans le rectangle donnée.\n"
  | Abs_ae_exception -> Printf.printf "Les options -ae et -abs ne peuvent pas s'éxecuter en même temps.\n"
  | Rc_only -> Printf.printf "L'option -rc doit être utiliser avec l'option -abs ou -ae.\n"
  | Not_color -> Printf.printf "Ce n'est pas une couleur valide.\n"
